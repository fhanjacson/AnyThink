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

        SqlConnection dbConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AnyThink.mdf;Integrated Security=True");

        String createPost(String username, String content, String dateposted, String point)
        {
            String PostTemplate = @"
                 <div class=""container"">
                    <div class=""row"">
                        <div class=""col"">
                            <div class=""media my-3"">
                                <img src = ""Assets/Images/Profile_Picture/100px/profile1.jpg"" class=""align-self-end m-2"" alt=""profile picture"" />
                                <div class=""media-body"" >
                                    <section class=""message-left"" >
                                        <div class=""nes-balloon from-left"" >
                                            <p class=""text-break post-content"" >"
                                                + content +
                                            @"</p>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=""row"">
                        <div class=""col point text-center""><small>" + point + @" Points</small></div>
                        <div class=""col text-truncate username text-center"" ><small>Posted by: <a href=""/profile/" + username + @""" class=""text-decoration-none"">" + username + @"</a></small></div>
                        <div class=""col post-category text-center""><small>Category: " + "General" + @"</small></div> 
                        <div class=""col dateposted text-center""><small>" + dateposted + @"</small></div>
                    </div>
                    <hr>
                </div>
            ";
            return PostTemplate;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (dbConnection.State == System.Data.ConnectionState.Open)
            {
                dbConnection.Close();
            }
            dbConnection.Open();
            SqlCommand sqlCmd = dbConnection.CreateCommand();
            sqlCmd.CommandType = System.Data.CommandType.Text;
            sqlCmd.CommandText = "SELECT Users.Username, Post.Content, Post.Point, Post.Date_Posted FROM Post inner join Users on Post.User_ID = Users.User_ID where Post.Status_ID = 1 order by Post.Date_Posted desc";
            SqlDataReader reader = sqlCmd.ExecuteReader();

            

            while (reader.Read())
            {   
                //String post_ID = reader.GetValue(0).ToString();
                String username = reader.GetValue(0).ToString();
                String content = reader.GetValue(1).ToString();
                String point = reader.GetValue(2).ToString();
                String date_posted = reader.GetValue(3).ToString();
                //String status = reader.GetValue(5).ToString();
                postContainer.InnerHtml += createPost(username, content, date_posted, point);
            }
            dbConnection.Close();


        }
    }
}