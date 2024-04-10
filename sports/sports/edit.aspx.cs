using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class edit : System.Web.UI.Page
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
                string q = "select * from register where email='" + mail + "'";
                SqlCommand cm = new SqlCommand(q, con);
                SqlDataReader sd = cm.ExecuteReader();
                if (sd.Read())
                {

                }
                else
                {
                    Response.Redirect("login1.aspx");
                }
                con.Close();

                email.Text = mail;
                con.Open();
                string query = "select * from users where email='" + mail + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["name2"] = sdr["name"].ToString();
                    username.Text = sdr["name"].ToString();
                    address.Text = sdr["address"].ToString();
                    string gender= sdr["gender"].ToString();
                    if(gender=="M")
                    {
                        male.Checked = true;
                    }
                    else if(gender == "F")
                    {
                        female.Checked = true;
                    }    
                    city.Text = sdr["city"].ToString();
                    state.Text = sdr["state"].ToString();
                    pincode.Text = sdr["pincode"].ToString();
                    phone.Text = sdr["phone"].ToString();
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
        protected void view_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile1.aspx");
        }
        protected void newpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepass.aspx");
        }
        protected void orderview_Click(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx");
        }
        protected void save_Click(object sender, EventArgs e)
        {

            string mail = (string)Session["email2"];

            con.Open();
            string q = "select * from users where email='" + mail + "'";
            SqlCommand cm = new SqlCommand(q, con);
            SqlDataReader sd = cm.ExecuteReader();
            if (sd.Read())
            {
                con.Close();
                string gender = string.Empty;
                if (male.Checked)
                {
                    gender = "M";
                }
                else if (female.Checked)
                {
                    gender = "F";
                }
               
                if (username.Text == "" || address.Text == "" || city.Text == "" || state.Text == "" || pincode.Text == "" || phone.Text == "")
                {
                    Response.Write("<script>alert('insert all values')</script>");
                }
                else
                {
                    con.Open();
                    string up = "update users Set name=@name,address=@add,gender=@g,city=@city,state=@state,pincode=@pin,phone=@phone where email=@email";
                    SqlCommand cmd1 = new SqlCommand(up, con);

                    cmd1.Parameters.AddWithValue("@name", username.Text);
                    cmd1.Parameters.AddWithValue("@add", address.Text);
                    cmd1.Parameters.AddWithValue("@g", gender);
                    cmd1.Parameters.AddWithValue("@city", city.Text);
                    cmd1.Parameters.AddWithValue("@state", state.Text);
                    cmd1.Parameters.AddWithValue("@pin", pincode.Text);
                    cmd1.Parameters.AddWithValue("@phone", phone.Text);
                    cmd1.Parameters.AddWithValue("@email", mail);

                    cmd1.ExecuteNonQuery();
                    cmd1.Dispose();
                    /* string query1 = "UPDATE users set name='" + username.Text +"', address='"+ address.Text +"', gender='"+ g + "', city='" + city.Text + "', state='" + state.Text + "', pincode='" + pincode.Text + "', phone='" + phone.Text + "' WHERE email = '" +email.Text+ "'";
                     SqlCommand cmd1= new SqlCommand(query1,con);
                     cmd1.ExecuteNonQuery();*/
                    con.Close();
                    Response.Write("<script>alert('profile updated successfully')</script>");
                }
            }
            else
            {
                con.Close();
                string gender = string.Empty;
                if (male.Checked)
                {
                    gender = "M";
                }
                else if (female.Checked)
                {
                    gender = "F";
                }
                if (username.Text == "" || address.Text == "" || city.Text == "" || state.Text == "" || pincode.Text == "" || phone.Text == "")
                {
                    Response.Write("<script>alert('insert all values')</script>");
                }
                else
                {
                    con.Open();
                    string up = "insert into users(name,address,gender,city,state,pincode,phone,email) values ('" + username.Text + "','" + address.Text + "','" + gender + "','" + city.Text + "','" + state.Text + "','" + pincode.Text + "','" + phone.Text + "','" +mail+ "')";
                    SqlCommand cmd1 = new SqlCommand(up, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('profile inseted successfully')</script>");
                }
            }
        }
    }
}