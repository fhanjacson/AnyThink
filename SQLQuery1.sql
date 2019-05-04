select GETDATE(), Token.Token_ID, Token.Date_Created, Token.Date_Expired from Token where Token.Date_Expired > GETDATE()

Select Token.Token_ID, Token.Token_Hashed, Token.Token_Salt, Users.Username, Token.Date_Created, Token.Date_Expired, Token.Status_ID, Token.Service_Type from Token inner join Users on Token.User_ID = Users.User_ID where Token.Service_type = 'VerifyAccount' and Users.Username = '" + username + "' and Token.Status_ID = 1 and Users.Status_ID = 3 and Token.Date_Expired > GETDATE() order by Token.Token_ID DESC

update Token set Status_ID = 2 where 