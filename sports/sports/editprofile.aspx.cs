using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class editprofile : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string mail = (string)Session["email2"];
            con.Open();
            string query = "select * from register where email='" + mail + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                username.Text = sdr["username"].ToString();
                email.Text = sdr["email"].ToString();
            }
            else
            {
                Response.Redirect("login1.aspx");
            }
        }

    }
}