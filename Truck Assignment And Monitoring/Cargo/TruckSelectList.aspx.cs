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
    
    public partial class TruckSelectList : System.Web.UI.Page
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
                    dt.Columns.AddRange(new DataColumn[5] { new DataColumn("NumberPlate"), new DataColumn("WeightCapacity"), new DataColumn("DriverName"), new DataColumn("FamilyName"), new DataColumn("PhoneNo")});

                    SqlCommand sqlcmd = new SqlCommand("SpTruckSelect", sqlcon);
                    sqlcmd.Parameters.AddWithValue("@CargoID", Session["cargo"]);
                    sqlcmd.Parameters.AddWithValue("@Quan", Session["quan"]);
                    sqlcmd.Parameters.AddWithValue("@OwnerLoginID", Session["Logged"]);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Drivers");
                 
                    foreach (DataRow pRow in ds.Tables["Drivers"].Rows)
                    {
                       
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "updateProgress"+i, "updateProgress('" + pRow["lat"] + "','" + pRow["lon"] + "');", true);
                        dt.Rows.Add(pRow["NumberPlate"], pRow["WeightCapacity"],pRow["DriverName"],pRow["FamilyName"],pRow["PhoneNo"]);
                
                    }
                    
                    GridViewTruck.DataSource = dt;
                    GridViewTruck.DataBind();
                    sqlcon.Close();
                }
                catch(Exception ee)
                {
                    Console.WriteLine(ee);

                }
            }
        }
      
        protected void GetSelectedRecords(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[1] { new DataColumn("TruckNo")});
            int counter = 0;
            foreach (GridViewRow row in GridViewTruck.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string TruckNo = row.Cells[1].Text;
                        SqlConnection sqlcon2 = new SqlConnection("Data Source=DESKTOP-LN1ORGC;Initial Catalog=TAM;Integrated Security=True;MultipleActiveResultSets=True");
                       
                        if (sqlcon2.State == ConnectionState.Closed)
                        {
                            sqlcon2.Open();
                        }
                        try
                        {
                            

                            SqlCommand sqlcmd2 = new SqlCommand("SpTruckWaiting", sqlcon2);
                            sqlcmd2.CommandType = CommandType.StoredProcedure;
                            sqlcmd2.Parameters.AddWithValue("@CargoID", Session["cargo"]);
                            sqlcmd2.Parameters.AddWithValue("@TruckNumber", TruckNo);
                            sqlcmd2.ExecuteNonQuery();
                         
                            sqlcon2.Close();
                        }
                        catch (Exception ee)
                        {
                            Console.WriteLine(ee);

                        }
                        //string TruckNo = (row.Cells[1].FindControl("Id Place Here") as Label).Text;
                        dt.Rows.Add(TruckNo);
                        counter++;
                    }
                }
               
            }
            if(counter==0)
            {
                //Page.RegisterStartupScript("MyScript","<script language=javascript>" + " alert('Please select at least one truck'); </script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DriverError", "DriverError('" + counter + "');", true);

            }
            else if(counter>5)
            {
                SqlConnection sqlcon3 = new SqlConnection("Data Source=DESKTOP-LN1ORGC;Initial Catalog=TAM;Integrated Security=True;MultipleActiveResultSets=True");

                if (sqlcon3.State == ConnectionState.Closed)
                {
                    sqlcon3.Open();
                }
                try
                {


                    SqlCommand sqlcmd3 = new SqlCommand("SpTruckWaitingDeleteExcess", sqlcon3);
                    sqlcmd3.CommandType = CommandType.StoredProcedure;
                    sqlcmd3.Parameters.AddWithValue("@CargoID", Session["cargo"]);
                    
                    sqlcmd3.ExecuteNonQuery();

                    sqlcon3.Close();
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee);

                }
                //Page.RegisterStartupScript("MyScript", "<script language=javascript>" + " alert('Please select at most five trucks'); </script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DriverError", "DriverError('" + counter + "');", true);
            }


            //Page.RegisterStartupScript("MyScript", "<script language=javascript>" + "   window.location.href = "+"'Cargo/CargoHome.aspx'"+"; </script>");
            //Response.Redirect("/Cargo/CargoHome.aspx");
            else
            {
                Session["cargo"] = null;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DriverError", "DriverError('" + counter + "');", true);
                //System.Threading.Thread.Sleep(2000);
                //Response.Redirect("/Cargo/TruckSelectSuccess.aspx");
            }
            

            //   gvSelected.DataSource = dt;
            // gvSelected.DataBind();
        }
       




    }
}