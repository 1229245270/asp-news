<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Page.aspx.cs" Inherits="AdminHome_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .admincentent .adminleft .leftul .leftli:first-child .lefta {
            background-color:#f0f0f0;
        }
    </style>
    <link href="../css/AdminPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div class="leftcontent">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"
            SelectCommand=""></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="leftbox">
                    <div class="notepage">
                        <a runat="server" href='<%# "AlterPage.aspx?id="+Eval("noteid") %>' id="notetitle" class="notetitle"><%# Eval("notetitle").ToString().Length>50?Eval("notetitle").ToString().Substring(0,50)+"...":Eval("notetitle") %></a>
                        <a runat="server" id="notecontent" class="notecontent"><%# Eval("noteintro").ToString().Length>60?Eval("noteintro").ToString().Substring(0,60)+"...":Eval("noteintro") %></a>
                        <div class="notefoot">
                            <a runat="server" href="#" id="footname" class="footname"><%# Eval("userid") %></a>
                            <a runat="server" href="#" id="footcomment" class="footcomment"><img src="../images/HomePageImages/comment.png" /><%# Eval("comnum") %></a>
                            <a runat="server" href="#" id="footgetlike" class="footgetlike"><img src="../images/HomePageImages/getlike.png" /><%# Eval("getlike") %></a>
                            <a runat="server" id="footdate" class="footdate"><%# Eval("notedate") %></a>
                            <div class="clearfloat"></div>
                        </div>
                        
                        <a class="abut" href="<%# "javascript:if(confirm('确实要删除该内容吗?')){location='DeletePage.aspx?id=" + Eval("noteid") + "'}" %>">删除文章</a>
                        <a class="abut" href="<%# "AddPage.aspx?id="+Eval("noteid") %>">编辑文章</a>
                    </div>
                    <a class="footimg" href='<%# "AlterPage.aspx?id="+Eval("noteid") %>'><img runat="server" src='<%# "../"+Eval("noteimage").ToString().Substring(2) %>' /></a>
                    <div class="clearfloat"></div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div class="page">
            <asp:Label CssClass="pagenum" ID="pagenum" runat="server"></asp:Label>
            <asp:Button ID="returnbut" CssClass="pagebut" runat="server" Text="上一页" OnClick="Returnclick" />
            <asp:Button ID="shouyebut" CssClass="pagebut" runat="server" Text="首页" OnClick="Shouyeclick" />
            <asp:Button ID="nextbut" CssClass="pagebut" runat="server" Text="下一页" OnClick="Nextclick" />
            <div class="clearfloat"></div>
        </div>
    </div>
</asp:Content>

