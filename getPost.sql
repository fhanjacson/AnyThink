﻿SELECT Users.Username, Post.Content, Post.Point, Post.Date_Posted FROM Post inner join Users on Post.User_ID = Users.User_ID