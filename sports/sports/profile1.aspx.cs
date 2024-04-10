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

    public partial class profile1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
               
                con.Open();
                string query = "select * from users where email='" + mail + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {

                    Session["name1"] = sdr["name"].ToString();
                    Session["add2"] = sdr["address"].ToString();
                    Session["g"] = sdr["gender"].ToString();
                    Session["city2"] = sdr["city"].ToString();
                    Session["state2"] = sdr["state"].ToString();
                    Session["pin2"] = sdr["pincode"].ToString();
                    Session["phone"] = sdr["phone"].ToString();
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
            pbrand.DataValueField = "id";
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
            cat.DataValueField = "id";
            cat.DataTextField = "name";
            cat.DataBind();
            con.Close();
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx");
        }

        protected void changepass_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepass.aspx");
        }

        protected void order_Click(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx");
        }
    }
}