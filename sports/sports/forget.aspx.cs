using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class forget : System.Web.UI.Page
    {
        static string activationcode;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activationcode = random.Next(10000, 99999).ToString();
            Session["otp"] = activationcode;
            con.Open();
            string query = "select * from register where email='" + email.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                sendcode();
                Session["changemail"] = email.Text;
                Response.Redirect("otp3.aspx");
            }
            else
            {
                Response.Write("<script>alert('enter correct email')</script>");
            }
            con.Close();
        }
        public void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("sportsjam.in@gmail.com", "jblnmzuqexewdxuy");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "otp to forget your password";
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
    }
}