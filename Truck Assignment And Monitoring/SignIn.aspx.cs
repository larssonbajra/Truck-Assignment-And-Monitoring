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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] != null)
            {
                if (Session["Type"].ToString() == "Administrator")
                {
                    Response.Redirect("~/Admin/AdminHome.aspx");
                }

                else if (Session["Type"].ToString() == "CargoOwner")
                {
                    Response.Redirect("/Cargo/CargoHome.aspx");
                }
                else
                {
                    Response.Redirect("/Driver/DriverPage.aspx");
                }

            }
        }

        protected void DropDownListOption_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Btn_Login_Click1(object sender, EventArgs e)
        {


            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {
                string option = DropDownListOption.SelectedValue;
                string Id = User_Login.Text;
                encrypt encpass = new encrypt();
                string key = "sblw-3hn8-sqoy19";
                string encryptpass = encpass.PassEncrypt(User_Password.Text, key);
                SqlCommand sqlcmd = new SqlCommand("SpLoginCheck", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@LoginID", Id);
                sqlcmd.Parameters.AddWithValue("@Password", encryptpass);
                sqlcmd.Parameters.AddWithValue("@Option", option);
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);

                DataSet ds = new DataSet();



                int results = da.Fill(ds, "LoginID");
                if ((results == 1) && (option == "CargoOwner"))
                {
                    sqlcon.Close();
                    Session["Logged"] = User_Login.Text;
                    Session["Type"] = "CargoOwner";
                    Response.Redirect("/Cargo/CargoHome.aspx");
                  //  Server.Transfer("/Cargo/CargoHome.aspx");

                }
                else if ((results == 1) && (option == "Driver"))
                {
                    sqlcon.Close();
                    Session["Logged"] = User_Login.Text;
                    Session["Type"] = "Driver";
                    Server.Transfer("/Driver/DriverPage.aspx");
                    //Response.Redirect("/Driver/DriverHome.aspx");

                }
                else
                {
                    sqlcon.Close();
                    //Response.Redirect("~/Index.aspx");
                   // Page.ClientScript.RegisterStartupScript(this.GetType(), "LoginError", "LoginError();", true);
                }
                
            }
            catch(Exception here)
            {
                Console.WriteLine(here);

            }

        }
    }
}