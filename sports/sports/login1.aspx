<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="sports.login1" %>

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
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
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

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<style>
body {
 background-color: white;
  /*background-image:url("pic3.jpg");
 

   Center and scale the image nicely 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;*/
}
.login{
	width: 36%;
	border: 2px solid;
	margin-left:370px;
	margin-top:50px;
}
.col{
	background-color:#dc3545;
}
.colo{
color: #D19C97 !important;
}
    .back {
        background-color: #D19C97 !important;
    }
    .btn-colo{
            color: #fff;
    background-color: #D19C97 !important;
    border-color: #D19C97 !important;
    }
    .foot{
            background-color: whitesmoke !important;
    }
</style>
<body>
    <form method="post"  runat="server">
	<div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="index.php" class="text-decoration-none">

                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="colo font-weight-bold border px-3 mr-1">Sports</span>jam.in</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <!-- <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </span>
                    </div>
                </div>
            </form> -->
        </div>
        <div class="col-lg-3 col-6 text-right">
            
            <a href="profile1.aspx" class="btn border">
           
                <i class="fas fa-user colo"></i>
                
            </a>
           
           <a href="cart.php" class="btn border">
              <i class="fas fa-shopping-cart colo"></i>
                <span></span>
            </a>
            
        </div>
    </div>
<!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between back text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100" style="height: 300px">
                       
                       
                       <asp:DropDownList ID="cat" class="nav-item nav-link" runat="server" ></asp:DropDownList>
                        
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="index.php" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Sports</span>jam.in</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                           <%-- <a href="index.php" class="nav-item nav-link">Home</a>--%>
                            <asp:HyperLink ID="HyperLink3" class="nav-item nav-link" runat="server" NavigateUrl="~/index.aspx">Home</asp:HyperLink>
                            <!-- <a href="shop.html" class="nav-item nav-link active">Shop</a> -->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">brands</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                
                                    <%--<a href="product.php?id=<?php echo $res['id'];?>" class="dropdown-item"><?php echo $res['name'];?></a>--%>
                                     <asp:DropDownList ID="pbrand" class="dropdown-item" runat="server"></asp:DropDownList>
                                   
                                    <!-- <a href="Adidas.php" class="dropdown-item">Adidas</a>
                                    <a href="Puma.php" class="dropdown-item">Puma</a>
                                    <a href="Kookaburra.php" class="dropdown-item">Kookaburra</a>
                                    <a href="cosco.php" class="dropdown-item">Cosco</a>
                                    <a href="slazenger.php" class="dropdown-item">Slazenger</a>
                                    <a href="spalding.php" class="dropdown-item">Spalding</a>
                                    <a href="Evelast.php" class="dropdown-item">Everlast</a> -->
                                </div>
                            </div>
                            <!-- <a href="detail.html" class="nav-item nav-link">Shop Detail</a> -->
                            <!-- <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a> -->
                                <!-- <div class="dropdown-menu rounded-0 m-0"> -->
                                    <a href="cart.aspx" class="nav-item nav-link">Shopping Cart</a>
                                    <!-- <a href="checkout.html" class="dropdown-item">Checkout</a> -->
                                <!-- </div> -->
                            <!-- </div> -->
                            <a href="contact1.aspx" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                     
                        <%--<a href="logout.php" class="nav-item nav-link" >logout</a>
                        
                       <a href="login.php" class="nav-item nav-link">Login</a>
                       <a href="register.php" class="nav-item nav-link">Register</a>--%>
                       
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
   <div class="container">
		<div class="login">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-130 p-b-97">
			<div>
                    <div class="login100-form validate-form">

				<span class="login100-form-title p-b-37">
					Sign In
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter username">
					<asp:TextBox ID="email" TextMode="Email" class="input100"  runat="server" placeholder="email"></asp:TextBox>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<asp:TextBox ID="password" class="input100"  TextMode="Password" runat="server" placeholder="Enter password"></asp:TextBox>
					<span class="focus-input100"></span>
				</div>

						<div class="container-login100-form-btn">
							<asp:Button runat="server" class="login100-form-btn" Text="Log In" ID="btnlogin" OnClick="btnlogin_Click" />
							
							</div>
						 <br><br><br>
                                <div class="text-center">
                                    <a href="forget.aspx" class="txt2 hov1">
					Forget password
					</a>
				</div><br>
				<div class="text-center">Need an account?
                                    <a href="register.aspx" class="txt2 hov1">
				
				Sign Up
					</a>
				</div>
			</div>
                </div>
</div>
	</div>
	<div class="container-fluid foot text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="colo font-weight-bold border border-white px-3 mr-1">Sports</span>jam.in</h1>
            </a>
            <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt colo mr-3"></i>123 Street, New York, USA</p>
            <p class="mb-2"><i class="fa fa-envelope colo mr-3"></i>info@example.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt colo mr-3"></i>+012 345 67890</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="index.aspx"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="profile1.aspx"><i class="fa fa-angle-right mr-2"></i>profile</a>
                        <!-- <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a> -->
                        <a class="text-dark mb-2" href="cart.aspx"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <!-- <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a> -->
                        <a class="text-dark" href="contact1.aspx"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                    <a class="text-dark mb-2" href="index1.aspx"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="profile1.aspx"><i class="fa fa-angle-right mr-2"></i>profile</a>
                        <!-- <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a> -->
                        <a class="text-dark mb-2" href="cart.aspx"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <!-- <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a> -->
                        <a class="text-dark" href="contact1.aspx"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <!-- <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                    <form action="">
                        <div class="form-group">
                            <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                required="required" />
                        </div>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                        </div>
                    </form>
                </div> -->
            </div>
        </div>
    </div>
    <!-- <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                by
                <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div> -->
<!-- Footer End -->
        <!-- head and footer js -->
	<!-- Back to Top -->
      <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


      <!-- JavaScript Libraries -->
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
      <script src="lib/easing/easing.min.js"></script>
      <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  
      <!-- Contact Javascript File -->
      <script src="mail/jqBootstrapValidation.min.js"></script>
      <script src="mail/contact.js"></script>
  
      <!-- Template Javascript -->
      <script src="js/main.js"></script>
         
	<div id="dropDownSelect1"></div>

        <!-- head and footer js end -->
	
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


    <!-- Back to Top -->
      <a href="#" class="btn btn-colo back-to-top"><i class="fa fa-angle-double-up"></i></a>


      <!-- JavaScript Libraries -->
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
      <script src="lib/easing/easing.min.js"></script>
      <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  
      <!-- Contact Javascript File -->
      <script src="mail/jqBootstrapValidation.min.js"></script>
      <script src="mail/contact.js"></script>
  
      <!-- Template Javascript -->
      <script src="js/main.js"></script>


        </form>
</body>
</html>
         
	
