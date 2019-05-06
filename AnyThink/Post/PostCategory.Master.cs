using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink.Post
{
    public partial class PostCategory : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FullNameNavBar.Text = "Guest";
            ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"../SignIn.aspx\">Sign In</a><a class=\"dropdown-item\" href=\"../SignUp.aspx\">Sign Up</a>";
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                if (Session["loggedin"].ToString() == "yes")
                {
                    FullNameNavBar.Text = Session["full_name"].ToString();
                    ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"../Profile.aspx\">Profile</a><a class=\"dropdown-item\" href=\"../AddPost.aspx\">Create New Post</a><a class=\"dropdown-item\" href=\"../SignOut.aspx\">Sign Out</a>";
                }

            }
        }
    }
}