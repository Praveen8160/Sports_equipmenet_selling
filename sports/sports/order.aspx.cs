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
    public partial class order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GVbind();
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
                    Session["name2"] = sdr["name"].ToString();
                    username.Text = sdr["name"].ToString();
                   
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
        protected void GVbind()
        {
            string mail4 =Session["email2"].ToString();
            con.Open();
            string view = "select * from tblorder where cemail='"+mail4+"'";
            SqlCommand cmd = new SqlCommand(view, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GVbind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GVbind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            String query = "delete from tblorder where id='" + id + "'";
            con.Open();
            SqlCommand cdm = new SqlCommand(query, con);
            int t = cdm.ExecuteNonQuery();
            con.Close();
            if (t > 0)
            {
                Response.Write("<script>alert('data deleted')</script>");
                GridView1.EditIndex = -1;
                GVbind();
            }
            else
            {
                Response.Write("<script>alert('data not deleted')</script>");
            }

        }
        protected void view_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile1.aspx");
        }

        protected void edit1_Click(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx");
        }

        protected void newpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepass.aspx");
        }

        protected void orderview_Click(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx");
        }
    }
}