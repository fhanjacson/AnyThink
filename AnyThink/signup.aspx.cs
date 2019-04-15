using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class signup : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            //label_error.Text = AnyThink.randStr(32) + "|" + AnyThink.randStr(16);
            label_error.Visible = false;
            

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            int lastInsertID = -1;
            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Users where Username = '" + SignUpUsername.Text + "'", dbConnection))
                {
                    dbConnection.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();
                        if (reader.HasRows)
                        {
                            label_error.Text = "Username is taken";
                            label_error.Visible = true;
                            Console.WriteLine("Username Exists");
                        }
                        else
                        {
                            dbConnection.Close();
                            var query = "INSERT INTO Users (Username, Password_Hashed, Password_Salt, Permission_ID, Email, Full_Name, Profile_Picture, Status_ID) VALUES (@Username, @PasswordHashed, @PasswordSalt, @PermissionID, @Email, @FullName, @ProfilePicture, @StatusID)";
                            using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                            {
                                string textPassword = SignUpPassword.Text;
                                string saltPassword = AnyThink.randStr(16);
                                string hashPassword = AnyThink.ComputeSha256Hash(textPassword + saltPassword);

                                sqlCommand.Parameters.AddWithValue("@Username", SignUpUsername.Text.ToLower());
                                sqlCommand.Parameters.AddWithValue("@PasswordHashed", hashPassword);
                                sqlCommand.Parameters.AddWithValue("@PasswordSalt", saltPassword);
                                sqlCommand.Parameters.AddWithValue("@PermissionID", 3);
                                sqlCommand.Parameters.AddWithValue("@Email", SignUpEmail.Text);
                                sqlCommand.Parameters.AddWithValue("@FullName", SignUpFullName.Text);
                                sqlCommand.Parameters.AddWithValue("@ProfilePicture", "profile1");
                                sqlCommand.Parameters.AddWithValue("@StatusID", 1);
                                dbConnection.Open();
                                sqlCommand.ExecuteNonQuery();
                                dbConnection.Close();
                            }

                            query = "Select TOP(1) User_ID from Users Order by 1 desc";
                            using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                            {
                                dbConnection.Open();
                                using (SqlDataReader readerr = cmd.ExecuteReader())
                                {
                                    readerr.Read();
                                    if (readerr.HasRows)
                                    {
                                        lastInsertID = (int)readerr[0];
                                    }
                                }
                                dbConnection.Close();
                            }


                            query = "INSERT INTO Token (Token_Hashed, Token_Salt, User_ID, Date_Created, Date_Expired, Status_ID) VALUES (@TokenHashed, @TokenSalt, @UserID, @DateCreated, @DateExpired, @StatusID)";
                            using (SqlCommand sqlCommand = new SqlCommand(query, dbConnection))
                            {
                                string textToken = AnyThink.randStr(32);
                                string saltToken = AnyThink.randStr(16);
                                string hashToken = AnyThink.ComputeSha256Hash(textToken + saltToken);
                                DateTime TokenDateCreated = DateTime.Now;
                                DateTime TokenDateExpired = TokenDateCreated.AddDays(1);
                                                                
                                sqlCommand.Parameters.AddWithValue("@TokenHashed", hashToken);
                                sqlCommand.Parameters.AddWithValue("@TokenSalt", saltToken);
                                sqlCommand.Parameters.AddWithValue("@UserID", lastInsertID);
                                sqlCommand.Parameters.AddWithValue("@DateCreated", TokenDateCreated);
                                sqlCommand.Parameters.AddWithValue("@DateExpired", TokenDateExpired);
                                sqlCommand.Parameters.AddWithValue("@StatusID", 1);
                                dbConnection.Open();
                                sqlCommand.ExecuteNonQuery();
                                dbConnection.Close();

                                var message = new MimeMessage();
                                message.From.Add(new MailboxAddress("AnyThink", "noreply@anythink.com"));
                                message.To.Add(new MailboxAddress(SignUpFullName.Text, SignUpEmail.Text));
                                message.Subject = "AnyThink - Verify Your Account";
                                message.Body = new TextPart("plain")
                                {
                                    Text = @"Hey " + SignUpFullName.Text + @",
Welcome to AnyThink. Click the link below to verify your AnyThink Account!" + @"
" + @"
" + textToken };

                                using (var mailclient = new SmtpClient())
                                {
                                    mailclient.Connect("smtp.gmail.com", 587);


                                    // Note: since we don't have an OAuth2 token, disable
                                    // the XOAUTH2 authentication mechanism.
                                    mailclient.AuthenticationMechanisms.Remove("XOAUTH2");

                                    // Note: only needed if the SMTP server requires authentication
                                    mailclient.Authenticate("noreply.anythink@gmail.com", "&tqv$Rp0toUr3ao!sYv5");

                                    mailclient.Send(message);
                                    mailclient.Disconnect(true);
                                    label_error.Text = "Account is registered sucessfully! Check your email";
                                    label_error.Visible = true;
                                }

                            }
                        }
                        reader.Close();
                        dbConnection.Close();
                    }
                }
            }
        }
    }
}