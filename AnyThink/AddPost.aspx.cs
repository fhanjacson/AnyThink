using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class addPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FullNameNavBar.Text = "Guest";
            ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"SignIn.aspx\">Sign In</a><a class=\"dropdown-item\" href=\"SignUp.aspx\">Sign Up</a>";
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {

                if (Session["loggedin"].ToString() == "yes")
                {
                    FullNameNavBar.Text = Session["full_name"].ToString();
                    ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"Profile.aspx\">Profile</a><a class=\"dropdown-item\" href=\"AddPost.aspx\">Create New Post</a><a class=\"dropdown-item\" href=\"SignOut.aspx\">Sign Out</a>";
                }
            }
            else
            {
                Response.Redirect("SignedIn.aspx");

            }



        }

        protected void ButtonPost_Click(object sender, EventArgs e)
        {
            string textPost = Content.InnerText;
            string postCategory = Category.Value.ToString();
            string userid = Session["userid"].ToString();

            if (textPost != "")
            {
                using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                {
                    var query = "INSERT INTO Post (User_ID, Content, Point, Date_Posted, Status_ID, Category) VALUES (@UserID, @Content, @Point, GETDATE(), @Status, @Category)";
                    using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                    {

                        sqlCommand.Parameters.AddWithValue("@UserID", userid);
                        sqlCommand.Parameters.AddWithValue("@Content", textPost);
                        sqlCommand.Parameters.AddWithValue("@Point", 0);
                        //sqlCommand.Parameters.AddWithValue("@DatePosted", );
                        sqlCommand.Parameters.AddWithValue("@Status", 1);
                        sqlCommand.Parameters.AddWithValue("@Category", postCategory);
                        dbConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        dbConnection.Close();
                        Response.Redirect("SignedIn.aspx");
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