/*
 * A picasa adapter for vtour.
 *
 * Requires Ext
 */

Ext.ns( 'vtour' );

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
      {name: 'description', mapping: 'summary.$t'},
      {name: 'imageurl', mapping: 'content.src'},
      {name: 'author', mapping: 'author'},
      {name: 'thumb', mapping: 'media$group.media$thumbnail'},
      {name: 'location', mapping: 'georss$where'}
    ])
  );

  this.template = new Ext.XTemplate( 
    '<tpl for=".">',
    '<div>what</div>',
    '</tpl>'
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
        'max-results': ppg,
        bbox: bbox
      }
    });
  
    store.load({ params:
      {
        from: 1,
        to: ppg
      }
    });

    return store;
  };

  this.prepareData = function(data){
    return data;
  };

  this.getToolbar = function( ppg, store, fromDate, toDate, tags ) {
    return new Ext.PagingToolbar({
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
