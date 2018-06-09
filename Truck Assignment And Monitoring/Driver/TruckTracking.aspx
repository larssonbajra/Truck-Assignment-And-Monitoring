<%@ Page Title="" Language="C#" MasterPageFile="~/Driver/Driver.Master" AutoEventWireup="true" CodeFile="TruckTracking.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Driver.TruckTracking" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
Truck Tracking
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Truck Track</title>
<script type="text/javascript" src="../js/jquery-1.9.0.js"></script>
<script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="../js/util.js"></script>

   
       <script type="text/javascript">

           setInterval(callIt, 5000);
           function callIt() {
               var name = ' <%=Session["Logged"]%> ';
               var URL = 'http://localhost:52362/Driver/DriverPage.aspx/CallFromJS';


               //var ssData = '{' + dataValue + '}';
               var LoginID = "{ namer: '<%=Session["Logged"]%>' }";
               $.ajax({
                   type: "POST",

                   url: URL,

                   //data: {'LoginID':name},
                   data: LoginID,

                   contentType: "application/json; charset=utf-8",
                   dataType: "json",

                   error: function (XMLHttpRequest, textStatus, errorThrown) {
                       alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                   },
                   success: function (result) {
                       if (result.d != null) {
                           alertify.alert(result.d, function (e) {
                               if (e) {
                                   window.location.href = "DriverPage.aspx";
                               }
                           });

                           return false
                       }

                   }
               });
               return false;
           }
           
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="driverBody" runat="server">
      <script language="javascript" src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=e10ec60e-629d-44e1-864f-f49c48e0c067"></script>

            <div id="map_div">
               
            </div>
    <script type="text/javascript">
           map = new Tmap.Map({
               div: 'map_div', // map을 표시해줄 div
               width: "80%", // map의 width 설정
               height: "800px", // map의 height 설정
           });
           map.setCenter(new Tmap.LonLat("127.897987", "36.501625").transform("EPSG:4326", "EPSG:3857"), 8);
           var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
           var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
           map.addLayer(routeLayer);//map에 벡터 레이어 추가
           map.addLayer(markerLayer);//map에 마커 레이어 추가

           setInterval(function callIt() {



               var timestamp = new Date().getTime();
               var data = '../data.xml?t=' + timestamp;
               var logged = ('<%=Session["Logged"]%>');

               $.get(data, {}, function (data) {
                   $(data).find("marker").each(
                       function () {
                           var marker = $(this);

                           var status = marker.attr("Status");
                           var truck = marker.attr("TruckID");

                           var plate = marker.attr("NumberPlate");
                           var LoginID = marker.attr("LoginID");

                          


                           // 시작
                           var size = new Tmap.Size(24, 38);//아이콘 크기 설정
                           var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
                           if (status == 10) {
                               var icon = new Tmap.Icon('/images/pin_g_m_r.png', size, offset);//마커 아이콘 설정
                           }
                           else if (status == 11) {
                               var icon = new Tmap.Icon('/images/pin_r_m_r.png', size, offset);//마커 아이콘 설정
                           }
                           else if (status == 12) {
                               var icon = new Tmap.Icon('/images/pin_b_m_r.png', size, offset);//마커 아이콘 설정
                           }
                          
                           var label = new Tmap.Label("now its here");
                          
                           var marker_s = new Tmap.Marker(new Tmap.LonLat(parseFloat(marker
                               .attr("YPosition")), parseFloat(marker.attr("XPosition"))).transform("EPSG:4326", "EPSG:3857"), icon, label);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
                           if (logged == LoginID) {
                               markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가
                           }
                           
                           var popup;
                           popup = new Tmap.Popup("p1",
                               new Tmap.LonLat(parseFloat(marker
                                   .attr("YPosition")), parseFloat(marker.attr("XPosition"))).transform("EPSG:4326", "EPSG:3857"),
                               new Tmap.Size(200, 100),
                               "<div>Truck ID= " + truck + "</div>" + "<div>Number Plate= " + plate + "</div>"
                           );
                          
                           map.addPopup(popup);
                           popup.hide();
                           marker_s.events.register("mousedown", popup, onMouseMarker);
                           marker_s.events.register("mouseout", popup, onMouseMarker);
                           marker_s.events.register("mouseover", popup, onMouseMarker);
                          
                           function onMouseMarker(evt)
                           {
                               if (evt.type == "mouseout") {
                                   this.show();
                               } else {
                                   this.hide();
                               }
                           }

                           setTimeout(function ()
                           {
                                   markerLayer.removeMarker(marker_s);
                                   popup.hide();


                               }, 4900);

                         
                           
                       });
             
              
               });
         
           }, 5000);

      
    </script>
</asp:Content>
