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
    public partial class addproduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
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
                    viewsize();
                }
            }
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
            pcat.DataSource = dt;
            pcat.DataValueField = "name";
            pcat.DataTextField = "name";
            pcat.DataBind();
            con.Close();
        }
        protected void viewsize()
        {
            String query = "select * from size";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            psize.DataSource = dt;
            psize.DataValueField = "name";
            psize.DataTextField = "name";
            psize.DataBind();
            con.Close();
        }

        protected void addpro_Click(object sender, EventArgs e)
        {
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
                        String query = "insert into tblproduct(name,price,offer,brand,categories,size,description,quantity,image) values('" + name + "','" + pprice + "','" + poffer + "','" + pbrand.SelectedValue.ToString() + "','" + pcat.SelectedValue.ToString() + "','" + psize.SelectedValue.ToString() + "','" + des + "','" + qty + "','" + file.FileName + "')";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("viewproduct.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('select product image')</script>");
                    }
                }
            }
        }
    }
}