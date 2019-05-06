<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="AnyThink.Notice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AnyThink</title>
    <link href="Assets/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Style_Sheets/AnyThink.css" rel="stylesheet" />
    <link href="Assets/Vendor/NES/nes.css" rel="stylesheet" />
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
                    <a class="nav-link dropdown-toggle mr-3" href="#" id="ProfileDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <asp:Literal ID="FullNameNavBar" runat="server">Guest</asp:Literal></a>
                    <div class="dropdown-menu" aria-labelledby="ProfileDropDown" runat="server" id="ProfileDropDownMenu">
                        <a class="dropdown-item" href="SignIn.aspx">Sign In</a>
                        <a class="dropdown-item" href="SignUp.aspx">Sign Up</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container pt-5 mt-5">
        <div class="row">
            <div class="col"></div>
            <div class="col-auto">
                <div class="card">
                    <div class="card-header">
                        <asp:Literal ID="CardHeader" runat="server">Header</asp:Literal>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><asp:Literal ID="CardBody" runat="server">Body Message</asp:Literal></p>
                        <a href="index.aspx" class="btn btn-primary">Go Home</a>
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
