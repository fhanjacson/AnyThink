<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignedIn.aspx.cs" Inherits="AnyThink.SignedIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signed In - Anythink</title>
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
                    <a class="nav-link dropdown-toggle" href="#" id="ProfileDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><asp:Literal ID="FullNameNavBar" runat="server"></asp:Literal></a>
                    <div class="dropdown-menu" aria-labelledby="ProfileDropDown" id="ProfileDropDownMenu"  runat="server">
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row my-5 py-5">
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
        </div>
        <div class="row my-5 py-5">
            <div class="col"></div>
            <div class="col-auto">
                <asp:Literal ID="Message" runat="server"></asp:Literal></div>
            <div class="col"></div>
        </div>
    </div>
    <script>
        setTimeout(() => {
            window.location = 'index.aspx';
        }, 5000);

    </script>
    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>
