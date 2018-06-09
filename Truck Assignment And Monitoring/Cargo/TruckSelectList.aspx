<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="TruckSelectList.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.TruckSelectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Truck Select List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript" src="../js/jquery-1.9.0.js"></script>

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="../js/util.js"></script>

       <script type="text/javascript">
           function DriverError(data) {
               if (data == 0) {
                   alertify
                       .alert("Please select at least 1 truck", function () {
                           alertify.message('OK');
                       });
               }
               
               else if (data> 5) {
                   alertify
                       .alert("Cannot select more than 5 trucks", function () {
                           alertify.message('OK');
                       });
               }
               else if ( (data< 6)&& (data>0)) {
                   alertify.alert("The trucks have been notified", function (e) {
                       if (e) {
                           window.location.href = "CargoHome.aspx";
                       }
                   });

                   return false
               }
              

           }

         

           setInterval(callIt, 5000);
           function callIt() {
               var name = ' <%=Session["Logged"]%> ';
               var URL = 'http://localhost:52362/Cargo/CargoHome.aspx/CallFromJS';

            
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
                                   window.location.href = "CargoHome.aspx";
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
<asp:Content ID="Content3" ContentPlaceHolderID="cargoBody" runat="server">
   

    <asp:GridView ID="GridViewTruck" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false">
    <Columns>				
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
       
       <asp:BoundField DataField="NumberPlate" HeaderText="NumberPlate" ItemStyle-Width="150" />
        <asp:TemplateField HeaderText="WeightCapacity" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="WeightCapacity" runat="server" Text='<%# Eval("WeightCapacity") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="DriverName" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="DriverName" runat="server" Text='<%# Eval("DriverName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="FamilyName" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="FamilyName" runat="server" Text='<%# Eval("FamilyName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PhoneNo" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="PhoneNo" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        

          
    </Columns>
</asp:GridView>
<br />
<asp:Button ID="btnGetSelected" runat="server" class="btn btn-outline-primary waves-effect" Text="Select trucks" OnClick="GetSelectedRecords" />
      <script language="javascript" src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=e10ec60e-629d-44e1-864f-f49c48e0c067"></script>

            <div id="map_div">
               
            </div>
    <script type="text/javascript">
           map = new Tmap.Map({
               div: 'map_div', 
               width: "80%", 
               height: "800px",
           });
           map.setCenter(new Tmap.LonLat("127.897987", "36.501625").transform("EPSG:4326", "EPSG:3857"), 8);
           var routeLayer = new Tmap.Layer.Vector("route");
           var markerLayer = new Tmap.Layer.Markers("start");
           map.addLayer(routeLayer);
           map.addLayer(markerLayer);

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
                        




                        
                           var size = new Tmap.Size(24, 38);
                           var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
                           if (status == 10) {
                               var icon = new Tmap.IconHtml('<img src=http://localhost:52362/images/pin_g_m_r.png />', size, offset);//마커 아이콘 설정
                           }
                           else if (status == 11) {
                               var icon = new Tmap.IconHtml('<img src=http://localhost:52362/images/pin_r_m_r.png />', size, offset);//마커 아이콘 설정
                           }
                           else if (status == 12) {
                               var icon = new Tmap.IconHtml('<img src=http://localhost:52362/images/pin_b_m_r.png />', size, offset);//마커 아이콘 설정
                           }

                           var label = new Tmap.Label("now its here");

                           var marker_s = new Tmap.Marker(new Tmap.LonLat(parseFloat(marker
                               .attr("YPosition")), parseFloat(marker.attr("XPosition"))).transform("EPSG:4326", "EPSG:3857"), icon, label);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
                           if (status == '10') {
                               markerLayer.addMarker(marker_s);
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

                           function onMouseMarker(evt) {
                               if (evt.type == "mousedown") {
                                   this.show();
                               } else {
                                   this.hide();
                               }
                           }

                           setTimeout(function () {
                               markerLayer.removeMarker(marker_s);
                               popup.hide();


                           }, 4900);



                       });


               });

           }, 5000);


    </script>
  
  

  
</asp:Content>




