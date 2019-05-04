<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="AnyThink.signup" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Anythink</title>
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

        <div class="row mt-5">
            <div class="col"></div>
            <div class="col-auto">
                <form id="SignUpForm" runat="server">
                    <div class="form-group">
                        <label>Full Name</label>
                        <asp:TextBox ID="SignUpFullName" runat="server" cssClass="form-control" placeholder="Full Name" required="required" AutoComplete="name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="SignUpUsername" runat="server" cssClass="form-control" placeholder="Username" required="required" AutoComplete="username"></asp:TextBox>
                        <small id="SignUpUsernameHelp" class="form-text text-muted">6-20 character of a-z and 0-9</small>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="SignUpEmail" runat="server" TextMode="Email" cssClass="form-control" placeholder="Email" required="required" AutoComplete="email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="SignUpPassword" runat="server" TextMode="Password" cssClass="form-control" placeholder="Password" required="required" AutoComplete="new-password"></asp:TextBox>
                        <small id="SignUpPasswordHelp" class="form-text text-muted">8-20 characters and at least a number</small>

                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="SignUpConfirmPassword" runat="server" TextMode="Password" cssClass="form-control" placeholder="Confirm Password" required="required" AutoComplete="new-password"></asp:TextBox>
                        
                    </div>
                    
                    <div class="form-group">
                        <asp:Button ID="SignUpButton" runat="server" class="btn-block btn-md" Text="Sign Up" OnClick="SignUpButton_Click" />
                    </div>
                    <asp:Label ID="label_error" runat="server"></asp:Label>
                    <asp:RegularExpressionValidator ID="UsernameRegularExpressionValidator" runat="server" CssClass="text-danger small" ErrorMessage="Username doesn't meet the requirement" ControlToValidate="SignUpUsername" ValidationExpression="^[a-zA-Z0-9_-]{3,20}$"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" runat="server" CssClass="text-danger small" ErrorMessage="Password doesn't meet the requirement" ControlToValidate="SignUpPassword" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z])(?!.*\s).{8,20}$"></asp:RegularExpressionValidator>
                        <br />
                        <asp:CompareValidator ID="confirmPassworCompare" runat="server" ErrorMessage="Password does not match!" CssClass="text-danger small" ControlToCompare="SignUpPassword" Display="Dynamic" SetFocusOnError="True" ControlToValidate="SignUpConfirmPassword"></asp:CompareValidator>
                </form>
            </div>
            <div class="col"></div>
            
        </div>
    </div>
    <script src="Assets/Vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="Assets/Vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
</body>
</html>
