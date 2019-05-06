using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class ViewPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userid = "1";
            FullNameNavBar.Text = "Guest";
            ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"SignIn.aspx\">Sign In</a><a class=\"dropdown-item\" href=\"SignUp.aspx\">Sign Up</a>";
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                string userid = Session["userid"].ToString();
                if (Session["loggedin"].ToString() == "yes")
                {

                    using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                    {
                        using (SqlCommand sqlCommand = new SqlCommand("SELECT Post.Post_ID, Post.Content, Post.Date_Posted, Post.Point, Post.Category FROM Post inner join Users on Post.User_ID = Users.User_ID where Users.User_ID = '" + userid + "' and Post.Status_ID = 1 order by Post.Date_Posted desc", dbConnection))
                        {
                            dbConnection.Open();
                            using (SqlDataReader reader = sqlCommand.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    string postid = reader["Post_ID"].ToString();
                                    string content = reader["Content"].ToString();
                                    string point = reader["Point"].ToString();
                                    string date_posted = reader["Date_Posted"].ToString();
                                    string category = reader["Category"].ToString();
                                    PostContainer.InnerHtml += AnyThink.createBox(postid, content, category, date_posted);
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
}