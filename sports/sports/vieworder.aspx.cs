using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class vieworder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVbind();
            }
        }

        protected void GVbind()
        {
            string selectedValue = DropDownList1.SelectedValue;
            con.Open();
            string view = "select * from tblorder where status='"+selectedValue+"'";
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
            int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            
            //string available = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            DropDownList status = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("status");
            string available = status.SelectedValue;
            string query3 = "update tblorder set status='" + available + "' where id='" + id1 + "'";
            con.Open();
            SqlCommand sq3 = new SqlCommand(query3, con);
            int p = sq3.ExecuteNonQuery();
            con.Close();
            if (p > 0)
            {
                Response.Write("<script>alert('data has updated')</script>");
                GridView1.EditIndex = -1;
                GVbind();
            }
            else
            {
                Response.Write("<script>alert('data has not updated')</script>");
            }

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

        protected void search_Click(object sender, EventArgs e)
        {
            string selectedValue = DropDownList1.SelectedValue;
            con.Open();
            string view = "select * from tblorder where status='" + selectedValue + "'";
            SqlCommand cmd = new SqlCommand(view, con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            con.Close();
        }
    }
}