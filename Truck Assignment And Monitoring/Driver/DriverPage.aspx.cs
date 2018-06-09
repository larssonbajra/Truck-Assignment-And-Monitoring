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
    public partial class DriverIndex : System.Web.UI.Page
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
       
       
       
        public static string Emergency(string logged)
        {
            string strConnection2 = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection2);

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
                if (finalmessage!=null)
                {
                  //  SqlConnection sqlcon2 = new SqlConnection("Data Source=DESKTOP-LN1ORGC;Initial Catalog=TAM;Integrated Security=True;MultipleActiveResultSets=True");
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();
                    }


                    try
                    {


                        SqlCommand sqlcmd2 = new SqlCommand("SpDeleteNotify", sqlcon);
                        sqlcmd2.Parameters.AddWithValue("@LoginID", logged);
                        sqlcmd2.CommandType = CommandType.StoredProcedure;
                        sqlcmd2.ExecuteNonQuery();

                    }
                    catch (Exception ee)
                    {
                        Console.WriteLine(ee);

                    }
                    sqlcon.Close();
                }


            }
            catch (Exception ee)
            {
                Console.WriteLine(ee);

            }
            sqlcon.Close();
            return finalmessage;
        }
        protected void Start_Trip(object sender, EventArgs e)
        {
           
            SqlConnection sqlcon3 = new SqlConnection(strConnection);
            if (sqlcon3.State == ConnectionState.Closed)
            {
                sqlcon3.Open();
            }
            try
            {
                
                string TruckID = DropDownList1.SelectedValue.ToString();
                string value;
                SqlCommand sqlcmd = new SqlCommand("SpTransitCheck", sqlcon3);
                sqlcmd.CommandType = CommandType.StoredProcedure;               
                sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();


                da.Fill(ds, "Trip");
                //int i = 1;
                foreach (DataRow pRow in ds.Tables["Trip"].Rows)
                {
                    value = pRow["demo"].ToString();
                   
                        sqlcon3.Close();
                        // Page.RegisterStartupScript("MyScript", "<script language=javascript>" + " alert('Trip Already Started'); </script>");
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "updateProgress", "updateProgress('" + value + "');", true);

                  
                }
                   

            }
            catch (Exception here)
            {
                Console.WriteLine(here);

            }
        }


        protected void End_Trip(object sender, EventArgs e)
        {
            SqlConnection sqlcon4 = new SqlConnection(strConnection);
            if (sqlcon4.State == ConnectionState.Closed)
            {
                sqlcon4.Open();
            }
            try
            {

                string TruckID = DropDownList1.SelectedValue.ToString();
                string value;
                SqlCommand sqlcmd = new SqlCommand("SpEndTrip", sqlcon4);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@TruckID", TruckID);
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();


                da.Fill(ds, "Trip");
               
                foreach (DataRow pRow in ds.Tables["Trip"].Rows)
                {
                    value = pRow["demo"].ToString();

                    sqlcon4.Close();
                    // Page.RegisterStartupScript("MyScript", "<script language=javascript>" + " alert('Trip Already Started'); </script>");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "EndTrip", "EndTrip('" + value + "');", true);


                }


            }
            catch (Exception here)
            {
                Console.WriteLine(here);

            }
        }
    }
}