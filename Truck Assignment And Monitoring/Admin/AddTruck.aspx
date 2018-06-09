<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="AddTruck.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.AddTruck" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Add Truck
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1">

  
		<!-- Website CSS style -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    
		
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" rel="stylesheet" />



    <script type="text/javascript">
     function Added() {
            
             
               alertify.alert("The Truck is added successfully.", function (e) {
                   if (e) {
                       window.location.href = "ViewTrucks.aspx";
                   }
               });

               return false


        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="admin_placeholder" runat="server">
     <div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>Register the Truck</h5>
					

               <div class="form-group">
                   <label for="NumberPlate" class="cols-sm-2 control-label">Number Plate*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="NumberPlate" type="text" class="form-control" runat="server" required=""></asp:TextBox>

                       </div>
                   </div>
               </div>
                      <div class="form-group">
                   <label for="WeightCapacity" class="cols-sm-2 control-label">Weight Capacity*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="WeightCapacity" type="text" class="form-control" runat="server" placeholder="Capacity" required=""></asp:TextBox>

                       </div>
                   </div>
               </div>
                      <div class="form-group">
                   <label for="Category" class="cols-sm-2 control-label">Category*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                       <asp:DropDownList ID="TruckType" class="btn btn-secondary dropdown-toggle" runat="server" DataSourceID="SqlDataSourceTruckType" DataTextField="ListItemName" DataValueField="ListItemName"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSourceTruckType" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SELECT ListItemName FROM ListItem WHERE (ListItemCategoryID = 3)"></asp:SqlDataSource>
                       </div>
                   </div>
               </div>

                           <div class="form-group">
                   <label for="Manufacture" class="cols-sm-2 control-label">Manufactured Year*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                    <asp:TextBox ID="Manufactured" type="text" class="form-control" runat="server" placeholder="Manufactured year" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>

               <div class="form-group ">
                   <asp:Button ID="TruckAdd" runat="server" Text="Register" class="btn btn-outline-primary waves-effect" OnClick="TruckAdd_Click"/>
               </div>

          
				</div>
			</div>
           </div>
	

		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  
    <script src="../js/bootstrap.min.js"></script>

   
       

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


    <script>
        function CallError()
        {
            alert("Insert Data Failed");
        }
    </script>
</asp:Content>
