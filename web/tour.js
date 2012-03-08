//
// A Tour data object
//
function Tour()
{
  this.TourPoints = new Array();
  this.TourPolyline = null;
}

//
// Add a point to this tour
//
Tour.prototype.addPoint = function( lat, lon )
{
  var pt = new TourPoint( lat, lon );

  this.TourPoints.push( pt );
  
  this.TourPolyline = null;
};

//
// Remove a point from this tour
//
Tour.prototype.removePoint = function( index )
{
  if ( index >= 0 && index < this.TourPoints.length - 1 )
  {
    this.TourPoints.splice( index, 1 );
    this.TourPolyline = null;
  }
};

//
// Find the place in this tour of a specific marker
//
Tour.prototype.indexOfMarker = function( marker )
{
  var ptIndex = -1;
  
  for ( var i = 0; i < this.TourPoints.length; i++ )
  {
    var pt = this.TourPoints[ i ];
    
    if ( pt.Marker.id == marker.id )
      ptIndex = i;
  }
  
  return ptIndex;
};

//
// Find the place in this tour of a specific coordinate
//
Tour.prototype.indexOfCoord = function( coord )
{
  var ptIndex = -1;
  
  for ( var i = 0; i < this.TourPoints.length; i++ )
  {
    var pt = this.TourPoints[ i ];
    
    if ( pt.Coord.Lat == coord.Lat && pt.Coord.Lon == coord.Lon )
      ptIndex = i;
  }
  
  return ptIndex;
};

//
// Get all the markers in this tour
//
Tour.prototype.getMarkers = function()
{
  var markers = new Array();
  
  for ( var i = 0; i < this.TourPoints.length; i++ )
  {
    markers.push( this.TourPoints[i].Marker );
  }
  
  return markers;
};

//
// Get the polyline that describes this tour
//
Tour.prototype.getPolyline = function()
{
  if ( this.TourPolyline == null )
  {
    var points = new Array();

    for ( var i = 0; i < this.TourPoints.length; i++ )
    {
      points.push( this.TourPoints[i].Coord );
    }
	
    this.TourPolyline = new YPolyline( points, 'black', 7, 0.7 );
  }

  return this.TourPolyline;
};

//
// Get the bounds for each point of this tour, in order
//
Tour.prototype.getPointBounds = function(map)
{
  var bounds = new Array();
  
  for ( var i = 0; i < this.TourPoints.length; i++ )
  {
    bounds.push( this.TourPoints[i].computeBounds(map) );
  }
  
  return bounds;
};

//
// A single point along this tour
//
function TourPoint( lat, lon )
{
  this.Marker = null;
  this.Coord = null;
  this.PhotoPanel = null;
  this.DateLimit = new Date();
  this.DateLimit.setFullYear( this.DateLimit.getFullYear() - 1 );
  this.ResultsPage = 1;
  this.SearchUrl = '';

  if ( lat && lon )
  {
    this.Coord = new YGeoPoint( lat, lon );
    this.Marker = new YMarker( this.Coord );
    this.Marker.addAutoExpand("Click to delete");
  }
}

//
// Calculate the bounding box for this point ( however big 25px is in the scale of the map )
//
TourPoint.prototype.computeBounds = function( map )
{
  var coord = map.convertLatLonXY( this.Coord );
  var minxy = map.convertXYLatLon( new YCoordPoint( coord.x - 25, coord.y + 25 ) );
  var maxxy = map.convertXYLatLon( new YCoordPoint( coord.x + 25, coord.y - 25 ) );
	
  var bounds =  minxy.Lon + ',' + minxy.Lat + ',' +
    maxxy.Lon + ',' + maxxy.Lat;
  
  return bounds;
};

TourPoint.prototype.fetchPhotos = function( map, waitingRef )
{
  waitingRef(true);

  var bbox = this.computeBounds( map );

  var url = 'http://www.zwarg.com/cgi-bin/pxy.cgi?';
  var params = 'method=flickr.photos.search' +
    '&format=json' +
    '&api_key=' + flickrkey +
    '&bbox=' + bbox +
    '&min_taken_date=' + this.DateLimit.getFullYear() + 
                   '-' + (this.DateLimit.getMonth() + 1) +
                   '-' + this.DateLimit.getDate() +
    '&page=' + this.ResultsPage +
    '&per_page=10' +
    '&nojsoncallback=1';
  this.SearchUrl = url + escape( params );

  this.SendFetchRequest( this.SearchUrl, waitingRef );
};

TourPoint.prototype.SendFetchRequest = function ( url, waitingRef )
{
  var xmlReq = getXmlRequest();

  var caller = this;

  xmlReq.onreadystatechange=function(){
    if ( xmlReq.readyState == 4 )
    {
      if ( xmlReq.status == 200 )
      {
        var rsp;
        eval( 'rsp = ' + xmlReq.responseText );
        caller.fetchPhotosCallback( rsp );

        waitingRef(false);
      }
    }
  };
  xmlReq.open('GET',url,true);
  xmlReq.send(null);
};

TourPoint.prototype.fetchPhotosCallback = function( rsp )
{
  var photosDiv = document.getElementById('photos');

  var photoDiv = document.getElementById('photos'+this.Marker.id);

  if ( photoDiv == null )
  {
    photoDiv = document.createElement('div');
    photoDiv.id = 'photos' + this.Marker.id;
  }
  else
  {
    while ( photoDiv.childNodes.length > 0 )
    {
      photoDiv.removeChild( photoDiv.firstChild );
    }
  }

  var begin = document.createElement('div');
  begin.className='topFloat';
  begin.appendChild( document.createTextNode('\u00a0') );

  photoDiv.appendChild( begin );

  for ( var photoIndex = 0; photoIndex < rsp.photos.photo.length; photoIndex++ )
  {
    var photo = rsp.photos.photo[ photoIndex ];

    var baseURL = 'http://farm' + photo.farm + '.static.flickr.com/' +
      photo.server + '/' + photo.id + '_' + photo.secret;

    var thumbURL = baseURL + '_s.jpg';
    var pictURL = baseURL + '_m.jpg';

    var photoItem = document.createElement('div');
    photoItem.className = 'photoItem';

    var img = document.createElement('img');
    img.src = thumbURL;
    img.alt = photo.title;
    img.flickrInfo = { id:photo.id, secret:photo.secret, url:pictURL };
    img.onclick = getImageInfo;

    var loaderImg = document.createElement('img');
    loaderImg.className = 'itemLoader';
    loaderImg.src = 'indicator_arrows_circle.gif';

    photoItem.appendChild( img );
    photoItem.appendChild( document.createElement('br') );
    photoItem.appendChild( loaderImg );

    photoDiv.appendChild( photoItem );
  }

  var end = document.createElement('div');
  end.className='bottomFloat';
  end.appendChild( document.createTextNode('\u00a0') );

  photoDiv.appendChild( end );

  photoDiv.appendChild( this.MorePhotoInfo( rsp ) );

  this.PhotoPanel = photoDiv;

  photosDiv.appendChild( photoDiv );

  this.ShowLastPhotoPanel( photosDiv );
  this.UpdatePhotoPaging( photosDiv );
};

TourPoint.prototype.MorePhotoInfo = function( rsp )
{
  var from = ((rsp.photos.page-1)*rsp.photos.perpage)+1;
  var to = (rsp.photos.page-1)*rsp.photos.perpage+rsp.photos.perpage;
  to = ( rsp.photos.total < to ) ? rsp.photos.total : to;

  var info = document.createElement('div');
  info.className = 'smalltext';

  if ( from > 1 )
  {
    var prev = document.createElement('span');
    prev.className = 'resultButton';
    prev.onclick = this.MorePhotosFunction('prev');
    prev.appendChild( document.createTextNode('\u00ab') );
    info.appendChild( prev );
  }

  var infoStr = from.toString() + ' to ' + to.toString() + ' of ' + rsp.photos.total;
  info.appendChild( document.createTextNode( infoStr ) );

  if ( to < rsp.photos.total )
  {
    var next = document.createElement('span');
    next.className = 'resultButton';
    next.onclick = this.MorePhotosFunction('next');
    next.appendChild( document.createTextNode('\u00bb') );
    info.appendChild( next );
  }

  return info;
};

TourPoint.prototype.MorePhotosFunction = function(dir)
{
  var caller = this;
  return function(){
    if(dir == 'next')
    { caller.ResultsPage++; }
    else
    { caller.ResultsPage--; }

    //&page=1
    var newUrl = caller.SearchUrl.replace( /\%26page\%3D\d+/, '%26page%3D' + caller.ResultsPage);
    
    caller.SendFetchRequest( caller.SearchUrl, waiting );
  };
};

TourPoint.prototype.ShowLastPhotoPanel = function( div )
{
  for( var i = 0; i < div.childNodes.length-1; i++ )
  {
    div.childNodes[i].style.display = 'none';
  }

  div.childNodes[ div.childNodes.length - 1 ].style.display = 'block';
};

TourPoint.prototype.UpdatePhotoPaging = function( container )
{
  var current = document.getElementById('pagerNow');
  current.removeChild( current.firstChild );
  current.appendChild( document.createTextNode( container.childNodes.length ) );

  var total = document.getElementById('pagerTotal');
  total.removeChild( total.firstChild );
  total.appendChild( document.createTextNode( container.childNodes.length ) );
};
