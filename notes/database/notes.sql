USE [master]
GO
/****** Object:  Database [notes]    Script Date: 06/02/2019 17:13:35 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'notes')
BEGIN

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE notes
  ON PRIMARY (NAME = N''notes'', FILENAME = N''' + @device_directory + N'notes.mdf'')
  LOG ON (NAME = N''notes_log'',  FILENAME = N''' + @device_directory + N'notes.ldf'')')

END
GO
ALTER DATABASE [notes] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [notes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [notes] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [notes] SET ANSI_NULLS OFF
GO
ALTER DATABASE [notes] SET ANSI_PADDING OFF
GO
ALTER DATABASE [notes] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [notes] SET ARITHABORT OFF
GO
ALTER DATABASE [notes] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [notes] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [notes] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [notes] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [notes] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [notes] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [notes] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [notes] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [notes] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [notes] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [notes] SET  DISABLE_BROKER
GO
ALTER DATABASE [notes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [notes] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [notes] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [notes] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [notes] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [notes] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [notes] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [notes] SET  READ_WRITE
GO
ALTER DATABASE [notes] SET RECOVERY SIMPLE
GO
ALTER DATABASE [notes] SET  MULTI_USER
GO
ALTER DATABASE [notes] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [notes] SET DB_CHAINING OFF
GO
USE [notes]
GO
/****** Object:  Table [dbo].[userslike]    Script Date: 06/02/2019 17:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[userslike]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[userslike](
	[userid] [varchar](16) NULL,
	[liker] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[userslike] ([userid], [liker]) VALUES (N'记忆的天空', N'16')
INSERT [dbo].[userslike] ([userid], [liker]) VALUES (N'记忆的天空', N'c18')
INSERT [dbo].[userslike] ([userid], [liker]) VALUES (N'记忆的天空', N'c19')
INSERT [dbo].[userslike] ([userid], [liker]) VALUES (N'记忆的天空', N'20')
INSERT [dbo].[userslike] ([userid], [liker]) VALUES (N'记忆的天空', N'c20')
/****** Object:  Table [dbo].[users]    Script Date: 06/02/2019 17:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[userid] [varchar](16) NOT NULL,
	[userpwd] [varchar](14) NOT NULL,
	[ssex] [varchar](2) NULL,
	[getlike] [int] NULL,
	[userheader] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'10086', N'a10086', N'男', 0, N'~/images/userimages/10086.jpg                                                                                                                                                                                                                                  ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'admin', N'admin', N'男', 0, N'~/images/userimages/admin.jpg                                                                                                                                                                                                                                  ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'飞翔的企鹅', N'a12345', N'男', 0, N'~/images/userimages/飞翔的企鹅.jpg                                                                                                                                                                                                                                  ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'黄混岗', N'a12345', N'男', 0, N'~/images/userimages/黄混岗.jpg                                                                                                                                                                                                                                    ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'记忆的天空', N'a12345', N'男', 0, N'~/images/userimages/记忆的天空.jpg                                                                                                                                                                                                                                  ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'刘德华', N'a12345', N'男', 8, N'~/images/userimages/刘德华.jpg                                                                                                                                                                                                                                    ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'我的世界', N'a11111', N'男', 0, N'~/images/userimages/我的世界.jpg                                                                                                                                                                                                                                   ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'我的天空', N'a12345', N'男', 5, N'~/images/userimages/我的天空.jpg                                                                                                                                                                                                                                   ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'我是小网友', N'a12345', N'男', 10, N'~/images/userimages/我是小网友.jpg                                                                                                                                                                                                                                  ')
INSERT [dbo].[users] ([userid], [userpwd], [ssex], [getlike], [userheader]) VALUES (N'小张三', N'xiaozhang3', N'男', 0, N'~/images/userimages/小张三.jpg                                                                                                                                                                                                                                    ')
/****** Object:  Table [dbo].[notes]    Script Date: 06/02/2019 17:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[notes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[notes](
	[userid] [varchar](16) NOT NULL,
	[notetitle] [varchar](100) NOT NULL,
	[noteintro] [text] NOT NULL,
	[notecontent] [text] NULL,
	[getlike] [int] NULL,
	[notedate] [datetime] NULL,
	[noteimage] [varchar](255) NULL,
	[noteid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__notes__CBA1B25708EA5793] PRIMARY KEY CLUSTERED 
(
	[noteid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[notes] ON
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'小张三', N'地球为什么是圆的', N'地球是圆的，为什么地面是平坦的？一起来看看有哪些原因', N'<p style="line-height:40px;font-size: 16px;color:#222;font-weight:400;text-indent:2em;text-align:justify;">我们人类生活在地球上，一般是很难感觉到自己生活在一个球体上的。<b>这让人感觉到很奇怪</b>，因为我们知道球体是一个曲面，在曲面上是很难站住的。但是根据我们的研究，我们已经知道了，这是因为地球自转和公转导致的。地球在旋转的时候，<b>我们会被向心力作用</b>
，贴在地面上。那么我们的地球为什么是圆形的呢？而且在宇宙中还有这么多的星球是圆形的，是怎么形成的呢？地球为什么是圆的？为什么我们能站在地面上？原来和这个原因有关！<br/>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid1img1.jpg" />
我们可以用我们最熟悉的地球来举例说明，首先根据很多科学家的研究，<b>我们的地球原本只是围绕在我们太阳周围的一个小东西</b>。但是随着宇宙中很多小碎块的加入，不停的和我们的地球开始结合，在旋转的过程中开始<b>聚拢、收紧</b>，成为一体。随着<b>体积</b>和<b>质量</b>的变大，就形成了太阳系行星中的一员。<br/>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid1img2.jpg" />
而根据万有引力和开普勒三大定律，我们知道随着体积和质量的变大，引力也会变大。这引力一变大，我们人类也就会牢牢的牵引在地球上。这个道理也就是太阳系的星球为什么会绕着太阳转一样。所以在小行星不断变大的过程中，有着这个力作用在小行星上，只要有东西粘附在星球上时，如果质量较大，小行星就会给它一个向小行星中心的力。<br/>
所以在宇宙中 ，有很多的天体都是受这种力的影响，而形成球形的。但是有一个前提条件，就是这个天体的半径，要达到500公里以上才能形成这个球形。我们可以举几个例子来说明一下，比如说我们常见的流星，它就是一个小天体。但是因为体积和质量都不达标，它无法被引力牵引，也没办法把撞击在自己身上的，其他的小天体给结合在一起。所以它始终都没个定所，一直在宇宙的很多的恒星外围游走。<br/>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid1img3.jpg" />
但是从卫星图片来看，我们的球也不是一个很规整的圆形，是一个<b>不规则的椭圆形</b>。因为在地球自转的时候，我们的地球虽然把这地面上的一切都可以留住，但是公转是太阳给的力，所以在太阳直射的赤道上，我们的地球会被太阳扯着，有<b>微微的凸起</b>。还有一个影响地球形状的原因，就是地球给月球的力。我们知道力的作用是相互的，所以地球在向月球施力的同时，地球也会有形变。<br/></p>
', 0, CAST(0x0000AA3C00000000 AS DateTime), N'~/images/noteimages/1.jpg', 1)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'10086', N'自己做的jq图片轮播', N'新手开始学习js写的一个经常能用到的图片轮播效果', N'
<p style="line-height:40px;font-size: 16px;color:#222;font-weight:400;text-indent:2em;text-align:justify;">新手开始学习js写的一个经常能用到的图片轮播效果<br />
废话不多说，直接上代码！<br />
html代码：
<textarea style="height:600px;display: block;width: 780px;line-height: 1.5;font-size: 16px;resize: none;background-color:#eee;border:1px solid #aaa;padding-left:20px;" readonly>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>图片轮播</title>
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>
    <div class="index-slider">
        <ul>
            <li class="li-one liblock"></li>
            <li class="li-two linone"></li>
            <li class="li-three linone"></li>
            <li class="li-four linone"></li>
            <li class="li-five linone"></li>
        </ul>
    </div>
    <a href="#" class="slider-lift-btn btn" id="slider-left-btn"><i class="fa fa-angle-left"></i></a>
    <a href="#" class="slider-lift-btntwo btn" id="slider-right-btn"><i class="fa fa-angle-right"></i></a>
    <div class="posterBlur" id="posterBlur">
        <a class="posterBlurOne posterBlurActive" data-value="0"></a>
        <a class="posterBlurOne" data-value="1"></a>
        <a class="posterBlurOne" data-value="2"></a>
        <a class="posterBlurOne" data-value="3"></a>
        <a class="posterBlurOne" data-value="4"></a>
    </div>
</body>
</html>
</textarea>
jq代码：
<textarea style="height:800px;display: block;width: 780px;line-height: 1.5;font-size: 16px;resize: none;background-color:#eee;border:1px solid #aaa;padding-left:20px;" readonly>
<script type="text/javascript">
    /*全屏轮播海报开始*/
    !(function(){
        var index=0;//索引值从0开始
        var thisPost=$(".index-slider ul li");//海报对象
        var pblur=$("#posterBlur .posterBlurOne");//海报焦点对象
        var goPoster=setInterval(poster,3000);//倒计时操作dom函数（唯一性）
        /*海报向左滑动的按钮事件*/
        $("#slider-left-btn").on("click",function(){
            index--;
            if(index<0){
                index=thisPost.length-1;
            }
            switchLeft(index);//函数调用，保证索引值的一致性

        })    
        /*海报向右滑动的按钮事件*/
        $("#slider-right-btn").on("click",function(){
            index++;
            if(index>thisPost.length-1){
                index=0;
                thisPost.eq(thisPost.length-1).fadeOut(2000);
            }
            switchRight(index);

        })  
        /*海报焦点点击切换*/
        pblur.on("click",function(){
            var thisBlur=$(this).attr("data-value");//当前点击的焦点的data-value值(data-value值与海报索引值匹配)
            thisPost.eq(thisBlur).fadeIn(2000);//与当前点击的焦点获得的值相等索引值的海报显示
            thisPost.eq(index).fadeOut(2000);//海报自动轮播时当时正在展示的海报隐藏
            pblur.removeClass("posterBlurActive");//自动展示激活的焦点关闭激活状态
            pblur.eq(thisBlur).addClass("posterBlurActive");//点击的焦点激活
            index=thisBlur;//将索引值重置为点前点击焦点所返回的值
            console.log(thisBlur);
        })
        /*海报向左滑动的按钮点击之后调用的函数*/
        function switchLeft(index){
            console.log(index);
            thisPost.eq(index).fadeIn(2000);
            thisPost.eq(index).next().fadeOut(2000);
            pblur.removeClass("posterBlurActive");//自动展示激活的焦点关闭激活状态
            pblur.eq(index).addClass("posterBlurActive");//点击的焦点激活
        }
        /*海报向右滑动的按钮点击之后调用的函数*/
        function switchRight(index){
            console.log(index);
            thisPost.eq(index).fadeIn(2000);
            thisPost.eq(index).prev().fadeOut(2000);
            pblur.removeClass("posterBlurActive");//自动展示激活的焦点关闭激活状态
            pblur.eq(index).addClass("posterBlurActive");//点击的焦点激活
        }
        /*海报焦点自滚动函数*/
        function switchPblur(index){
            pblur.eq(index).addClass("posterBlurActive");
            pblur.eq(index).prev().removeClass("posterBlurActive");
        }
        /*公用的倒计时函数*/
        function poster(){
            index++;
            if(index<thisPost.length){
                switchRight(index);
                switchPblur(index);
            }
            if(index>thisPost.length-1){
                index=0;
                thisPost.eq(thisPost.length-1).fadeOut(2000);
                pblur.eq(pblur.length-1).removeClass("posterBlurActive");
                switchRight(index);
                switchPblur(index);
            }
        }
        /*鼠标悬浮在左右按钮时计时函数停止运行*/
        $(".btn").on("mouseover",function(){
            clearInterval(goPoster);
        })
        /*鼠标离开左右按钮时计时函数开始继续运行*/
        $(".btn").on("mouseout",function(){
            goPoster=setInterval(poster,3000);
        })
        /*鼠标移到焦点上时停止计时函数运行*/
        pblur.on("mouseover",function(){
            clearInterval(goPoster);
        })
        /*鼠标移出焦点时计时函数继续运行*/
        pblur.on("mouseout",function(){
            goPoster=setInterval(poster,3000);
        })
    })();
    /*全屏轮播海报结束*/
</script>

</textarea>

css样式代码：
<textarea style="height:600px;display: block;width: 780px;line-height: 1.5;font-size: 16px;resize: none;background-color:#eee;border:1px solid #aaa;padding-left:20px;" readonly>
<style>
        html,body,h1,h2,h3,h4,h5,h6,div,dl,dt,dd,ul,ol,li,p,blockquote,pre,hr,figure,table,caption,th,td,form,fieldset,legend,input,button,textarea,menu{margin:0;padding:0;}
        .index-slider{position: relative;z-index: 1;height: 720px;}
        .index-slider li{position: absolute;top: 0;left: 0;width: 100%;height: 720px;}
        .liblock{display: block;}
        .linone{display: none;}
        .index-slider .li-one{background: url(../images/01.png);background-repeat: no-repeat;background-size: cover;background-position: center;}
        .index-slider .li-two{background: url(../images/02.png);background-repeat: no-repeat;background-size: cover;background-position: center;}
        .index-slider .li-three{background: url(../images/03.png);background-repeat: no-repeat;background-size: cover;background-position: center;}
        .index-slider .li-four{background: url(../images/04.png);background-repeat: no-repeat;background-size: cover;background-position: center;}
        .index-slider .li-five{background: url(../images/05.png);background-repeat: no-repeat;background-size: cover;background-position: center;}
        .slider-lift-btn{display: block;position: absolute; width: 45px;height: 80px;background: #cf0f32;top: 40%;z-index: 5;left: 0;}
        .slider-lift-btn i{position: relative;top: 35%;left: 40%;font-size: 20px;color: #fff;}
        .slider-lift-btntwo{display: block;position: absolute; width: 45px;height: 80px;background: #cf0f32;top: 40%;z-index: 5;right: 0;}
        .slider-lift-btntwo i{position: relative;top: 35%;left: 50%; font-size: 20px;color: #fff;}

        .posterBlur{position: absolute;top: 0px;right: 19%;}
        .posterBlurOne{background-image: url(../images/postBlur.png);background-repeat: no-repeat;background-position:-37px 0;float: left;z-index: 999;height: 20px;width: 20px;position: relative;z-index: 999;margin:0 5px; top: 575px;left: 75%;}
        .posterBlurActive{background-image: url(../images/postBlur.png);background-repeat: no-repeat;background-position:0 -37px;float: left;z-index: 999;height: 20px;width: 20px;position: relative;z-index: 999;margin:0 5px; top: 575px;left: 75%;}

        .sliderDetail{display: block;position: relative;margin: 0 auto;width: 1230px;height: 100%;}
        .sliderDetailContent{position: absolute;left: 95px;top: 260px;width: 490px;}
        .sliderDetailContent h2{font-size: 44px;color: #fff;text-align: left;}
        .sliderDetailContent p{font-size: 15px;text-align: left;margin: 15px 0 30px;line-height: 30px;border-top: 1px solid #CF1132;padding-top: 10px;}
        .sliderDetailContent span{background-image: url(../images/btnContent.png);background-repeat: no-repeat;display: block;width: 140px;height: 50px;}
    </style>

</textarea></p>
', 0, CAST(0x0000AA3C0097AA90 AS DateTime), N'~/images/noteimages/2.jpg', 2)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'小张三', N'Android布局LayoutParams 使用', N'Android 代码动态布局 LayoutParams 使用', N'
<div id="cnblogs_post_body" class="blogpost-body"><p>1. 有这样的一个应用场景：有一个linearLayout控件在其中布局一个textView控件</p>
<p>&nbsp; &nbsp;&nbsp;</p>
<p>首先，创建线性布局对象</p>
<div class="cnblogs_code">
<pre> LinearLayout layout = <span style="color: #0000ff;">new</span> LinearLayout(<span style="color: #0000ff;">this</span>);<span style="color: #008000;">//</span><span style="color: #008000;">为本Activity创建一个线性布局对象
</span><span style="color: #008000;">//</span><span style="color: #008000;">并且设置它的属性 android:layout_width 与 android:layout_height 都为 FILL_PARENT<br><strong>//布局方面的属性设置方式</strong><br></span>
LinearLayout.LayoutParams layoutParams =   <span style="color: #0000ff;">new</span> LinearLayout.LayoutParams(ViewGroup.LayoutParams.FILL_PARENT，ViewGroup.LayoutParams.FILL_PARENT);</pre>
</div>
<p>&nbsp;</p>
<p>然后，为本Activity创建一个TextView，代码如下</p>
<div class="cnblogs_code">
<pre>TextView textView = <span style="color: #0000ff;">new</span> TextView(<span style="color: #0000ff;">this</span><span style="color: #000000;">);
</span><span style="color: #008000;">//</span><span style="color: #008000;">然后设置TextView的属性</span>
<span style="color: #000000;">textView.setText(R.string.hello);
textView.setId(</span>34);</pre>
</div>
<p><strong>对于布局方面的属性这样来设置</strong></p>
<div class="cnblogs_code">
<pre> LinearLayout.LayoutParams textviewParams = <span style="color: #0000ff;">new</span><span style="color: #000000;"> LinearLayout.LayoutParams(ViewGroup.LayoutParams.FILL_PARENT,
      ViewGroup.LayoutParams.WRAP_CONTENT);</span></pre>
</div>
<p>接着在线性布局对象中加入这个TextView</p>
<div class="cnblogs_code">
<pre>layout.addView(textView,textviewParams);<span style="color: #008000;">//</span><span style="color: #008000;">加入的同时，也就设置了TextView相对于布局对象的布局属性 android:layout_width 与 android:layout_height</span></pre>
</div>
<div>
<div>最后一步，设置本Activity的顶级界面为线性布局</div>
<div>
<div class="cnblogs_code">
<pre>setContentView(layout,layoutParams); <span style="color: #008000;">//</span><span style="color: #008000;">同时也就设置了布局对象的android:layout_width 与 android:layout_height</span></pre>
</div>
<p><span style="color: #ff0000;">个人猜想：控件的属性分为 控件自身特性属性 与布局属性：即与父控件的关系属性.</span></p>
<p>&nbsp;</p>
<p><strong><span style="color: #000000;">LayoutParams的理解与应用：</span></strong></p>
<p><span style="color: #000000;">&nbsp; &nbsp; &nbsp; 
&nbsp;LayoutParams相当于一个Layout的信息包，它封装了Layout的位置、高、宽等信息。假设在屏幕上一块区域是由一个
Layout占领的，如果将一个View添加到一个Layout中，最好告诉Layout用户期望的布局方式，也就是将一个认可的
layoutParams传递进去。<br>&nbsp; &nbsp;&nbsp; &nbsp; 可以这样去形容LayoutParams，在象棋的棋盘上，每个棋子都占据一个位置，也就是每个棋子都有一个位置的信息，如这个棋子在4行4列，这里的“4行4列”就是棋子的LayoutParams。</span></p>
<p><span style="color: #ff0000;">&nbsp; &nbsp; &nbsp; &nbsp;但LayoutParams类也只是简单的描述了宽高，宽和高都可以设置成三种值：<br>&nbsp; &nbsp;&nbsp; &nbsp;<strong> 1，一个确定的值；<br> &nbsp; &nbsp;&nbsp; &nbsp; 2，FILL_PARENT，即填满（和父容器一样大小）；<br> &nbsp; &nbsp;&nbsp; &nbsp; 3，WRAP_CONTENT，即包裹住组件就好。</strong></span></p>
<p>&nbsp;</p>
<p>在JAVA中动态构建的布局，常常这样写：</p>
<div class="cnblogs_code">
<pre>setLayoutParams(new LayoutParams(LayoutParams.FILL_PARENT, LayoutParams.FILL_PARENT));</pre>
</div>
<p>上面这一句话其实是子对父的，也就是说，父布局下的子控件要设置这句话。</p>
<p>因为布局很多，虽然都继承至ViewGroup但是各个布局还是有很大的不同。</p>
<p>很显然上面这句应该这样写才算准确：</p>
<div class="cnblogs_code">
<pre>setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.FILL_PARENT,TableRow.LayoutParams.FILL_PARENT));</pre>
</div>
<p>下面分别说下两个常用到布局:</p>
<p>1. FrameLayout下动态设置子控件居中，动态用JAVA代码要这样实现:</p>
<div class="cnblogs_code">
<pre>FrameLayout.LayoutParams lytp = new FrameLayout.LayoutParams(80,LayoutParams.WRAP_CONTENT);
lytp .gravity = Gravity.CENTER;
btn.setLayoutParams(lytp);</pre>
</div>
<p>2. RelativeLayout下动态设置子控件居中：</p>
<div class="cnblogs_code">
<pre>RelativeLayout.LayoutParams lp=new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT); 
lp.addRule(RelativeLayout.ALIGN_PARENT_RIGHT, RelativeLayout.TRUE); 
lp.addRule(RelativeLayout.ALIGN_PARENT_TOP, RelativeLayout.TRUE); 
btn1.setLayoutParams(lp);</pre>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div>
<div>在实际开发中LayoutInflater这个类还是非常有用的，它的作用类似于findViewById()。</div>
<div>不同点是LayoutInflater是用来找res/layout/下的xml布局文件，并且实例化；</div>
<div>而findViewById()是找xml布局文件下的具体widget控件(如Button、TextView等)。</div>
<div>&nbsp;</div>
<div>具体作用：</div>
<div>1、对于一个没有被载入或者想要动态载入的界面，都需要使用LayoutInflater.inflate()来载入；</div>
<div>2、对于一个已经载入的界面，就可以使用Activiyt.findViewById()方法来获得其中的界面元素。</div>
<div>LayoutInflater 是一个抽象类，在文档中如下声明：</div>
<div>public abstract class LayoutInflater extends Object</div>
<div>获得 LayoutInflater 实例的三种方式</div>
<div>1. LayoutInflater inflater = getLayoutInflater();//调用Activity的getLayoutInflater()&nbsp;</div>
<div>2. LayoutInflater inflater = LayoutInflater.from(context); &nbsp;</div>
<div>3. LayoutInflater inflater = &nbsp;(LayoutInflater)context.getSystemService</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
(Context.LAYOUT_INFLATER_SERVICE);</div>
<div>其实，这三种方式本质是相同的，从源码中可以看出：</div>
<div>getLayoutInflater()：</div>
<div>Activity 的 getLayoutInflater() 方法是调用 PhoneWindow 的getLayoutInflater()方法，看一下该源代码：</div>
<div>public PhoneWindow(Context context)</div>
<div>{ &nbsp;&nbsp;</div>
<div>&nbsp;super(context); &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; mLayoutInflater = LayoutInflater.from(context);</div>
<div>}</div>
<div>可以看出它其实是调用 LayoutInflater.from(context)。</div>
<div>LayoutInflater.from(context)：</div>
<div>public static LayoutInflater from(Context context)</div>
<div>{ &nbsp;&nbsp;</div>
<div>&nbsp;LayoutInflater LayoutInflater = (LayoutInflater) context.getSystemService</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(Context.LAYOUT_INFLATER_SERVICE);</div>
<div>&nbsp; &nbsp; if (LayoutInflater == null)</div>
<div>&nbsp; &nbsp; { &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;throw new AssertionError("LayoutInflater not found."); &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; } &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; return LayoutInflater;</div>
<div>}</div>
<div>&nbsp;</div>
<div>可以看出它其实调用 context.getSystemService()。</div>
<div>&nbsp;</div>
<div><strong>结论：所以这三种方式最终本质是都是调用的Context.getSystemService()。</strong></div>
<div>&nbsp;</div>
<div>另外getSystemService()是Android很重要的一个API，它是Activity的一个方法，根据传入的NAME来取得对应的Object，然后转换成相应的服务对象。</div>
<div>&nbsp;</div>
<div>以下介绍系统相应的服务。</div>
<div>&nbsp;</div>
<div>传入的Name 返回的对象 说明</div>
<div>WINDOW_SERVICE WindowManager 管理打开的窗口程序</div>
<div>LAYOUT_INFLATER_SERVICE LayoutInflater 取得xml里定义的view</div>
<div>ACTIVITY_SERVICE ActivityManager 管理应用程序的系统状态</div>
<div>POWER_SERVICE PowerManger 电源的服务</div>
<div>ALARM_SERVICE AlarmManager 闹钟的服务</div>
<div>NOTIFICATION_SERVICE NotificationManager 状态栏的服务</div>
<div>KEYGUARD_SERVICE KeyguardManager 键盘锁的服务</div>
<div>LOCATION_SERVICE LocationManager 位置的服务，如GPS</div>
<div>SEARCH_SERVICE SearchManager 搜索的服务</div>
<div>VEBRATOR_SERVICE Vebrator 手机震动的服务</div>
<div>CONNECTIVITY_SERVICE Connectivity 网络连接的服务</div>
<div>WIFI_SERVICE WifiManager Wi-Fi服务</div>
<div>TELEPHONY_SERVICE TeleponyManager 电话服务</div>
<div>inflate 方法</div>
<div>通过 sdk 的 api 文档，可以知道该方法有以下几种过载形式，返回值均是 View 对象，如下：</div>
<div>public View inflate (int resource, ViewGroup root)&nbsp;</div>
<div>public View inflate (XmlPullParser parser, ViewGroup root)</div>
<div>public View inflate (XmlPullParser parser, ViewGroup root, boolean attachToRoot) &nbsp;</div>
<div>public View inflate (int resource, ViewGroup root, boolean attachToRoot)</div>
<div>示意代码：</div>
<div>LayoutInflater inflater = (LayoutInflater)getSystemService(LAYOUT_INFLATER_SERVICE); &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>View view = inflater.inflate(R.layout.custom, (ViewGroup)findViewById(R.id.test)); &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>//EditText editText = (EditText)findViewById(R.id.content);// error&nbsp;</div>
<div>EditText editText = (EditText)view.findViewById(R.id.content);</div>
<div>对于上面代码，指定了第二个参数 ViewGroup root，当然你也可以设置为 null 值。</div>
<div>注意：</div>
<div>·inflate 方法与 findViewById 方法不同；</div>
<div>·inflater 是用来找 res/layout 下的 xml 布局文件，并且实例化；</div>
<div>·findViewById() 是找具体 xml 布局文件中的具体 widget 控件(如:Button、TextView 等)。</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</div></div><div id="MySignature"></div>
', 0, CAST(0x0000AA3C00AE69BC AS DateTime), N'~/images/noteimages/3.jpg', 3)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'10086', N'普通程序员，三年成为年薪70w架构师，只因做到了这些', N'每个程序员、或者说每个工作者都应该有自己的职业规划，如果你不是富二代，不是官二代，也没有职业规划，希望你可以思考一下自己的将来。今天给大家分享的是一篇来自阿里Java架构师对普通程序员的职业建议，希望对你有启发。', N'
<div id="article_content" class="article_content csdn-tracking-statistics tracking-click">
<p><span>工作年限：8 年服务公司：4 家（含四大门户中的两家）最近职业：Java 架构师职场关键词：社交平台、高并发系统架构设计、技术团队管理、多款从零到一的产品城市！</span></p>
<p><span>六年间，这位职人呆过四大门户中的两家，完成了工程师到架构师的蜕变。经手多款从零到一产品的开发和增长，也经历国内最大社交平台亿级流量和用户的架构设计及优化工作。工作上思路清晰、认真负责，是同事们心目中优秀 Problem Solver。</span></p>
<p><span>问：介绍一下你自己？</span></p>
<p><span>答</span>：我 2008 年硕士毕业后，前 2 年在一家传统 IT 公司，最近 6 年在互联网公司，历任 Java 
开发工程师、高级工程师、架构师等职位。工作内容上，经历过多款产品从零到一的诞生开发过程，也经手过国内用户、内容和流量最大的社交/社区产品的架构改
造优化工作，有丰富的社交产品的研发经验，目前在一家创业公司担任技术合伙人。</p>
<p><span>问：你擅长的技术领域是什么？</span></p>
<p><span>答</span>：擅长的编程语言是 Java、Golang、Scala，熟悉程度依次递减。专注于高性能、高并发系统架构设计和实现。</p>
<p><span>问：平时怎么向家人解释你的工作是做什么的？</span></p>
<p><span>答</span>：一般不详细解释，即使解释了也是徒劳。所以他们会按照自己的理解来描述我的工作，比如修电脑的，比如卖手机的。</p>
<p><span>问：你觉得程序员可以当一辈子吗？有没有想象过自己 40 岁时在做什么？</span></p>
<p><span>答</span>：应该还是会从事开发方面的工作吧，外企中有很多上了年岁的程序员啊。</p>
<p><span>问：合作过程中，你觉得优秀产品经理最重要的三个特质是什么？</span></p>
<p><span>答</span>：逻辑思维能力；对数据敏感；不错的语言和文字表达能力；当然如果能写点儿代码就跟好了。。。</p>
<p><span>问：你最欣赏的软件工程师是谁？</span></p>
<p><span>答</span>：Linus Torvalds 和 Doug Lea</p>
<p><span>问：在你心目中，具备哪些素质才能称之为全栈工程师？</span></p>
<p><span>答</span>：我觉得要成为一个全栈工程师首先要有好的学习能力，对新的技术能够摒弃偏见，快速了解它解决的问题以及如何解决的；其次要对技术保有好奇心；最后是有极强的动手能力，不拖延，说干就干。</p>
<p><span>问：你觉得一个优秀 CTO 最宝贵的品质是什么？</span></p>
<p><span>答</span>：</p>
<ul class="list-paddingleft-2" style="list-style:none;"><li style="list-style:none;">
<p>广阔的技术视野，让先进的技术解决实际的问题；</p>
</li><li style="list-style:none;">
<p>熟悉所在的业务领域，根据所在领域的实际情况确定系统架构和系统容量；</p>
</li><li style="list-style:none;">
<p>团队管理能力，构建团队人才梯队，打造一个技术型团队。</p>
</li></ul><p><span>问：你觉得世界上存在最好的编程语言吗？如果有，是什么语言？</span></p>
<p><span>答</span>：没有最好的，只有最合适的。任何语言都是为了解决某一方面的问题而出现，所以无谓好坏。</p>
<p><span>问：工作中最喜欢或讨论的设计师分别是什么样的？</span></p>
<p><span>答</span>：有产品思维，能够和产品经理一起确认交互细节甚至产品方向的设计师。</p>
<p><span>问</span>：<span>如果JAVA的软件工程师 3 条建议，你会写什么？</span></p>
<p><span>答</span>：</p>
<ul class="list-paddingleft-2" style="list-style:none;"><li style="list-style:none;">
<p>重视基础知识（算法、操作系统、网络等等）</p>
</li><li style="list-style:none;">
<p>拓宽技术视野。多去参加技术沙龙，看看别人的牛逼是怎么吹的；多关注感兴趣的开源项目</p>
</li><li style="list-style:none;">
<p>保护好颈椎和腰椎(⊙o⊙)…</p>
</li></ul><p><span>问</span>：<span>做了 8 年软件工程师，现在对自己的定位是怎样的，对下一份工作有什么样的期待？</span></p>
<p><span>答</span>：</p>
<ul class="list-paddingleft-2" style="list-style:none;"><li style="list-style:none;">
<p>目前我对自己的定位是一个架构师或者是团队 Leader；</p>
</li><li style="list-style:none;">
<p>对于下一份工作，要么是在一个有着浓烈技术氛围和高并发平台的大型公司中做一个螺丝钉；要么是在有发展前景的创业公司做一个领头人；</p>
</li><li style="list-style:none;">
<p>公司阶段最好在 B 轮或者以后；</p>
</li><li style="list-style:none;">
<p>行业方面除了游戏，其他都 OK。</p>
</li></ul><p><span><span>问</span>：你当时是怎么学习的？</span></p>
<p>答：架构师是一个充满挑战的职业，知识面的宽窄往往决定着一个架构师的架构能力，所以在这一点上我比较赞成你的学习方式，就是要阅读大量的技术书
籍，但我希望你不要仅限于软件相关的书籍，经常泡技术论坛，一方面可以结交朋友，一方面可以增加自己的知识面，还可以加入一下技术博客，还可以加一个架构
群交流。</p>
<p><span>PS：推荐一个JAVA架构交流群：629740746</span></p>
<p><span>问</span>：<span>你觉得Java架构师了解的东西有哪些？</span></p>
<p><span>答：</span></p>
<p><span>初级Java程序员的重心在编写代码、运用框架-&gt;中级Java程序员重心在编写代码和框架-&gt;高级Java程序员技术攻关、性能调优-&gt;架构师 解决业务和技术问题</span></p>
<h1 style="font-weight:400;line-height:1.1;color:inherit;">
<span>中级后端程序员提升薪资的重要点在于：</span></h1>
<p>1.项目经验：支付，通知，IM，短信等公用模块快迅实现。</p>
<p>2.代码质量：抽象封装，日志规范，发布流程，快速定位。</p>
<p>3.性能优化：服务器的内存，硬盘，数据增长量，带宽，系统中最消耗性能的地方，一个请求需要调用哪些服务，每次访问DB的时间是多久。</p>
<p>4.架构能力：分布式，负载均衡，读写分离。</p>
<p>5.选型能力：JMS，SOA/SCA/微服务，MongoDB/Redis/Memcache,Java/Go/NodeJS等。</p>
<p>6.管理能力：团队技术分享组织，项目风险控制，任务和工作的分配</p>
<p>7.需求评审能力：很快给出反馈建议，多长时间能够完成，技术风险点在哪，有没有花费时间长，又不重要的需求。</p>
<p>8.Geek能力：对某一个技术点研究的特别深入，比如说Nginx的配置，设计，构架。ElasticSearch的设计，优势。</p>
<p><span><br></span><span>问</span>：<span>你以前是如何学习的？</span><span>有没有Java高级学习路线？</span></p>
<p><span>答：我规划了几张体系图，可以了解一下。</span></p>
<div class="divimg"><img src="../images/ArticleImages/noteid4img1.jpg" alt="从普通JAVA程序员到阿里架构师，他用了六年" /></div>
<p class="pgc-img-caption">
分布式架构专题</p>
<div class="divimg"><img src="../images/ArticleImages/noteid4img2.jpg" alt="从普通JAVA程序员到阿里架构师，他用了六年" /></div>
<p class="pgc-img-caption">
团队协作效率</p>
<div class="divimg"><img src="../images/ArticleImages/noteid4img3.jpg" alt="从普通JAVA程序员到阿里架构师，他用了六年" /></div>
<p class="pgc-img-caption">
微服务架构专题</p>
<div class="divimg"><img src="../images/ArticleImages/noteid4img4.jpg" alt="从普通JAVA程序员到阿里架构师，他用了六年" /></div>
<p class="pgc-img-caption">
性能优化</p>
<div class="divimg"><img src="../images/ArticleImages/noteid4img5.jpg" alt="从普通JAVA程序员到阿里架构师，他用了六年" /></div>
<p class="pgc-img-caption">
源码分析</p>
<p><span>PS：获取高清图片加架构群：629740746</span></p>
<p><span>同时即可获得</span></p>
<p><span style="color:rgb(53,53,53);font-size:14px;">大互联网公司精选面试！</span><br style="color:rgb(53,53,53);font-size:14px;"><span style="color:rgb(53,53,53);font-size:14px;">【JAVA架构资料】！</span><br style="color:rgb(53,53,53);font-size:14px;"><span style="color:rgb(53,53,53);font-size:14px;">【双十一架构高清体系图】</span><br style="color:rgb(53,53,53);font-size:14px;"><span style="color:rgb(53,53,53);font-size:14px;">【经典书籍】</span><br></p>
<div><span style="color:rgb(53,53,53);font-size:14px;"><br></span></div>
</div>
            </div>
                      </div>
	</article>
</div>
', 0, CAST(0x0000AA3C00C5DEB9 AS DateTime), N'~/images/noteimages/4.jpg', 4)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'黄混岗', N'18岁欧阳娜娜为陈冠希当模特，身材又胖又壮？网友：惊呆！', N'哈喽，筒子们。超级无敌大八卦的哔宝来也！搜尽天下娱乐事，那都不是事儿，只要你想看的这里都有哦，还在等什么，快点跟随哔宝的脚步，开启密探模式吧！', N'
<p style="line-height:40px;font-size: 16px;color:#222;font-weight:400;text-indent:2em;text-align:justify;">哈喽，筒子们。超级无敌大八卦的哔宝来也！搜尽天下娱乐事，那都不是事儿，只要你想看的这里都有哦，还在等什么，快点跟随哔宝的脚步，开启密探模式吧！</br>
不论别人怎么打击、怎么黑她，依然坚持做好自己的这份决心，真是值得我们赞赏滴！</p>

', 101, CAST(0x0000AA3C01200B5C AS DateTime), N'~/images/noteimages/5.jpg', 5)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'记忆的天空', N'绿茶婊聊天记录曝光！这手段一般人真顶不住', N'说起“绿茶婊”，似乎已经是个过气网红般的概念了。但她们还依旧存活于现实世界中，而且还杀伤力惊人', N'
<center>作为一个集万千宠爱于一身的</center>

<center>高颜值高智商的我</center>

<center>经常被粉丝在后台问这样一个问题：</center>

<center>这世界上的男生是真的分不出绿茶婊吗？</center>



<center>对此我只想说</center>

<center>没有发现不了的绿茶婊</center>

<center>只有调教不好的男朋友</center>

<center>比如遇到下面这样的绿茶婊</center>

<center>是如何通过自己的高明手段</center>

<center>把女主气死</center>

<center>还让男朋友帮忙说话</center>



<center>男朋友想送女友一支口红</center>

<center>于是问了身边的女生朋友帮忙挑选</center>

<center>结果女朋友收到口红的那一刻</center>

<center>心态就爆炸了</center>

<center>......</center>
', 16, CAST(0x0000AA3C01200B5C AS DateTime), N'~/images/noteimages/6.jpg', 6)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'记忆的天空', N'陈妍希演紫霞成“紫薯包”，选择适合自己的风格非常重要', N'大家好，这里是芳芳～欢迎来到：芳芳的爱美圣经（ID：weare_shopaholics），关注同名公众号，每天分享各种变美小技巧～最近，陈妍希挑战了一个很经典的角色——紫霞仙子。', N'
<p style="line-height:40px;font-size: 16px;color:#222;font-weight:400;text-indent:2em;text-align:justify;">本身就是那种领嫁女孩般气质的陈妍希前几年竟然接拍了《神雕侠侣》，在剧中饰演“姑姑”，而在此之前，刘亦菲版和李若彤版的“姑姑”早已深入人心。
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid7img1.jpg" />
　　
<br/>陈妍希的新版“姑姑”一上线就被广大网友群讽，说其是“小笼包姑姑”，毫无仙气不说在剧里的武打动作也没有任何美感可言。而在绳子上睡觉的经典场景与刘亦菲或者李若彤比起来也是差了好多。
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid7img2.jpg" />
　　
<br/>单看陈妍希的颜其实还是很不错的，肉肉的脸也很可爱，不然当初在《那些年》中也不会给人一种初恋般的感觉的，只是并不适合这种古装仙女类的角色罢了。本以为通过《神雕侠侣》中的“姑姑”一角已经认识到自己不足之处的陈妍希会就此罢手，但事实恰恰与之相反。
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid7img3.jpg" />
　　
<br/>日前，舞台剧《大话西游之大圣娶亲》在梅兰芳大剧院首次公开演出。该剧的“紫霞仙子”就是陈妍希出演。对比一下朱茵版的紫霞仙子和现如今的陈妍希版，网友们调侃陈妍希演紫霞却演成了“紫薯包”，还是一如既往的群嘲。
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid7img4.jpg" />
　
<br/>“陈妍希为什么老演不适合自己气质的仙女角色呢”、“为什么她永远没有自知之明呢？从小龙女，到紫霞仙子其实她可以演适合自己的角色，当初《那些年》也挺好的啊。”
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid7img5.jpg" />
　　
<br/>近日，在出席某活动时谈及出演紫霞仙子面对的争议，陈妍希坦言有看网友的评论，幽默回应“紫霞”像“紫薯包”等调侃：“看到都觉得满饿的，但最近确实不太瘦，就当作警惕自己。”</p>

', 1001, CAST(0x0000AA3C01200B5C AS DateTime), N'~/images/noteimages/7.jpg', 7)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'飞翔的企鹅', N'迪士尼，你大爷还是你大爷', N'什么叫情怀爆灯？让全球粉丝嗷嗷等了6年，首款预告一出手，马上成爆款。24小时全球观看量超1.16亿，登顶“史上最火动画预告”。只能是它，《冰雪奇缘2》。', N'
<p>什么叫情怀爆灯？</p>

<p>让全球粉丝嗷嗷等了6年，首款预告一出手，马上成爆款。</p>

<p>24小时全球观看量超1.16亿，登顶“史上最火动画预告”。</p>

<p>只能是它，《冰雪奇缘2》。</p>

<p>讲真，Sir不认为这只是情怀。</p>

<p>更是我们对《冰雪奇缘》硬实力的期待。</p>

<p>光这2分钟的预告，又是一次大开眼界——</p>

<p>剧情上看，第二部更趋暗黑。</p>

<p>艾莎为啥苦练海上漂，安娜拔剑砍向谁？</p>

<p>北美定档今年11月，要等答案，还需耐心。</p>

<p>但正片上映前，就这预告片就够嗨好久了。</p>

<p>坦白说，logo出现前的41秒时间，Sir已经傻眼了。</p>

<p>第一次看没什么，可越看越觉得这些画面里的东西……</p>

<p>真实得可怕。</p>

<p>比如，海。</p>

<p>第一个远景，恢弘磅礴。</p>

<p>镜头拉近，看到浪花的形状和深浅不一的层次。</p>

<p>再拉近，到脚踝处——</p>

<p>随运动而溅起的水雾也一清二楚。</p>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img1.gif" />
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img2.gif" />
<centre>没完，更可怕是无形之中的细节。</centre>
<p>比如风和光。</p>

<p>艾莎独自面对海洋，镜头切到近景——</p>

<p>打在她脸上的闪电，和吹拂在发梢的海风都是连贯的。</p>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img3.gif" />
<p>不，这根本不是重点。</p>

<p>接下来这个细节，才足以证明迪士尼动画变态式的讲究。</p>

<p>注意衣服上的宝石，随着她一次深呼吸……</p>

<p>胸腔的运动导致反光角度细微地改变一下。</p>

<p>放大看，发生了什么——</p>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img4.gif" />
<p>Sir真不是故意盯着胸看的</p>

<p>没错，钻石因为折射，闪了一下。</p>

<p>气愤吗！可怕吗！</p>

<p>这已经不是强迫症了，是强迫症晚期了啊！</p>

<p>越放大越惊喜。</p>

<p>你以为宝石只有一颗吗，其实整件衣服，密密麻麻。</p>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img5.jpg" />
<p>发丝、唇纹和衣服的一针一线，全部精细做工，栩栩如生。</p>
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img6.jpg" />
<img style=" display:block;max-width:800px;height:auto;margin:20px auto 20px auto;" src="../images/ArticleImages/noteid8img7.jpg" />
<p>再来看这张全员眺看江山美景图。</p>

<p>构图、颜色，整体看，美啊。</p>

<p>呵呵。</p>

<p>放大看，你才惊呼——变态啊！</p>

<p>甭管你放大哪里，都挑不出瑕疵。</p>
', 21, CAST(0x0000AA3C01200B5C AS DateTime), N'~/images/noteimages/8.jpg', 8)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'飞翔的企鹅', N'随便写的一篇文章', N'你就将就着看吧', N'
<p>巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉</p>
<p>巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉做法发顺丰很多事</p>
<p>巴拉巴拉巴拉巴拉巴拉巴拉巴巴拉巴拉做法发顺丰很多事巴拉巴拉做法发顺丰很多事拉巴拉巴拉巴拉巴拉</p>
<p>巴拉巴拉巴拉巴拉做法发顺丰很多事巴拉巴拉做法发顺丰很多事巴拉巴拉做法发顺丰很多事巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉</p>
', 0, CAST(0x0000AA4100BE8E89 AS DateTime), N'~/images/noteimages/10.jpg', 10)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'10086', N'千瓦时', N'是的函数', N'1瓦哈二分
', 1, CAST(0x0000AA5A01187D01 AS DateTime), N'~/images/noteimages/noteimage.jpg', 16)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'记忆的天空', N'杀得好杀得好', N'沙发啥的哈哈水电费', N'1135发生的话SD敢达是广大跟不上的风格不是的更好的时候', 0, CAST(0x0000AA5D016A8D39 AS DateTime), N'~/images/noteimages/noteimage.jpg', 17)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'记忆的天空', N'是的函数', N'啥的婚纱发送到', N'1111都是好的试婚纱大杀得好杀得好啥的&#183;
', 0, CAST(0x0000AA5D016B8385 AS DateTime), N'~/images/noteimages/noteimage.jpg', 18)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'10086', N'思维方式', N'水电费第三个', N'<div>111111111112222222222233333333333</div>
<div>是的好多大好时光的<br />
</div>
<div><br />
</div>
', 0, CAST(0x0000AA5D016CB645 AS DateTime), N'~/images/noteimages/noteimage.jpg', 19)
INSERT [dbo].[notes] ([userid], [notetitle], [noteintro], [notecontent], [getlike], [notedate], [noteimage], [noteid]) VALUES (N'记忆的天空', N'我要写文章', N'随便吧暗示防守打法', N'打个电话的韩国代购鞍山市第三方
', 1, CAST(0x0000AA5E00B61247 AS DateTime), N'~/images/noteimages/noteimage.jpg', 20)
SET IDENTITY_INSERT [dbo].[notes] OFF
/****** Object:  Table [dbo].[comment]    Script Date: 06/02/2019 17:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comment](
	[userid] [varchar](16) NOT NULL,
	[noteid] [varchar](10) NOT NULL,
	[commenttext] [text] NULL,
	[getlike] [int] NULL,
	[commentdate] [datetime] NULL,
	[comid] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'小张三', N'2', N'文章写的很好，给你个赞', 0, CAST(0x0000AA3C00AE69BD AS DateTime), 1)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'10086', N'1', N'终于知道地球为什么是圆的了', 0, CAST(0x0000AA3C00AE69BD AS DateTime), 2)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'黄混岗', N'3', N'文章还行', 0, CAST(0x0000AA3C011EAACE AS DateTime), 3)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'4', N'拒绝996，从我做起', 0, CAST(0x0000AA3C011EAACF AS DateTime), 4)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'飞翔的企鹅', N'4', N'学到了，很不错', 0, CAST(0x0000AA3C011EAACF AS DateTime), 5)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'3', N'感谢作者，终于学会了', 0, CAST(0x0000AA3C011EAACF AS DateTime), 6)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'admin', N'1', N'哈哈哈，我是管理员', 0, CAST(0x0000AA52017DDEF0 AS DateTime), 9)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'10086', N'1', N'暗示和啊啊啊啊啊啊啊', 1, CAST(0x0000AA52017E8604 AS DateTime), 12)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'6', N'哈哈哈哈哈哈', 7, CAST(0x0000AA5D00B59912 AS DateTime), 13)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'6', N'哈哈哈哈哈哈', 2, CAST(0x0000AA5D00B5B4DA AS DateTime), 14)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'6', N'哈哈哈哈哈哈哈哈哈哈哈', 2, CAST(0x0000AA5D00B5BFAB AS DateTime), 15)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'6', N'我去你的阿达萨达', 1, CAST(0x0000AA5D00B632E2 AS DateTime), 16)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'8', N'啊十大', 1, CAST(0x0000AA5D0154EDE8 AS DateTime), 17)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'16', N'哈哈哈哈哈哈哈', 1, CAST(0x0000AA5E00B59739 AS DateTime), 18)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'16', N'啊啊啊啊啊啊', 1, CAST(0x0000AA5E00B5CD20 AS DateTime), 19)
INSERT [dbo].[comment] ([userid], [noteid], [commenttext], [getlike], [commentdate], [comid]) VALUES (N'记忆的天空', N'20', N'我的和尚', 1, CAST(0x0000AA600119E644 AS DateTime), 20)
SET IDENTITY_INSERT [dbo].[comment] OFF
/****** Object:  Table [dbo].[attention]    Script Date: 06/02/2019 17:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[attention]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[attention](
	[userid] [varchar](20) NULL,
	[attent] [varchar](20) NULL,
	[attdate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'飞翔的企鹅', CAST(0x0000AA5E00B859A8 AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'记忆的天空', CAST(0x0000AA5F0143165E AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'我的天空', CAST(0x0000AA5F014505CF AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'黄混岗', CAST(0x0000AA6000BCB138 AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'10086', CAST(0x0000AA6000BCBD36 AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'小张三', CAST(0x0000AA6000BCC5C5 AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'刘德华', CAST(0x0000AA6001197591 AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'我是小网友', CAST(0x0000AA6000BCF37E AS DateTime))
INSERT [dbo].[attention] ([userid], [attent], [attdate]) VALUES (N'记忆的天空', N'我的世界', CAST(0x0000AA6001198B02 AS DateTime))
/****** Object:  Default [con_ssex]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[con_ssex]') AND parent_object_id = OBJECT_ID(N'[dbo].[users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[con_ssex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [con_ssex]  DEFAULT ('男') FOR [ssex]
END


End
GO
/****** Object:  Default [con_getlike]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[con_getlike]') AND parent_object_id = OBJECT_ID(N'[dbo].[users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[con_getlike]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [con_getlike]  DEFAULT ((0)) FOR [getlike]
END


End
GO
/****** Object:  Default [DF_users_userheader]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_users_userheader]') AND parent_object_id = OBJECT_ID(N'[dbo].[users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_users_userheader]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_userheader]  DEFAULT (N'~/images/userimages/notuser.png') FOR [userheader]
END


End
GO
/****** Object:  Default [DF__notes__getlike__0AD2A005]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__notes__getlike__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[notes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__notes__getlike__0AD2A005]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[notes] ADD  CONSTRAINT [DF__notes__getlike__0AD2A005]  DEFAULT ((0)) FOR [getlike]
END


End
GO
/****** Object:  Default [con_getdate]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[con_getdate]') AND parent_object_id = OBJECT_ID(N'[dbo].[notes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[con_getdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[notes] ADD  CONSTRAINT [con_getdate]  DEFAULT (getdate()) FOR [notedate]
END


End
GO
/****** Object:  Default [DF_notes_noteimage]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_notes_noteimage]') AND parent_object_id = OBJECT_ID(N'[dbo].[notes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_notes_noteimage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[notes] ADD  CONSTRAINT [DF_notes_noteimage]  DEFAULT ('~/images/noteimages/noteimage.jpg') FOR [noteimage]
END


End
GO
/****** Object:  Default [DF__comment__getlike__0BC6C43E]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__comment__getlike__0BC6C43E]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__comment__getlike__0BC6C43E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [getlike]
END


End
GO
/****** Object:  Default [con_getcomdate]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[con_getcomdate]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[con_getcomdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [con_getcomdate]  DEFAULT (getdate()) FOR [commentdate]
END


End
GO
/****** Object:  Default [DF_attention_attdate]    Script Date: 06/02/2019 17:13:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_attention_attdate]') AND parent_object_id = OBJECT_ID(N'[dbo].[attention]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_attention_attdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[attention] ADD  CONSTRAINT [DF_attention_attdate]  DEFAULT (getdate()) FOR [attdate]
END


End
GO
