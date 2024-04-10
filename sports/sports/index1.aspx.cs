using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class index1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GVbind();
            }

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
                con.Open();
                int count1 = 0;
                string q = "select  COUNT(*) from tblproduct";
                SqlCommand cm = new SqlCommand(q, con);
                count1 = (int)cm.ExecuteScalar();
                user.Text = count1.ToString();

                con.Close();

                con.Open();
                int count2 = 0;
                string q1 = "select  COUNT(*) from users";
                SqlCommand cmd = new SqlCommand(q1, con);
                count2 = (int)cmd.ExecuteScalar();
                pro.Text = count2.ToString();

                con.Close();

                con.Open();
                int count3 = 0;
                string q2 = "select SUM(total) from tblorder";
                SqlCommand cmd1 = new SqlCommand(q2, con);
                count3 = (int)cmd1.ExecuteScalar();
                total.Text = count3.ToString();

                con.Close();
            }

        }
        protected void GVbind()
        {
            string selectedValue = "Panding";
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