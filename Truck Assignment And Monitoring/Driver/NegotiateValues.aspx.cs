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
    public partial class NegotiateValues : System.Web.UI.Page
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
            TruckID.Text= Request.QueryString["truckid"];
            CargoID.Text = Request.QueryString["cargoid"];
            pickerdate.Text = Request.QueryString["picking"];
            dropperdate.Text = Request.QueryString["dropping"];
            
            // pickdate.Text = Request.QueryString["picking"];
            // dropdate.Text = Request.QueryString["dropping"];
            // Request.Form["pickdate"] = Request.QueryString["picking"];

        }

       

        protected void Negotiate_Click1(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {

                string Cargo = CargoType.SelectedValue.ToString();
                string CargoId = Request.QueryString["cargoid"];
                string pri = Rate.Text;
                string Logger = Session["Logged"].ToString();
                int price = Convert.ToInt32(pri);
                string Pickdate = Request.Form["pickdate"];
                DateTime PickUpdt = Convert.ToDateTime(Pickdate);
                string Dropdate = Request.Form["dropdate"];
                DateTime Dropdt = Convert.ToDateTime(Dropdate);
                SqlCommand sqlcmd = new SqlCommand("SpNegotiateProcessDriver", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@PickDate", PickUpdt);
                sqlcmd.Parameters.AddWithValue("@DropDate", Dropdt);               
                sqlcmd.Parameters.AddWithValue("@Price", price);
                sqlcmd.Parameters.AddWithValue("@CargoId", CargoId);
                sqlcmd.Parameters.AddWithValue("@Logged", Logger);
                sqlcmd.Parameters.AddWithValue("@CargoType", Cargo);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Negotiate", "Negotiate();", true);
                //Response.Redirect("/Driver/Negotiation.aspx");
            }
            catch (Exception eaa)
            {

                Console.WriteLine(eaa.ToString());

               
            }

        }
    }
}