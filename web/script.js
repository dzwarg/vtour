//
//
//  YAHOO map section
//
//

// Create a map object
var map;

// Create an array of tour pts
var tour = new Tour();
var mapEvt = null;
var waitQueue = new Array();

// A tooltip panel
var tooltip;

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

  document.getElementById('place').focus();

  tooltip = document.getElementById('tooltip');
}

// mouse click capture function
function markPt(_e, _c){
  if ( tour.TourPolyline ) map.removeOverlay( tour.TourPolyline );
  
  tour.addPoint( _c.Lat, _c.Lon );

  map.addOverlay( tour.getPolyline() );

  var myPoint = tour.TourPoints[ tour.TourPoints.length - 1 ];

  YEvent.Capture( myPoint.Marker, EventsList.MouseClick, 
    function(){
      map.removeOverlay( myPoint.Marker );
      if ( tour.TourPolyline ) map.removeOverlay( tour.TourPolyline );

      var index = tour.indexOfMarker( myPoint.Marker );
 
      tour.removePoint( index );

      map.addOverlay( tour.getPolyline() );
    }
  );

  map.addOverlay( myPoint.Marker );

  myPoint.fetchPhotos( map, waiting );
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

var flickrkey='flickrkey';
var tourleg = 0;
var resultMarkers = new Array();

function clearTour()
{
  clearTourPhotos();

  map.removeOverlay( tour.TourPolyline );

  while ( tour.TourPoints.length > 0 )
  {
    var tourPt = tour.TourPoints.pop();
    map.removeOverlay( tourPt.Marker );
  }

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

  for ( var stripIndex = (strips.length-2); stripIndex >= 0; stripIndex-- )
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
  if ( state )
  {
    waitQueue.push(state);
  }
  else
  {
    waitQueue.pop();
  }

  var waitdiv = document.getElementById('waiting');
  waitdiv.style.display = (waitQueue.length > 0) ? 'block' : 'none';
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

  var markup = '<div class="photoPopup"><a href="' + 
    rsp.photo.urls.url[0]._content + '"><img src="' + url + '" alt="' +
    rsp.photo.title._content + '" border="0"/></a>' + '<center><a href="' + 
    rsp.photo.urls.url[0]._content + '">' + rsp.photo.urls.url[0].type + 
    '</a><br/>' + rsp.photo.title._content + '</center></div>';

  YEvent.Capture( marker, EventsList.MouseClick,
    function(){
      marker.openSmartWindow( markup );
    }
  );

  var preCache = new Image();
  preCache.src = url;

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

function placeInputEvent(event)
{
  if( event.keyCode == event.DOM_VK_ENTER ||
      event.keyCode == event.DOM_VK_RETURN )
  {
    findPlace();
  }
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

//
//
// Close the initial help window.
//
//
function closeHelp( event )
{
  var helpDiv = document.getElementById('help');
  helpDiv.style.display = 'none';
}

//
//
// Show and hide tooltip window.
//
//
var tooltipTimeout;

function showTooltip(event,text,align)
{
  var x = event.clientX;
  var y = event.clientY;

  tooltipTimeout = setTimeout( function(){
    tooltip.innerHTML = text;
    tooltip.style.display = 'block';
 
    if ( align == 'R' )
    { 
      tooltip.style.left = (x+5) + 'px';
    }
    else
    {
      tooltip.style.left = (x-(5+tooltip.clientWidth)) + 'px';
    }
    tooltip.style.top = (y+5) + 'px';

    clearTimeout( tooltipTimeout );
  }, 500 );
}

function hideTooltip()
{
  if ( tooltipTimeout != null ) clearTimeout( tooltipTimeout );

  tooltip.style.display = 'none';
}

function showHelp(item)
{
  var itemDiv = document.getElementById('help_'+item);
  itemDiv.className = 'centered';
}
