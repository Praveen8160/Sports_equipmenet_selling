using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class deleteproduct : System.Web.UI.Page
    {
        SqlConnection connectionString = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            string query = "DELETE FROM tblproduct WHERE id='"+id+"'";
            SqlCommand cmd = new SqlCommand(query,connectionString);
            connectionString.Open();
            cmd.ExecuteNonQuery();
            connectionString.Close();
            Response.Redirect("viewproduct.aspx");
        }
    }
}