<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="CargoHome.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.CargoHome" %>
<%@ Import Namespace="System.Web.Services" %>
<script type="text/C#" runat="server">

    [WebMethod]
    public static string CallFromJS(string namer)
    {
        string data=Emergency(namer);
        
        return data;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Cargo Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="../css/bootstrap.min.css" rel="stylesheet">
  

       <script type="text/javascript">

           function Delivery() {
            
             
               alertify.alert("The delivery is confirmed. Thank you for choosing our service", function (e) {
                   if (e) {
                       window.location.href = "CargoHome.aspx";
                   }
               });

               return false


           }

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
       <h1>This is home. Please Click Menu button for all options</h1>
    <h2>List Of Deals</h2>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceDealCargoShow" AllowPaging="True" AllowSorting="True"></asp:GridView>
       <asp:SqlDataSource ID="SqlDataSourceDealCargoShow" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpDealCargoShow" SelectCommandType="StoredProcedure">
           <SelectParameters>
               <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
     <div class="container">
         <div class="form-group">
   
</div>
         </div>
    
    <h2>List Of Transit Cargos</h2>
       <p>
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSourceTransit" OnRowCommand="GridView2_RowCommand" AllowPaging="True" AllowSorting="True" >
               <Columns>
                   <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" ReadOnly="True" SortExpression="TransactionID" />
                   <asp:BoundField DataField="TruckID" HeaderText="TruckID" SortExpression="TruckID" />
                   <asp:BoundField DataField="CargoID" HeaderText="CargoID" SortExpression="CargoID" />
                   <asp:BoundField DataField="PickUpTime" HeaderText="PickUpTime" SortExpression="PickUpTime" />
                   <asp:BoundField DataField="ArrivalTime" HeaderText="ArrivalTime" SortExpression="ArrivalTime" />
                   <asp:BoundField DataField="PickFrom" HeaderText="PickFrom" SortExpression="PickFrom" />
                   <asp:BoundField DataField="DropTo" HeaderText="DropTo" SortExpression="DropTo" />
                   <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                   <asp:ButtonField ButtonType="Button" CommandName="receive" HeaderText="Confirm" Text="Confirm Received" />
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSourceTransit" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpTransitCargoOwner" SelectCommandType="StoredProcedure">
               <SelectParameters>
                   <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
       </p>
</asp:Content>
