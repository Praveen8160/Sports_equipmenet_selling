using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data;

namespace sports
{
    public partial class register : System.Web.UI.Page
    {
        static string activationcode;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                viewcat();
                viewbrand();

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
            cat.DataSource = dt;
            cat.DataValueField = "name";
            cat.DataTextField = "name";
            cat.DataBind();
            con.Close();
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            if (username.Text==""|| email.Text==""|| password.Text==""|| repassword.Text=="")
            {
                Response.Write("<script>alert('enter all values')</script>");
            }
            else
            {
                string query1 = "select * from register where email='" + email.Text + "'";
                SqlCommand cmd1= new SqlCommand(query1, con);
                con.Open();
                SqlDataReader sdr = cmd1.ExecuteReader();
                if (sdr.Read())
                {
                    con.Close();
                    Response.Write("<script>alert('email already registred')</script>");
                    
                }
                else
                {
                    con.Close();
                    Random random = new Random();
                    activationcode = random.Next(1001, 9999).ToString();
                    string query = "insert into otp(otp,status) values('" + activationcode + "','0')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    sendcode();
                    Session["name"] = username.Text;
                    Session["email"] = email.Text;
                    Session["pass"] = encryptpass(password.Text);
                    Session["repass"] = encryptpass(repassword.Text);

                    Response.Redirect("otp2.aspx");
                }
              
            }
            /*if(password.Text==repassword.Text)
             {
                String strpass = encryptpass(password.Text);
                string insert="insert into register (username,email,password) values('"+username.Text+ "','" + email.Text + "','" + password.Text + "')";
                SqlCommand cmd = new SqlCommand(insert, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("register success");
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Write("password doesn't match");

            }*/
        }

        public void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("sportsjam.in@gmail.com", "jblnmzuqexewdxuy");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "otp to verify email";
            msg.Body = "dear" + email.Text + "your otp is " + activationcode + "\n\n\nThanks";
            string toaddress = email.Text;
            msg.To.Add(toaddress);
            string fromaddress = "sports.jam<spoartjam.in@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
        }
        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

    }
}