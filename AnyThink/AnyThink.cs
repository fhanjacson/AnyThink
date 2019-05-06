using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace AnyThink
{
    public class AnyThink
    {
        public static string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AnyThink.mdf;Integrated Security=True";

        //string getRand = randStr(new Random().Next(16, 16));

        public static string randStr(int size)
        {
            Random rand = new Random((int)DateTime.Now.Ticks);
            string input = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            return new string(Enumerable.Range(0, size).Select(x => input[rand.Next(0, input.Length)]).ToArray());
        }

        public static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public static String createPost(String username, String content, String dateposted, String point, String category, String profilepicture)
        {
            String PostTemplate = @"
                 <div class=""container"">
                    <div class=""row"">
                        <div class=""col"">
                            <div class=""media my-3"">
                                <img src = ""../Assets/Images/Profile_Picture/250px/" + profilepicture + @".png"" class=""align-self-end m-2"" alt=""profile picture"" style=""width:100px;height:100px""/>
                                <div class=""media-body"" >
                                    <section class=""message-left"" >
                                        <div class=""nes-balloon from-left w-100"" >
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
                        <small class=""col small"">By: " + username + " | Category: " + category + " | Date: " + dateposted + @"</small>
                    </div>
                    <hr>
                </div>
            ";
            return PostTemplate;
            //< small class=""col small"">Point: " + point + " | By: " + username + " | Category: " + category + " | Date: " + dateposted + @"</small>
            //< div class=""col point text-center""><small>" + point + @" Points</small></div>
            //        <div class=""col text-truncate username text-center"" ><small>Posted by: <a href = "" / profile / " + username + @""" class=""text-decoration-none"">" + username + @"</a></small></div>
            //        <div class=""col post-category text-center""><small>Category: " + category + @"</small></div> 
            //        <div class=""col dateposted text-center""><small>" + dateposted + @"</small></div>

        }

        internal static string createBox(string postid, string content, string category, string date_posted)
        {
            string box = @"
<section class=""nes-container"">
<span class=""nes-text"">" + content + @"</span>
<button type=""button"" class=""nes-btn is-primary buttonBottomRight editButton"" data-postid=""" + postid + @""" onclick="""">Edit</button>
</section>
<small class=""col small"">Category: " + category + " | Date: " + date_posted + @"</small><hr>";

            return box;
        }
    }
}