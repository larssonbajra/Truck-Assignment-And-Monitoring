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
    public partial class SignUp : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["TAMConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Type"] != null)
            {
                if (Session["Type"].ToString() == "Administrator")
                {
                    Response.Redirect("/Admin/AdminHome.aspx");
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
        public string CallFromJS()
        {
            SqlConnection sqlcon = new SqlConnection(strConnection);
           
            try
            {
                string passwd1 = password.Text;
                string passwd2 = confirm_password.Text;
                string mobile = mobile_no.Text;
                string homephone = telephone_no.Text;
                if ((passwd1 != passwd2))
                {
                    return "2";
                }


                encrypt encpass = new encrypt();
                
                string firstname = first_name.Text;
                string middlename = middle_name.Text;
                string lastname = last_name.Text;

                string email = email_id.Text;
                string address = full_address.Text;
                string ID = login_id.Text;
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }

                SqlCommand sqlcmd = new SqlCommand("SpCargoOwnerIdPassCheck", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@LoginID", ID);

                SqlDataReader logusers;
                logusers = sqlcmd.ExecuteReader();

                //  string temp = logusers["temp"].ToString();
                if (logusers.HasRows)
                {
                    sqlcon.Close();
                    return "1";
                }
                if (email_id.Text == "")
                {
                    sqlcon.Close();
                    return "3";
                }

                string key = "sblw-3hn8-sqoy19";
                string encryptpass = encpass.PassEncrypt(password.Text, key);
                SqlCommand sqlcmd2 = new SqlCommand("SpCargoOwnerIns", sqlcon);
                sqlcmd2.CommandType = CommandType.StoredProcedure;
                sqlcmd2.Parameters.AddWithValue("@FirstName", firstname);
                sqlcmd2.Parameters.AddWithValue("@MiddleName", middlename);
                sqlcmd2.Parameters.AddWithValue("@LastName", lastname);
                sqlcmd2.Parameters.AddWithValue("@Mobile", mobile);
                sqlcmd2.Parameters.AddWithValue("@Phone", homephone);
                sqlcmd2.Parameters.AddWithValue("@Email", email);
                sqlcmd2.Parameters.AddWithValue("@Address", address);
                sqlcmd2.Parameters.AddWithValue("@LoginID", ID);
                sqlcmd2.Parameters.AddWithValue("@password", encryptpass);

                sqlcmd2.ExecuteNonQuery();
                sqlcon.Close();
                return "0";



                // ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
                // this.lblMessage.Text = "Your Registration is done successfully. Our team will contact you shotly";
                //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('FiveDot File uploaded successfully'); alert('TwoDot File uploaded successfully');", true);


            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());

            }
            return null;
        }
    }
}