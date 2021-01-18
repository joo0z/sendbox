<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="http://maps.google.com/maps/api/js?
   &sensor=false"></script>
<!--    key=AIzaSyClFKeSHSjy9bZjEQly04w8aIRs9Os03oY -->
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      function init(){
         console.log("current_position = ", current_position);
         window.navigator.geolocation.getCurrentPosition(current_position);
      }
       
      function current_position(position){
    	  alert("API geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
          console.log("position = ", position);

          console.log("latitude = ", position.coords.latitude);
          console.log("longitude = ", position.coords.longitude);
          
          
          
//           var lat = parseFloat(position.coords.latitude) - parseFloat(0.0068522);
//           var lng = parseFloat(position.coords.longitude) + parseFloat(0.0039437999999);
         
          //var latlng = new google.maps.LatLng(lat, lng);
          //var latlng = new google.maps.LatLng('36.3230', '127.4187');
//           var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          // 상하, 좌우
          // 실제 위치
          // 36.3298522 ==> 0.0068522
          // 127.41475620000001 ==> +0.0039437999999
//           console.log("위도 : ", position.coords.latitude)
//           console.log("위도 : ", position.coords.longitude)
          
          
//           var map_options = {
//               center:latlng,zoom:14,
//               mapTypeId:google.maps.MapTypeId.ROADMAP,
//               mapTypeControl:false,
//               navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
//           }
          
//           var map = new google.maps.Map(document.getElementById("google_map"), map_options);
//           var marker = new google.maps.Marker({position:latlng,map:map,title:"You are here!"});
      }
      window.addEventListener("load", init);
   </script>
</head>
<body>
   <div id="google_map" style="width:500px;height:500px;"></div>
</body>
</html>
