<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Discuss.aspx.cs" Inherits="AdminHome_Discuss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/DiscussCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" runat="server"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="commentbox">
                <a class="comuserimage" href="#"><img src="<%# "../" + Eval("userheader").ToString().Substring(2) %>" /></a>
                <div class="comment">
                    <a class="comname"><%# Eval("userid") %></a>
                    <a class="comjianjie"><%# Eval("row") + "楼 ▪ " + Eval("commentdate") %></a>
                    <a class="comcontent"><%# Eval("commenttext") %></a>
                    <div class="comfoot">
                        <a href="#"><%# Eval("getlike") %>赞</a>
                        <a href="#">回复</a>
                        <a href="<%# "javascript:if(confirm('确实要删除该内容吗?')){location='DeleteDiscuss.aspx?id=" + Eval("comid") + "'}" %>"" class="abut">删除评论</a>
                        <a href="<%# "AlterDiscuss.aspx?id="+Eval("comid") %>" class="abut">修改评论</a>
                        <div class="cleanfloat"></div>
                    </div>
                </div>
                <div class="cleanfloat"></div>

            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

