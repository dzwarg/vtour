//
//
//  YAHOO map section
//
//

// Create a map object
var map;

// Create an array of tour pts
var tourPts = new Array();
var tourPolys = new Array();
var tourMarkers = new Array();
var resultMarkers = new Array();
var tour = null;
var mapEvt = null;

function setup()
{
  map = new YMap(document.getElementById('map'));

  // Add map type control
  map.addTypeControl();

  // Add map zoom levels
  map.addZoomLong();

  // Set map type to either of: YAHOO_MAP_SAT, YAHOO_MAP_HYB, YAHOO_MAP_REG
  map.setMapType(YAHOO_MAP_REG);

  // Display the map centered on a geocoded location
  map.drawZoomAndCenter("Philadelphia, PA", 3);

  // Add an event to capture mouse clicks
  // This event sucks, because it counts a map drag as a click
  //YEvent.Capture(map, EventsList.MouseClick, markPt);

  YEvent.Capture(map, EventsList.MouseDown, function(_e,_c){
    mapEvt = _c;
  });

  YEvent.Capture(map, EventsList.MouseUp, function(_e,_c){
    if ( mapEvt == null ) return;
    if ( _c.Lat == 0 && _c.Lon == -180 ) return;
    if ( (_c.Lat-mapEvt.Lat) == 0 && (_c.Lon-mapEvt.Lon) == 0 )
    {
      markPt(_e,_c);
    }
    mapEvt = null;
  });
}

// mouse click capture function
function markPt(_e, _c){
  // get the coordinate of this point
  var geoPt = new YGeoPoint( _c.Lat, _c.Lon );
  var marker = new YMarker( geoPt );
  marker.addAutoExpand("Click to delete");

  if ( tour ) map.removeOverlay( tour );

  tourPts.push( geoPt );
  tour = new YPolyline( tourPts, 'black', 7, 0.7 );

  YEvent.Capture( marker, EventsList.MouseClick, 
    function(){
      map.removeOverlay(marker);
      if ( tour ) map.removeOverlay(tour);

      // find out exactly which item to splice out
      var ptIndex = -1;
      for( var i = 0; i < tourPts.length; i++ )
      {
        if ( tourPts[i].Lat == marker.YGeoPoint.Lat &&
             tourPts[i].Lon == marker.YGeoPoint.Lon )
          ptIndex = i;
      }

      // splice out the matching point, and only that point
      tourPts.splice( ptIndex, 1 );
      tourPolys.splice( ptIndex, 1 );
      tourMarkers.splice( ptIndex, 1 );
      tour = new YPolyline( tourPts, 'black', 7, 0.7 );
      map.addOverlay( tour );
    }
  );

  map.addOverlay(marker);
  tourMarkers.push( marker );

  if ( tourPts.length > 1 )
  {
    map.addOverlay( tour );
  }

  var coord = map.convertLatLonXY( marker.YGeoPoint );
  var coord1 = new YCoordPoint( coord.x + 25, coord.y - 25 );
  var coord2 = new YCoordPoint( coord.x + 25, coord.y + 25 );
  var coord3 = new YCoordPoint( coord.x - 25, coord.y + 25 );
  var coord4 = new YCoordPoint( coord.x - 25, coord.y - 25 );

  var polyBounds = [
    map.convertXYLatLon( coord1 ),
    map.convertXYLatLon( coord2 ),
    map.convertXYLatLon( coord3 ),
    map.convertXYLatLon( coord4 ),
    map.convertXYLatLon( coord1 ) ];

  tourPolys.push( new YPolyline( polyBounds, 'green', 1, 1 ) );
  //map.addOverlay( tourPolys[ tourPolys.length - 1 ] );
  //debugMessage( 'Ft per pixel:' + (map.getUnitsPerPixel( map.getZoomLevel() ).miles * 5280) + '<br/>' );
}

function enumerateProperties ( obj )
{
  for ( var p in obj )
  { debugMessage( 'obj['+p+']='+obj[p]+'<br/>' ); }
}
  
//
//
//  Flickr scripting
//
//

var flickrkey='d9a76ca10b3a34cf59a859843d495b63';
var tourleg = 0;

function clearTour()
{
  clearTourPhotos();

  while ( tourMarkers.length > 0 )
  {
    var marker = tourMarkers.pop();
    map.removeOverlay( marker );
  }

  map.removeOverlay( tour );

  tour = null;
  tourPts = new Array();
  tourPolys = new Array();
  tourMarkers = new Array();
  resultMarkers = new Array();
}

function clearTourPhotos()
{
  var photosDiv = document.getElementById('photos');

  while ( photosDiv.childNodes.length > 0 )
  {
    photosDiv.removeChild( photosDiv.firstChild );
  }
  tourleg = 0;

  while ( resultMarkers.length > 0 )
  {
    var marker = resultMarkers.pop();
    map.removeOverlay( marker );
  }

  var current = document.getElementById('pagerNow');
  current.removeChild( current.firstChild );
  current.appendChild( document.createTextNode('0') );

  var total = document.getElementById('pagerTotal');
  total.removeChild( total.firstChild );
  total.appendChild( document.createTextNode('0') );
}

function getTourPhotos()
{
  waiting(true);

  if ( tourPolys.length == 0 )
  {
    window.alert( 'add a point first!' );
    waiting(false);
    return;
  }

  if ( tourleg + 1 > tourPolys.length )
  {
    // end of the tour!
    waiting(false);
    return;
  }

  var bbox = BoundsFromPoly( tourPolys[tourleg++] );
  //debugMessage( bbox );

  var url = 'http://www.zwarg.com/cgi-bin/pxy.cgi?';
  var params = 'method=flickr.photos.search&format=json&api_key=';
  params += flickrkey+'&bbox='+bbox+'&min_taken_date=2007-1-1&per_page=10';
  params += '&jsoncallback=geoSearchResponse';
  url += escape( params );
    
  var xmlReq = getXmlRequest();

  xmlReq.onreadystatechange=function(){
    if ( xmlReq.readyState == 4 )
    {
      if ( xmlReq.status == 200 )
      {
        //debugMessage( '<div>' + xmlReq.responseText + '</div>' );
        eval( xmlReq.responseText );

        window.setTimeout( 'getTourPhotos()', 0 );
      }
      else
      { window.alert( 'problem getting photos for tour point ' + (tourleg-1) ); }
    }
  };
  xmlReq.open('GET',url,true);
  xmlReq.send(null);
}

function BoundsFromPoly( polyline )
{
  var minx = polyline._path[2].Lon;
  var miny = polyline._path[2].Lat;
  var maxx = polyline._path[0].Lon;
  var maxy = polyline._path[0].Lat;

  return minx+','+miny+','+maxx+','+maxy;
}

function geoSearchResponse(rsp)
{
  if ( rsp.stat != 'ok' )
  {
    return;
  }

  var photoDiv = document.createElement('div');
  photoDiv.id = 'photos' + (tourleg-1);
  photoDiv.style.display = (tourleg == 1) ? 'block' : 'none';

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

  var photosDiv = document.getElementById('photos');
  photosDiv.appendChild( photoDiv );

  if ( photosDiv.childNodes.length == 1 )
  {
    var current = document.getElementById('pagerNow');
    current.removeChild( current.firstChild );
    current.appendChild( document.createTextNode( '1' ) );
  }

  var total = document.getElementById('pagerTotal');
  total.removeChild( total.firstChild );
  total.appendChild( document.createTextNode( photosDiv.childNodes.length ) );
}

// Lightstrip navigation
function prevPoint()
{
  var current = document.getElementById('pagerNow');
  var photosDiv = document.getElementById('photos');
  var strips = photosDiv.childNodes;

  for ( var stripIndex = 1; stripIndex < strips.length; stripIndex++ )
  {
    if ( strips[stripIndex].style.display == 'block' )
    {
      strips[ stripIndex - 1 ].style.display = 'block';
      strips[ stripIndex ].style.display = 'none';

      current.removeChild( current.firstChild );
      current.appendChild( document.createTextNode( stripIndex ) );
    }
  }
}

function nextPoint()
{
  var current = document.getElementById('pagerNow');
  var photosDiv = document.getElementById('photos');
  var strips = photosDiv.childNodes;

  for ( var stripIndex = (strips.length-1); stripIndex >= 0; stripIndex-- )
  {
    if ( strips[stripIndex].style.display == 'block' )
    {
      strips[ stripIndex + 1 ].style.display = 'block';
      strips[ stripIndex ].style.display = 'none';

      current.removeChild( current.firstChild );
      current.appendChild( document.createTextNode( stripIndex + 2 ) );
    }
  }
}

function debugMessage( message )
{
  var div = document.getElementById('debug');

  div.innerHTML += message;
}

function getXmlRequest()
{
  var xmlReq;

  if ( window.XMLHttpRequest )
  {
    xmlReq = new XMLHttpRequest();
  }
  else if ( window.ActiveXObject )
  {
    xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
  }
  
  return xmlReq;
}

function waiting( state )
{
  var waitdiv = document.getElementById('waiting');
  waitdiv.style.display = (state) ? 'block' : 'none';
}

function getImageInfo()
{
  var loader = this.parentNode.childNodes[2];
  loader.style.display = 'block';
  var xmlReq = getXmlRequest();

  var info = this.flickrInfo;

  var url = 'http://www.zwarg.com/cgi-bin/pxy.cgi?';
  var params = 'method=flickr.photos.getInfo&format=json&api_key=';
  params += flickrkey+'&photo_id='+info.id+'&secret=';
  params += info.secret + '&nojsoncallback=1';
  url += escape( params );

  xmlReq.onreadystatechange=function(){
    if ( xmlReq.readyState == 4 )
    {
      if ( xmlReq.status == 200 )
      {
        var rsp;
        eval( 'rsp=' + xmlReq.responseText );
        photoInfoResponse(rsp, info.url);
        loader.style.display='none';
      }
      else
      { window.alert( 'problem getting info for photo ' + this.flickrInfo.id ); }
    }
  };
  xmlReq.open('GET',url,true);
  xmlReq.send(null);
}

function photoInfoResponse(rsp,url)
{
  if ( rsp.stat != 'ok' )
  {
    window.alert( 'get photo info response was not okay!' );
    return;
  }

  var geoPt = new YGeoPoint( rsp.photo.location.latitude, 
                             rsp.photo.location.longitude );
  var marker = new YMarker( geoPt, createCameraIcon() );
  resultMarkers.push( marker );

  var markup = '<a href="' + rsp.photo.urls.url[0]._content + '">' +
    '<img src="' + url + '" alt="' + rsp.photo.title._content + 
    '" border="0"/></a>' + '<center><a href="' + 
    rsp.photo.urls.url[0]._content + '">' + rsp.photo.urls.url[0].type + 
    '</a><br/>' + rsp.photo.title._content + '</center>';

  YEvent.Capture( marker, EventsList.MouseClick,
    function(){
      marker.openSmartWindow( markup );
    }
  );

  map.addOverlay( marker );
  marker.addAutoExpand('show photo');
  marker.openSmartWindow( markup );
}

function createCameraIcon()
{
  var myImage = new YImage();
  myImage.src = 'http://www.zwarg.com/vtour/cameraicon.gif';
  myImage.size = new YSize(16,16);
  myImage.offsetSmartWindow = new YCoordPoint(3,1);
  return myImage;
}

function findPlace()
{
  var place = document.getElementById('place');
  place.style.color='#000000';
  YEvent.Capture( map, EventsList.onEndGeoCode, function(_e){
    if ( _e.success )
    {
      map.panToLatLon(_e.GeoPoint);
    }
    else
    {
      place.style.color='#ff0000';
    }
  });
  map.geoCodeAddress(place.value);
}
