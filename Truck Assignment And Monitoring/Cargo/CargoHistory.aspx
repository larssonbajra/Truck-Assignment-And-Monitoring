<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeBehind="CargoHistory.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.CargoHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Cargo History
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

       <script type="text/javascript">

         

           setInterval(callIt, 5000);
           function callIt() {
               var name = ' <%=Session["Logged"]%> ';
               var URL = 'http://localhost:52362/Cargo/CargoHome.aspx/CallFromJS';

            
             
               var LoginID = "{ namer: '<%=Session["Logged"]%>' }";
               $.ajax({
                   type: "POST",

                   url: URL,

                  
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
   <h1>Past Cargo List</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHistoryOwner">
            <Columns>
                <asp:BoundField DataField="CargoID" HeaderText="CargoID" SortExpression="CargoID" />
                <asp:BoundField DataField="DriverID" HeaderText="DriverID" SortExpression="DriverID" />
                <asp:BoundField DataField="TruckID" HeaderText="TruckID" SortExpression="TruckID" />
                <asp:BoundField DataField="DeliveredTime" HeaderText="DeliveredTime" SortExpression="DeliveredTime" />
                <asp:BoundField DataField="PickFrom" HeaderText="PickFrom" SortExpression="PickFrom" />
                <asp:BoundField DataField="DropTo" HeaderText="DropTo" SortExpression="DropTo" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceHistoryOwner" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpCargoHistoryOwner" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
