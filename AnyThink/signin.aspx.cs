using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AnyThink
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //label_error.Visible = false;
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                if (Session["loggedin"].ToString() == "yes")
                {
                    Response.Redirect("SignedIn.aspx");
                }
            }
        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            string formUsername = SignInUsername.Text.ToLower();
            string formPassword = SignInPassword.Text;
            string formPasswordHashed = "";
            string dbUsername = "";
            string dbPasswordHashed = "";
            string dbPasswordSalt = "";



            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand("Select * from Users where Username = '" + formUsername + "' and Status_ID = 1", dbConnection))
                {
                    dbConnection.Open();
                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {
                       
                        if (reader.HasRows)
                        {
                            
                            reader.Read();

                            dbUsername = reader["Username"].ToString();
                            dbPasswordHashed = reader["Password_Hashed"].ToString();
                            dbPasswordSalt = reader["Password_Salt"].ToString();

                            formPasswordHashed = AnyThink.ComputeSha256Hash(formPassword + dbPasswordSalt);

                            if (formUsername.Equals(dbUsername))
                            {
                                if (formPasswordHashed.Equals(dbPasswordHashed))
                                {
                                    label_error.Text = "Login success";
                                    Session["loggedin"] = "yes";
                                    Session["full_name"] = reader["Full_name"];
                                    Response.Redirect("index.aspx");

                                }
                                else
                                {
                                    label_error.Text = "Username or Password incorrect!";
                                }
                            }
                            else
                            {
                                label_error.Text = "Username or Password incorrect!";
                            }

                        }
                        else
                        {
                            label_error.Text = "Account doesnt exist or email not verified";
                            label_error.Visible = true;
                        }
                    }
                }
            }
        }
    }
}