﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AnyThink.index" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>AnyThink</title>
    <link href="Assets/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Style_Sheets/AnyThink.css" rel="stylesheet" />
    <link href="Assets/Vendor/NES/nes.css" rel="stylesheet" />
    <style>
        #mainContainer {
            padding-top: 5rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#MainNavBar" aria-controls="MainNavBar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand pl-5" href="index.aspx">AnyThink</a>

        <div class="navbar-collapse justify-content-end collapse" id="MainNavBar" style="">
            <ul class="navbar-nav pr-5">
                <li class="nav-item active">
                    <a class="nav-link" href="index.aspx">Home </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="ProfileDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <asp:Literal ID="FullNameNavBar" runat="server"></asp:Literal></a>
                    <div class="dropdown-menu" aria-labelledby="ProfileDropDown" runat="server" id="ProfileDropDownMenu">
                        <a class="dropdown-item" href="SignIn.aspx">Sign In</a>
                        <a class="dropdown-item" href="SignUp.aspx">Sign Up</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div id="mainContainer" class="container">
        <div class="row">
            <div class="col-2 d-none d-lg-block" id="Category">
                <p>Sort by</p>
                <nav class="nav flex-column">
                    <a class="nav-link" href="/Post/New.aspx">Newest</a>
                    <a class="nav-link" href="/Post/Top.aspx">Top</a>
                </nav>
                <br />
                <p>Category</p>
                <nav class="nav flex-column">
                    <a class="nav-link" href="/Post/Funny.aspx">Funny</a>
                    <a class="nav-link" href="/Post/Game.aspx">Game</a>
                    <a class="nav-link" href="/Post/Music.aspx">Music</a>
                    <a class="nav-link" href="/Post/Rant.aspx">Rant</a>
                    <a class="nav-link" href="/Post/Confess.aspx">Confess</a>
                </nav>
            </div>
            <div class="col" id="Post">
                    <div ID="postContainer" runat="server">

                    </div>
            </div>
        </div>
    </div>

    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>

