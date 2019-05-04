using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnyThink
{
    public partial class verifyaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_info.Text = "Processing . . .";
            string servicetype = "VerifyAccount";
            string username = "";
            string token = "";

            string dbTokenID, dbTokenHashed, dbTokenSalt, dbUserID, dbUsername, dbTokenStatusID, dbTokenServiceType = "";
            DateTime dbTokenDateCreated, dbTokenDateExpired;


            if (Request.QueryString["username"] != null)
            {
                username = Request.QueryString["username"];
            }
            if (Request.QueryString["token"] != null)
            {
                token = Request.QueryString["token"];
            }

            using (SqlConnection dbConnection = new SqlConnection(AnyThink.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand("Select Token.Token_ID, Token.Token_Hashed, Token.Token_Salt, Token.User_ID, Users.Username, Token.Date_Created, Token.Date_Expired, Token.Status_ID, Token.Service_Type from Token inner join Users on Token.User_ID = Users.User_ID where Token.Service_type = '" + servicetype + "' and Users.Username = '" + username + "' and Token.Status_ID = 1 and Users.Status_ID = 3 and Token.Date_Expired > GETDATE() order by Token.Token_ID DESC", dbConnection))
                {
                    dbConnection.Open();
                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {

                            
                            reader.Read();
                            dbTokenID = reader["Token_ID"].ToString();
                            dbTokenHashed = reader["Token_Hashed"].ToString();
                            dbTokenSalt = reader["Token_Salt"].ToString();
                            dbUserID = reader["User_ID"].ToString();
                            dbUsername = reader["Username"].ToString();
                            dbTokenDateCreated = Convert.ToDateTime(reader["Date_Created"].ToString());
                            dbTokenDateExpired = Convert.ToDateTime(reader["Date_Expired"].ToString());
                            dbTokenStatusID = reader["Status_ID"].ToString();
                            dbTokenServiceType = reader["Service_Type"].ToString();
                            reader.Close();
                            dbConnection.Close();
                            string hashToken = AnyThink.ComputeSha256Hash(token + dbTokenSalt);
                            if (hashToken == dbTokenHashed)
                            {
                                label_info.Text = "Token Valid";
                                using (SqlCommand sqlCommand2 = new SqlCommand("update Token set Status_ID = 2 where Token_ID = @TokenID", dbConnection))
                                {
                                    sqlCommand2.Parameters.AddWithValue("@TokenID", dbTokenID);
                                    dbConnection.Open();
                                    sqlCommand2.ExecuteNonQuery();
                                    dbConnection.Close();

                                    using (SqlCommand sqlCommand3 = new SqlCommand("update Users set Status_ID = 1 where User_ID = @UserID", dbConnection))
                                    {
                                        sqlCommand3.Parameters.AddWithValue("@UserID", dbUserID);
                                        dbConnection.Open();
                                        sqlCommand3.ExecuteNonQuery();
                                        dbConnection.Close();
                                        label_info.Text = "Email Account successfully verified";
                                    }
                                }

                            } else
                            {
                                label_info.Text = "Token is Invalid!";
                            }



                        }
                        else
                        {
                            label_info.Text = "No Token Found";
                        }

                    }
                }



            }
        }
    }
}