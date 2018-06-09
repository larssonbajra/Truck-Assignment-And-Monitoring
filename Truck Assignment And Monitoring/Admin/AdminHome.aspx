<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.AdminHome" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Admin Home
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_placeholder" runat="server">
    <h2>List Of Drivers</h2>
    <p>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourcedriverDate" OnRowCommand="GridView3_RowCommand">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="truck" Text="View Truck" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcedriverDate" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SpDriverList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>

    <h2>List Of Users</h2>
    <p>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OwnerID" DataSourceID="SqlDataSourceCustomerLists">
            <Columns>
                <asp:BoundField DataField="OwnerID" HeaderText="OwnerID" ReadOnly="True" SortExpression="OwnerID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="RegistrationNo" HeaderText="RegistrationNo" SortExpression="RegistrationNo" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceCustomerLists" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SELECT [OwnerID], [FirstName], [MiddleName], [LastName], [RegistrationNo], [Mobile], [Email], [Address] FROM [CargoOwner] ORDER BY [OwnerID]"></asp:SqlDataSource>
    </p>
</asp:Content>
