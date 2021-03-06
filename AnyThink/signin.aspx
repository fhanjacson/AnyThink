﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="AnyThink.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In - Anythink</title>
    <link href="Assets/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Style_Sheets/AnyThink.css" rel="stylesheet" />
    <link href="Assets/Vendor/NES/nes.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand pl-5" href="index.aspx">AnyThink</a>

        <div class="navbar-collapse justify-content-end collapse" id="navbarsExample08" style="">
            <ul class="navbar-nav pr-5">
                <li class="nav-item active">
                    <a class="nav-link" href="index.aspx">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="ProfileDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Guest</a>
                    <div class="dropdown-menu" aria-labelledby="ProfileDropDown" id="ProfileDropDownMenu">
                        <a class="dropdown-item" href="SignIn.aspx">Sign In</a>
                        <a class="dropdown-item" href="SignUp.aspx">Sign Up</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5 py-5">

        <div class="row mt-5">
            <div class="col"></div>
            <div class="col-8">
                <form id="SignInForm" runat="server">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="SignInUsername" runat="server" cssClass="form-control" placeholder="Username" required="required" AutoComplete="username"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="SignInPassword" runat="server" TextMode="Password" cssClass="form-control" placeholder="Password" required="required" AutoComplete="current-password"></asp:TextBox>
                        <div class="text-right my-2"><a class="text-decoration-none" href="ForgotPassword.aspx">Forgot Password</a></div>
                    </div>
                    <asp:Label ID="label_error" runat="server"></asp:Label>
                    <br />
                    <div class="form-group">
                        <asp:Button ID="SignInButton" runat="server" class="btn-block btn-md" Text="Sign In" OnClick="SignInButton_Click" />
                    </div>
                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>

