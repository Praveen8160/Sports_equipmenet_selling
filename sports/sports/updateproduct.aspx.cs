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
    public partial class updateproduct : System.Web.UI.Page
    {
        SqlConnection connectionString = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                viewbrand();
                viewcat();
                viewsize();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    string query = "SELECT * FROM tblproduct WHERE id=@Product_id";

                    using (connectionString)
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(query, connectionString))
                        {
                            adapter.SelectCommand.Parameters.AddWithValue("@Product_id", id);
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {

                                pname.Text = dt.Rows[0]["name"].ToString();
                                price.Text = dt.Rows[0]["price"].ToString();
                                offer.Text = dt.Rows[0]["offer"].ToString();
                                price.Text = dt.Rows[0]["price"].ToString();

                                int brand = int.Parse(dt.Rows[0]["id"].ToString());
                                pbrand.SelectedValue = brand.ToString();

                                int category = int.Parse(dt.Rows[0]["id"].ToString());
                                pcat.SelectedValue = category.ToString();

                                string imagePath = dt.Rows[0]["image"].ToString();
                                if (!string.IsNullOrEmpty(imagePath))
                                {
                                    image.Attributes["value"] = imagePath;
                                }
                                quantity.Text = dt.Rows[0]["quantity"].ToString();

                                description.Text = dt.Rows[0]["description"].ToString();

                            }
                        }

                    }
                }
            }
        }
        protected void viewbrand()
        {
            String query = "select * from tblbrand";
            connectionString.Open();
            SqlCommand cmd = new SqlCommand(query, connectionString);
            SqlDataAdapter sdr = new SqlDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            sdr.Fill(dt);
            pbrand.DataSource = dt;
            pbrand.DataValueField = "name";
            pbrand.DataTextField = "name";
            pbrand.DataBind();
            connectionString.Close();
        }
        protected void viewcat()
        {
            String query = "select * from tblcategories1";
            connectionString.Open();
            SqlCommand cmd = new SqlCommand(query, connectionString);
            SqlDataAdapter sda = new SqlDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            pcat.DataSource = dt;
            pcat.DataValueField = "name";
            pcat.DataTextField = "name";
            pcat.DataBind();
            connectionString.Close();
        }
        protected void viewsize()
        {
            String query = "select * from size";
            connectionString.Open();
            SqlCommand cmd = new SqlCommand(query, connectionString);
            SqlDataAdapter sda = new SqlDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            psize.DataSource = dt;
            psize.DataValueField = "name";
            psize.DataTextField = "name";
            psize.DataBind();
            connectionString.Close();
        }
        protected void addpro_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            string name = pname.Text;
            int pprice = System.Convert.ToInt32(price.Text);
            int poffer = System.Convert.ToInt32(offer.Text);


            string des = description.Text;
            int qty = System.Convert.ToInt32(quantity.Text);
            if (name == "" || pprice < 0 || poffer < 0 || des == "" || qty < 0)
            {
                Response.Write("<script>alert('enter all data')</script>");
            }
            else
            {
                if (pcat.SelectedValue == "" || psize.SelectedValue == "" || pbrand.SelectedValue == "")
                {
                    Response.Write("<script>alert('select all option values')</script>");
                }
                else
                {
                    HttpPostedFile file = Request.Files["image"];
                    if (image.HasFile)
                    {
                        string fileName = Path.GetExtension(file.FileName);
                        image.SaveAs(Server.MapPath("productimage/") + Path.GetFileName(image.FileName));
                        String query = "update tblproduct set name='"+name+"',price='"+pprice+ "',offer='" + poffer + "',brand='" + pbrand.SelectedValue.ToString() + "',categories='" + pcat.SelectedValue.ToString() + "',size='" + psize.SelectedValue.ToString() + "',description='"+des+"',quantity='"+qty+ "',image='"+ file.FileName + "'  WHERE id = '"+id+"'";
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand(query, connectionString);
                        cmd.ExecuteNonQuery();
                        connectionString.Close();
                        Response.Redirect("viewproduct.aspx");
                      
                    }
                    else
                    {
                        String query = "update tblproduct set name='" + name + "',price='" + pprice + "',offer='" + poffer + "',brand='" + pbrand.SelectedValue.ToString() + "',categories='" + pcat.SelectedValue.ToString() + "',size='" + psize.SelectedValue.ToString() + "',description='" + des + "',quantity='" + qty + "'  WHERE id = '" + id + "'";
                        connectionString.Open();
                        SqlCommand cmd = new SqlCommand(query, connectionString);
                        cmd.ExecuteNonQuery();
                        connectionString.Close();
                        Response.Redirect("viewproduct.aspx");
                    }
                }
            }
        }
    }
}