<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AnyThink.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile - AnyThink</title>

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
                    <a class="nav-link dropdown-toggle" href="#" id="profiledropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <asp:Literal ID="FullNameNavBar" runat="server">Guest</asp:Literal></a>
                    <div class="dropdown-menu" aria-labelledby="profiledropdown" runat="server" id="ProfileDropDownMenu">
                        <a class="dropdown-item" href="signin.aspx">Sign In</a>
                        <a class="dropdown-item" href="signup.aspx">Sign Up</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div id="mainContainer" class="container">
        <div class="row">
            <div class="col"></div>
            <div class="col-auto"><button class="btn btn-block btn-success" onclick="window.location = 'ViewPost.aspx';">View & Edit post(s) by you</button></div>
            <div class="col"></div>
        </div>
        <div class="row mt-5">
            <div class="col"></div>
            <div class="col-auto">
                <asp:Literal ID="ProfilePictureDisplay" runat="server"></asp:Literal>
                <br />
                <p class="text-center"><asp:Literal ID="FullNameDisplay" runat="server">Full Name</asp:Literal></p>
                <br />
                <p class="text-center"><asp:Literal ID="EmailDisplay" runat="server">Email Address</asp:Literal></p>
            </div>
            <div class="col-auto">
                <form id="UpdateProfileForm" runat="server">
                    <div class="form-group">
                        <label for="ProfilePictureSelect">Profile Picture</label>
                        <select class="form-control" runat="server" id="ProfilePictureSelect">
                            <option>avatar1</option>
                            <option>avatar2</option>
                            <option>avatar3</option>
                            <option>avatar4</option>
                            <option>avatar5</option>
                        </select>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="FullName">Full Name</label>
                        <input type="text" runat="server" class="form-control" id="FullName" aria-describedby="FullName" placeholder="Full Name" />
                    </div>
                    <br />
                    <asp:Button runat="server" class="btn btn-primary btn-block" ID="ButtonSave" Text="Save" OnClick="ButtonSave_Click" />
                    <asp:Button runat="server" class="btn btn-secondary btn-block" ID="ButtonCancel" Text="Cancel" OnClick="ButtonCancel_Click" />

                </form>
            </div>
            <div class="col"></div>
        </div>

    </div>

    <script src="../Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="../Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>
