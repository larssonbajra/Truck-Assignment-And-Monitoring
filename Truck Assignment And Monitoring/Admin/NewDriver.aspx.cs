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
    public partial class NewDriver : System.Web.UI.Page
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
           
        }

        protected void AddDriver_Click(object sender, EventArgs e)
        {

            string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnection);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            try
            {
                string Admin = Session["Logged"].ToString();
                string firstname = FirstName.Text;
                string middlename = MiddleName.Text;
                string lastname = LastName.Text;
                string dob = Request.Form["date"];
                DateTime DateOfBirth = Convert.ToDateTime(dob);
                string mobile = Mobile.Text;
                string phone = Phone.Text;
                string email = Email.Text;
                string address = Address.Text;
                string login = Login.Text;
                string password = Password.Text;
                string password1 = ConfirmPassword.Text;
                if (password!=password1)
                {
                    //  Page.RegisterStartupScript("MyScript", "<script language=javascript>" + " alert('password mismatch. Try again'); </script>");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Mismatch", "Mismatch();", true);

                }
               else
                {
                    SqlCommand sqlcmd2 = new SqlCommand("SpDriverLoginCheck", sqlcon);
                    sqlcmd2.CommandType = CommandType.StoredProcedure;
                    sqlcmd2.Parameters.AddWithValue("@LoginID", login);

                    SqlDataReader logusers;
                    logusers = sqlcmd2.ExecuteReader();

                    //  string temp = logusers["temp"].ToString();
                    if (logusers.HasRows)
                    {
                        sqlcon.Close();
                        // Page.RegisterStartupScript("MyScript", "<script language=javascript>" + " alert('Id already taken'); </script>");
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Taken", "Taken();", true);

                    }
                    else
                    {
                        string key = "sblw-3hn8-sqoy19";
                        encrypt encpass = new encrypt();
                        string encryptpass = encpass.PassEncrypt(password, key);
                        SqlCommand sqlcmd = new SqlCommand("SpDriverIns", sqlcon);
                        sqlcmd.CommandType = CommandType.StoredProcedure;
                        sqlcmd.Parameters.AddWithValue("@firstname", firstname);
                        sqlcmd.Parameters.AddWithValue("@middlename", middlename);
                        sqlcmd.Parameters.AddWithValue("@lastname", lastname);
                        sqlcmd.Parameters.AddWithValue("@dob", DateOfBirth);
                        sqlcmd.Parameters.AddWithValue("@mobile", mobile);
                        sqlcmd.Parameters.AddWithValue("@phone", phone);
                        sqlcmd.Parameters.AddWithValue("@email", email);
                        sqlcmd.Parameters.AddWithValue("@address", address);
                        sqlcmd.Parameters.AddWithValue("@login", login);
                        sqlcmd.Parameters.AddWithValue("@password", encryptpass);
                        sqlcmd.ExecuteNonQuery();
                        sqlcon.Close();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "Success();", true);
                        //Response.Redirect("/Admin/DriverAddSuccess.aspx", false);
                    }
                  
                }
             
            }
            catch (Exception eaa)
            {

                Console.WriteLine(eaa.ToString());

               // Response.Redirect("/Admin/NewDriver.aspx");
            }
            //Response.Redirect("/Admin/NewDriver.aspx");
        }
    }
}