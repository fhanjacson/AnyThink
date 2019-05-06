using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AnyThink
{
    public partial class index : System.Web.UI.Page
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

            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand("SELECT Users.Username, Post.Content, Post.Point, Post.Date_Posted, Post.Category, Users.Profile_Picture FROM Post inner join Users on Post.User_ID = Users.User_ID where Post.Status_ID = 1 order by Post.Date_Posted desc", dbConnection))
                {
                    dbConnection.Open();
                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            String username = reader["Username"].ToString();
                            String content = reader["Content"].ToString();
                            String point = reader["Point"].ToString();
                            String date_posted = reader["Date_Posted"].ToString();
                            String category = reader["Category"].ToString();
                            String profilepicture = reader["Profile_Picture"].ToString();
                            //String status = reader.GetValue(5).ToString();
                            postContainer.InnerHtml += AnyThink.createPost(username, content, date_posted, point, category, profilepicture);
                        }
                        dbConnection.Close();

                    }
                }
            }
        }
    }
}
