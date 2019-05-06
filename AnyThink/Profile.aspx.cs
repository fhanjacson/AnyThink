using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                FullNameNavBar.Text = "Guest";
                ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"SignIn.aspx\">Sign In</a><a class=\"dropdown-item\" href=\"SignUp.aspx\">Sign Up</a>";
                if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
                {
                    string userid = Session["userid"].ToString();
                    if (Session["loggedin"].ToString() == "yes")
                    {
                        FullNameNavBar.Text = Session["full_name"].ToString();
                        ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"Profile.aspx\">Profile</a><a class=\"dropdown-item\" href=\"AddPost.aspx\">Create New Post</a><a class=\"dropdown-item\" href=\"SignOut.aspx\">Sign Out</a>";
                        string profilepicture = "";
                        string fullname = "";
                        string email = "";
                        using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                        {
                            using (SqlCommand sqlCommand = new SqlCommand("SELECT TOP 1 Full_Name, Profile_Picture, Email FROM Users where User_ID = '" + userid + "'", dbConnection))
                            {
                                dbConnection.Open();
                                using (SqlDataReader reader = sqlCommand.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        fullname = reader["Full_Name"].ToString();
                                        profilepicture = reader["Profile_Picture"].ToString();
                                        email = reader["Email"].ToString();
                                        ProfilePictureDisplay.Text = "<img src=\"../Assets/Images/Profile_Picture/250px/" + profilepicture + ".png\" alt=\"profile picture\" style=\"margin - left: auto; margin - right: auto; display: block;\"/>";
                                        FullNameDisplay.Text = fullname;
                                        FullName.Value = fullname;
                                        ProfilePictureSelect.Value = profilepicture;
                                        EmailDisplay.Text = email;
                                    }
                                    dbConnection.Close();
                                }
                            }
                        }


                    }
                }
                else
                {
                    Response.Redirect("SignedIn.aspx");
                }
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            if ((ProfilePictureSelect.Value != null) && (FullName.Value != null))
            {
                string profilepicture = ProfilePictureSelect.Value.ToString();
                string fullname = FullName.Value.ToString();

                using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                {
                    var query = "UPDATE Users set Profile_Picture = @ProfilePicture, Full_Name = @FullName where User_ID = @UserID";
                    using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                    {
                        System.Diagnostics.Debug.WriteLine("Profile pic: " + profilepicture);
                        System.Diagnostics.Debug.WriteLine("Full Name: " + fullname);
                        System.Diagnostics.Debug.WriteLine("User ID: " + Session["userid"].ToString());

                        sqlCommand.Parameters.AddWithValue("@ProfilePicture", profilepicture);
                        sqlCommand.Parameters.AddWithValue("@FullName", fullname);
                        sqlCommand.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        dbConnection.Close();
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }



        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}