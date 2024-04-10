using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class viewbrand : System.Web.UI.Page
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
            string view = "select * from tblbrand";
            SqlCommand cmd = new SqlCommand(view, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

       
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            FileUpload image = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("image"));
            if (image.FileName != "") // if a new image was uploaded
            {
               
                image.SaveAs(Server.MapPath("brandimage/") + Path.GetFileName(image.FileName));

                String link = Path.GetFileName(image.FileName);

                string updateQuery = "UPDATE tblbrand SET name='" + name + "', image='" + image.FileName + "' WHERE id='" + id + "'";
                con.Open();
                SqlCommand command = new SqlCommand(updateQuery, con);
                command.ExecuteNonQuery();
                con.Close();

            }
            else // if no new image was uploaded, just update the name
            {

                string updateQuery = "UPDATE tblbrand SET name='" + name + "' WHERE Id='" + id + "'";
                con.Open();
                SqlCommand command = new SqlCommand(updateQuery, con);
                command.ExecuteNonQuery();
                con.Close();
            }
            // Update the data in the database

            // Rebind the GridView control to display the updated data
            GridView1.EditIndex = -1;
            GVbind();
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
            String query = "delete from tblbrand where id='" + id + "'";
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
    }
}