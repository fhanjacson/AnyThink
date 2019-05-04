<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyAccount.aspx.cs" Inherits="AnyThink.verifyaccount" %>

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
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#MainNavBar" aria-controls="MainNavBar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand pl-5" href="#">AnyThink</a>

        <div class="navbar-collapse justify-content-end collapse" id="MainNavBar" style="">
            <ul class="navbar-nav pr-5">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
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

        <div class="row">
            <div class="col"></div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header">
                        Quote
                    </div>
                    <div class="card-body">
                        <blockquote class="blockquote mb-0">
                            <p><asp:Label ID="label_info" runat="server" Text="Label"></asp:Label></p>
                            <div class="my-2"><a href="index.aspx" class="btn btn-primary">Back to Home Page</a></div>
                            <footer class="blockquote-footer">AnyThink 2019</footer>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>


