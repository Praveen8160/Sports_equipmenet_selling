using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class addcat : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-O2PF70G;Initial Catalog=dbsports;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
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
               
            }
        }

        protected void upload1_Click(object sender, EventArgs e)
        {
            
            String name1 = name.Text;
            if (name1 != "" && image.HasFile)
            {
                    string fname = Path.GetFileName(image.FileName);
                    string fPath = Server.MapPath("catimage/");
                    string filepath = fPath + fname;

                if (File.Exists(filepath))
                {
                    string newFileName = Path.GetFileNameWithoutExtension(fname) + DateTime.Now.ToString("yyyyMMddHHmmssfff") + Path.GetExtension(fname);
                    string newFilePath = fPath + newFileName;
                    File.Move(filepath, newFilePath);
                    fname = newFileName;
                }
                else
                {
                    image.SaveAs(filepath);
                }



              
                String query = "insert into tblcategories1(name,image) values('" + name1 + "','" + fname + "')";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("viewcat.aspx");
            }
            else
            {
                Response.Write("<script>alert('enter the all values')</script>");
            }
        }
    }
}