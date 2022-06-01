<%-- 
    Document   : acompanhaEntregaProduto
    Created on : 13/07/2019, 21:55:54
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
          <meta name="viewport" content="initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
        <h1>Hello World!</h1>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf3Aujej0dSSNZA7R9iYiYStzPA8tqYO8&callback=initMap"async defer></script>
  </body>
</html>
   
