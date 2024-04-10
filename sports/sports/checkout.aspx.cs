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
   
    public partial class checkout : System.Web.UI.Page
    {
        public string amount;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
           
            //amount = (500 * 100).ToString();
            amount = (Convert.ToDouble(Session["total"]) * 100).ToString();
            if (!IsPostBack)
            {
                string mail = (string)Session["email2"];
                email.Text = mail;
                string q = "select * from users where email ='" + mail + "'";
                con.Open();
                SqlCommand sqc = new SqlCommand(q, con);
                SqlDataReader sdr = sqc.ExecuteReader();
                if(sdr.Read())
                {
                    name.Text = sdr["name"].ToString();
                    phone.Text = sdr["phone"].ToString();
                    address.Text= sdr["address"].ToString();
                    city.Text= sdr["city"].ToString();
                    state.Text = sdr["state"].ToString();
                    pin.Text= sdr["pincode"].ToString();
                }
                con.Close();
                up();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string mail = (string)Session["email2"];
            int totalCustomers, totalProducts = 0;
            string p;
            int q, pri, tot;
            if (name.Text == "" || email.Text == "" || phone.Text == "" || address.Text == "" || city.Text == "" || state.Text == "" || pin.Text == "")
            {
                Response.Write("<script>alert('enter all detail')</script>");
            }
            else
            {
                con.Open();
                string cou= "SELECT SUM(total) FROM tblcart1 WHERE cemail='"+mail+"'";
                SqlCommand cmd2 = new SqlCommand(cou, con);
                totalCustomers = (int)cmd2.ExecuteScalar();
                con.Close();


                string payment = string.Empty;
                if (cod.Checked)
                {
                    payment = "UPI";
                }
                else if (online.Checked)
                {
                    payment = "Online banking";
                }
                DateTime currentDate = DateTime.Now;
                string formattedDate = currentDate.ToString("dd/MM/yyyy"); // or use any other format string you prefer
           
                string stut = "Panding";
                con.Open();
                string up1 = "insert into tblorder(cemail,total,address,city,state,mobile,pincode,payment,status,date) values ('" + mail + "','" + totalCustomers + "','" + address.Text + "','" + city.Text + "','" + state.Text + "','" + phone.Text + "','" + pin.Text + "','" + payment + "','" + stut + "','"+formattedDate+"');SELECT SCOPE_IDENTITY()";
                SqlCommand cmd1 = new SqlCommand(up1, con);
                int orderId = Convert.ToInt32(cmd1.ExecuteScalar());
                con.Close();

                string cartQuery = "SELECT pid, quantity, total FROM tblcart1 WHERE cemail = @cemail";
                string orderItemQuery = "INSERT INTO tblorderitem (order_id, pid, quantity, price) VALUES (@orderid, @productid, @quantity, @price)";

                using (con)
                {
                    con.Open();

                    // Get cart data
                    using (SqlCommand cartCommand = new SqlCommand(cartQuery, con))
                    {
                        cartCommand.Parameters.AddWithValue("@cemail", mail);
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cartCommand))
                        {
                            DataTable cartData = new DataTable();
                            adapter.Fill(cartData);

                            foreach (DataRow cartRow in cartData.Rows)
                            {
                                // Get values from cart data
                                int productId = Convert.ToInt32(cartRow["pid"]);
                                int quantity = Convert.ToInt32(cartRow["quantity"]);
                                int price = Convert.ToInt32(cartRow["total"]);

                                // Insert values into order table
                                using (SqlCommand orderItemCommand = new SqlCommand(orderItemQuery, con))
                                {
                                    orderItemCommand.Parameters.AddWithValue("@orderid", orderId);
                                    orderItemCommand.Parameters.AddWithValue("@productid", productId);
                                    orderItemCommand.Parameters.AddWithValue("@quantity", quantity);
                                    orderItemCommand.Parameters.AddWithValue("@price", price);
                                    orderItemCommand.ExecuteNonQuery();
                                }
                            }
                        }

                        // Delete cart data for customer
                        using (SqlCommand deleteCartCommand = new SqlCommand("DELETE FROM tblcart1 WHERE cemail = @customerid", con))
                        {
                            deleteCartCommand.Parameters.AddWithValue("@customerid", mail);
                            deleteCartCommand.ExecuteNonQuery();
                        }
                    }

                    con.Close();
                }


                // Close connection
                Response.Redirect("thankyou.aspx");

            }


        }









        //        string p;
        //    int q, pri, tot;
        //    if (name.Text==""||email.Text==""||phone.Text==""||address.Text==""||city.Text==""||state.Text==""||pin.Text=="")
        //    {
        //        Response.Write("<script>alert('enter all detail')</script>");
        //    }
        //    else
        //    {
        //        string payment = string.Empty;
        //        if (cod.Checked)
        //        {
        //            payment = "UPI";
        //        }
        //        else if (online.Checked)
        //        {
        //            payment = "Online banking";
        //        }
        //        string stut = "panding";
        //        string mail = (string)Session["email2"];
        //        con.Open();
        //        string view = "select * from tblcart1 where cemail='" + mail + "'";
        //        SqlCommand cmd = new SqlCommand(view, con);
        //        SqlDataReader sdr = cmd.ExecuteReader();
        //        if (sdr.Read())
        //        {
        //            p = sdr["name"].ToString();
        //            q = int.Parse(sdr["quantity"].ToString());
        //            pri = int.Parse(sdr["price"].ToString());
        //            tot = int.Parse(sdr["total"].ToString());

        //            con.Close();

        //            con.Open();
        //            string up1 = "insert into tblorder(name,quantity,cemail,price,total,address,city,state,mobile,pincode,payment,status) values ('" + p + "','" + q + "','" + mail + "','" + pri + "','" + tot + "','" + address.Text + "','" + city.Text + "','" + state.Text + "','" + phone.Text + "','" + pin.Text + "','" + payment + "','" + stut + "');SELECT SCOPE_IDENTITY()";
        //            SqlCommand cmd1 = new SqlCommand(up1, con);
        //            cmd1.ExecuteNonQuery();
        //            con.Close();
        //            Response.Write("<script>alert('profile inseted successfully')</script>");

        //            String query = "delete from tblcart1 where cemail='" + mail + "'";
        //            con.Open();
        //            SqlCommand cdm = new SqlCommand(query, con);
        //            cdm.ExecuteNonQuery();
        //            con.Close();

        //            Response.Redirect("thankyou.aspx");
        //        }
        //    }
        //}

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
    }
}