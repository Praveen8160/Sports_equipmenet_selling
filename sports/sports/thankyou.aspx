<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thankyou.aspx.cs" Inherits="sports.thankyou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
        </div>
    </form>
     <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            
            var amount = "<%=amount%>";

            var options = {
                "key": "rzp_test_rwtDGCBgfYyWd6",
                "amount": amount,
                "currency": "INR",
                "name": "Acme Corp",
                "description": "Test Transaction",
                
                "image": "https://example.com/your_logo",
                "handler": function (response) {
                    window.location.href = "order.aspx";
                },

                "theme": {
                    "color": "#3399cc"
                }
            };

            var rzp1 = new Razorpay(options);

            rzp1.on('payment.failed', function (response) {
                alert("Payment failed. Please try again later.");
            });

           
                rzp1.open();
                e.preventDefault();
          
        </script>
</body>
</html>
