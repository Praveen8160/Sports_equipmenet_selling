<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setpass.aspx.cs" Inherits="sports.setpass" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
	<title>sports</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"> -->
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css1/util.css">
	<link rel="stylesheet" type="text/css" href="css1/main.css">
<!--===============================================================================================-->
</head>
<style>
body {
   background-image:url("pic3.jpg");
  /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.forget{
	width: 36%;
	border: 2px solid;
	margin-left:370px;
	margin-top:50px;
}
.col{
	background-color:#dc3545;
}
</style>
<body>
	<div class="container">
	<div class="forget">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
                    <form class="login100-form validate-form" action="" method="post" runat="server">
                    <?php include('errors.php'); ?>
				<span class="login100-form-title p-b-37">
          SET NEW PASSWORD
				</span>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<asp:TextBox ID="password" TextMode="Password" class="input100"  runat="server" placeholder="password"></asp:TextBox>
					<asp:regularexpressionvalidator id="pass" runat="server" controltovalidate="password" errormessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" validationexpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="Dynamic" Text="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" ForeColor="#FF66FF">Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number</asp:regularexpressionvalidator>
					<span class="focus-input100"></span>
				</div>
                
                <div class="wrap-input100 validate-input m-b-25" data-validate = "Re-enter password">
					<asp:TextBox ID="repassword" TextMode="Password" class="input100"  runat="server" placeholder="Re-enter password" ControlToValidate="repassword"></asp:TextBox>
					<asp:CompareValidator ID="passwordcom" runat="server" ErrorMessage="password are not match" Display="Dynamic" ForeColor="Fuchsia" Text="password are not match" SetFocusOnError="True" ControlToValidate="repassword" ControlToCompare="password"></asp:CompareValidator>
					<span class="focus-input100"></span>
				</div>

				<div class="login100-form-btn">
					<asp:Button runat="server" class="login100-form-btn" Id="change" Text="change" name="change" OnClick="change_Click"></asp:Button>

          </div>
          
          

                                <br><br><br>
                               

			</form>
                </div>
</div>
	</div>
	
	
	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>


