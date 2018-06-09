<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="NegotiateValues.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.NegotiateValues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Negotiate Values
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  
     <meta name="viewport" content="width=device-width, initial-scale=1">


		<!-- Website CSS style -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    
		
    <link rel="stylesheet" href="../css/jquery.datetimepicker.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" rel="stylesheet" />

     <script type="text/javascript">
         function Negotiate() {


             alertify.alert("The Negotiation is done. Please wait for the driver's response", function (e) {
                 if (e) {
                     window.location.href = "Negotiation.aspx";
                 }
             });

             return false


         }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cargoBody" runat="server">
    	<div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>Negotiate here</h5>
					

               <div class="form-group">
                  
                   <div class="cols-sm-10">
                       <div class="input-group">
                         
                            <asp:Label ID="Label1" Text="CargoID:" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="CargoID" runat="server"></asp:Label>                         
                       </div>
                   </div>
               </div>
                     <div class="form-group">
                  
                   <div class="cols-sm-10">
                       <div class="input-group">
                                      
                            <asp:Label ID="Label5" Text="TruckID:" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="TruckID" runat="server"></asp:Label>                        
                       </div>
                   </div>
               </div>
                <div class="form-group">
                 
                   <div class="cols-sm-10">
                       <div class="input-group">
                                         
                            <asp:Label ID="Label2" Text="PickDate" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="pickerdate" runat="server"></asp:Label>                        
                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="pick date" class="cols-sm-2 control-label">Pick Up Date</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           <input type="text" class="form-control" name="pickdate" id="pickdate" required=""/>
                           

                       </div>
                   </div>
               </div>
                          <div class="form-group">
                 
                   <div class="cols-sm-10">
                       <div class="input-group">
                                  
                            <asp:Label ID="Label3" Text="DropDate" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="dropperdate" runat="server"></asp:Label>                        
                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="Drop date" class="cols-sm-2 control-label">Drop date here</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                            <input type="text" class="form-control" name="dropdate" id="dropdate" required=""/>
                          
                      </div>
                       </div>
                   </div>
                         <div class="form-group">
                   <label for="Cargo Type" class="cols-sm-2 control-label">Cargo Type</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                        
                           <asp:DropDownList ID="CargoType" class="btn btn-secondary dropdown-toggle" runat="server" DataSourceID="SqlDataSourceCargoType" DataTextField="ListItemName" DataValueField="ListItemName"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSourceCargoType" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SELECT ListItemName FROM ListItem WHERE (ListItemCategoryID = 2)"></asp:SqlDataSource>
                       </div>
                   </div>
               </div>
               <div class="form-group">
                   <label for="Origin" class="cols-sm-2 control-label">Price</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           
                           <asp:TextBox ID="Rate" CssClass="form-control" runat="server" required="" ></asp:TextBox>
                       </div>
                   </div>
               </div>
          

               <div class="form-group ">
                   <asp:Button ID="Negotiate" runat="server" Text="Negotiate" class="btn btn-outline-primary waves-effect" OnClick="Negotiate_Click1"/>
               </div>

          
				</div>
			</div>
           </div>
	

		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    
               <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"> </script>
    <script src="../js/jquery.datetimepicker.full.js"></script>
    <script>
  
      
        $("#pickdate").datetimepicker();
        $("#dropdate").datetimepicker();
    </script>
  
</asp:Content>
