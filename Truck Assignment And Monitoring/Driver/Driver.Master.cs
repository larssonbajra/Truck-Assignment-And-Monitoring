using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Driver
{
    public partial class Driver : System.Web.UI.MasterPage
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
                namelabel.Text = Session["Logged"].ToString();
            
          
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Index.aspx");
        }

    }
}