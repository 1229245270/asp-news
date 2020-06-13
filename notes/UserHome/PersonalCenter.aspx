<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" AutoEventWireup="true" CodeFile="PersonalCenter.aspx.cs" Inherits="UserHome_PersonalCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/PersonalCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="percenter">
        <div class="perleft">
            <a class="perlefta">全部关注▼</a>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                <div class="perrshow">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="showleft">
                            <img class="showimage" src="<%# ".."+Eval("attentheader").ToString().Substring(1) %>" />
                            <asp:Label CssClass="showattent" ID="attentLabel" runat="server" Text='<%# Eval("attent") %>' />
                            <asp:LinkButton CssClass="showbtn" ID="attentbut" runat="server" CommandArgument='<%#Eval("userid")+","+ Eval("attent")%>' OnCommand="attentbut_Command" >取关</asp:LinkButton>
                        </div>

                    </ItemTemplate>
                    
                </asp:DataList>
                </div>
        </div>
        <div class="perright">
            <div class="perrtop">
                <a id="but1" class="rightbut">推荐文章</a>
                <a id="but2" class="rightbut">推荐用户</a>
            </div>
            <div class="show1" id="show1">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>"></asp:SqlDataSource>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" >
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
            </div>
            <div class="show2" id="show2">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" SelectCommand="SELECT [userid], [ssex], [getlike], [userheader] FROM [users] order by getlike desc"></asp:SqlDataSource>
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" DataKeyField="userid"  >
                <HeaderTemplate>
                    <table style="text-align:center;height:30px;line-height:30px;color:#ec6149;">
                        <tr>
                            <td style="width:80px;">头像</td>
                            <td style="width:120px;">姓名</td>
                            <td style="width:120px;">性别</td>
                            <td style="width:120px;">点赞数</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                <div class="showbottom">
                  <img class="showone" src="<%# ".." + Eval("userheader").ToString().Substring(1) %>" />
                  <a class="showtwo" ><%# Eval("userid") %></a>
                  <a class="showtwo" ><%# Eval("ssex") %></a>
                  <a class="showtwo" ><%# Eval("getlike") %></a>
                  <a class="showthree" href="<%# "Attention.aspx?attent=" + Eval("userid") %>">关注</a>
                  <div class="clearfloat"></div>
                </div>
            </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
            </div>
            <script type="text/javascript">
                $("#show1").show();
                $("#show2").hide();
                $("#but1").click(function () {
                    $("#show1").show();
                    $("#show2").hide();
                });
                $("#but2").click(function () {
                    $("#show1").hide();
                    $("#show2").show();
                });
            </script>
        </div>
        <div class="clearfloat"></div>
    </div>
</asp:Content>

