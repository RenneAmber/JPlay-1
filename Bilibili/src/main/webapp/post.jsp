<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/7/15
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.pojo.InterestGroup" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <!-- Web App Capable-->
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>兴趣部落</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no,maximum-scale=1.0">
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style.css">
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

    <!-- 发帖 -->
    <script>
        //发帖模态框
        function postModal()
        {
            $("#post_modal").modal("show");
        }
        function send_post(groupId,username)
        {
            var text=document.getElementById("post_content");
            var param={"interestsGroupId": groupId,"postContent":text.value};
            var content=document.getElementById("post-field");
//            var count=document.getElementById("post_id");
            $.ajax({
                url: "sendPost.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:param,
                // 回调函数，接受服务器端返回给客户端的值，即result值
                beforeSend:function() {},
                success : function() {
                    $("#post_modal").modal("hide");

                    content.innerHTML= '<li class="post_add"><img src="images/10.jpg" alt="image"/>'+
                            '<div class="user_info"><div class="user_name">'+
                            '<h4><b>'+username+' </b><span class="date_time">'+
                            complete_time+'</span></h4></div><div class="post-content">'+
                            text.value+'</div><div class="bottom-function"></div></div></li>'+
                            content.innerHTML;
                    text.value='';
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("系统发生错误，请稍后再试！");
                }
            });

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
                        <li><a href="" title="Application"  ><i class="fa fa-plus"></i>申请管理员</a></li>
                        <li><a href="" title="Exit"><i class="fa fa-sign-out"></i>退出部落</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--////////////////////////////////////Container-->
    <section id="container" class="index-page">
        <div class="wrap-container zerogrid">
            <!-- Title & Post-->
            <section class="IGreply">
                <div class="left" style="min-height: 578px;">
                    <div class="reply-head">
                        <h1 title=""><s:property value="postList.content"/><!--v-html--></h1>
                        <button><i class="fa fa-pencil"></i>回复</button>
                    </div>
                    <div class="reply-info" style="border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(229, 233, 239);">
                        <a class="info-avatar" target="_blank" href="http://space.bilibili.com/12874855">
                            <img src="images/10.jpg"></a>
                        <div class="info-context">
                            <a class="info-author" target="_blank" href="http://space.bilibili.com/12874855">葬礼仪、</a>
                        </div>
                    </div>
                </div>
                        <div class="body">
                            <!-- Post-->
                            <ul id="post-field" height="100px">
                                <s:property value="#postBean.postSender"/>
                                <s:iterator value="replyListBean" var="reply" status="st">
                                    <li class="post_add"  >
                                        <img src="images/10.jpg" alt="image"/>
                                        <div class="user_name">
                                            <h4>${reply.replyPusher}&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="date_time">
                                                            ${reply.createTime}
                                                    </span>
                                            </h4>
                                        </div>
                                        <div class="post-content">
                                                ${reply.content}
                                        </div>

                                    </li>
                                </s:iterator>
                            </ul>
                        </div>
            </section>
            <!-- Admin -->
            <div id="sidebar" class="col-1-3">
                <!---- Start Widget ---->
                <div class="IGadmin">
                    <div class="header">
                        <h5>管理员</h5>
                    </div>
                    <table class="body">
                        <thead>
                        <th>
                        <td style="width:60%;color: white">&nbsp;昵称</td>
                        <td style="width:30%;color: white;text-align: right">EXP</td>
                        </th>
                        </thead>
                        <tbody>
                        <tr  class="admin_list">
                            <%--<s:iterator value="postAdminListBean" var="admin" status="st">--%>
                            <td class ="index" >
                                <%--<s:property value="%{#st.index}"/>--%>
                                1
                            </td>
                            <td class="user_name">&nbsp;
                                <b> slt
                                    <%--${admin.username}--%>
                                </b>
                            </td>
                            <td class="exp">
                                <%--${admin.experiencae}--%>
                                120
                            </td>
                            <%--</s:iterator>--%>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 发帖模态框 -->
            <div class="modal fade" id="post_modal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"
                                    data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                发帖
                            </h4>
                        </div>
                        <div class="modal-body" style="padding-left: 2%" >
                            <p><textarea  id="post_content" name="postContent" placeholder="在这里写出你要发表的帖子内容..." required ></textarea></p>
                        </div>
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-default" data-dismiss="modal">
                                关闭
                            </button>
                            <button class="btn btn-primary" onclick="send_post(<s:property value="groupId"/> ,'<%=session.getAttribute("username")%>')"  data-dismiss="modal">
                                发帖
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

        </div>
    </section>
</div>

</body>
</html>
