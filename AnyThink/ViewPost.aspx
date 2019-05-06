<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPost.aspx.cs" Inherits="AnyThink.ViewPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Post - AnyThink</title>
    <link href="Assets/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Style_Sheets/AnyThink.css" rel="stylesheet" />
    <link href="Assets/Vendor/NES/nes.css" rel="stylesheet" />
    <style>
        #mainContainer {
            padding-top: 5rem;
        }
        .buttonBottomRight {
            position: absolute;
            font-size: 12px;
            bottom: 0px;
            right: -4px;
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
            <div class="col-auto"><button class="btn btn-block btn-success" onclick="window.location = 'Profile.aspx';">View & Edit your profile</button></div>
            <div class="col"></div>
        </div>
        <div class="row mt-5">
            <div class="col"></div>
            <div class="col-8">
                <div id="PostContainer" runat="server">

                </div>
            </div>
            <div class="col"></div>
        </div>

    </div>

    
    <script src="../Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="../Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //function editPost(button) {
        //    var postid = $(event.relatedtarget).data('postid');
        //    console.log("postid: " + postid);
        //}

        $(document).ready(function() {
            $(".editButton").on('click', function(event) {
                var postid = $(event.target).data('postid');
                console.log("Post ID: " + postid);
                var url = "EditPost.aspx?postid=" + postid;
                window.open(url , '_blank');
            });
        });
    </script>
</body>
</html>
