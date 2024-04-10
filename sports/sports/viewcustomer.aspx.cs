using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class viewcustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();

                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");

                string mail = (string)Session["email2"];
                if (mail == "" || mail == null)
                {
                    Response.Redirect("login1.aspx");
                }
                else
                {
                    GVbind();
                }
            }
        }
        protected void GVbind()
        {
            con.Open();
            string view = "select * from users";
            SqlCommand cmd = new SqlCommand(view, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            String query = "delete from users where id='" + id + "'";
            con.Open();
            SqlCommand cdm = new SqlCommand(query, con);
            int t = cdm.ExecuteNonQuery();
            SqlDataReader sdr = cdm.ExecuteReader();
            if(sdr.Read())
            {
                string email = sdr["email"].ToString();
                string q = "delete from register where email='" + email + "'";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
            }
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

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GVbind();
        }
    }
}