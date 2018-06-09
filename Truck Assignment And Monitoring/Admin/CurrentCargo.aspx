<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CurrentCargo.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.CurrentCargo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Current Cargo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_placeholder" runat="server">
    <h1>Cargos in transit</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSourceTransitAdmin">
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
        <asp:SqlDataSource ID="SqlDataSourceTransitAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpTransitCargoAdmin" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
</asp:Content>
