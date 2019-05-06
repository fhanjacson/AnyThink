using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class EditPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
                {
                    string userid = Session["userid"].ToString();
                    if (Session["loggedin"].ToString() == "yes")
                    {
                        if (Request.QueryString["postid"] != null)
                        {
                            FullNameNavBar.Text = Session["full_name"].ToString();
                            string postid = Request.QueryString["postid"];
                            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                            {
                                using (SqlCommand sqlCommand = new SqlCommand("SELECT TOP 1 Post.Post_ID, Post.Content, Post.Date_Posted, Post.Point, Post.Category FROM Post inner join Users on Post.User_ID = Users.User_ID where Users.User_ID = '" + userid + "' and Post.Status_ID = 1 and Post.Post_ID = '" + postid + "' order by Post.Date_Posted desc", dbConnection))
                                {
                                    dbConnection.Open();
                                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                                    {
                                        while (reader.Read())
                                        {
                                            string content = reader["Content"].ToString();
                                            string point = reader["Point"].ToString();
                                            string date_posted = reader["Date_Posted"].ToString();
                                            string category = reader["Category"].ToString();

                                            Content.InnerText = content;
                                            Category.Value = category;

                                        }
                                        dbConnection.Close();

                                    }
                                }
                            }
                        }
                        else
                        {
                            Response.Redirect("Notice.aspx?head=No%20Post%20ID%20Provided&body=Open%20this%20page%20from%20profile%20page");
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
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                string userid = Session["userid"].ToString();
                if (Session["loggedin"].ToString() == "yes")
                {
                    if (Request.QueryString["postid"] != null)
                    {
                        string postid = Request.QueryString["postid"];
                        if ((Content.Value != null) && (Category.Value != null))
                        {
                            string content = Content.Value.ToString();
                            string category = Category.Value.ToString();

                            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                            {
                                var query = "UPDATE Post set Content = @Content, Category = @Category where Post_ID = @PostID";
                                using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                                {

                                    sqlCommand.Parameters.AddWithValue("@Content", content);
                                    sqlCommand.Parameters.AddWithValue("@Category", category);
                                    sqlCommand.Parameters.AddWithValue("@PostID", postid);
                                    dbConnection.Open();
                                    sqlCommand.ExecuteNonQuery();
                                    dbConnection.Close();
                                    Response.Redirect(Request.RawUrl);
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            if (Session != null && Session["full_name"] != null && Session["loggedin"] != null)
            {
                if (Session["loggedin"].ToString() == "yes")
                {
                    if (Request.QueryString["postid"] != null)
                    {
                        System.Diagnostics.Debug.WriteLine("asd");
                        using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
                        {
                            string postid = Request.QueryString["postid"];
                            var query = "Delete Post where Post_ID = @PostID";
                            using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                            {
                                sqlCommand.Parameters.AddWithValue("@PostID", postid);
                                dbConnection.Open();
                                sqlCommand.ExecuteNonQuery();
                                dbConnection.Close();
                                Response.Redirect("Notice.aspx?head=Post%20Deleted&body=Post%20has%20been%20deleted%20successfully");
                            }
                        }
                    }
                }
            }
        }
    }
}