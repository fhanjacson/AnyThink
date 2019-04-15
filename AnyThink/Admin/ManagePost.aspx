<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePost.aspx.cs" Inherits="AnyThink.Admin.ManagePost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Search Post
            <table>
               <tr>
                   <td>
                       Post ID : 
                   </td>
                   <td>
                       <asp:TextBox ID="searchpostid" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Button ID="search_button" runat="server" Text="Search" OnClick="search_button_click"/>
                   </td>
               </tr>
           </table>
            <br />
            <asp:Panel runat="server" ID="panel1">
           

            
            <br />
            <table>
                <tr>
                    <td>
                        Post ID :
                    </td>
                    <td>
                        <asp:TextBox ID="post_id" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        User ID :
                    </td>
                    <td>
                        <asp:TextBox ID="user_id" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Content :
                    </td>
                    <td>
                        <asp:TextBox ID="content" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Point :
                    </td>
                    <td>
                        <asp:TextBox ID="point" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Posted : 
                    </td>
                    <td>
                        <asp:TextBox ID="date_posted" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status :
                    </td>
                    <td>
                        <asp:TextBox ID="status" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Category :
                    </td>
                    <td>
                        <asp:TextBox ID="category" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="update_button" runat="server" Text="Update" OnClick="update_button_Click" />
                    </td>
                    <td>
                        <asp:Button ID="delete_button" runat="server" Text="Delete" />
                    </td>
                </tr>
            </table>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
