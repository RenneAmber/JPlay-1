<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/7/5
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Web App Capable-->
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>私信</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no,maximum-scale=1.0">
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/profile-style.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
    <!-- Owl Carousel Assets -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- blueimp Gallery styles -->
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="css/jquery.fileupload.css">
    <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
    <!-- CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" href="css/jquery.fileupload-noscript.css"></noscript>
    <noscript><link rel="stylesheet" href="css/jquery.fileupload-ui-noscript.css"></noscript>

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/jsp5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>


    <!-- 获取时间-->
    <script language="javascript">
        function realSysTime(clock){
            var now=new Date(); //创建Date对象
            var year=now.getFullYear(); //获取年份
            var month=now.getMonth(); //获取月份
            var date=now.getDate(); //获取日期
            var hour=now.getHours(); //获取小时
            var minute=now.getMinutes(); //获取分钟
            month=month+1;
            var time;
            var complete_time;
            if(minute<10) {
                complete_time = year + "年" + month + "月" + date + "日 " + " " + hour + ":0" + minute; //组合系统时间
                time=hour + ":0" + minute;
            }
            else
            {
                complete_time=year+"年"+month+"月"+date+"日 "+" "+hour+":"+minute; //组合系统时间
                time=hour + ":" + minute;
            }
            clock.innerHTML=complete_time; //显示系统时间

        }
        window.onload=function(){
            window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间
        }
    </script>
    <!-- Opacity -->
    <style>
        body {background-color: #f0f0f0}

    </style>

</head>
<body id="wrapper" >
<div class="wrap-body">


    <!--////////////////////////////////////Header-->
    <header>
        <div class="wrap-header">
            <div class="zerogrid">
                <div class="row">
                    <a href="index.jsp" class="logo"><img src="images/111.jpg" /></a>
                    <ul class="social">
                        <%--<li><a href="upload.jsp" title="Upload Video" style="color:#ffffdd" ><i class="fa fa-upload"></i>上传</a></li>--%>
                        <% String loginUsername = (String)session.getAttribute("username");
                            if(loginUsername == null)
                                out.print("<script> alert('Sorry,you shall LOGIN first!!'); window.location='login.jsp';</script>");
                            else{ %>
                        <li><a href="upload.jsp" title="Upload Video" style="color:#ffffdd" ><i class="fa fa-upload"></i>上传</a></li>
                        <li><a href="userProfile.jsp" title="Profile" style="color:#ffffdd"><i class="fa fa-renren"></i>个人信息</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="profile">
        <div class="profile-table">
            <!-- 左边栏，罗列出功能-->
            <h2 style="font-family: 微软雅黑;"><b>功能</b></h2>
            <hr  style="height:1px;border:none;border-top:1px solid #555555;" />
            <ul style="color: grey">

                <li><a href="userProfile.jsp"><i class="fa fa-info" style="color:limegreen"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人信息</a></li>
                <li><a href="#"><i class="fa fa-video-camera" style="color:orange"></i>&nbsp;我的收藏</a></li>
                <li><a href="#"><i class="fa fa-tags" style="color:red;"></i>&nbsp;我的订阅</a></li>
                <li><a href="#"><i class="fa fa-comment" style="color:dodgerblue"></i>&nbsp;我的私信</a></li>
                <li><a href="#"><i class="fa fa-home" style="color:skyblue"></i>&nbsp;兴趣部落</a></li>
                <li><a href="myupload.action"><i class="fa fa-apple" style="color: #ff72c4"></i>&nbsp;我的上传</a></li>
            </ul>
        </div>

        <div class="profile-content" >
            <form class="content" action="secretLetter">
                <i class="icon-bar"></i>
                <p>发送给：<input type="text" value="qwe" name="sender" readonly></p>
                <p>内容：<textarea value="" name="letterContent"></textarea></p>
                <button type="reset" id="reset_button">清 除</button>
                <button type="submit" id="submit_button" >提 交</button>
                <p>&nbsp;</p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
