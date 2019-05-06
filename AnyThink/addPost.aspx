<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="AnyThink.addPost" %>

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
                        <asp:Literal ID="FullNameNavBar" runat="server"></asp:Literal></a>
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
            <div class="col-5">
                <form id="AddPostForm" runat="server">
                    <div class="form-group">
                        <label for="Content">Content</label>
                        <small id="ContentHelp" class="form-text text-muted">No racist & Spam</small>
                        <textarea runat="server" rows="8" class="form-control" id="Content" aria-describedby="Content" placeholder="Post Content" onkeyup="CountCharacter(this)" maxlength="250"></textarea>
                        <small id="PostCharacterCounter" class="form-text text-muted text-right">[250/250]</small>

                    </div>
                    <div class="form-group">
                        <label for="Category">Category</label>
                        <select class="form-control" id="Category" runat="server">
                            <option>General</option>
                            <option>Music</option>
                            <option>Games</option>
                            <option>Rant</option>
                            <option>Confess</option>
                        </select>
                    </div>
                    <asp:Button runat="server" class="btn btn-primary btn-block" ID="ButtonPost" Text="Post" OnClick="ButtonPost_Click" />
                    <asp:Button runat="server" class="btn btn-secondary btn-block" ID="ButtonCancel" Text="Cancel" OnClick="ButtonCancel_Click" />
                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>

    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function CountCharacter(value) {
            var len = value.value.length;
            if (len > 250) {
                val.value = val.value.substring(0, 250);
            } else {
                $('#PostCharacterCounter').text("[" + (250 - len) + "/250]");
            }
        }
    </script>
</body>
</html>
