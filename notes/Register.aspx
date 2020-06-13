<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/RegisterCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <div class="register">
            <div class="title">欢迎注册用户</div>
            <asp:TextBox CssClass="userid" ID="userid" runat="server" placeholder="账号" MaxLength="8"></asp:TextBox>
            <a style="margin-top:5px" class="text">账号不能为空</a>
            <a id="useridhint" class="text">必须大于2个字符</a>
            <a id="useridhint2" class="text">账号不能为空格</a>
            <asp:TextBox CssClass="userpwd" ID="userpwd" runat="server" placeholder="密码" MaxLength="14" TextMode="Password"></asp:TextBox>
            <a style="margin-top:5px" class="text">密码不能为空</a>
            <a id="pwdhint" class="text">
                <img src="images/RegisterImages/info.png" />不能包括空格<br />
                <img src="images/RegisterImages/info.png" />长度为6到14个字符<br />
                <img src="images/RegisterImages/info.png" />必须包含字母、数字、符号至少2种

            </a>
            <asp:TextBox CssClass="userangin" ID="userangin" runat="server" placeholder="确认密码" MaxLength="14" TextMode="Password"></asp:TextBox>
            <a style="margin-top:5px" class="text">密码确认不一致</a>
            <div class="code">
                <asp:TextBox CssClass="codecontent" ID="codecontent" runat="server" placeholder="验证码" MaxLength="4"></asp:TextBox>

                <div class="codeimage">
                    <img id="code" onclick="document.getElementById('code').src='function/code.aspx?'+Math.random()" src="function/code.aspx" />
                </div>
                <div class="clearfloat"></div>
            </div>
            <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                var userid = '#<%= userid.ClientID %>';
                var userpwd = '#<%= userpwd.ClientID %>';
                var userangin = '#<%= userangin.ClientID %>';
                var codecontent = '#<%= codecontent.ClientID %>';

                function borderColor(idTextBox) {     //输入框边框提示设置

                    $(document).ready(function () {

                        $(idTextBox).focus(function () {            //鼠标点击时事件
                            $(idTextBox).css("color", "#000");                      //所有文本框字体变黑
                            $(idTextBox).css("border-color", "#2b72ff");            //所有文本框边框变蓝
                            $(idTextBox + " + a").css("max-height", "0px");         //取消为0提示，设置max-height=0
                            if (idTextBox == userpwd) {                             //点击密码框，显示提示pwdhint
                                    $("#pwdhint").css("max-height","78px");
                            }
                        })
                        $(idTextBox).keyup(function () {            //键盘敲击事件
                            if (idTextBox == userid) {              //账号
                                $("#useridhint2").css("max-height", "0px");         //没有空格时，隐藏提示useridhint2

                                if ( $(userid).val().length <= 2 ) {                //长度小于等于2时，显示提示useridhint
                                    $("#useridhint").css("max-height", "20px");
                                }else if ($(userid).val().length > 2) {             //长度大于2时，隐藏提示useridhint
                                    $("#useridhint").css("max-height", "0px");

                                    if ($(userid).val().indexOf(" ") >= 0) {        //长度大于2时有空格，显示提示useridhint2
                                        $("#useridhint2").css("max-height", "20px");
                                    }
                                }
                            }

                            if (idTextBox == userpwd) {            //密码
                                if ($(idTextBox).val().indexOf(" ") >= 0)           //判断密码框是否有空格
                                    $("#pwdhint img:first-child").attr("src","images/RegisterImages/error.png");
                                else $("#pwdhint img:first-child").attr("src", "images/RegisterImages/green.png");

                                if ($(idTextBox).val().length < 6)                  //判断密码框长度
                                    $("#pwdhint img:nth-of-type(2)").attr("src","images/RegisterImages/error.png"); //其父元素的第n个子元素，必须使用nth-of-type()
                                else $("#pwdhint img:nth-of-type(2)").attr("src", "images/RegisterImages/green.png");

                                boo1 = /\d/.test($(idTextBox).val());               //正则表达式,判断字母数字字符三种
                                boo2= /[a-zA-Z]/.test($(idTextBox).val());
                                boo3 = /[-=;',./\\\[\]]/.test($(idTextBox).val());
                                if ((boo1 && boo2) || (boo1 && boo3) || (boo2 && boo3))        //判断字母数字字符三种
                                    $("#pwdhint img:last-child").attr("src","images/RegisterImages/green.png");
                                else $("#pwdhint img:last-child").attr("src", "images/RegisterImages/error.png");
                            }
                        })
                        


                        $(idTextBox).blur(function () {         //鼠标离开后事件( 设置正确时离开样式和错误时样式 )
                            $(idTextBox).css("border-color", "#808080");        //离开时边框设置为灰色
                            if ($(idTextBox).val() == "") {     //判断文本框为空
                                $("#useridhint").css("max-height", "0px");      //取消提示useridhint，当userid为空时，让其只显示一行提示
                                $(idTextBox).css("border-color", "red");        //文本框为空时，边框为红
                                if (idTextBox != userangin) {                   //文本框为空时，显示为空提示
                                  $(idTextBox + "+ a").css("max-height", "20px");
                                }
                            }

                            if (idTextBox == userid) {           //判断账号
                                if (($(idTextBox).val().length < 3) || $(idTextBox).val().indexOf(" ") >= 0) {
                                    $(idTextBox).css("color", "red");
                                    $(idTextBox).css("border-color", "red");
                                } else {
                                    $("#useridhint").css("max-height", "0px");
                                }
                                if ($(idTextBox).val().length = 0) {
                                    $("#userhint".css("max-height","0px"));
                                }
                            }

                            if (idTextBox == userpwd) {
                                $("#pwdhint").css("max-height","0px");
                                var boo1 = ($(idTextBox).val().indexOf(" ") < 0);
                                var boo2 = ($(idTextBox).val().length >= 6);
                                var boo3_1 = /\d/.test($(idTextBox).val());             //正则表达式,判断字母数字字符三种
                                var boo3_2= /[a-zA-Z]/.test($(idTextBox).val());
                                var boo3_3 = /[-=;',./\\\[\]]/.test($(idTextBox).val());
                                var boo3 = ((boo3_1 && boo3_2) || (boo3_1 && boo3_3) || (boo3_2 && boo3_3));

                                if (!boo1 || !boo2 || !boo3) {
                                    $(idTextBox).css("color", "red");
                                    $(idTextBox).css("border-color", "red");
                                } 
                                if ($(userangin).val() != $(userpwd).val()) {
                                    $(userangin).css("color", "red");
                                    $(userangin).css("border-color", "red");
                                    $(userangin + "+ a").css("max-height", "20px");
                                } else {
                                    $(userangin).css("color", "#000");
                                    $(userangin).css("border-color", "#808080");
                                    $(userangin + "+ a").css("max-height", "0px");
                                }
                            }

                            if (idTextBox == userangin) {        //密码确认判定
                                if ($(idTextBox).val() != $(userpwd).val()) {
                                    $(idTextBox).css("color", "red");
                                    $(idTextBox).css("border-color", "red");
                                    $(idTextBox + " + a").css("max-height", "20px");
                                } else {
                                    $(idTextBox).css("color", "#000");
                                    $(idTextBox).css("border-color", "#808080");
                                    $(idTextBox + " + a").css("max-height", "0px");
                                }
                                 
                            }
                        })
                    })

                }
                borderColor(userid);
                borderColor(userpwd);
                borderColor(userangin);
                borderColor(codecontent);
            </script>


            <!--           注册按钮            -->
            <asp:Button CssClass="zhuce" ID="zhuce" runat="server" Text="立即注册" OnClick="zhuce_Click" />

           
        </div>

</asp:Content>

