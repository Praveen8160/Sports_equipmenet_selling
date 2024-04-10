<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="sports.profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Sports</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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
    </style>
<body>
<?php
            include 'head.php';
        ?>
  <main id="main">
    
    <div class="pagetitle" class="profile">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="adminindex.php">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
        <form runat="server">
      <div class="row">
        <div class="col-xl-4">
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <!-- <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> -->
              <h1> <?php
               if (isset($_SESSION['username'])) {
                echo $_SESSION['username'];
            }
            else{
              echo "login your account";
            } ?></h1>
            <h3><?php 
                     if (isset($_SESSION['username'])) {
                      echo $_SESSION['email'];
                  } ?><h3>
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
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>


                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password" name="change">Change Password</button>
                </li>

                
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#order" name="change">Order</button>
                </li>

              </ul>
        
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['username'])) {
                        echo  $_SESSION['username'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">address</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['address'])) {
                        echo  $_SESSION['address'];
                    }
                    ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Gender</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['gender'])) {
                        echo  $_SESSION['gender'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>
                
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">city</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['city'])) {
                        echo  $_SESSION['city'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">state</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['state'])) {
                        echo  $_SESSION['state'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Country</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['country'])) {
                        echo  $_SESSION['country'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">pincode</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['pincode'])) {
                        echo  $_SESSION['pincode'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8"><?php 
                     if (isset($_SESSION['email'])) {
                      echo $_SESSION['email'];
                  } ?> </div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Phone</div>
                    <div class="col-lg-9 col-md-8"><?php 
                      if (isset($_SESSION['phone'])) {
                        echo  $_SESSION['phone'];
                    }
                    else
                    {
                      echo '';
                    } ?></div>
                  </div>
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

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
                   
                   
                  
                    <?php include('errors.php'); ?>
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


                  <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                 
                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                          <asp:TextBox ID="password" TextMode="Password" class="form-control" runat="server" placeholder="Enter password"></asp:TextBox>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                          <asp:TextBox ID="password1" TextMode="Password" class="form-control"  runat="server" placeholder="password"></asp:TextBox>
					<asp:regularexpressionvalidator id="pass" runat="server" controltovalidate="password1" errormessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" validationexpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="Dynamic" Text="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" ForeColor="#FF66FF">Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number</asp:regularexpressionvalidator>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                       
                          <asp:TextBox ID="repassword" TextMode="Password" class="form-control"  runat="server" placeholder="Re-enter password" ControlToValidate="repassword"></asp:TextBox>
					<asp:CompareValidator ID="passwordcom" runat="server" ErrorMessage="password are not match" Display="Dynamic" ForeColor="Fuchsia" Text="password are not match" SetFocusOnError="True" ControlToValidate="repassword" ControlToCompare="password1"></asp:CompareValidator>
                      </div>
                    </div>

                    <div class="text-center">
                         <asp:Button ID="passchange1" runat="server" class="btn btn-primary" Text="change"></asp:Button>
                    </div>
                  

                </div>
              

               

                
                

                <!-- order start -->

                <div class="tab-pane fade pt-3" id="order">
                  
                <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <h3><a class="breadcrumb-item text-dark" href="#">ORDERS</a></h3>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

                <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>quantity</th>
                            
                            <th>total</th>
                            <th>Payment</th>
                            <th>date</th>
                            <th>order ststus</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                      <?php
                     $email=$_SESSION['email'];
                     $sql="SELECT `id` FROM `users` WHERE email='$email'";
                     $res=mysqli_query($db,$sql);
                     $result=mysqli_fetch_array($res);
                     $id=$result['id'];
                     $sql1="SELECT * FROM `order_tbl` WHERE cid=$id";
                     $res2=mysqli_query($db,$sql1);
                     while($res1=mysqli_fetch_array($res2))
                     {?> 
                        <tr>     
                            <td class="align-middle"><?php echo $res1['pname'];?> </td>
                            <td class="align-middle"><?php echo $res1['quantity'];?></td>
                          
                            <td class="align-middle"><?php echo $res1['total'];?></td>
                            <td class="align-middle"><?php echo $res1['payment'];?></td>
                            <td class="align-middle"><?php echo $res1['date'];?></td>
                            <td class="align-middle"><?php echo $res1['status'];?></td>

                        </tr>
                        <?php
                        }
                        ?>
                       
                        
                    </tbody>
                </table>
            </div>
          
        </div>
    </div>

                </div>


        
              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
            </form>
    </section>
      
  </main><!-- End #main -->

  <?php include 'footer.php'; ?>

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


