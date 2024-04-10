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
    public partial class changepass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                viewcat();
                viewbrand();
                string mail = (string)Session["email2"];


                Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();

                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");

                con.Open();
                string query = "select * from users where email='" + mail + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["user"] = sdr["name"].ToString();
                }
                else
                {
                    Response.Redirect("login1.aspx");
                }
                con.Close();
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

      
      

        protected void profilehome_Click2(object sender, EventArgs e)
        {  
                Response.Redirect("profile1.aspx");
        }

        protected void changepassword_Click1(object sender, EventArgs e)
        {
            if (password.Text == "" || password1.Text == "")
            {
                Response.Write("<script>alert('enter the all values')</script>");
            }
            else
            {
                string pass1 = encryptpass(password.Text);
                string pass2 = encryptpass(password1.Text);
                string mail2 = (string)Session["email2"];
                con.Open();
                string query = "select * from register where email='" + mail2 + "' and password='" + pass1 + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    con.Close();
                    string query1 = "UPDATE register SET password = '" + pass2 + "' WHERE email = '" + mail2 + "'";
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('password changed')</script>");
                }
                else
                {
                    con.Close();
                    Response.Write("<script>alert('old password not match')</script>");
                }
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

        protected void edit_Click1(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx");
        }
    }
}