<%@ Page Title="" Language="C#" MasterPageFile="~/Driver/Driver.Master" AutoEventWireup="true" CodeFile="Negotiation.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Driver.Negotiation" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
Negotiation
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <script type="text/javascript">

           function Deal() {


               alertify.alert("The Deal is done. The owner has been notified", function (e) {
                   if (e) {
                       window.location.href = "Negotiation.aspx";
                   }
               });

               return false


           }
           function Cancel()
           {


               alertify.alert("The requests have been cancelled completely. You will no longer get response from the owner for this cargo.", function (e) {
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
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNegoDriverView" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Negotiate" Text="Negotiate" HeaderText="Negotiate" />
            <asp:ButtonField CommandName="Cancel" Text="Cancel" HeaderText="Cancel Request" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceNegoDriverView" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiationViewDriver" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="LoginID" SessionField="Logged" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceNegoViewDriver" runat="server"></asp:SqlDataSource>
   <h1> Negotiation Currently Carried On(Customer Response Wait)</h1><asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSourceRecentDriverUpdate" AllowPaging="True" OnRowCommand="GridView2_RowCommand">
    <Columns>
        <asp:ButtonField CommandName="Cancel" Text="Cancel" HeaderText="Cancel Cargo" />
    </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSourceRecentDriverUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiateRecentDriverUpdate" SelectCommandType="StoredProcedure">
           <SelectParameters>
               <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
    <h1>Processing Negotiation</h1><asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSourceDriverDecision" OnRowCommand="GridView3_RowCommand" AllowPaging="True">
    <Columns>
        <asp:ButtonField ButtonType="Button" CommandName="Deal" Text="Deal" HeaderText="Deal" />
        <asp:ButtonField ButtonType="Button" CommandName="Negotiate" Text="Negotiate" HeaderText="Negotiate" />
        <asp:ButtonField CommandName="Cancel" Text="Cancel" HeaderText="Cancel Cargo" />
    </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDriverDecision" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpNegotiateDriverDecision" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
</asp:Content>
