<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllCargoHistory.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.AllCargoHistory" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Cargo History
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_placeholder" runat="server">
    <h1>All Cargo History</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHistoryAdmin">
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
        <asp:SqlDataSource ID="SqlDataSourceHistoryAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpCargoHistoryAdmin" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
</asp:Content>
