// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function initMap(lat, lng) {

  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
  center: myCoords,
  zoom: 14
  };

  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var marker = new google.maps.Marker({
      position: myCoords,
      map: map
  });
}

function initMap2() {
    var lat = document.getElementById('location_lat').value;
    var lng = document.getElementById('location_lng').value;
    // if not defined create default position
    if (!lat || !lng){
        lat=51.5;
        lng=-0.125;
        document.getElementById('location_lat').value = lat;
        document.getElementById('location_lng').value = lng;
    }
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map2'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });
    // refresh marker position and recenter map on marker
    function refreshMarker(){
        var lat = document.getElementById('location_lat').value;
        var lng = document.getElementById('location_lng').value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());
    }
    // when input values change call refreshMarker
    document.getElementById('location_lat').onchange = refreshMarker;
    document.getElementById('location_lng').onchange = refreshMarker;
    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('location_lat').value = newlat;
        document.getElementById('location_lng').value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());
    });
}

// function to use current location_lng
$(document).on('turbolinks:load', function() {
  $('#use_current_location').click(function(event){
    useCurrentLocation()
  });
})

function useCurrentLocation() {
  if (navigator.geolocation) {
     navigator.geolocation.getCurrentPosition(function (position) {
        document.getElementById('location_lat').value = position.coords.latitude;
        document.getElementById('location_lng').value = position.coords.longitude;

        initMap2()
     });
  }
}

$(document).on('turbolinks:load', function() {
  $('.location_option').click(function(event){
    $('.location_option').removeClass('location-highlighted');
    $(this).toggleClass('location-highlighted');
    $('#location_address').val(event.target.children[0].innerHTML);
    $('#location_lat').val(event.target.children[1].innerHTML);
    $('#location_lng').val(event.target.children[2].innerHTML);
  });
})

$(document).on('turbolinks:load', function() {
  $('.hover_map_change').hover(function(event){
    if (event.target.children[1].innerHTML !== null) {
      initMap(event.target.children[1].innerHTML, event.target.children[2].innerHTML)
    }
  });
})
