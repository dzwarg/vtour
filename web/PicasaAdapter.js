Ext.ns( 'vtour' );


/**
 * @class Ext.FlickrPagingToolbar
 * @extends Ext.PagingToolbar
 * A specialized toolbar that is bound to a {@link Ext.data.Store} and provides automatic paging controls
 * for a Flickr JSON photo search result.
 * @constructor
 * Create a new FlickrPagingToolbar
 * @param {Object} config The config object
 */
vtour.PicasaPagingToolbar = Ext.extend(Ext.PagingToolbar, {
    /**
     * Object mapping of parameter names for load calls (defaults to {start: 'page', limit: 'per_page'})
     */
    paramNames : {start: 'start-index', limit: 'max-results'},

    initComponent : function(){
        vtour.PicasaPagingToolbar.superclass.initComponent.call(this);
        this.cursor = 1;
        this.max = 1000;
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
                    this.cursor,
                    this.cursor + this.pageSize - 1, 
                    Math.min( this.store.getTotalCount(), this.max )
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
       this.cursor = o.params ? o.params[this.paramNames.start] : 1;
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
        var total = Math.min( this.store.getTotalCount(), this.max );
        return {
            total : total,
            activePage : Math.floor(this.cursor / this.pageSize) + 1,
            pages :  total < this.pageSize ? 1 : Math.ceil(total/this.pageSize)
        };
    },
    
    // private
    onPagingKeydown : function(e){
        var k = e.getKey(), d = this.getPageData(), pageNum;
        if (k == e.RETURN) {
            e.stopEvent();
            if(pageNum = this.readPage(d)){
                this.doLoad((pageNum-1)*this.pageSize+1);
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
                this.doLoad(1);
            break;
            case "prev":
                this.doLoad(Math.max(1, this.cursor-this.pageSize));
            break;
            case "next":
                this.doLoad(this.cursor+this.pageSize);
            break;
            case "last":
                var total = Math.min( store.getTotalCount(), this.max );
                var extra = total % this.pageSize;
                var lastStart = total - extra;
                this.doLoad(lastStart);
            break;
            case "refresh":
                this.doLoad(this.cursor);
            break;
        }
    }
});
Ext.reg('pcpaging', vtour.PicasaPagingToolbar);

/*
 * A picasa adapter for vtour.
 */

vtour.PicasaAdapter = function(){
  this.proxy = new Ext.data.ScriptTagProxy({
    callbackParam: 'callback',
    url: 'http://picasaweb.google.com/data/feed/api/all'
  });

  this.reader = new Ext.data.JsonReader(
    {
      totalProperty: 'feed.openSearch$totalResults.$t',
      root: 'feed.entry',
      id: 'id.$t'
    },
    Ext.data.Record.create([
      {name: 'id', mapping: 'id.$t'},
      {name: 'title', mapping: 'title.$t'},
      {name: 'author', mapping: 'author'},
      {name: 'thumb', mapping: 'media$group.media$thumbnail'},
      {name: 'location', mapping: 'georss$where'},
      {name: 'link', mapping: 'link'}
    ])
  );

  this.template = new Ext.XTemplate( 
    '<tpl for=".">',
    '<div class="thumb-wrap" id="{title}">',
    '<div class="thumb" ext:position="{longitude},{latitude}" ',
    'ext:tags="{tags}" ext:image="{imageurl}" ext:title="{title}" ',
    'ext:imageid="{id}" ext:page_url="{pageurl}">',
    '<img src="{thumburl}" title="{title}"/></div>',
    '<span class="x-editable">{title}</span></div>',
    '</tpl>',
    '<div class="x-clear"></div>'
  );

  this.getStore = function( bbox, fromDate, toDate, tags, ppg ) {
    var store = new Ext.data.Store({
      proxy: this.proxy,
      reader: this.reader,
      baseParams: {
        kind: 'photo',
        access: 'public',
        alt: 'json-in-script',
        tag: (tags&&tags.length>0)?tags:null,
        bbox: bbox,
        thumbsize: '72c,320u'
      }
    });
  
    store.load({ params:
      {
        'start-index': 1,
        'max-results': ppg
      }
    });

    return store;
  };

  this.prepareData = function(data){
    data.tags = '';

    var latlon = data.location.gml$Point.gml$pos.$t.split(/ /);
    data.longitude = parseFloat( latlon[1] );
    data.latitude = parseFloat( latlon[0] );

    data.imageurl = data.thumb[1].url;
    data.thumburl = data.thumb[0].url;

    data.pageurl = data.link[1].href;
    return data;
  };

  this.makeTextMenu = function( txt, theStore ) {
    var txtBtn = new Ext.Toolbar.Button({
      text: '\''+txt+'\'',
      handler: function(btn){
        var l = new Ext.Layer({});
        var tags = btn.getText().match( /^'(.*)'$/ )[1];
        
        l.update('<div class="tagEdit"><input type="text" value="' + tags + '"/></div>');
        l.show();
        l.alignTo( btn.el, 'bl-tl' );

        var html = Ext.DomQuery.select( 'div.tagEdit input' );
        if (html != null && html.length == 1)
          html[0].focus();

        l.on( 'keypress', function(evt){
          if ( evt.keyCode == 13 ) {
            l.hide();

            var theTxt = '';
            if ( html != null && html.length == 1 )
               theTxt = html[0].value;
              
            btn.setText( '\'' + theTxt + '\'' );
            theStore.baseParams.tag = (theTxt.length==0)?null:theTxt;

            l.remove();
          };
        });
      }
    });

    return txtBtn;
  };

  this.getToolbar = function( ppg, store, fromDate, toDate, tags ) {
    return new vtour.PicasaPagingToolbar({
      pageSize: ppg,
      store: store,
      displayInfo: true,
      displayMsg: 'Displaying images {0} - {1} of {2}',
      emptyMsg: 'No images to display',
      items:[
        {xtype: 'tbtext', text: 'Tags:' },
        this.makeTextMenu( tags, store )
      ]
    }); 
  };

  this.getSelector = function( checked ) {
    var inputcfg = {
      tag: 'input', 
      type: 'radio', 
      name: 'photoService', 
      value: 'picasa', 
      onclick: 'changeService(this);', 
      id: 'pcss'
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
          'for': 'pcss',
          html: 'Picasa'
        }
      ]
    });
  };
};
