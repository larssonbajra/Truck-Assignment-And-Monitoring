using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Admin
{
    public partial class AddTruck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] == null)
            {
                Response.Redirect("../Administrator.aspx");
            }
            else if (Session["Type"].ToString() == "Driver")
            {
                Response.Redirect("../Driver/DriverPage.aspx");
            }
            else if (Session["Type"].ToString() == "CargoOwner")
            {
                Response.Redirect("../Cargo/CargoHome.aspx");
            }
        }

        protected void TruckAdd_Click(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {
                string DriverID = Session["driver"].ToString();
                string Number = NumberPlate.Text;
                string Capacity = WeightCapacity.Text;            
                int quantity = Convert.ToInt32(Capacity);
                string year = Manufactured.Text;
                string TruckKind = TruckType.SelectedValue.ToString();
                SqlCommand sqlcmd = new SqlCommand("SpTruckInsAdmin", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@DriverID", DriverID);
                sqlcmd.Parameters.AddWithValue("@NumberPlate", Number);
                sqlcmd.Parameters.AddWithValue("@Weight", quantity);
                sqlcmd.Parameters.AddWithValue("@Type", TruckKind);
                sqlcmd.Parameters.AddWithValue("@Year", year);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Added", "Added();", true);
                // Response.Redirect("/Admin/ViewTrucks.aspx", false);

            }
            catch (Exception eaa)
            {

                Console.WriteLine(eaa.ToString());

                Response.Redirect("/Admin/ViewTrucks.aspx", false);
            }
        }
    }
}