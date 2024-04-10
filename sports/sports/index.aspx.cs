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
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                viewcat();
                viewbrand();
                
                
                cimage();
                bimage2();


                Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();

                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");


            }
        }

        //protected void bimage()
        //{
        //    string q = "select * from tblbrand";
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand(q, con);
        //    SqlDataAdapter ad = new SqlDataAdapter(cmd);
        //    DataTable table = new DataTable();
        //    ad.Fill(table);
        //    brand.DataSource = table;
        //    brand.DataBind();
        //    con.Close();
        //}
        protected void bimage2()
        {
            string q = "select * from tblbrand";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter ad2 = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            ad2.Fill(table);
            bran.DataSource = table;
            bran.DataBind();
            con.Close();
        }
        protected void pimage()
        {
            //string q = "select * from tblproduct";
            //con.Open();
            //SqlCommand cmd = new SqlCommand(q, con);
            //SqlDataAdapter ad = new SqlDataAdapter(cmd);
            //DataTable table = new DataTable();
            //ad.Fill(table);
            //pro.DataSource = table;
            //pro.DataBind();
            //con.Close();

        }
        protected void cimage()
        {
            string q = "select * from tblcategories1";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter ad3 = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            ad3.Fill(table);
            cate.DataSource = table;
            cate.DataBind();
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