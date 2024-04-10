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
    public partial class cart : System.Web.UI.Page
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
                    viewbrand();
                    viewcat();
                    GVbind();
                    up();
                }
            }
           
        }
        protected void up()
        {
            int to = 0;
            string mail = (string)Session["email2"];
            con.Open();
            string view = "select * from tblcart1 where cemail='" + mail + "'";
            SqlCommand cmd = new SqlCommand(view, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                to = int.Parse(sdr["total"].ToString()) + to;
            }

            sub.Text = Convert.ToString(to);
            sub2.Text = Convert.ToString(to);
            con.Close();
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

            string mail = (string)Session["email2"];
            con.Open();
            string view = "select * from tblcart1 where cemail='"+mail+"'";
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
            String query = "delete from tblcart1 where id='" + id + "'";
            con.Open();
            SqlCommand cdm = new SqlCommand(query, con);
            int t = cdm.ExecuteNonQuery();
            con.Close();
            if (t > 0)
            {
                Response.Write("<script>alert('product delete from card')</script>");
                GridView1.EditIndex = -1;
                GVbind();
                up();
            }
            else
            {
                Response.Write("<script>alert('product not deleted')</script>");
                up();
            }

        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Retrieve the data from the GridView row
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string quantity = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            int price = int.Parse(GridView1.Rows[e.RowIndex].Cells[4].Text);
           string name= GridView1.Rows[e.RowIndex].Cells[1].Text;
            int qty = int.Parse(quantity);
            int t = int.Parse(quantity) * price;

                string updateQuery = "UPDATE tblcart1 SET quantity='" + qty + "', total='" + t + "' WHERE id='" + id + "'";
              con.Open();
              SqlCommand command = new SqlCommand(updateQuery, con);
              command.ExecuteNonQuery();
              con.Close();
               up();

            GridView1.EditIndex = -1;
            GVbind();
        }



        protected void checkout_Click(object sender, EventArgs e)
        {
            con.Open();
            int count1 = 0;
            string mail = (string)Session["email2"];
            string q = "select  COUNT(*) from tblcart1 where cemail='"+mail+"'";
            SqlCommand cm = new SqlCommand(q, con);
            count1 = (int)cm.ExecuteScalar();
            con.Close();
            Session["total"] = int.Parse(sub2.Text);
            if(count1>0)
            {
                Response.Redirect("checkout.aspx");
            }
            else
            {
                Response.Write("<script>alert('your cart is empty')</script>");
            }
        }
    }
}