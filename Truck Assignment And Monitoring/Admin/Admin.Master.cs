using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"]==null)
            {
                Response.Redirect("../Administrator.aspx");
            }
            else if(Session["Type"].ToString()=="Driver")
            {
                Response.Redirect("../Driver/DriverPage.aspx");
            }
            else if (Session["Type"].ToString() == "CargoOwner")
            {
                Response.Redirect("../Cargo/CargoHome.aspx");
            }
            namelabel.Text = Session["Logged"].ToString();
           
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Administrator.aspx");
        }
    }
}