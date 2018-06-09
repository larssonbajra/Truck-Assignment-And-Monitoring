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
    public partial class Negotiation : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
        //protected GridView GridView2;
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

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Negotiate")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView2.Rows[crow].Cells[3].Text;
                string TruckID = GridView2.Rows[crow].Cells[4].Text;
                DateTime PickingDate = Convert.ToDateTime(GridView2.Rows[crow].Cells[8].Text);
                DateTime DroppingDate = Convert.ToDateTime(GridView2.Rows[crow].Cells[9].Text);


                Response.Redirect("/Cargo/NegotiateValues.aspx?cargoid=" + CargID + "&truckid=" + TruckID + "&picking=" + PickingDate + "&dropping=" + DroppingDate);




            }
            else if (e.CommandName == "Cancel")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView2.Rows[crow].Cells[3].Text;
                string TruckID = GridView2.Rows[crow].Cells[4].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {

                    string logger = Session["Logged"].ToString();
                    SqlCommand sqlcmd = new SqlCommand("SpCargoDeleteRequestWaitingTruck", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                    sqlcmd.Parameters.AddWithValue("@Logged", logger);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    //Response.Redirect("/Cargo/Negotiation.aspx");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Cancel", "Cancel();", true);




                }
                catch
                {


                }

            }
            else if (e.CommandName == "Deal")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView2.Rows[crow].Cells[3].Text;
                string TruckID = GridView2.Rows[crow].Cells[4].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {
                    string logger = Session["Logged"].ToString();
                    SqlCommand sqlcmd = new SqlCommand("SpDealDoneOwner", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                    sqlcmd.Parameters.AddWithValue("@Logged", logger);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Deal", "Deal();", true);
                    //  Response.Redirect("/Cargo/Negotiation.aspx",true);
                }
                catch (System.Threading.ThreadAbortException)
                {
                    // ignore it
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }
            }
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
              if (e.CommandName == "Cancel")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView3.Rows[crow].Cells[1].Text;
                string TruckID = GridView3.Rows[crow].Cells[2].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {
                    string logger = Session["Logged"].ToString();
                    SqlCommand sqlcmd = new SqlCommand("SpCargoDeleteRequestWaitingTruck", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                    sqlcmd.Parameters.AddWithValue("@Logged", logger);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Cancel", "Cancel();", true);
                    // Response.Redirect("/Cargo/Negotiation.aspx");
                }
                catch
                {


                }

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView1.Rows[crow].Cells[1].Text;
                string TruckID = GridView1.Rows[crow].Cells[2].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {
                    string logger = Session["Logged"].ToString();
                    SqlCommand sqlcmd = new SqlCommand("SpCargoDeleteRequestWaitingTruck", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                    sqlcmd.Parameters.AddWithValue("@Logged", logger);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    //Response.Redirect("/Cargo/Negotiation.aspx");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Cancel", "Cancel();", true);
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }

            }
        }


    }
}