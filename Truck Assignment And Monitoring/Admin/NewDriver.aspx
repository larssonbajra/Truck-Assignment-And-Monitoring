<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeFile="NewDriver.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Admin.NewDriver" %>
<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Admin New Driver
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

        function Success() {


            alertify.alert("You have added a driver successfully", function (e) {
                if (e) {
                    window.location.href = "AdminHome.aspx";
                }
            });

            return false
        }
        function Mismatch() {


            alertify.alert("The password is mismatch. Please correct it", function (e) {
                if (e) {
                    // window.location.href = "NewDriver.aspx";
                   
                }
            });

            return false
        }
        function Taken() {


            alertify.alert("The ID is already taken", function (e) {
                if (e) {
                   // window.location.href = "NewDriver.aspx";
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
				<h5>Register the Driver</h5>
					

               <div class="form-group">
                   <label for="firstname" class="cols-sm-2 control-label">First Name*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="FirstName" type="text" class="form-control" runat="server" placeholder="First Name" required=""></asp:TextBox>

                       </div>
                   </div>
               </div>
                      <div class="form-group">
                   <label for="name" class="cols-sm-2 control-label">Middle Name</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="MiddleName" type="text" class="form-control" runat="server" placeholder="Middle Name"></asp:TextBox>

                       </div>
                   </div>
               </div>
                      <div class="form-group">
                   <label for="LastName" class="cols-sm-2 control-label">Family Name*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="LastName" type="text" class="form-control" runat="server" placeholder="Family Name" required=""></asp:TextBox>

                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="date" class="cols-sm-2 control-label">Date of Birth*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           <input type="text" class="form-control" name="date" id="date" placeholder="DOB here" data-provide="datepicker" required=""/>
                           

                       </div>
                   </div>
               </div>

            
              
               <div class="form-group">
                   <label for="Mobile" class="cols-sm-2 control-label">Mobile No*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Mobile" CssClass="form-control" runat="server" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>
               <div class="form-group">
                   <label for="Phone" class="cols-sm-2 control-label">Phone No</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Phone" CssClass="form-control" runat="server"></asp:TextBox>
                       </div>
                   </div>
               </div>
                    <div class="form-group">
                   <label for="Email" class="cols-sm-2 control-label">Email ID</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Email" CssClass="form-control" runat="server"></asp:TextBox>
                       </div>
                   </div>
               </div>
                     <div class="form-group">
                   <label for="Address" class="cols-sm-2 control-label">Address*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Address" CssClass="form-control" runat="server" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>
                     <div class="form-group">
                   <label for="Login" class="cols-sm-2 control-label">Login ID*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Login" CssClass="form-control" runat="server" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>
                     <div class="form-group">
                   <label for="Password" class="cols-sm-2 control-label">Password Please*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="Password" CssClass="form-control" runat="server" type="password" required="" ></asp:TextBox>
                       </div>
                   </div>
               </div>
                     <div class="form-group">
                   <label for="ConfirmPassword" class="cols-sm-2 control-label">Confirm Password*</label>
                   <div class="cols-sm-10">
                       <div class="input-group">                          
                           <asp:TextBox ID="ConfirmPassword" CssClass="form-control" runat="server" type="password" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>

               <div class="form-group ">
                   <asp:Button ID="AddDriver" runat="server" Text="Register" class="btn btn-outline-primary waves-effect" OnClick="AddDriver_Click"/>
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
    $(document).ready(function () {
        var date_input = $('input[name="date"]'); //our date input has the name "date"
        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
</script>
    <script>
        function CallError()
        {
            alert("Insert Data Failed");
        }
    </script>
</asp:Content>
