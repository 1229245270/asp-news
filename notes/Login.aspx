<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/LoginCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="login">
    <div class="title">欢迎登录用户</div>
    <asp:TextBox CssClass="userid" ID="userid" runat="server" placeholder="账号" MaxLength="16"></asp:TextBox>

    <asp:TextBox CssClass="userpwd" ID="userpwd" runat="server" placeholder="密码" MaxLength="14" TextMode="Password"></asp:TextBox>

    <div class="code">
        <asp:TextBox CssClass="codecontent" ID="codecontent" runat="server" placeholder="验证码" MaxLength="4"></asp:TextBox>
        <div class="codeimage">
            <img id="code" onclick="document.getElementById('code').src='function/code.aspx?'+Math.random()" src="function/code.aspx" />
        </div>
        <div class="clearfloat"></div>
    </div>

    <!--           登录按钮            -->
    <asp:Button CssClass="denglu" ID="denglu" runat="server" Text="登录" OnClick="denglu_Click" />

           
</div>
</asp:Content>