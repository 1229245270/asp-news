<%@ Page Title="" Language="C#" MasterPageFile="../Top.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/HomeCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
    <div class="left">
    <div class="slideshow">
        <div class="slidebox">
        <a href="#"><img src="../images/HomePageImages/img1.png" class="images" /></a>
        <a href="#"><img src="../images/HomePageImages/img2.png" class="images" /></a>
        <a href="#"><img src="../images/HomePageImages/img3.jpg" class="images" /></a>
        <a href="#"><img src="../images/HomePageImages/img4.jpg" class="images" /></a>
        <div class="clearfloat"></div>
        </div>
        <ol>      
        <li class="liaction" data-value="0"></li>
        <li data-value="1"></li>
        <li data-value="2"></li>
        <li data-value="3"></li>
        </ol>
        <a class="btn btn-left" id="btn-left"><</a>
        <a class="btn btn-right" id="btn-right">></a>

    </div>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        var index = 0;
        var thisa = $(".slidebox a");
        var thisli = $(".slideshow ol li");
        var thisleft = $(".slideshow .btn-left");
        var thisright = $(".slideshow .btn-right");

        function toleft(index) {
            thisa.eq(index).fadeIn(100);
            thisa.eq(index).next().fadeOut(100);
            thisli.removeClass("liaction");
            thisli.eq(index).addClass("liaction");
            if (index == thisa.length-1) {
                thisa.eq(0).fadeOut(100);
            }
        }

        function toright(index) {
            thisa.eq(index).fadeIn(100);
            thisa.eq(index).prev().fadeOut(100);
            thisli.removeClass("liaction");
            thisli.eq(index).addClass("liaction");
            if (index == 0) {
                thisa.eq(thisa.length - 1).fadeOut(100);
            }
        }

        function switchli(index) {
            thisli.removeClass("liaction");
            thisli.eq(index).addClass("liaction");
        }

        //左按钮点击事件
        thisleft.on("click", function () {
            index--;
            if (index < 0) index = thisa.length - 1;
            toleft(index);
        })

        //右按钮点击事件
        thisright.on("click", function () {
            index++;
            if (index > thisa.length - 1) index = 0;
            toright(index);
        })

        //下标点击事件
        thisli.on("click", function () {
            var thisdata = $(this).attr("data-value");
            thisa.eq(0).fadeOut(1);     //点击时先去除叠加的图片，否则点击后几项时无法正常显示
            thisa.eq(1).fadeOut(1);
            thisa.eq(2).fadeOut(1);
            thisa.eq(3).fadeOut(1);
            if (thisdata != index) {
                thisa.eq(thisdata).fadeIn(100); 
                thisa.eq(index).fadeOut(100);
                thisli.eq(index).removeClass("liaction");
                thisli.eq(thisdata).addClass("liaction");
                index = thisdata;
            }
        })

        //图片自动轮播
        function showtime() {
            index++;
            if (index < thisa.length) {
                toright(index);
                switchli(index);
            }
            if (index > thisa.length - 1) {
                index = 0;
                thisa.eq(index).fadeIn(100);
                thisa.eq(thisa.length - 1).fadeOut(100);
                switchli(index);
            }
        }
        goshow=setInterval(showtime, 3000);

        $(".btn").on("mouseover", function () {
            clearInterval(goshow);
        })
        $(".btn").on("mouseout", function () {
            goshow=setInterval(showtime,3000);
        })
        thisli.on("mouseover", function () {
            clearInterval(goshow);
        })
        thisli.on("mouseout", function () {
            goshow=setInterval(showtime,3000);
        })
                
    </script>
              
    <div class="leftcontent">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"
            SelectCommand=""></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="leftbox">
                    <div class="notepage">
                        <a runat="server" href='<%# "Article.aspx?id="+Eval("noteid") %>' id="notetitle" class="notetitle"><%# Eval("notetitle").ToString().Length>50?Eval("notetitle").ToString().Substring(0,50)+"...":Eval("notetitle") %></a>
                        <a runat="server" id="notecontent" class="notecontent"><%# Eval("noteintro").ToString().Length>60?Eval("noteintro").ToString().Substring(0,60)+"...":Eval("noteintro") %></a>
                        <div class="notefoot">
                            <a runat="server" href="#" id="footname" class="footname"><%# Eval("userid") %></a>
                            <a runat="server" href="#" id="footcomment" class="footcomment"><img src="../images/HomePageImages/comment.png" /><%# Eval("comnum") %></a>
                            <a runat="server" href="#" id="footgetlike" class="footgetlike"><img src="../images/HomePageImages/getlike.png" /><%# Eval("getlike") %></a>
                            <a runat="server" id="footdate" class="footdate"><%# Eval("notedate") %></a>
                            <div class="clearfloat"></div>
                        </div>
                    </div>
                    <a class="footimg" href='<%# "Article.aspx?id="+Eval("noteid") %>'><img runat="server" src='<%# "../"+Eval("noteimage").ToString().Substring(2) %>' /></a>
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


    </div>
    <div class="right">
    <div class="notice">
        <a class="notitle">今日公告</a>
        <a class="nocontent">本站出品，必属精品！如果你有想和我们分享的精品，欢迎投稿！</a>
    </div>
    <a id="block1" class="tblock" href="#">每日签到 ></a>
    <a id="block2" class="tblock" href="#">学习课堂 ></a>
    <a id="block3" class="tblock" href="#">优质文章 ></a>
    <a class="ad" href="#"><img src="../images/HomePageImages/ad1.jpg" /></a>
    <div class="recommend">
        <div class="retop">
            <a class="releft">推荐作者</a>
            <a runat="server" id="refresh" href="#" class="reright"><img src="../images/HomePageImages/refresh.png" />换一批</a>
            <div class="clearfloat"></div>

        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" 
            SelectCommand="SELECT top 5 [userid], [getlike], [userheader],(select count([noteid]) from [notes] where [userid]=[tableusers].[userid]) AS [pagenum] FROM [users] AS [tableusers] order by [getlike] desc"></asp:SqlDataSource>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="userid" DataSourceID="SqlDataSource2">
            <ItemTemplate>
            <div class="recontent">
                <a href="#"><img class="reimage" src='<%# "../images/userimages/"+Eval("userid")+".jpg" %>' /></a>
                <div class="recentre">
                    <a href="#" class="name"><%# Eval("userid") %></a>
                    <a class="jianjie">写了<%# Eval("pagenum") %>篇文章,<%# Eval("getlike") %>关注</a>
                </div>
                <a href="Attention.aspx?attent=<%# Eval("userid") %>" class="getlike">+关注</a>
                <div class="clearfloat"></div>
            </div>                        
            </ItemTemplate>
            </asp:DataList>

    </div>
    <a class="ad" href="#"><img src="../images/HomePageImages/ad2.jpg" /></a>
    </div>
    <div class="clearfloat"></div>
</div>
<div class="foot"></div>
</asp:Content>
