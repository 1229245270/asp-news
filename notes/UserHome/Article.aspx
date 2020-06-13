<%@ Page Title="" Language="C#" MasterPageFile="../Top.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/ArticleCss.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="acentre">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"
            SelectCommand=""></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <asp:Label CssClass="notetitle" runat="server"><%# Eval("notetitle") %></asp:Label>
        <div class="notejianjie">
            <a href="#"><img class="noteleft" src="<%# "../" + Eval("userheader").ToString().Substring(2) %>" /></a>
            <div class="noteright">
                <div class="ntop">
                    <a runat="server" class="nname" href="#"><%# Eval("userid") %></a>
                    <a href="Attention.aspx?attent=<%# Eval("userid") %>" class="ngetlike" id="ngetlike">+关注 </a>
                    <div class="cleanfloat"></div>
                </div>
                <asp:Label CssClass="njieshao" ID="njieshao" runat="server"><%# Eval("notedate") + "  字数 " + (Eval("notecontent").ToString().Length) + "  评论 " + Eval("comnum") + " 喜欢 " + Eval("notelike") %></asp:Label>
            </div>
            <div class="cleanfloat"></div>
        </div>
        <asp:Label CssClass="notecontent" ID="notecontent" runat="server"><%# Eval("notecontent") %></asp:Label>
        <a class="gettext">千山万水总是情，投点礼物行不行</a>
        <a class="getmoney" href="#">赞赏支持</a>
        <div class="notebottom">
            <a class="copyright">© 著作权归作者所有 </a>
            <a href="#" class="jubao">举报文章</a>
        </div>
        <div class="userjianjie">
            <a class="userimage" href="#"><img src="<%# "../" + Eval("userheader").ToString().Substring(2) %>" /></a>
            <div class="usercentre">
                <a href="#" class="username" runat="server"><%# Eval("userid") %></a>
                <asp:Label CssClass="ujieshao" ID="ujieshao" runat="server"><%# "写了 " + Eval("pagenum") + " 篇文章，被 " + Eval("userlike") + " 人关注,获得 " + Eval("likenum") +" 个喜欢" %></asp:Label>
            </div>
            <a href="Attention.aspx?attent=<%# Eval("userid") %>" class="ugetlike" id="ugetlike">+关注</a>
            <div class="cleanfloat"></div>
        </div>
        <div class="notefoot">
            <a href="<%# "getlike.aspx?liker=" + Eval("noteid") + "&userid=" + (Session["userid"] == null ? null : Session["userid"])  %>"><img src="../images/ArticleImages/love.png" />喜欢  |  <%# Eval("notelike") %></a>
            <a href="#">更多分享</a>
            <a href="#"><img src="../images/ArticleImages/wechat.png" /></a>
            <a href="#"><img src="../images/ArticleImages/feige.png" /></a>
            <a href="#"><img src="../images/ArticleImages/qq.png" /></a>
            <div class="cleanfloat"></div>
        </div>
    </ItemTemplate>
    </asp:DataList>

    <div class="mycomment">
        <div class="mycom1">
            <!-- ~/images/userimages/记忆的天空.jpg需要修改 -->
            <asp:Image ID="Image1" runat="server" />
            <div class="combox">
                <asp:TextBox CssClass="comtext" ID="comtext" runat="server" placeholder="期待你的神评论" Rows="3" TextMode="MultiLine"></asp:TextBox>
                <div class="combutton">
                    <a class="comimage"></a>
                    <asp:Button CssClass="comsend" ID="comsend" runat="server" Text="发送" OnClick="comsend_Click" />
                </div>
            </div>
            <div class="cleanfloat"></div>
        </div>
        <div class="mycom2">
            <img src="../images/userimages/notuser.png" />
            <div class="combox">
                <a href="../Login.aspx">登录</a>
                <a>后发表评论</a>
                <div class="cleanfloat"></div>
            </div>
            <div class="cleanfloat"></div>
        </div>

    </div>
    <% if (Session["userid"] == null) { %>
            <script type="text/javascript">
                $(".mycom1").hide();
                $(".mycom2").show();
            </script>
    <% } else { %>   
            <script type="text/javascript">
                $(".mycom1").show();
                $(".mycom2").hide();
            </script>
    <% } %>
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
                        <a href="<%# "getlike.aspx?liker=c" + Eval("comid") + "&noteid=" + Eval("noteid") + "&userid=" + (Session["userid"] == null ? null : Session["userid"])  %>"><%# Eval("getlike") %>赞</a>
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
