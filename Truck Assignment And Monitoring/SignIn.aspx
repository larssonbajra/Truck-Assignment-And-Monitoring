<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<!--//booststrap end-->
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons -->
	<!--stylesheets-->
	<link href="css/style.css" rel='stylesheet' type='text/css' media="all">
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<!-- banner text slider-->
	<!--//style sheet end here-->
	<!-- //lightbox files -->
	<link rel="stylesheet" href="css/lightbox.css">
	<!-- //lightbox files -->
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <script type="text/javascript" src="js/util.js"></script>
           <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
  
  
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

     <link rel="stylesheet" href="alertify/themes/alertify.core.css" />

<link rel="stylesheet" href="alertify/themes/alertify.default.css" id="toggleCSS" />
    <!-- this is for stylish alert-->
<script src="alertify/lib/alertify.min.js"></script>
      <script type="text/javascript">
          function LoginError() {

              alertify
                  .alert("ID or password error", function () {
                      alertify.message('OK');
                  });




          }



    </script>


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

<!-- Form Name -->

<!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="Choose Option">Option</label>  
         <div class="col-md-4">
        <asp:DropDownList ID="DropDownListOption" class="btn btn-secondary dropdown-toggle" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="Category" DataValueField="Category" OnSelectedIndexChanged="DropDownListOption_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:TAMConnectionString %>" SelectCommand="SELECT [Category] FROM [Category]"></asp:SqlDataSource>
    </div>
        </div>
<div class="form-group">
  <label class="col-md-4 control-label" for="Login ID">Login ID</label>  
  <div class="col-md-4">
      
  <asp:TextBox id="User_Login" runat="server" name="Login ID" type="text" placeholder="Place your ID here" class="form-control input-md" required=""></asp:TextBox>
      
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Password">Password</label>
  <div class="col-md-4">
    <asp:TextBox id="User_Password" runat="server" name="Password" type="password" placeholder="Place your password here" class="form-control input-md" required=""></asp:TextBox>
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Btn_Login"></label>
  <div class="col-md-8">
      <asp:Button ID="Btn_Login" name="Btn_Login" runat="server" Text="Sign In" class="btn btn-lg btn-success" OnClick="Btn_Login_Click1" />
      &nbsp;&nbsp;&nbsp;
         <asp:Button ID="Btn_Forgot" name="Btn_Forgot" runat="server" Text="HELP" class="btn btn-lg btn-danger" Width="116px" />
    
    
  </div>
</div>

</fieldset>
</form>
</body>
</html>
