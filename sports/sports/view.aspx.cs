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
    public partial class view : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            view1();
            revi();
            viewbrand();
            viewcat();
            reviewcount();
            int id = int.Parse(Request.QueryString["id"]);
            con.Open();
            string query = "select * from tblproduct where id='" + id + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                offer.Text = sdr["offer"].ToString();
                price2.Text = sdr["price"].ToString();
                des.Text = sdr["description"].ToString();
                name2.Text = sdr["name"].ToString();
                size.Text = sdr["size"].ToString();
                name.Text = sdr["name"].ToString();
                int p = int.Parse(sdr["price"].ToString());
                int off = int.Parse(sdr["offer"].ToString());
                int pri = p - (p * off / 100);
                price.Text = Convert.ToString(pri);
                int q = int.Parse(sdr["quantity"].ToString());
                if (q > 0)
                {
                    string msg1 = "Out of Stock";
                    stock.Text = msg1;
                }
                else
                {
                    stock.Text = "in stock";
                }

            }
            con.Close();
            string mail4 = (string)Session["email2"];
            email.Text = mail4;

        }

        protected void reviewcount()
        {
            int id = int.Parse(Request.QueryString["id"]);
            con.Open();
            int count1 = 0;
            string q = "select  COUNT(*) from tblreview where pid='" + id + "'";
            SqlCommand cm = new SqlCommand(q, con);
            count1 = (int)cm.ExecuteScalar();
            coun.Text =Convert.ToString(count1);
            coun2.Text = Convert.ToString(count1);
            con.Close();
        }
        protected void revi()
        {
            int id = int.Parse(Request.QueryString["id"]);
            string q = "select * from tblreview where pid='"+id+"'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter ad3 = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            ad3.Fill(table);
            reviewshow.DataSource = table;
            reviewshow.DataBind();
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
        protected void view1()
        {
            int id = int.Parse(Request.QueryString["id"]);
            string q = "select * from tblproduct where id='" + id + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter ad3 = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            ad3.Fill(table);
            product.DataSource = table;
            product.DataBind();
            con.Close();
        }

        protected void add_Click(object sender, EventArgs e)
        {
            
            con.Open();
            int id = int.Parse(Request.QueryString["id"]);
            string query = "select * from tblproduct where id='" + id + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                string mail = (string)Session["email2"];
                string name = sdr["name"].ToString();
                string image = sdr["image"].ToString();
                int p = int.Parse(sdr["price"].ToString());
                int off = int.Parse(sdr["offer"].ToString());
                int pri = p - (p * off / 100);
                
                int quantity = int.Parse(qty.Text);
                int quantity1 = int.Parse(sdr["quantity"].ToString());
                int total = pri * quantity;
                if (quantity == 0)
                {
                    con.Close();
                    Response.Write("<script>alert('enter the product quantity more than 0')</script>");
                }
                else
                {
                    if (quantity > quantity1)
                    {
                        con.Close();
                        Response.Write("<script>alert('stock are less')</script>");
                    }
                    else
                    {
                        if (mail == "" || mail == null)
                        {
                            Response.Redirect("login1.aspx");
                        }
                        else
                        {
                            con.Close();
                            string q = "insert into tblcart1(name,cemail,pid,image,price,quantity,total) values('" + name + "','" + mail + "','" + id + "','" + image + "','" + pri + "','" + quantity + "','" + total + "')";
                            SqlCommand cmd1 = new SqlCommand(q, con);
                            con.Open();
                            cmd1.ExecuteNonQuery();
                            con.Close();



                            int qty = quantity1 - quantity;
                            string q2 = "update tblproduct set quantity='" + qty + "' where id='" + id + "'";
                            SqlCommand cmd2 = new SqlCommand(q2, con);
                            con.Open();
                            cmd2.ExecuteNonQuery();
                            cmd2.Dispose();
                            con.Close();

                            Response.Write("<script>alert('product added to cart')</script>");
                        }
                    }
                }


            }
        }
        protected void rev_Click(object sender, EventArgs e)
        {
            string mail = (string)Session["email2"];
            int id = int.Parse(Request.QueryString["id"]);
            if (review.Text==""||name3.Text=="")
            {
                Response.Write("<script>alert('enter review detail')</script>");
            }
            else
            {
                con.Close();
                string q = "insert into tblreview(name,pid,review,email) values('" + name3.Text + "','" + id + "','" + review.Text + "','" + mail + "')";
                SqlCommand cmd1 = new SqlCommand(q, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('review sended')</script>");
            }
        }
    }
}