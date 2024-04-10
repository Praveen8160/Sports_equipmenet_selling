using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;

namespace sports
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

        protected void btnlogin_Click1(object sender, EventArgs e)
        {
            Response.Write("not correct");
            string email1 = email.Text;
            string pass = encryptpass(password.Text);
            con.Open();
            string query = "select * from register where email='" + email1 + "' and password='" + pass + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();

            
            if (sdr.Read())
            {
                Response.Redirect("register.aspx");

            }
            else
            {
                Response.Redirect("login.aspx");
            }
            con.Close();
        }
    }
}