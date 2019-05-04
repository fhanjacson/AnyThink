<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="AnyThink.resetpassword" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password - Anythink</title>
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
                <form id="ResetPasswordForm" runat="server">
                    <div class="form-group">
                        <label>New Password</label>
                        <asp:TextBox ID="InputPassword" runat="server" TextMode="Password" cssClass="form-control" placeholder="Password" required="required" AutoComplete="new-password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="InputConfirmPassword" runat="server" TextMode="Password" cssClass="form-control" placeholder="Confirm Password" required="required" AutoComplete="new-password"></asp:TextBox>
                    </div>
                    <asp:Label ID="label_error" runat="server" CssClass="small"></asp:Label>
                    <br />
                    <div class="form-group mt-1">
                        <asp:Button ID="ResetPasswordButton" runat="server" class="btn-block btn-md" Text="Reset Password" OnClick="ResetPasswordButton_Click" />
                    </div>
                    <br />
                    <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" runat="server" CssClass="text-danger small" ErrorMessage="Password doesn't meet the requirement (8-20 characters and at least a number)" ControlToValidate="InputPassword" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z])(?!.*\s).{8,20}$"></asp:RegularExpressionValidator>
                    <br />
                    <asp:CompareValidator ID="PasswordCompareValidator" CssClass="text-danger small" runat="server" ErrorMessage="Password does not match!" ControlToValidate="InputConfirmPassword" ControlToCompare="InputPassword"></asp:CompareValidator>


                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>

