using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Driver
{
    public partial class CargoHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] == null)
            {
                Response.Redirect("../Index.aspx");
            }
            else if (Session["Type"].ToString() == "Cargo")
            {
                Response.Redirect("../Cargo/CargoHome.aspx");
            }
            else if (Session["Type"].ToString() == "Administrator")
            {
                Response.Redirect("../Admin/AdminHome.aspx");
            }
        }
    }
}