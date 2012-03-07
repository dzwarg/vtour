Ext.ns( 'vtour' );

/**
 * @class Ext.PanoramioPagingToolbar
 * @extends Ext.PagingToolbar
 * A specialized toolbar that is bound to a {@link Ext.data.Store} and provides automatic paging controls
 * for a Panoramio JSON photo search result.
 * @constructor
 * Create a new PanoramioPagingToolbar
 * @param {Object} config The config object
 */
vtour.PanoramioPagingToolbar = Ext.extend(Ext.PagingToolbar, {
    /**
     * Object mapping of parameter names for load calls (defaults to {start: 'page', limit: 'per_page'})
     */
    paramNames : {start: 'from', limit: 'to'},

    /**
     * The number of photos per page.
     */
    _pageSize: 10,

    initComponent : function(){
        vtour.PanoramioPagingToolbar.superclass.initComponent.call(this);
        this.cursor = 1;
        this._pageSize = this.pageSize;
        this.bind(this.store);
    },

    // private
    updateInfo : function(){
        if(this.displayEl){
            var count = this.store.getCount();
            var msg = count == 0 ?
                this.emptyMsg :
                String.format(
                    this.displayMsg,
                    ((this.cursor - 1) * this._pageSize) + 1, 
                    (this.cursor * this._pageSize), 
                    this.store.getTotalCount()
                );
            this.displayEl.update(msg);
        }
    },

    // private
    onLoad : function(store, r, o){
        if(!this.rendered){
            this.dsLoaded = [store, r, o];
            return;
        }
       this.cursor = o.params ? Math.floor(o.params[this.paramNames.start]/this._pageSize) + 1 : 1;
       var d = this.getPageData(), ap = d.activePage, ps = d.pages;

       this.afterTextEl.el.innerHTML = String.format(this.afterPageText, d.pages);
       this.field.dom.value = ap;
       this.field.dom.disabled = (this.store.getCount()==0);
       this.first.setDisabled(ap == 1);
       this.prev.setDisabled(ap == 1);
       this.next.setDisabled(ap == ps);
       this.last.setDisabled(ap == ps);
       this.loading.enable();
       this.updateInfo();
    },

    // private
    getPageData : function(){
        var total = this.store.getTotalCount();
        return {
            total : total,
            activePage : this.cursor,
            pages :  total < this._pageSize ? 1 : Math.ceil(total/this._pageSize)
        };
    },
    
    // private
    onPagingKeydown : function(e){
        var k = e.getKey(), d = this.getPageData(), pageNum;
        if (k == e.RETURN) {
            e.stopEvent();
            if(pageNum = this.readPage(d)){
                this.pageSize = pageNum*this._pageSize;
                this.doLoad((pageNum-1)*this._pageSize);
            }
        }else if (k == e.HOME || k == e.END){
            e.stopEvent();
            pageNum = k == e.HOME ? 1 : d.pages;
            this.field.dom.value = pageNum;
        }else if (k == e.UP || k == e.PAGEUP || k == e.DOWN || k == e.PAGEDOWN){
            e.stopEvent();
            if(pageNum = this.readPage(d)){
                var increment = e.shiftKey ? 10 : 1;
                if(k == e.DOWN || k == e.PAGEDOWN){
                    increment *= -1;
                }
                pageNum += increment;
                if(pageNum >= 1 & pageNum <= d.pages){
                    this.field.dom.value = pageNum;
                }
            }
        }
    },

    // private
    onClick : function(which){
        var store = this.store;
        switch(which){
            case "first":
                this.pageSize = this._pageSize;
                this.doLoad(0);
            break;
            case "prev":
                this.pageSize = Math.max(this._pageSize, this.pageSize-this._pageSize);
                this.doLoad(Math.max(0, (this.cursor-2)*this._pageSize));
            break;
            case "next":
                this.pageSize += this._pageSize;
                this.doLoad(this.cursor*this._pageSize);
            break;
            case "last":
                var total = store.getTotalCount();
                var extra = total % this._pageSize;
                var lastStart = (total - extra);
                this.pageSize = lastStart + this._pageSize;
                this.doLoad(lastStart);
            break;
            case "refresh":
                this.doLoad(this.cursor*this._pageSize);
            break;
        }
    }
});
Ext.reg('ppaging', vtour.PanoramioPagingToolbar);

/*
 * A panoramio adapter for vtour.
 */

vtour.PanoramioAdapter = function(){
  this.proxy = new Ext.data.ScriptTagProxy({
    callbackParam: 'callback',
    url: 'http://www.panoramio.com/map/get_panoramas.php'
  });

  this.reader = new Ext.data.JsonReader(
    {
      totalProperty: 'count',
      root: 'photos',
      id: 'photo_id'
    }, 
    Ext.data.Record.create([
      {name: 'photo_id'},
      {name: 'photo_title'},
      {name: 'photo_url'},
      {name: 'photo_file_url'},
      {name: 'longitude', type:'float'},
      {name: 'latitude', type:'float'},
      {name: 'width', type:'int'},
      {name: 'height', type:'int'},
      {name: 'isfamily'},
      {name: 'uploaded_date', type:'date'},
      {name: 'owner_id', type: 'int'},
      {name: 'owner_name'},
      {name: 'owner_url'}
    ])
  );

  this.template = new Ext.XTemplate( 
    '<tpl for=".">',
    '<div class="thumb-wrap" id="{photo_title}">',
    '<div class="thumb" ext:position="{longitude},{latitude}" ',
    'ext:image="{imageurl}" ext:title="{photo_title}" ',
    'ext:imageid="{photo_id}" ext:page_url="{photo_url}">',
    '<img src="{thumburl}" title="{photo_title}"></div>',
    '<span class="x-editable">{photo_title}</span></div>',
    '</tpl>',
    '<div class="x-clear"></div>'
  );

  this.getStore = function( bbox, fromDate, toDate, tags, ppg ) {
    var bounds = bbox.split( /,/ );
    var store = new Ext.data.Store({
      proxy: this.proxy,
      reader: this.reader,
      baseParams: {
        order: 'upload_date',
        set: 'full',
        size: 'square',
        minx: bounds[0],
        miny: bounds[1],
        maxx: bounds[2],
        maxy: bounds[3]
      }
    });
  
    store.load({ params:
      {
        from: 0,
        to: ppg
      }
    });

    return store;
  };

  this.prepareData = function(data){
    data.thumburl = data.photo_file_url;
    data.imageurl = data.photo_file_url.replace(/\/square\//, '/small/');
    return data;
  };

  this.getToolbar = function( ppg, store, fromDate, toDate, tags ) {
    return new vtour.PanoramioPagingToolbar({
      pageSize: ppg,
      store: store,
      displayInfo: true,
      displayMsg: 'Displaying images {0} - {1} of {2}',
      emptyMsg: 'No images to display'
    });
  };

  this.getSelector = function( checked ) {
    var inputcfg = {
      tag: 'input', 
      type: 'radio', 
      name: 'photoService', 
      value: 'panoramio', 
      onclick: 'changeService(this);', 
      id: 'rss'
    };

    if ( checked ) {
      inputcfg.checked = 'checked';
    }

    return Ext.DomHelper.markup({
      tag: 'li', 
      children: [
        inputcfg,
        {
          tag: 'label',
          'for': 'rss',
          html: 'Panoramio'
        }
      ]
    });
  };
};
