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
    
    public partial class CargoList : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
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
          // GridView1.DataSource = SqlDataSourceCargoList;
           //GridView1.DataBind();
          
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="select")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string v = GridView1.Rows[crow].Cells[2].Text;
                string qty = GridView1.Rows[crow].Cells[3].Text;
                int quan = Int32.Parse(qty);
                Session["cargo"] = v;
                Session["quan"] = quan;
                

               // Label1.Text = "Rollno of Selected Student is " + v;

                Response.Redirect("/Cargo/TruckSelectList.aspx");
            }
            else if (e.CommandName == "delete")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView1.Rows[crow].Cells[2].Text;
                Session["cargo"] = null;
                
                SqlConnection sqlcon = new SqlConnection(strConnection);
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                try
                {
                   
                    SqlCommand sqlcmd = new SqlCommand("SpDeleteCargoList", sqlcon);
                    sqlcmd.CommandType = CommandType.StoredProcedure;
                    sqlcmd.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd.Parameters.AddWithValue("@Status", "TruckUncheck");
                    sqlcmd.ExecuteNonQuery();

                    sqlcon.Close();
                   // Page.ClientScript.RegisterStartupScript(this.GetType(), "Cancel", "Cancel();", true);
                      Response.Redirect("/Cargo/CargoList.aspx",true);





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
        
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if (e.CommandName == "delete1")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string CargID = GridView2.Rows[crow].Cells[1].Text;
                Session["cargo"] = null;
                SqlConnection sqlcon2 = new SqlConnection(strConnection);
                if (sqlcon2.State == ConnectionState.Closed)
                {
                    sqlcon2.Open();
                }
                try
                {

                    SqlCommand sqlcmd2 = new SqlCommand("SpDeleteCargoList", sqlcon2);
                    sqlcmd2.CommandType = CommandType.StoredProcedure;
                    sqlcmd2.Parameters.AddWithValue("@CargoID", CargID);
                    sqlcmd2.Parameters.AddWithValue("@Status","TruckCheck");
                    sqlcmd2.ExecuteNonQuery();
                    sqlcon2.Close();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Cancel", "Cancel();", true);
                    Response.Redirect("/Cargo/CargoList.aspx");
                    

                }
                catch
                {


                }


            }
        }
    }
}