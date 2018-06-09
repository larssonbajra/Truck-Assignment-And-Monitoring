<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="ViewTrucks.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.ViewTrucks" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    View Trucks
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_placeholder" runat="server">
   <asp:GridView ID="GridViewTruck" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="false">
    <Columns>				
       
       <asp:BoundField DataField="TruckID" HeaderText="TruckID" ItemStyle-Width="150" />
        <asp:TemplateField HeaderText="TruckNumber" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="Number" runat="server" Text='<%# Eval("Number") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="WeightCapacity" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="Weight" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="Status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
   
    </Columns>
</asp:GridView>
     <asp:Button ID="AddTruck" runat="server" Text="Add Truck" class="btn btn-outline-primary waves-effect" OnClick="AddTruck_Click"/>


</asp:Content>
