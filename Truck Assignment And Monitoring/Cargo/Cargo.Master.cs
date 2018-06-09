using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Cargo
{
    public partial class Cargo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] == null)
            {
                Response.Redirect("../Index.aspx");
            }
            else if (Session["Type"].ToString() == "Driver")
            {
                Response.Redirect("../Driver/DriverPage.aspx");
            }
            else if (Session["Type"].ToString() == "Administrator")
            {
                Response.Redirect("../Admin/AdminHome.aspx");
            }
            namelabel.Text = Session["Logged"].ToString();
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Index.aspx");
        }
        public string CallFromJS()
        {
            return null;
        }
    }
}