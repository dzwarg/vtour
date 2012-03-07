/**
 * @class Ext.FlickrPagingToolbar
 * @extends Ext.PagingToolbar
 * A specialized toolbar that is bound to a {@link Ext.data.Store} and provides automatic paging controls
 * for a Flickr JSON photo search result.
 * @constructor
 * Create a new FlickrPagingToolbar
 * @param {Object} config The config object
 */
Ext.FlickrPagingToolbar = Ext.extend(Ext.PagingToolbar, {
    /**
     * Object mapping of parameter names for load calls (defaults to {start: 'page', limit: 'per_page'})
     */
    paramNames : {start: 'page', limit: 'per_page'},

    initComponent : function(){
        Ext.FlickrPagingToolbar.superclass.initComponent.call(this);
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
Ext.reg('fpaging', Ext.FlickrPagingToolbar);
