<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="sports.order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    .main{
        margin-right:2000px;
    }
</style>
<body>
    <form runat="server">

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
                <% Response.Write(Session["email2"]); %>
            </a>
           
            <a href="cart.aspx" class="btn border">
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
                            <a href="index.aspx" class="nav-item nav-link">Home</a>
                            <!-- <a href="shop.html" class="nav-item nav-link active">Shop</a> -->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">brands</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                
                                   
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
                     
                        <a href="logout.aspx" class="nav-item nav-link" >logout</a>
                        
                       
                   
                     
                       
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

    <section class="section profile">
        
      <div class="row">
        <div class="col-xl-4">
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
              

              <!-- <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> -->
              <h1>
                  <asp:Label ID="username" runat="server" Text=""></asp:Label></h1>

            <h3><% Response.Write(Session["email2"]); %></h3>
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
                  
                    <asp:Button ID="view" class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-overview" runat="server" Text="Overview" OnClick="view_Click"  />
                </li>

                <li class="nav-item">
                  
                    <asp:Button ID="edit1" class="nav-link " data-bs-toggle="tab" data-bs-target="#profile-edit" runat="server" Text="Edit Profile" OnClick="edit1_Click" />
                </li>


                <li class="nav-item">
                 
                    <asp:Button ID="newpass" class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password" runat="server" Text="Change Password" OnClick="newpass_Click"  />
                </li>

                
                <li class="nav-item">
                  
                    <asp:Button ID="orderview" class="nav-link active"  data-bs-toggle="tab" data-bs-target="#order" runat="server" Text="Order" OnClick="orderview_Click"/>
                </li>

              </ul>
                        
                 <div class="tab-pane pt-3" id="order">
                  
                <!-- Breadcrumb Start -->
    
    <!-- Breadcrumb End -->
                      <div class="container-fluid">
        <div class="row px-xl-5">
          

             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowEditing="GridView1_RowEditing" DataKeyNames="id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" CellSpacing="2">
                    <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" />
                        <asp:BoundField DataField="total" HeaderText="Total" />
                        <asp:BoundField DataField="payment" HeaderText="Paymnet" />
                        <asp:BoundField DataField="status" HeaderText="delivery status" />
                         <asp:BoundField DataField="date" HeaderText="Date" />
                    
                    
                                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>


            
        </div>
              <!-- End Bordered Tabs -->
              </div>
                     </div>
                </div>
            </div>
          </div>

      
   
    </section>
      
  </main><!-- End #main -->



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
    </form>
</body>
</html>
