using OneSignalSharp;
using OneSignalSharp.Posting;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Truck_Assignment_And_Monitoring
{
    public partial class Index : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] != null)
            {
                if (Session["Type"].ToString() == "Administrator")
                {
                    Response.Redirect("~/Admin/AdminHome.aspx");
                }

                else if (Session["Type"].ToString() == "CargoOwner")
                {
                    Response.Redirect("~/Cargo/CargoHome.aspx");
                }
                else
                {
                    Response.Redirect("~/Driver/DriverPage.aspx");
                }              
            }
          


        }
      
        protected void SignIn_Click(object sender, EventArgs e)
        {
           
            //Server.Transfer("SignIn.aspx");
            Response.Redirect("~/SignIn.aspx");
        }
       
        protected void SignUp_Click(object sender, EventArgs e)
        {           
           

            Response.Redirect("~/SignUp.aspx");
            //Server.Transfer("SignUp.aspx");

        }

       
      
    }
}