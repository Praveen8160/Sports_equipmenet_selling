﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="otp3.aspx.cs" Inherits="sports.otp3" %>

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
  /*background-color: orange;*/
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
                    <form class="login100-form validate-form" runat="server" action="" method="post">

				<span class="login100-form-title p-b-37">
          ENTER OTP
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter Email">
					<asp:TextBox ID="otp" class="input100"  runat="server" placeholder="enter otp"></asp:TextBox>
					<span class="focus-input100"></span>
				</div>

				<div class="login100-form-btn">
					<asp:Button runat="server" class="login100-form-btn" Id="btnotp2" Text="OTP" name="otp" OnClick="btnotp2_Click"></asp:Button>

          </div>
         
         <!-- <div class="login100-form-btn">
			  <asp:Button runat="server" class="login100-form-btn" Id="btnreotp" Text="RESEND" name="Resend" OnClick="btnreotp_Click"></asp:Button>
				</div>-->
<br><br>
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
