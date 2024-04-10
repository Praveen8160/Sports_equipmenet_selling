using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class login1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                viewcat();
                viewbrand();

            }
        }
        protected void viewbrand()
        {
            String query = "select * from tblbrand";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            pbrand.DataSource = dt;
            pbrand.DataValueField = "name";
            pbrand.DataTextField = "name";
            pbrand.DataBind();
            con.Close();
        }
        protected void viewcat()
        {
            String query = "select * from tblcategories1";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cat.DataSource = dt;
            cat.DataValueField = "name";
            cat.DataTextField = "name";
            cat.DataBind();
            con.Close();
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (email.Text=="admin123@gmail.com" && password.Text=="admin123")
            {
                Session["email2"] = email.Text;
                Response.Redirect("index1.aspx");
            }
            else
            {
                string email1 = email.Text;
                string pass = encryptpass(password.Text);
                con.Open();
                string query = "select * from register where email='" + email1 + "' and password='" + pass + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();


                if (sdr.Read())
                {
                    Session["email2"] = email.Text;
                    Response.Redirect("index.aspx");

                }
                else
                {
                    Response.Write("<script>alert('username and password not match')</script>");
                }
                con.Close();
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