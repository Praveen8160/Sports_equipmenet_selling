using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
           /* string mail = (string)Session["email2"];
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
            }*/

        }
        protected void passchange1_Click(object sender, EventArgs e)
        {
            Response.Redirect("otp2.aspx");
            string pass1 = encryptpass(password.Text);
            string pass2 = encryptpass(password1.Text);
            string pass3 = encryptpass(repassword.Text);
            string mail2 =(string)Session["email2"];
            con.Open();
            string query = "select * from register where email='" + mail2 + "' and password='" + pass1 + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if(sdr.Read())
            {
                string query1 = "UPDATE register SET password = '" + pass2 + "' WHERE email = '" + mail2 + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('username and password not match')</script>");
            }

        }
        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
    }
}