<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddPage.aspx.cs" Inherits="AdminHome_AddPage" %>

<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/AddPageCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="pageblock">
        <asp:Label CssClass="labelpage" ID="labeltitle" runat="server" Text="文章标题"></asp:Label>
        <asp:TextBox CssClass="textboxpage" ID="texttitle" runat="server" MaxLength="50"></asp:TextBox>
        <div class="clearfloat"></div>
    </div>
    <div class="pageblock">
        <asp:Label CssClass="labelpage" ID="labelwriter" runat="server" Text="作者"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" SelectCommand="SELECT [userid] FROM [users]"></asp:SqlDataSource>
        <asp:DropDownList CssClass="textboxpage" ID="textwriter" runat="server" DataSourceID="SqlDataSource1" DataTextField="userid" DataValueField="userid"></asp:DropDownList>
        <div class="clearfloat"></div>
    </div>
    <div class="pageintro">
        <asp:Label CssClass="labelintro" ID="labelintro" runat="server" Text="文章简介"></asp:Label>
        <asp:TextBox CssClass="textintro" ID="textintro" runat="server" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
        <div class="clearfloat"></div>
    </div>
    <div class="pagecontent">
        <asp:Label CssClass="labelcentent" ID="labelcontent" runat="server" Text="文章内容"></asp:Label>
        <ce:editor CssClass="textcontent" ID="textcontent" runat="server" Height="1000px" Width="798px" Text=""></ce:editor>
    </div>
    <div class="butpage">
        <asp:Button CssClass="butcss" ID="reset" runat="server" Text="重置" OnClick="reset_Click" />
        <asp:Button CssClass="butcss" ID="post" runat="server" Text="发布文章" OnClick="post_Click" />
        <asp:Button CssClass="butcss" ID="alter" runat="server" Text="修改文章" OnClick="alter_Click" />
        <% if (Request.QueryString["id"] == null)
            { %>
            <script type="text/javascript">
                $(".butpage .butcss:nth-child(2)").show();
                $(".butpage .butcss:nth-child(3)").hide();
            </script>
        <% }
        else{ %>
            <script type="text/javascript">
                $(".butpage .butcss:nth-child(2)").hide();
                $(".butpage .butcss:nth-child(3)").show();
            </script>
        <% } %>
        <div class="clearfloat"></div>
    </div>
</asp:Content>

