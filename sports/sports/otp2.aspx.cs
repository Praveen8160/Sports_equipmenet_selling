using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class otp2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
           // string email1 = Request.QueryString["emailadd"].ToString();
        }

        protected void btnotp_Click(object sender, EventArgs e)
        {
            string value = otp.Text;
            string query = "select * from otp where otp='" + otp.Text + "' and status='0'";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                string otp1;
                otp1 = ds.Tables[0].Rows[0]["otp"].ToString();
                if(otp1==otp.Text)
                {
                   
                        changestatus();
                        string strpass = (string)Session["pass"];
                        string insert = "insert into register (username,email,password) values('" + Session["name"] + "','" + Session["email"] + "','" + Session["pass"] + "')";
                        SqlCommand cmd1 = new SqlCommand(insert, con);
                        cmd1.ExecuteNonQuery();
                        Response.Redirect("login1.aspx");
     
                }
                else
                {
                    Response.Write("<script>alert('enter correct otp')</script>");
                }
            }
            con.Close();
        }
        private void changestatus()
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
            string update="Update otp set status='1' where otp='"+otp.Text+"'";
            con.Open();
            SqlCommand cmd = new SqlCommand(update, con);
            cmd.ExecuteNonQuery();
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