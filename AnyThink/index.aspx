<%@ Page Title="" Language="C#" MasterPageFile="~/User_Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AnyThink.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #mainContainer {
            padding-top: 5rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolder_Post" runat="server">
    <div runat="server" id="postContainer">
    </div>


</asp:Content>
