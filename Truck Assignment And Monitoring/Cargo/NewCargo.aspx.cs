using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring.Cargo
{
    public partial class NewCargo : System.Web.UI.Page
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
           
            
        }

  

        protected void CargoRegister_Click(object sender, EventArgs e)
        {


            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {
                string CargoOwner = Session["Logged"].ToString();
                string details = Details.Text;
                string PickUp = PickUpPlace.Text;
                string DropOff = Destination.Text;
                string Quan = Quantity.Text;
                int quantity = Convert.ToInt32(Quan);
                string Cargo = CargoType.SelectedValue.ToString();
                string Pickdate = Request.Form["pickdate"];
                DateTime PickUpdt = Convert.ToDateTime(Pickdate);
                string Dropdate = Request.Form["dropdate"];
                DateTime Dropdt = Convert.ToDateTime(Dropdate);
                SqlCommand sqlcmd = new SqlCommand("SpCargoIns", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@CargoOwner", CargoOwner);
                sqlcmd.Parameters.AddWithValue("@Details", details);
                sqlcmd.Parameters.AddWithValue("@PickUp", PickUp);
                sqlcmd.Parameters.AddWithValue("@Drop", DropOff);
                sqlcmd.Parameters.AddWithValue("@Quantity", quantity);
                sqlcmd.Parameters.AddWithValue("@Type", Cargo);
                sqlcmd.Parameters.AddWithValue("@PickUpDate", Pickdate);
                sqlcmd.Parameters.AddWithValue("@DropDate", Dropdate);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                //Response.Redirect("/Cargo/CargoSuccess.aspx",false);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AddCargo", "AddCargo();", true);

            }
            catch (Exception eaa)
            {

                Console.WriteLine(eaa.ToString());
              
                Response.Redirect("/Cargo/CargoHome.aspx");
            }

        }
       
    }
}