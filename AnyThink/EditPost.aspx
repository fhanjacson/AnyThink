<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPost.aspx.cs" Inherits="AnyThink.EditPost" %>

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

    <div id="mainContainer"  class="container">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <form id="EditPostForm" runat="server">
                    <div class="form-group">
                        <label for="Content">Content</label>
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
                    <asp:Button runat="server" class="btn btn-primary btn-block" ID="ButtonSave" Text="Save" OnClick="ButtonSave_Click" />
                    <asp:Button runat="server" class="btn btn-secondary btn-block" ID="ButtonCancel" Text="Cancel" OnClick="ButtonCancel_Click" />
                    <%--<asp:Button runat="server" class="btn btn-danger btn-block" ID="ButtonDelete" Text="Delete" OnClick="ButtonDelete_Click" />--%>
                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <script src="../Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="../Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
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
