<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="sports.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <%--<title>Dashboard - NiceAdmin Bootstrap Template</title>--%>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
      <form id="form1" runat="server">
    <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="adminindex.php" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Admin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li>
        <!-- End Search Icon -->

      
        <!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>
    <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="adminindex.php">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Forms</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
           <li>
              <a href="addproduct.aspx">
              <i class="bi bi-circle"></i><span>ADD PRODUCT</span>
            </a>
          </li>
          <li>
            <a href="viewproduct.aspx">
              <i class="bi bi-circle"></i><span>VIEW PRODUCT</span>
            </a>
          </li>
          <li>
              <a href="addbrand.aspx">
              <i class="bi bi-circle"></i><span>ADD BRAND</span>
            </a>
          </li>
          <li>
              <a href="viewbrand.aspx">
              <i class="bi bi-circle"></i><span>VIEW BRAND</span>
            </a>
          </li>
          <li>
              <a href="addcat.aspx">
              <i class="bi bi-circle"></i><span>ADD CATEGORIES</span>
            </a>
          </li>
          <li>
              <a href="viewcat.aspx">
              <i class="bi bi-circle"></i><span>VIEW CATEGORIES</span>
            </a>
          </li>
          <li>
              <a href="viewcustomer.aspx">
              <i class="bi bi-circle"></i><span>VIEW CUSTOMER</span>
            </a>
          </li>
          <li>
              <a href="vieworder.aspx">
              <i class="bi bi-circle"></i><span>VIEW ORDER</span>
            </a>
          </li>
          <li>
              <a href="message.aspx">
              <i class="bi bi-circle"></i><span>Message</span>
            </a>
          </li>
      </li><!-- End Forms Nav -->

      
      <li class="nav-heading">Pages</li>



      <li class="nav-item">
          <a class="nav-link collapsed" href="logout1.aspx">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Logout</span>
        </a>
      </li><!-- End Login Page Nav -->

    </ul>
  </aside>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index1.aspx">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

               

                <div class="card-body">
                  <h5 class="card-title">Total <span>USER</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people-fill"></i>
                    </div>
                   
                    <div class="ps-3">
                      <h6></h6>
                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1">
                         <h1><asp:Label ID="pro" runat="server"></asp:Label></span></h1> 

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

                

                <div class="card-body">
                  <h5 class="card-title">PRODUCT <span> | Available</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-basket-fill"></i>
                    </div>
                     
                     
                    <div class="ps-3">
                      <h6></h6>
                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1"><h1><asp:Label ID="user" runat="server"></asp:Label></span></h1></span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total <span> | Sales</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                     
                     
                    <div class="ps-3">
                      <h6></h6>
                      <span class="text-success small pt-1 fw-bold"></span> <span class="text-muted small pt-2 ps-1"><h1>
                          <asp:Label ID="total" runat="server" Text=""></asp:Label></h1></span>

                    </div>
                  </div>
                </div>

              </div>
            </div>

              <div class="col-12">
              <div class="card recent-sales">
                   <h5 class="card-title" style="margin-left:450px"> Panding Order</h5>
                <div class="card-body">
               <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="id">
                    <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" />
                        <asp:BoundField DataField="cemail" HeaderText="Customer email" ReadOnly="True" />
                    <asp:BoundField DataField="address" HeaderText="Address" ReadOnly="True" />
                    <asp:BoundField DataField="city" HeaderText="City" ReadOnly="True" />
                        <asp:BoundField DataField="state" HeaderText="State" ReadOnly="True" />
                        <asp:BoundField DataField="total" HeaderText="Total" ReadOnly="True" />
                        <asp:BoundField DataField="payment" HeaderText="Paymnet" ReadOnly="True" />
                         <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="True" />
                     
                   
                    </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>



                </div>

              </div>
            </div>

                </div>
    </section>

  </main>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
      
    </form>
</body>
</html>
