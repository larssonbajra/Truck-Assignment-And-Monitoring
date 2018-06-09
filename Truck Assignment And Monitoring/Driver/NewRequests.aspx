<%@ Page Title="" Language="C#" MasterPageFile="~/Driver/Driver.Master" AutoEventWireup="true" CodeFile="NewRequests.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Driver.NewRequests" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
New Requests
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <script type="text/javascript">

               function Accept() {


                   alertify.alert("You accepted the request. Negotiate time and amount with the owner", function (e) {
                       if (e) {
                           window.location.href = "Negotiation.aspx";
                       }
                   });

                   return false


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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSourceDriverRequestList" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:ButtonField ButtonType="Button" CommandName="select" HeaderText="SELECT" ShowHeader="True" Text="Select" />
        <asp:ButtonField ButtonType="Button" CommandName="cancel" HeaderText="CANCEL" ShowHeader="True" Text="CANCEL" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceDriverRequestList" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpDriverRequestList" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
