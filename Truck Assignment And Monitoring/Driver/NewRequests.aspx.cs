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
    public partial class NewRequests : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string cargo = GridView1.Rows[crow].Cells[2].Text;
                string truck = GridView1.Rows[crow].Cells[3].Text;
                string request = GridView1.Rows[crow].Cells[4].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {

                    SqlCommand sqlcmd = new SqlCommand("SpTruckConfirmRequest", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", cargo);
                    sqlcmd.Parameters.AddWithValue("@TruckID", truck);
                    sqlcmd.Parameters.AddWithValue("@RequestDate", request);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Accept", "Accept();", true);
                    // Response.Redirect("/Driver/NewRequests.aspx");

                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }

             }
            else if (e.CommandName == "cancel")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView1.Rows[crow].Cells[2].Text;
                string TruckID = GridView1.Rows[crow].Cells[3].Text;

                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {

                    SqlCommand sqlcmd = new SqlCommand("SpTruckWaitingDelete", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                    sqlcmd.ExecuteNonQuery();
                    sqlcon.Close();
                    Response.Redirect("/Driver/NewRequests.aspx");





                }
                catch
                {


                }





            }
        }
    }
}