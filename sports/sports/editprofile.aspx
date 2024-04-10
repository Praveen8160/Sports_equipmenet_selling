﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editprofile.aspx.cs" Inherits="sports.editprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Sports</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
     <!-- header css -->
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

    <!-- header css end-->
  <!-- Favicons -->
  <link href="assets1/img/favicon.png" rel="icon">
  <link href="assets1/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets1/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets1/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets1/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets1/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets1/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets1/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets1/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.1.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
    .main{
        margin-right:2000px;
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
        
            <a href="profile.php" class="btn border">
           
                <i class="fas fa-user colo"></i>
                <% Response.Write(Session["email2"]); %>
            </a>
           
            <a href="cart.php" class="btn border">
               <i class="fas fa-shopping-cart colo"></i>
                <span></span>
            </a>
        </div>
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
                       
                       
                        <a href="product2.php?id=<?php echo $res['id'];?>" class="nav-item nav-link"><?php echo $res['name'];?></a>
                        
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
                            <a href="index.php" class="nav-item nav-link">Home</a>
                            <!-- <a href="shop.html" class="nav-item nav-link active">Shop</a> -->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">brands</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                
                                    <a href="product.php?id=<?php echo $res['id'];?>" class="dropdown-item"><?php echo $res['name'];?></a>
                                   
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
                                    <a href="cart.php" class="nav-item nav-link">Shopping Cart</a>
                                    <!-- <a href="checkout.html" class="dropdown-item">Checkout</a> -->
                                <!-- </div> -->
                            <!-- </div> -->
                            <a href="contact.php" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                     
                        <a href="logout.php" class="nav-item nav-link" >logout</a>
                        
                       
                   
                       <a href="login.php" class="nav-item nav-link">Login</a>
                       <a href="register.php" class="nav-item nav-link">Register</a>
                       
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
  <main id="main">
    
    <div class="pagetitle" class="profile">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

 
        <form runat="server">
      <div class="row">
        <div class="col-xl-4">
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
              

              <!-- <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> -->
              <h1>name</h1>
            <h3><% Response.Write(Session["email2"]); %><h3>
              <!-- <h3>Web Designer</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div> -->
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                    <asp:Button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-overview" ID="overview2" runat="server" Text="Overview" OnClick="overview2_Click"/>
                </li>

                <li class="nav-item">              
                    <asp:Button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-edit" ID="edit2" runat="server" Text="Edit Profile"/>
                </li>


                <li class="nav-item">
                  
                    <asp:Button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password" ID="changepass2" runat="server" Text="Change Password" OnClick="changepass2_Click" />
                </li>

                
                <li class="nav-item">
                  
                    <asp:Button class="nav-link" data-bs-toggle="tab" data-bs-target="#order" ID="order2" runat="server" Text="Order" OnClick="order2_Click"/>
                
                </li>

              </ul>
        
    

                  <!-- Profile Edit Form -->
                  
                    <!-- <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="assets/img/profile-img.jpg" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div> -->
                   
                   
                  
                   
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                      <div class="col-md-8 col-lg-9">
                        
                          <asp:TextBox ID="username" class="form-control" runat="server" placeholder="username"></asp:TextBox>
                      </div>
                    </div>

                    <div class="row mb-3">
                    <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Gender</label>
                    <div class="col-md-8 col-lg-9">
                      <div class = "radio">
                        <label>
                          <input type = "radio" name = "gender" id = "optionsRadios1" value ="Male">
                            Male
                        </label>
          
                        <label>
                          <input type = "radio" name = "gender" id = "optionsRadios2" value ="Female">
                          Female
                        </label>
                      </div>
                    </div>
                  </div>
                    

                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">address</label>
                      <div class="col-lg-9 col-md-8">
                        <input name="address" type="text" class="form-control" id="company" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">city</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="city" type="text" class="form-control" id="Job" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">state</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="state" type="text" class="form-control" id="Job" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="country" type="text" class="form-control" id="Country" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">pincode</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="pincode" type="text" class="form-control" id="Address" required pattern="[0-9]{6}" oninvalid="this.setCustomValidity('enter 6 digit number')"  oninput="this.setCustomValidity('')" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phone" type="text" class="form-control" required pattern="[0-9]{11}" oninvalid="this.setCustomValidity('enter 11 digit number')"  oninput="this.setCustomValidity('')" value="">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="email" class="form-control" runat="server" placeholder="email"></asp:TextBox>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary" name="save">Save Changes</button>
                    </div>
                  

                </div>
                    </div><!-- End Bordered Tabs -->

          </div>
           </div>

        
            </form>
  
      
  </main>


    <!--footer start-->
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
                        <a class="text-dark mb-2" href="index.php"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="profile.php"><i class="fa fa-angle-right mr-2"></i>profile</a>
                        <!-- <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a> -->
                        <a class="text-dark mb-2" href="cart.php"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <!-- <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a> -->
                        <a class="text-dark" href="contact.php"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                    <a class="text-dark mb-2" href="index.php"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="profile.php"><i class="fa fa-angle-right mr-2"></i>profile</a>
                        <!-- <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a> -->
                        <a class="text-dark mb-2" href="cart.php"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                        <!-- <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a> -->
                        <a class="text-dark" href="contact.php"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
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

	
         
	<div id="dropDownSelect1"></div>

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

         <!--head and footer js end-->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets1/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="assets1/vendor/php-email-form/validate.js"></script>
  <script src="assets1/vendor/quill/quill.min.js"></script>
  <script src="assets1/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets1/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets1/vendor/chart.js/chart.min.js"></script>
  <script src="assets1/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets1/vendor/echarts/echarts.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets1/js/main.js"></script>

</body>

</html>
