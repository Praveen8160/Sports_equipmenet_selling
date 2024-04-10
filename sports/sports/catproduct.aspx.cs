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
    public partial class catproduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            int id = int.Parse(Request.QueryString["id"]);
            con.Open();
            string query = "select * from tblcategories1 where id='" + id + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
              
                name.Text = sdr["name"].ToString();
                name2.Text = sdr["name"].ToString();
                name3.Text = sdr["name"].ToString();
            }

            con.Close();
            viewbrand();
            viewcat();
            view();
        }

        protected void view()
        {
            int id = int.Parse(Request.QueryString["id"]);
            string q = "select * from tblproduct where categories='"+name.Text+"'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter ad3 = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            ad3.Fill(table);
            product.DataSource = table;
            product.DataBind();
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
    }
}