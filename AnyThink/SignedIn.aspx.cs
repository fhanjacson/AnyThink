using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class SignedIn : System.Web.UI.Page
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
                    Message.Text = "You've already Signed In. <a href=\"SignOut.aspx\">Sign Out Instead?</a>";
                    ProfileDropDownMenu.InnerHtml = "<a class=\"dropdown-item\" href=\"Profile.aspx\">Profile</a><a class=\"dropdown-item\" href=\"AddPost.aspx\">Create New Post</a><a class=\"dropdown-item\" href=\"SignOut.aspx\">Sign Out</a>";

                }
            }
            else
            {
                Message.Text = "You're not Signed In. <a href=\"SignIn.aspx\">Sign In Here</a>";

            }
        }
    }
}