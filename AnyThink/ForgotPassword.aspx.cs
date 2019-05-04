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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ForgotPasswordButton_Click(object sender, EventArgs e)
        {
            string formUsername = Username.Text.ToLower();
            string formEmail = Email.Text.ToLower();
            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand("Select User_ID, Username, Email, Full_Name from Users where Username = '" + formUsername + "' and Email = '" + formEmail + "' and Status_ID = 1", dbConnection))
                {
                    dbConnection.Open();
                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {

                        if (reader.HasRows)
                        {
                            reader.Read();
                            string dbUserID = reader["User_ID"].ToString();
                            string dbUsername = reader["Username"].ToString();
                            string dbEmail = reader["Email"].ToString();
                            string dbFullName = reader["Full_Name"].ToString();
                            dbConnection.Close();
                            string query = "INSERT INTO Token (Token_Hashed, Token_Salt, User_ID, Date_Created, Date_Expired, Status_ID, Service_Type) VALUES (@TokenHashed, @TokenSalt, @UserID, @DateCreated, @DateExpired, @StatusID, @ServiceType)";
                            using (SqlCommand sqlCommand2 = new SqlCommand(query, dbConnection))
                            {
                                string textToken = AnyThink.randStr(32);
                                string saltToken = AnyThink.randStr(16);
                                string hashToken = AnyThink.ComputeSha256Hash(textToken + saltToken);
                                DateTime TokenDateCreated = DateTime.Now;
                                DateTime TokenDateExpired = TokenDateCreated.AddDays(1);

                                sqlCommand2.Parameters.AddWithValue("@TokenHashed", hashToken);
                                sqlCommand2.Parameters.AddWithValue("@TokenSalt", saltToken);
                                sqlCommand2.Parameters.AddWithValue("@UserID", dbUserID);
                                sqlCommand2.Parameters.AddWithValue("@DateCreated", TokenDateCreated);
                                sqlCommand2.Parameters.AddWithValue("@DateExpired", TokenDateExpired);
                                sqlCommand2.Parameters.AddWithValue("@StatusID", 1);
                                sqlCommand2.Parameters.AddWithValue("@ServiceType", "ResetPassword");

                                dbConnection.Open();
                                sqlCommand2.ExecuteNonQuery();
                                dbConnection.Close();

                                var message = new MimeMessage();
                                message.From.Add(new MailboxAddress("AnyThink", "noreply@anythink.com"));
                                message.To.Add(new MailboxAddress(dbFullName, formEmail));
                                message.Subject = "AnyThink - Reset Password Request";
                                message.Body = new TextPart("plain")
                                {
                                    Text = @"Dear " + dbFullName + @",
If you have previously requested to change your password, only the link contained in this e-mail is valid. Click the link below to reset your AnyThink Account Password!" + @"
" + @"
[AnyThink]/ResetPassword.aspx?username=" + dbUsername + "&token=" + textToken
                                };

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
                                    label_error.Text = "Password Reset Link has been Sent! Check your email!";
                                    label_error.Visible = true;
                                }
                            }
                        } else
                        {
                            label_error.Text = "No Account Associated with the username and email";
                        }
                    }
                }
            }
        }
    }
}