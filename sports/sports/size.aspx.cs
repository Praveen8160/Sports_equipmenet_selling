using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class size : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void size1_Click(object sender, EventArgs e)
        {
            String name1 = name.Text;
            if (name1 != "")
            {
                String query = "insert into size(name) values('" + name1 + "')";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("addproduct.aspx");
            }
            else
            {
                Response.Write("<script>alert('enter the size')</script>");
            }
        }
    }
}