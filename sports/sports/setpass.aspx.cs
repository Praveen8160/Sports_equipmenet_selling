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
    public partial class setpass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void change_Click(object sender, EventArgs e)
        {
            string pass = encryptpass(password.Text);
            string repass = encryptpass(repassword.Text);
            string mail = (string)Session["changemail"];
            con.Open();
            if(pass==repass)
            {
                string query= "UPDATE register SET password = '"+pass+"' WHERE email = '"+ mail+"'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("login1.aspx");
            }
            else
            {
                Response.Redirect("setpass.aspx");
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