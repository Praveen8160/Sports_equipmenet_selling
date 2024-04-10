using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class viewproduct : System.Web.UI.Page
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

                    HyperLinkField editColumn = new HyperLinkField();
                    HyperLinkField deleteColumn = new HyperLinkField();
                    deleteColumn.HeaderText = "Edit";
                    deleteColumn.Text = "Edit";
                    deleteColumn.DataNavigateUrlFormatString = "~/UpdateProduct.aspx?id={0}";
                    deleteColumn.DataNavigateUrlFields = new string[] { "id" };

                    editColumn.HeaderText = "Delete";
                    editColumn.Text = "Delete";
                    editColumn.DataNavigateUrlFormatString = "~/deleteproduct.aspx?id={0}";
                    editColumn.DataNavigateUrlFields = new string[] { "id" };

                    GridView1.Columns.Add(editColumn);
                    GridView1.Columns.Add(deleteColumn);
                    GVbind();
                }
            }
        }
        protected void GVbind()
        {
            con.Open();
            string view = "select * from tblproduct";
            SqlCommand cmd = new SqlCommand(view, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {

                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            con.Close();
        }

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = GridView1.Rows[e.RowIndex];

        //    // Retrieve the data from the GridView row
        //    //int id = Convert.ToInt32(row.Cells[0].Text);
        //    //string name = ((TextBox)row.Cells[1].Controls[0]).Text;
        //    //string image = ((FileUpload)row.Cells[2].Controls[0]).FileName;
        //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        //    string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        //    int price = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
        //    int offer= Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text);


        //    DropDownList ddlCategory = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("brand");
        //    string brand2 = ddlCategory.SelectedValue;

        //    DropDownList ddlCategory1 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("categories");
        //    string catego = ddlCategory.SelectedValue;

        //    DropDownList ddlCategory2 = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("size");
        //    string size2 = ddlCategory.SelectedValue;


        //    string des = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
        //    int qty = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text);

        //    FileUpload image = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("image"));
        //    if (image.FileName != "") // if a new image was uploaded
        //    {
        //        //string extension = Path.GetExtension(image.FileName);
        //    ////    //string fileName = Guid.NewGuid().ToString() + extension; // generate a unique file name
        //    ////    //string uploadFolder = Server.MapPath("~/brandimage"); // specify the upload folder on the server
        //    ////    //string filePath = Path.Combine(uploadFolder, fileName); // combine the folder and file name
        //    ////    //((FileUpload)row.Cells[2].Controls[0]).SaveAs(filePath); // save the file to the server
        //        image.SaveAs(Server.MapPath("brandimage/") + Path.GetFileName(image.FileName));

        //        String link = Path.GetFileName(image.FileName);

        //        string updateQuery = "UPDATE tblbrand SET name='" + name + "', image='" + image.FileName + "' WHERE id='" + id + "'";
        //        con.Open();
        //        SqlCommand command = new SqlCommand(updateQuery, con);
        //        command.ExecuteNonQuery();
        //        con.Close();

        //    }
        //    else // if no new image was uploaded, just update the name
        //    {

        //    ////    string updateQuery = "UPDATE tblbrand SET name='" + name + "' WHERE Id='" + id + "'";
        //    ////    con.Open();
        //    ////    SqlCommand command = new SqlCommand(updateQuery, con);
        //    ////    command.ExecuteNonQuery();
        //    ////    con.Close();
        //    }
        //    //// Update the data in the database

        //    //// Rebind the GridView control to display the updated data
        //    GridView1.EditIndex = -1;
        //    GVbind();
        //}
        //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    GridView1.EditIndex = e.NewEditIndex;
        //    GVbind();
        //}

        //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    GridView1.EditIndex = -1;
        //    GVbind();
        //}

        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        //    String query = "delete from tblproduct where id='" + id + "'";
        //    con.Open();
        //    SqlCommand cdm = new SqlCommand(query, con);
        //    int t = cdm.ExecuteNonQuery();
        //    con.Close();
        //    if (t > 0)
        //    {
               
        //        Response.Write("<script>alert('data deleted')</script>");
        //        GridView1.EditIndex = -1;
        //        GVbind();
        //    }
        //    else
        //    {
                
        //        Response.Write("<script>alert('data not deleted')</script>");
        //    }

        //}



        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
          
            // Check if the current row is a data row
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Find the DropDownList control in the row
        //        DropDownList ddl = (DropDownList)e.Row.FindControl("brand");

        //        //        // Create a connection to the database

        //        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");




        //        //        // Create a SQL query to retrieve the data you want to display in the dropdown list
        //        string query = "SELECT id, name FROM tblbrand";
               
        //        conn.Open();
        //        // Execute the query and store the results in a DataTable
        //        DataTable dt = new DataTable();
        //        SqlDataAdapter da = new SqlDataAdapter(query, con);
        //        da.Fill(dt);

        ////        // Bind the DropDownList control to the data retrieved from the database
        //        ddl.DataSource = dt;
        //        ddl.DataTextField = "name";
        //       ddl.DataValueField = "name";
        //        ddl.DataBind();

        ////        // Close the connection
        //        conn.Close();
            
        

    }
}