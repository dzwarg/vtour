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
vtour.FlickrPagingToolbar = Ext.extend(Ext.PagingToolbar, {
    /**
     * Object mapping of parameter names for load calls (defaults to {start: 'page', limit: 'per_page'})
     */
    paramNames : {start: 'page', limit: 'per_page'},

    initComponent : function(){
        vtour.FlickrPagingToolbar.superclass.initComponent.call(this);
        this.cursor = 1;
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
                    ((this.cursor - 1) * this.pageSize) + 1, 
                    (this.cursor * this.pageSize), 
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
        var total = this.store.getTotalCount();
        return {
            total : total,
            activePage : this.cursor,
            pages :  total < this.pageSize ? 1 : Math.ceil(total/this.pageSize)
        };
    },
    
    // private
    onPagingKeydown : function(e){
        var k = e.getKey(), d = this.getPageData(), pageNum;
        if (k == e.RETURN) {
            e.stopEvent();
            if(pageNum = this.readPage(d)){
                this.doLoad(pageNum);
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
                this.doLoad(Math.max(1, this.cursor-1));
            break;
            case "next":
                this.doLoad(this.cursor+1);
            break;
            case "last":
                var total = store.getTotalCount();
                var extra = total % this.pageSize;
                var lastStart = (total - extra) / this.pageSize + 1;
                this.doLoad(lastStart);
            break;
            case "refresh":
                this.doLoad(this.cursor);
            break;
        }
    }
});
Ext.reg('fpaging', vtour.FlickrPagingToolbar);

/*
 * A flickr adapter for vtour.
 */

vtour.FlickrAdapter = function(){
  this.key = 'd9a76ca10b3a34cf59a859843d495b63';

  this.proxy = new Ext.data.ScriptTagProxy({
    callbackParam: 'jsoncallback',
    url: 'http://api.flickr.com/services/rest/'
  });

  this.reader = new Ext.data.JsonReader(
    {
      successProperty: 'stat',
      totalProperty: 'photos.total',
      root: 'photos.photo',
      id: 'id'
    }, 
    Ext.data.Record.create([
      {name: 'id'},
      {name: 'owner'},
      {name: 'secret'},
      {name: 'server'},
      {name: 'farm'},
      {name: 'title'},
      {name: 'ispublic'},
      {name: 'isfriend'},
      {name: 'isfamily'},
      {name: 'latitude', type: 'float'},
      {name: 'longitude', type: 'float'},
      {name: 'accuracy', type: 'int'},
      {name: 'place_id'},
      {name: 'woeid', type: 'int'},
      {name: 'tags'}
    ])
  );

  this.template = new Ext.XTemplate( 
    '<tpl for=".">',
    '<div class="thumb-wrap" id="{title}">',
    '<div class="thumb" ext:position="{longitude},{latitude}" ',
    'ext:tags="{tags}" ext:image="{imageurl}" ext:title="{title}" ',
    'ext:imageid="{id}" ext:page_url="http://www.flickr.com/photos/{owner}/{id}">',
    '<img src="{thumburl}" title="{title}"></div>',
    '<span class="x-editable">{title}</span></div>',
    '</tpl>',
    '<div class="x-clear"></div>'
  );

  this.getStore = function( bbox, fromDate, toDate, tags, ppg ) {
    var store = new Ext.data.Store({
      proxy: this.proxy,
      reader: this.reader,
      baseParams: {
        method: 'flickr.photos.search',
        format: 'json',
        api_key: this.key,
        bbox: bbox,
        min_taken_date: fromDate.format('Y-m-d'),
        max_taken_date: toDate.format('Y-m-d'),
        extras:'geo,tags',
        tags: tags
      }
    });
  
    store.load({ params:
      {
        page: 1,
        per_page: ppg
      }
    });

    return store;
  };

  this.prepareData = function(data){
    data.thumburl = 'http://farm' + data.farm + '.static.flickr.com/' + data.server + 
      '/' + data.id + '_' + data.secret + '_s.jpg';
    data.imageurl = 'http://farm' + data.farm + '.static.flickr.com/' + data.server + 
      '/' + data.id + '_' + data.secret + '_m.jpg';
    return data;
  };

  this.makeDateMenu = function( initDate, theStore, min ) {
    var btn = new Ext.Toolbar.Button({ 
      text: initDate.format('m/d/y'),
      menu: new Ext.menu.DateMenu({
        listeners:{ 
          'beforeshow':function(menu){
            menu.picker.setValue( initDate );
          },
          'select':function(picker,date){
            btn.setText( date.format('m/d/y') );
            if ( min ) {
              theStore.baseParams.min_taken_date = date.format('Y-m-d');
            }
            else {
              theStore.baseParams.max_taken_date = date.format('Y-m-d');
            }
          }
        }
      }),
      menuAlign:'br-tr'
    });

    return btn;
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
            theStore.baseParams.tags = theTxt;

            l.remove();
          };
        });
      }
    });

    return txtBtn;
  };

  this.getToolbar = function( ppg, store, fromDate, toDate, tags ) {
    return new vtour.FlickrPagingToolbar({
      pageSize: ppg,
      store: store,
      displayInfo: true,
      displayMsg: 'Displaying images {0} - {1} of {2}',
      emptyMsg: 'No images to display',
      items:[
        '-',
        { xtype: 'tbtext', text: 'From:' },
        this.makeDateMenu( fromDate, store, true ),
        '-',
        { xtype: 'tbtext', text: 'To:' },
        this.makeDateMenu( toDate, store, false ),
        '-',
        { xtype: 'tbtext', text: 'Tags:' },
        this.makeTextMenu( tags, store )
      ],
      listeners: {
        'beforedestroy': function(cmp){ 
          // destroy all the items in this toolbar, because something happens
          // with the menus and buttons that keeps the panel from clearing
          // if the items are not cleared when the toolbar is destroyed
          cmp.items.clear();
        }
      }
    }); 
  };

  this.getSelector = function( checked ) {
    var inputcfg = {
      tag: 'input', 
      type: 'radio', 
      name: 'photoService', 
      value: 'flickr', 
      onclick: 'changeService(this);', 
      id: 'fss'
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
          'for': 'fss',
          html: 'Flickr'
        }
      ]
    });
  };
};
