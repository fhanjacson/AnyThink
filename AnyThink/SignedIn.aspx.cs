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
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                
                if (Session["loggedin"].ToString() == "yes")
                {
                    FullNameNavBar.Text = Session["full_name"].ToString();
                }
            }
        }
    }
}