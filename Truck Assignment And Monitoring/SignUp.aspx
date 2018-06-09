<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> 

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
	<!--//booststrap end-->
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet"/>
	<!-- //font-awesome icons -->
	<!--stylesheets-->
	<link href="css/style.css" rel='stylesheet' type='text/css' media="all"/>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<!-- banner text slider-->
	<!--//style sheet end here-->
	<!-- //lightbox files -->
	<link rel="stylesheet" href="css/lightbox.css"/>
	<!-- //lightbox files -->
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"/>
    <link rel="stylesheet" href="alertify/themes/alertify.core.css" />

<link rel="stylesheet" href="alertify/themes/alertify.default.css" id="toggleCSS" />
    <!-- this is for stylish alert-->
<script src="alertify/lib/alertify.min.js"></script>
  
</head>
<body>
    <form class="form-horizontal" runat="server">
        
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
<fieldset>
    <div class="form-group ">
      <label class="col-md-4 control-label" for="first_name">
       First Name
            <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox class="form-control" runat="server" id="first_name" name="first_name" type="text" required=""></asp:TextBox></div>
     </div>
  
     <div class="form-group ">
      <label class="col-md-4 control-label" for="middle_name">
       Middle Name
      </label>
       <div class="col-md-4"><asp:TextBox class="form-control" runat="server" id="middle_name" name="middle_name" type="text"></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="last_name">
       Last Name
       <span class="asteriskField">
        *
       </span>
      </label>
      <div class="col-md-4"> <asp:TextBox runat="server" class="form-control" id="last_name" name="last_name" type="text" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="mobile_no">
       MobileNo
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox runat="server" class="form-control" id="mobile_no" name="mobile_no" type="text" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="telephone_no">
       Home Phone
      </label>
      <div class="col-md-4"> <asp:TextBox runat="server" class="form-control" id="telephone_no" name="telephone_no" type="text"></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="email">
       Email
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox runat="server" class="form-control" id="email_id" name="email_id" type="text" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="name3">
       Full Address
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox runat="server" class="form-control" id="full_address" name="full_address" type="text" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="login_id">
       LoginID
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox class="form-control" runat="server" id="login_id" name="login_id" type="text" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="password">
       Password
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox class="form-control" runat="server" id="password" name="password" type="password" required=""></asp:TextBox></div>
     </div>
     <div class="form-group ">
      <label class="col-md-4 control-label" for="confirm_password">
       Confirm Password
       <span class="asteriskField">
        *
       </span>
      </label>
       <div class="col-md-4"><asp:TextBox class="form-control" runat="server" id="confirm_password" name="confirm_password" type="password" required=""></asp:TextBox></div>
     </div>
     <div class="form-group">
    
      <label class="col-md-4 control-label" for="Btn_Login"></label>
         <div class="col-md-8">
           <asp:Button ID="btn_signup" runat="server" text="SignUp"  class="btn btn-lg btn-primary" onClientClick="return CallCodeBehind()"/>
                  <asp:Button ID="btn_back" runat="server" text="Back"  class="btn btn-lg btn-danger" onClientClick="return CallCodeBack()"/>
          
      </div>
     </div>
    
    <script type = "text/javascript" src="alertify/lib/alertify.min.js"></script>
     <script >

         function CallCodeBehind()
         {


             var a = '<%=CallFromJS()%>';
             if (a == "0")
             {
                 alertify.alert("User Created. You can now login from Main Page", function (e) {
                     if (e) {
                         window.location.href = "SignIn.aspx";
                     }
                 });
                 return false

             }

             if (a == "1")
             {
                 alertify.alert("User already present. Choose different ID", function (e) {
                     if (e) {
                         window.location.href = "SignUp.aspx";
                     }
                 });
               
                 return false
             }

             if (a == "2") {
                 alertify.alert(a"Password mismatch", function (e) {
                     if (e) {
                        window.location.href = "SignUp.aspx";
                     }
                 });
                
                 return false
             }
            
         }
         function CallCodeBack()
         {
             window.location.href = "Index.aspx";
         }
       
         </script>


</fieldset>
</form>
    <!--  <script src=" <!--https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>-->
     <!--Include all compiled plugins (below), or include individual files as needed -->
     <!--<script src="bootstrap/js/bootstrap.min.js"></script>-->

    


</body>
</html>
