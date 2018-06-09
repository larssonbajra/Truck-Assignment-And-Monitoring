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
    public partial class ViewTrucks : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[4] { new DataColumn("TruckID"), new DataColumn("Number"), new DataColumn("Weight"), new DataColumn("Status")});
                    String driver = Session["driver"].ToString();
                    SqlCommand sqlcmd = new SqlCommand("SpTruckListAdmin", sqlcon);
                    sqlcmd.Parameters.AddWithValue("@DriverID", driver);
                    sqlcmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                    DataSet ds = new DataSet();


                    da.Fill(ds, "Drivers");
                    foreach (DataRow pRow in ds.Tables["Drivers"].Rows)
                    {
                        dt.Rows.Add(pRow["TruckID"], pRow["Number"], pRow["Weight"], pRow["Status"]);

                    }
                    GridViewTruck.DataSource = dt;
                    GridViewTruck.DataBind();
                    sqlcon.Close();
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }
            }

        }
        protected void AddTruck_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AddTruck.aspx");
        }
    }
}