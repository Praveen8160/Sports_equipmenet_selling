<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="sports.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sports jamm.in</title>
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

<body style="overflow-x: hidden">
    

         <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="index.php" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Sports</span>jam.in</h1>
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
                </div> -->
        </div>
        <div class="col-lg-3 col-6 text-right">
        
            <a href="profile1.aspx" class="btn border">
      
                <i class="fas fa-user text-primary"></i>
                <% Response.Write(Session["email2"]); %>
                
            </a>
           
            <a href="cart.aspx" class="btn border">
               <i class="fas fa-shopping-cart text-primary"></i>
                <span></span>
            </a>
        </div>
    </div>

<!-- Topbar End -->


    <!-- Navbar Start -->
      <form id="form2" runat="server">
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
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
                     <!-- <?php  if (isset($_SESSION['username'])) {
                       ?>-->
                        <a href="logout.aspx" class="nav-item nav-link" ></a>
                        <!--<?php
                    }
                ?> 
                        <?php 
                    if (!isset($_SESSION['username'])) {
                       ?>-->
                       <a href="login1.aspx" class="nav-item nav-link"></a>
                       <a href="logout.aspx" class="nav-item nav-link">logout</a>
                       <!--<?php
                    }
                ?> -->
                        </div>
                    </div>
                </nav>
               
            </div>
        </div>
        </div>
   





     <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="1101px" DataKeyNames="id" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                       <%--  <asp:TemplateField HeaderText="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="quantity" runat="server" TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <img src="catimage/<%#Eval("image") %>" height="120"/>
                    </ItemTemplate>
                    </asp:TemplateField>--%>

                       <%-- <asp:ImageField DataImageUrlField='catimage/<%#Eval("image") %>' HeaderText="Image" ReadOnly="True">
                        </asp:ImageField>--%>
                        <asp:BoundField DataField="id" HeaderText="id" Visible="False" />

                        <asp:BoundField DataField="name" HeaderText="Product Name" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Image">
                          <ItemTemplate>
                        <img src="productimage/<%#Eval("image") %>" height="50"/>
                    </ItemTemplate>
                             </asp:TemplateField>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True"  />
                        <asp:BoundField DataField="total" HeaderText="Total" ReadOnly="True" />
                        <asp:CommandField ButtonType="Button" HeaderText="Update" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" />
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


            <div class="col-lg-4">
                <!-- <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form> -->

               
                        
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">
                                <asp:Label ID="sub" runat="server" Text=""></asp:Label></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">FREE</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><asp:Label ID="sub2" runat="server" Text=""></asp:Label></h5>
                        </div>
                       
                        <%--<button class="btn btn-block btn-primary my-3 py-3" name="checkout">Proceed To Checkout</button>--%>
                        <asp:Button ID="checkout" class="btn btn-block btn-primary my-3 py-3" runat="server" Text="Proceed To Checkout" OnClick="checkout_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <div>
        </div>


             <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">Sports</span>jam.in</h1>
                </a>
                <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
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
                   
                </div>
                </div>
            </div>
           </div>
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
    </form>
</body>
</html>
