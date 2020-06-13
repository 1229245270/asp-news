<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="AdminHome_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .setimage {
            display:block;
            height:40px;
            width:auto;
            border-radius:20px;
            margin:10px 20px 10px 20px;
        }
        .setrow {
            display:block;
            line-height:60px;
            height:60px;
            width:100px;
            text-align:center;
        }
        .setdel {
            color:#333;
            text-decoration-line:none;
            display:block;
            line-height:30px;
            height:30px;
            margin:0px 20px 0 20px;
            padding:0 10px 0 10px;
            border:1px solid #999;
            box-shadow:rgba(0,0,0,0.1) 5px 5px 10px; 
        }
        .setdel:hover {
            background-color: rgba(211, 113, 96,0.5);
        }
        .rowcss {
            height:60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:notesConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [userid] = @original_userid AND (([ssex] = @original_ssex) OR ([ssex] IS NULL AND @original_ssex IS NULL)) AND (([getlike] = @original_getlike) OR ([getlike] IS NULL AND @original_getlike IS NULL)) AND (([userheader] = @original_userheader) OR ([userheader] IS NULL AND @original_userheader IS NULL))" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [userid], [ssex], [getlike], [userheader] FROM [users] where [userid] != 'admin'">

        <InsertParameters>
            <asp:Parameter Name="userid" Type="String" />
            <asp:Parameter Name="ssex" Type="String" />
            <asp:Parameter Name="getlike" Type="Int32" />
            <asp:Parameter Name="userheader" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ssex" Type="String" />
            <asp:Parameter Name="getlike" Type="Int32" />
            <asp:Parameter Name="userheader" Type="String" />
            <asp:Parameter Name="original_userid" Type="String" />
            <asp:Parameter Name="original_ssex" Type="String" />
            <asp:Parameter Name="original_getlike" Type="Int32" />
            <asp:Parameter Name="original_userheader" Type="String" />
        </UpdateParameters>        
        <DeleteParameters>
            <asp:Parameter Name="original_userid" Type="String" />
            <asp:Parameter Name="original_ssex" Type="String" />
            <asp:Parameter Name="original_getlike" Type="Int32" />
            <asp:Parameter Name="original_userheader" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="userheader">
                <ItemTemplate>
                    <asp:Image CssClass="setimage" ID="Image1" runat="server" ImageUrl='<%# Eval("userheader") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="账号" SortExpression="userid">
                <ItemTemplate>
                    <asp:Label CssClass="setrow" ID="Label1" runat="server" Text='<%# Bind("userid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性别" SortExpression="ssex">
                <ItemTemplate>
                    <asp:Label CssClass="setrow" ID="Label2" runat="server" Text='<%# Bind("ssex") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="点赞" SortExpression="getlike">
                <ItemTemplate>
                    <asp:Label CssClass="setrow" ID="Label3" runat="server" Text='<%# Bind("getlike") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton CssClass="setdel" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#D37160" Height="50px" Width="80px" />
        <RowStyle CssClass="rowcss" />
    </asp:GridView>
</asp:Content>

