using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Truck_Assignment_And_Monitoring
{
    public partial class Administrator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] != null)
            {

                if (Session["Type"].ToString() == "Administrator")
                {
                    Response.Redirect("/Admin/AdminHome.aspx");
                }
                else if (Session["Type"].ToString() == "Driver")
                {
                    Response.Redirect("/Driver/DriverPage.aspx");
                }
                else if (Session["Type"].ToString() == "CargoOwner")
                {
                    Response.Redirect("/Cargo/CargoHome.aspx");
                }
            }
        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
           

            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {
                string option = "Administrator";
                string LoginID = Request.Form["username"];
                string password = Request.Form["password"];
                encrypt encpass = new encrypt();
                string key = "sblw-3hn8-sqoy19";
                string encryptpass = encpass.PassEncrypt(password, key);
                SqlCommand sqlcmd = new SqlCommand("SpLoginCheck", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@LoginID", LoginID);
                sqlcmd.Parameters.AddWithValue("@Password", encryptpass);
                sqlcmd.Parameters.AddWithValue("@Option", option);
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);

                DataSet ds = new DataSet();



                int results = da.Fill(ds, "LoginID");
                if (results == 1)
                {
                    Session["Logged"] = "Administrator";
                    Session["Type"] = "Administrator";
                    sqlcon.Close();
                    Response.Redirect("/Admin/AdminHome.aspx");
                    //  Server.Transfer("/Cargo/CargoHome.aspx");

                }
               
                else
                {
                    sqlcon.Close();
                    Response.Redirect("~/Administrator.aspx");
                }
                    
                
               




                // ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                // this.lblMessage.Text = "Your Registration is done successfully. Our team will contact you shotly";
                //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('FiveDot File uploaded successfully'); alert('TwoDot File uploaded successfully');", true);


            }
            catch(Exception ee)
            {
                Console.WriteLine(ee);

            }
        }
    }
}