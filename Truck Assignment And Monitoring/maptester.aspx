<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maptester.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.maptester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TESTER TRACKER</title>
    <script type="text/javascript" src="../js/jquery-1.9.0.js"></script>
<script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="../js/util.js"></script>
<script type="text/javascript">

	
    var customIcons = {
        10: {
            icon: 'http://localhost:52362/images/free.png',
            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
        },
        11: {
            icon: 'http://localhost:52362/images/busy.png',
            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
        },
        12: {
            icon: 'http://localhost:52362/images/passive.png',
            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
        }
    };


	
	var infoWindow = null;	

	
	var map = null;
	
	
	var markersArray = [];


	function initialize() {

		
        var myLatlng = new google.maps.LatLng(36.571333, 127.916000);
		var myOptions = {
			zoom : 7,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}

		map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);
				
		infoWindow = new google.maps.InfoWindow;				
		
		
		updateMaps();

		
		window.setInterval(updateMaps, 10000);

	}
	
	
    function clearOverlays() {
	  for (var i = 0; i < markersArray.length; i++ ) {
	   markersArray[i].setMap(null);
	  }
	}
	
	
	function updateMaps() {

		
		clearOverlays();

	
		
		var timestamp = new Date().getTime();
		var data = '../data.xml?t=' + timestamp;
		
		
		$.get(data, {}, function(data) {
            $(data).find("marker").each(
                function () {
                    var marker = $(this);
                    var status = marker.attr("Status")
                    var truck = marker.attr("TruckID")
                  
                    var plate = marker.attr("NumberPlate")
                    var firstname = marker.attr("FirstName")
                    var lastname = marker.attr("LastName")
                  


                        var icon = customIcons[status] || {};
                      
                 

                            var latlng = new google.maps.LatLng(parseFloat(marker
                                .attr("XPosition")), parseFloat(marker.attr("YPosition")));
                            var html = "<b>this location is " + truck + "<br/>TruckNumber " + plate + "<br/>FirstName " + firstname + "<br/>FamilyName " + lastname;

                            var marker = new google.maps.Marker({
                                position: latlng,
                                map: map,
                                icon: icon.icon,
                                shadow: icon.shadow,
                            });


                            google.maps.event.addListener(marker, 'click', function () {
                                infoWindow.setContent(html);
                                infoWindow.open(map, marker);
                            });


                            markersArray.push(marker);

                            google.maps.event.addListener(marker, "click", function () { });
                       
					});
			});

		}

		google.setOnLoadCallback(initialize);
	
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div id="map_canvas" style="width:1200px; height: 800px"></div>
    


      <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5nsI-hCeZ7ZQJ-IKSHjQ_I5PYEJy-Tb4&callback=initMap"
  type="text/javascript"></script>
        </div>
    </form>
</body>
</html>
