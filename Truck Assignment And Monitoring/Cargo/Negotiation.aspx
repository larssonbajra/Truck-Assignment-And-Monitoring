<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="Negotiation.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.Negotiation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Negotiation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

       <script type="text/javascript">

           function Deal() {


               alertify.alert("The Deal is done. Please wait for truck to start the trip. You can start tracking the truck in the map", function (e) {
                   if (e) {
                       window.location.href = "CargoHome.aspx";
                   }
               });

               return false


           }
           function Cancel() {


               alertify.alert("The requests have been cancelled completely. You will no longer get response from the driver for this cargo.", function (e) {
                   if (e) {
                       window.location.href = "Negotiation.aspx";
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
<asp:Content ID="Content3" ContentPlaceHolderID="cargoBody" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNegotiationViewOwner" AllowPaging="True" OnRowCommand="GridView1_RowCommand" AllowSorting="True">
        <Columns>
            <asp:ButtonField CommandName="Cancel" Text="Cancel" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceNegotiationViewOwner" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiationViewOwner" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Waiting Driver Response </h1><asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSourceWaitingDriver" AllowPaging="True" OnRowCommand="GridView3_RowCommand" AllowSorting="True">
    <Columns>
        <asp:ButtonField CommandName="Cancel" Text="Cancel" />
    </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceWaitingDriver" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiateRecentOwnerUpdate" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
   
    <h1>Processing Negotiations</h1>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSourceOwnerDecision" OnRowCommand="GridView2_RowCommand" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Deal" Text="Deal"/>
            <asp:ButtonField ButtonType="Button" CommandName="Negotiate" Text="Negotiate" />
            <asp:ButtonField CommandName="Cancel" Text="Cancel" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceOwnerDecision" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiateOwnerDecision" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
