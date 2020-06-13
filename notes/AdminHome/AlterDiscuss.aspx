<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AlterDiscuss.aspx.cs" Inherits="AdminHome_AlterDiscuss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/AlterDiscussCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" SelectCommand="SELECT [noteid],[notetitle] FROM [notes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" SelectCommand="SELECT [userid] FROM [users]"></asp:SqlDataSource>
            <div class="commentbox">
                <a class="comuserimage" href="#"><img id="userimage" runat="server" /></a>
                <div class="comment">
                    <div class="divs">
                        <span>文章</span>
                        <asp:DropDownList CssClass="compage" ID="compage" runat="server" DataSourceID="SqlDataSource1" DataTextField="notetitle" DataValueField="noteid"></asp:DropDownList>
                    </div>
                    <div class="divs">
                        <span>用户</span>
                        <asp:DropDownList CssClass="comname" ID="comname" runat="server" DataSourceID="SqlDataSource2" DataTextField="userid" DataValueField="userid"></asp:DropDownList>
                    </div>
                    <div class="divs">
                        <span>评论信息</span>
                        <asp:TextBox CssClass="comcontext" ID="comcontext" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <div class="clearfloat"></div>
                    </div>
                    <div class="divs">
                        <span>点赞次数</span>
                        <asp:TextBox CssClass="comgetlike" ID="comgetlike" runat="server"></asp:TextBox>
                        <span>赞</span>
                        <div class="clearfloat"></div>
                    </div>
                    <div class="butpage">
                        <asp:Button CssClass="butcss" ID="reset" runat="server" Text="重置" OnClick="reset_Click" />
                        <asp:Button CssClass="butcss" ID="post" runat="server" Text="发送评论" OnClick="post_Click" />
                        <asp:Button CssClass="butcss" ID="alter" runat="server" Text="修改评论" OnClick="alter_Click" />
                        <asp:Button CssClass="butcss" ID="delete" runat="server" Text="删除评论" OnClick="delete_Click" />
                        <% if (Request.QueryString["id"] == null)
                            { %>
                            <script type="text/javascript">
                                $(".butpage .butcss:nth-child(2)").show();
                                $(".butpage .butcss:nth-child(3)").hide();
                                $(".commentbox .comuserimage").hide();
                                $(".butpage .butcss:nth-child(4)").hide();
                            </script>
                        <% }
                        else{ %>
                            <script type="text/javascript">
                                $(".butpage .butcss:nth-child(2)").hide();
                                $(".butpage .butcss:nth-child(3)").show();
                                $(".commentbox .comuserimage").show();
                                $(".butpage .butcss:nth-child(4)").show();
                            </script>
                        <% } %>
                        <div class="clearfloat"></div>
                    </div>
                </div>
                <div class="cleanfloat"></div>
            </div>
</asp:Content>

