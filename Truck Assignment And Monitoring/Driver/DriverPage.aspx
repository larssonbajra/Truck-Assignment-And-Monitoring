<%@ Page Title="" Language="C#" MasterPageFile="~/Driver/Driver.Master" AutoEventWireup="true" CodeFile="DriverPage.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Driver.DriverIndex" %>

<%@ Import Namespace="System.Web.Services" %>
<script type="text/C#" runat="server">

    [WebMethod]
    public static string CallFromJS(string namer)
    {
        string data=Emergency(namer);

        return data;
    }
</script>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
Driver Home
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../js/jquery-1.9.0.js"></script>
    <script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="../js/util.js"></script>
       <script type="text/javascript">
           function updateProgress(data) {
               if (data == "0")
               {
                   alertify.alert("Trip Started. All the owners are notified", function (e) {
                       if (e) {
                           window.location.href = "DriverPage.aspx";
                       }
                   });
               }
               else if (data == "1")
               {
                   alertify
                       .alert("Trip Cannot be started. Truck has no cargo", function () {
                           alertify.message('OK');
                       });
               }
               else if (data == "2")
               {
                   alertify
                       .alert("Trip Already Started", function () {
                           alertify.message('OK');
                       });
               }

           }

           function EndTrip(data) {
               if (data == "0") {
                   alertify.alert("Trip finished. Your truck is able to receive cargo requests.", function (e) {
                       if (e) {
                           window.location.href = "DriverPage.aspx";
                       }
                   });
               }
               else if (data == "1") {
                   alertify
                       .alert("Trip is already ended or all the cargos are not delivered yet", function () {
                           alertify.message('OK');
                       });
               }
             

           }
         

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
               width: "50%", // map의 width 설정
               height: "500px", // map의 height 설정
           });
           map.setCenter(new Tmap.LonLat("127.897987", "36.501625").transform("EPSG:4326", "EPSG:3857"), 8);
           var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
           var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
           map.addLayer(routeLayer);//map에 벡터 레이어 추가
           map.addLayer(markerLayer);//map에 마커 레이어 추가

           setInterval(function callIt() {



               var timestamp = new Date().getTime();
               var data = '../drivermap.xml?t=' + timestamp;
               var logged = ('<%=Session["Logged"]%>');

               $.get(data, {}, function (data) {
                   $(data).find("marker").each(
                       function () {
                           var marker = $(this);

                           var status = marker.attr("Status");
                           var truck = marker.attr("TruckID");
                           var CargoID = marker.attr("CargoID")
                           var PickFrom = marker.attr("PickFrom");
                           var DropTo = marker.attr("DropTo");
                           var PickDates = marker.attr("PickDates");
                           var DropDates = marker.attr("DropDates");
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
                               new Tmap.Size(300, 200),
                               "<div>Truck ID= " + truck + "</div>" + "<div>CargoID= " + CargoID + "</div>" + "<div>PickFrom= " + PickFrom + "</div>" + "<div>DropTo= " + DropTo + "</div>" + "<div>PickDates= " + PickDates + "</div>" + "<div>DropDates= " + DropDates + "</div>"
                           );

                           map.addPopup(popup);
                           popup.hide();
                           marker_s.events.register("mousedown", popup, onMouseMarker);
                           marker_s.events.register("mouseout", popup, onMouseMarker);
                           marker_s.events.register("mouseover", popup, onMouseMarker);

                           function onMouseMarker(evt) {
                               if (evt.type == "mouseout") {
                                   this.show();
                               } else {
                                   this.hide();
                               }
                           }

                           setTimeout(function () {
                               markerLayer.removeMarker(marker_s);
                               popup.hide();


                           }, 5000);



                       });


               });

           }, 5000);


    </script>
    <h1>Deals Done</h1>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceDealTruckShow" AllowPaging="True" AllowSorting="True">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDealTruckShow" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpDealTruckShow" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p><br />
        <asp:DropDownList ID="DropDownList1"  class="btn btn-secondary dropdown-toggle" runat="server" DataSourceID="SqlDataSourceDropDownTruck" DataTextField="TruckID" DataValueField="TruckID">
        </asp:DropDownList>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Start" runat="server" Text="Start Trip" class="btn btn-outline-primary waves-effect" OnClick="Start_Trip"/>
         &nbsp;&nbsp;&nbsp;<asp:Button ID="Stop" runat="server" Text="End Trip" class="btn btn-outline-primary waves-effect" OnClick="End_Trip"/>
        <asp:SqlDataSource ID="SqlDataSourceDropDownTruck" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpDropDownTruck" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </p>
        <h1>In Transit</h1>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSourceTransitDriver" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" ReadOnly="True" SortExpression="TransactionID" />
                <asp:BoundField DataField="TruckID" HeaderText="TruckID" SortExpression="TruckID" />
                <asp:BoundField DataField="CargoID" HeaderText="CargoID" SortExpression="CargoID" />
                <asp:BoundField DataField="PickUpTime" HeaderText="PickUpTime" SortExpression="PickUpTime" />
                <asp:BoundField DataField="ArrivalTime" HeaderText="ArrivalTime" SortExpression="ArrivalTime" />
                <asp:BoundField DataField="PickFrom" HeaderText="PickFrom" SortExpression="PickFrom" />
                <asp:BoundField DataField="DropTo" HeaderText="DropTo" SortExpression="DropTo" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTransitDriver" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpTransitCargoDriver" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
   
</asp:Content>
