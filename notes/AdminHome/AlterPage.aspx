<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AlterPage.aspx.cs" Inherits="AdminHome_AlterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/AlterPageCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="acentre">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"
            SelectCommand=""></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <asp:Label CssClass="notetitle" runat="server"><%# Eval("notetitle") %></asp:Label>
        <div class="notejianjie">
            <a href="#"><img class="noteleft" src="<%# "../images/userimages/"+ Eval("userid") +".jpg" %>" /></a>
            <div class="noteright">
                <div class="ntop">
                    <a runat="server" class="nname" href="#"><%# Eval("userid") %></a>
                    <asp:Button CssClass="ngetlike" ID="ngetlike" runat="server" Text="+关注" />
                    <div class="cleanfloat"></div>
                </div>
                <asp:Label CssClass="njieshao" ID="njieshao" runat="server"><%# Eval("notedate") + "  字数 " + (Eval("notecontent").ToString().Length) + "  评论 " + Eval("comnum") + " 喜欢 " + Eval("notelike") %></asp:Label>
            </div>
            <div class="cleanfloat"></div>
        </div>
        <asp:Label ID="notecontent" runat="server"><%# Eval("notecontent") %></asp:Label>

        <div class="adminblock">
            <a href="<%# "javascript:if(confirm('确实要删除该内容吗?')){location='DeletePage.aspx?id=" + Eval("noteid") + "'}" %>"" class="abut">删除文章</a>
            <a href="<%# "AddPage.aspx?id="+Eval("noteid") %>" class="abut">修改文章</a>
            <asp:Label CssClass="jubao" ID="jubao" runat="server"><%# "文章举报次数:0次" %></asp:Label>
            <div class="clearfloat"></div>
        </div>
        <div class="userjianjie">
            <a class="userimage" href="#"><img src="<%# "../images/userimages/" + Eval("userid")+ ".jpg" %>" /></a>
            <div class="usercentre">
                <a href="#" class="username" runat="server"><%# Eval("userid") %></a>
                <asp:Label CssClass="ujieshao" ID="ujieshao" runat="server"><%# "写了 " + Eval("pagenum") + " 篇文章，被 " + Eval("userlike") + " 人关注,获得 " + Eval("likenum") +" 个喜欢" %></asp:Label>
            </div>
            <asp:Button CssClass="ugetlike" ID="ugetlike" runat="server" Text="+关注" />
            <div class="cleanfloat"></div>
        </div>
        <div class="notefoot">
            <a href="#"><img src="../images/ArticleImages/love.png" />喜欢  |  <%# Eval("notelike") %></a>
            <a href="#">更多分享</a>
            <a href="#"><img src="../images/ArticleImages/wechat.png" /></a>
            <a href="#"><img src="../images/ArticleImages/feige.png" /></a>
            <a href="#"><img src="../images/ArticleImages/qq.png" /></a>
            <div class="cleanfloat"></div>
        </div>
    </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"
            SelectCommand=""></asp:SqlDataSource>
    <div class="comtitle"><a runat="server" id="comnum"></a></div>
    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <div class="commentbox">
                <a class="comuserimage" href="#"><img src="<%# "../images/userimages/" + Eval("userid") + ".jpg" %>" /></a>
                <div class="comment">
                    <a class="comname"><%# Eval("userid") %></a>
                    <a class="comjianjie"><%# Eval("row") + "楼 ▪ " + Eval("commentdate") %></a>
                    <a class="comcontent"><%# Eval("commenttext") %></a>
                    <div class="comfoot">
                        <a href="#"><%# Eval("getlike") %>赞</a>
                        <a href="#">回复</a>
                        <div class="cleanfloat"></div>
                    </div>
                </div>
                <div class="cleanfloat"></div>

            </div>
        </ItemTemplate>
    </asp:DataList>

</div>
</asp:Content>

