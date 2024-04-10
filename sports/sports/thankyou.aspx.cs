using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sports
{
    public partial class thankyou : System.Web.UI.Page
    {
        public string amount;
        protected void Page_Load(object sender, EventArgs e)
        {
            amount = (Convert.ToDouble(Session["total"]) * 100).ToString();
            //Response.Redirect("order.aspx");
        }
    }
}