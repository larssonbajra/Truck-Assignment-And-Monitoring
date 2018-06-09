<%@ Page Title="" Language="C#" MasterPageFile="~/Cargo/Cargo.Master" AutoEventWireup="true" CodeFile="NewCargo.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Cargo.NewCargo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    New Cargo
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
           function AddCargo() {
              
                   alertify.alert("New Cargo Added. Now select trucks", function (e) {
                       if (e) {
                           window.location.href = "CargoList.aspx";
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
                           //alert(result.d);
                           alertify.alert(result.d, function (e) {
                               if (e) {
                                   window.location.href = "CargoHome.aspx";
                               }
                           });

                           return false
                       }

                   }
               });
               
           }




  </script>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cargoBody" runat="server">
    
    	<div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>Register your Cargo</h5>
					

               <div class="form-group">
                   <label for="name" class="cols-sm-2 control-label">Cargo Details</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                         
                        <!--   <input type="text" class="form-control" name="name" id="name" placeholder="Details please" />-->
                           <asp:TextBox ID="Details" type="text" class="form-control" runat="server" placeholder="Details please" required=""></asp:TextBox>

                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="Cargo Type" class="cols-sm-2 control-label">Cargo Type</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           
                           <!--<input type="text" class="form-control" name="email" id="email" placeholder="enter type" />-->
                           <asp:DropDownList ID="CargoType" class="btn btn-secondary dropdown-toggle" runat="server" DataSourceID="SqlDataSourceCargoType" DataTextField="ListItemName" DataValueField="ListItemName"></asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSourceCargoType" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SELECT ListItemName FROM ListItem WHERE (ListItemCategoryID = 2)"></asp:SqlDataSource>
                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="Quantity" class="cols-sm-2 control-label">Quantity</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           
                           
                           <asp:TextBox ID="Quantity" type="number" class="form-control" runat="server" placeholder="Enter quantity" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>

             
                
             
               <div class="form-group">
                   <label for="pick date" class="cols-sm-2 control-label">Pick Up Date</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           <input type="text" class="form-control" name="pickdate" id="PickUpDate" placeholder="PickUpDate here" required="" />
                           

                       </div>
                   </div>
               </div>

               <div class="form-group">
                   <label for="Drop date" class="cols-sm-2 control-label">Drop date here</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                            <input type="text" class="form-control" name="dropdate" id="DropDate" placeholder="DropDate here" required="" />
                          
                      </div>
                       </div>
                   </div>
              
               <div class="form-group">
                   <label for="Origin" class="cols-sm-2 control-label">Origin</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           
                           <asp:TextBox ID="PickUpPlace" CssClass="form-control" runat="server" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>
               <div class="form-group">
                   <label for="Destination" class="cols-sm-2 control-label">Destination Here</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                          
                           <asp:TextBox ID="Destination" CssClass="form-control" runat="server" required=""></asp:TextBox>
                       </div>
                   </div>
               </div>

               <div class="form-group ">
                   <asp:Button ID="CargoRegister" runat="server" Text="Register" class="btn btn-outline-primary waves-effect" OnClick="CargoRegister_Click"/>
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
        $("#PickUpDate").datetimepicker();
    
        $("#DropDate").datetimepicker();
       
    </script>
    <script>
        function CallError()
        {
            alert("Insert Data Failed");
        }
    </script>
</asp:Content>
