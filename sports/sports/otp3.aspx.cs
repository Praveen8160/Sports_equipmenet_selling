using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class otp3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnotp2_Click(object sender, EventArgs e)
        {
            string value = otp.Text;
            string mail = (string)Session["otp"];
            if (mail == value)
            {
                Response.Redirect("setpass.aspx");

            }
            else
            {
                Response.Write("<script>alert('enter correct otp')</script>");
            }
        }

        protected void btnreotp_Click(object sender, EventArgs e)
        {

        }
    }
}