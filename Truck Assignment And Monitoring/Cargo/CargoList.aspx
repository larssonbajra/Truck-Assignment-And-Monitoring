<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="CargoList.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.CargoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Cargo List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

       <script type="text/javascript">

           function Cancel() {


               alertify.alert("You cancelled the request. The cargo is automatically removed", function (e) {
                   if (e) {
                       window.location.href = "CargoList.aspx";
                   }
               });

               return false


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
<asp:Content ID="Content3" runat="server" contentplaceholderid="cargoBody">

    
   <h2>Select Desired Trucks For Cargo Delivery</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSourceCargoList" OnRowCommand="GridView1_RowCommand" AllowSorting="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="select" Text="Select" HeaderText="Select" />
            <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="Cancel" Text="Cancel" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCargoList" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpCargoList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
            <asp:Parameter DefaultValue="selecting" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />

   <h2>List Of Cargos Awaiting Confirmation from Truck Drivers</h2>
    <br />
    <asp:GridView ID="GridView2" AllowPaging="True" runat="server" DataSourceID="SqlDataSourceWaitingTruckResponse" OnRowCommand="GridView2_RowCommand" AllowSorting="True">
        <Columns>
            <asp:ButtonField CommandName="delete1" HeaderText="Cancel Cargo" Text="Cancel" />
        </Columns>
    </asp:GridView>
    
   
    <asp:SqlDataSource ID="SqlDataSourceWaitingTruckResponse" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpCargoList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
            <asp:Parameter DefaultValue="waiting" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
   
    </asp:Content>

