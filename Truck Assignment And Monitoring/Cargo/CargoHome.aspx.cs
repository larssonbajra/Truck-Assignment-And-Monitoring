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
    public partial class CargoHome : System.Web.UI.Page
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
        public static string Emergency(string logged)
        {

            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);

            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }

            String message;
            String finalmessage = null;
            try
            {


                SqlCommand sqlcmd = new SqlCommand("SpNotify", sqlcon);
                sqlcmd.Parameters.AddWithValue("@LoginID", logged);
                sqlcmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();


                da.Fill(ds, "Drivers");

                foreach (DataRow pRow in ds.Tables["Drivers"].Rows)
                {
                    message = "Sent from " + pRow["SentFrom"].ToString() + pRow["Text"].ToString() + " For " + pRow["CargoID"].ToString();
                    finalmessage += message;


                }
                if (finalmessage != null)
                {

                    SqlConnection sqlcon2 = new SqlConnection(strConnection);
                    if (sqlcon2.State == ConnectionState.Closed)
                    {
                        sqlcon2.Open();
                    }


                    try
                    {


                        SqlCommand sqlcmd2 = new SqlCommand("SpDeleteNotify", sqlcon2);
                        sqlcmd2.Parameters.AddWithValue("@LoginID", logged);
                        sqlcmd2.CommandType = CommandType.StoredProcedure;
                        sqlcmd2.ExecuteNonQuery();

                    }
                    catch (Exception ee)
                    {
                        Console.WriteLine(ee);

                    }
                    sqlcon2.Close();
                }


            }
            catch (Exception ee)
            {
                Console.WriteLine(ee);

            }
            sqlcon.Close();
            return finalmessage;
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          
            if (e.CommandName == "receive")
                {
                string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
                SqlConnection sqlcon3 = new SqlConnection(strConnection);
                if (sqlcon3.State == ConnectionState.Closed)
                {
                    sqlcon3.Open();
                }


                try
                {
                    int crow;
                    crow = Convert.ToInt32(e.CommandArgument.ToString());
                    string CargoID = GridView2.Rows[crow].Cells[2].Text;
                    SqlCommand sqlcmd3 = new SqlCommand("SpCargoDelivered", sqlcon3);
                    sqlcmd3.Parameters.AddWithValue("@CargoID", CargoID);
                    sqlcmd3.CommandType = CommandType.StoredProcedure;
                    sqlcmd3.ExecuteNonQuery();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Delivery", "Delivery();", true);

                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }
                sqlcon3.Close();
            }

            
        }

      
    }
}
