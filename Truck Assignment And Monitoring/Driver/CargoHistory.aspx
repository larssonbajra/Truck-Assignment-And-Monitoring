<%@ Page Title="" Language="C#" MasterPageFile="~/Driver/Driver.Master" AutoEventWireup="true" CodeFile="CargoHistory.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Driver.CargoHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Cargo History
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="driverBody" runat="server">
    <h1>Cargo History</h1>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TruckID" DataSourceID="SqlDataSourceHistoryDriver" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="TruckID" HeaderText="TruckID" ReadOnly="True" SortExpression="TruckID" />
            <asp:BoundField DataField="CargoID" HeaderText="CargoID" SortExpression="CargoID" />
            <asp:BoundField DataField="OwnerID" HeaderText="OwnerID" SortExpression="OwnerID" />
            <asp:BoundField DataField="DeliveredTime" HeaderText="DeliveredTime" SortExpression="DeliveredTime" />
            <asp:BoundField DataField="PickFrom" HeaderText="PickFrom" SortExpression="PickFrom" />
            <asp:BoundField DataField="DropTo" HeaderText="DropTo" SortExpression="DropTo" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceHistoryDriver" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpCargoHistoryDriver" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Logged" SessionField="Logged" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>

</asp:Content>
