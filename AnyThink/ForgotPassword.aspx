<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AnyThink.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password - AnyThink</title>
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
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Guest</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown08">
                        <a class="dropdown-item" href="SignIn.aspx">Sign In</a>
                        <a class="dropdown-item" href="SignUp.aspx">Sign Up</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5 py-5">
        <div class="row">
            <div class="col"></div>
            <div class="col">
        <form id="ForgotPasswordForm" runat="server">
            <div class="form-group">
                <label>Username</label>
                <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Username" required="required" AutoComplete="username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="Email" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email" required="required" AutoComplete="email"></asp:TextBox>
            </div>
            <asp:Label ID="label_error" runat="server"></asp:Label>
            <br />
            <div class="form-group">
                <asp:Button ID="ForgotPasswordButton" runat="server" Cssclass="btn-block btn-md" Text="Reset Password" OnClick="ForgotPasswordButton_Click" />
            </div>
        </form></div>
            <div class="col"></div>
            </div>
    </div>

    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>
