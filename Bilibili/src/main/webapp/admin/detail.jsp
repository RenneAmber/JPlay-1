<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" style="background-color:white">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Jplay</title>


    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-2.1.1.js"></script>
    <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap-table-master/bootstrap-table.min.js" ></script>

    <!-- Custom CSS -->
    <link href="../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <!--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>-->
    <![endif]-->
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">SB Admin</a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                <ul class="dropdown-menu message-dropdown">
                    <li class="message-preview">
                        <a href="#">
                            <div class="media">
                            <span class="pull-left">
                                <%--<img class="media-object" src="http://placehold.it/50x50" alt="">--%>
                                    </span>
                                <div class="media-body">
                                    <h5 class="media-heading"><strong>John Smith</strong>
                                    </h5>
                                    <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="message-preview">
                        <a href="#">
                            <div class="media">
                            <span class="pull-left">
                                <%--<img class="media-object" src="http://placehold.it/50x50" alt="">--%>
                                    </span>
                                <div class="media-body">
                                    <h5 class="media-heading"><strong>John Smith</strong>
                                    </h5>
                                    <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="message-preview">
                        <a href="#">
                            <div class="media">
                            <span class="pull-left">
                                <%--<img class="media-object" src="http://placehold.it/50x50" alt="">--%>
                                    </span>
                                <div class="media-body">
                                    <h5 class="media-heading"><strong>John Smith</strong>
                                    </h5>
                                    <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="message-footer">
                        <a href="#">Read All New Messages</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                <ul class="dropdown-menu alert-dropdown">
                    <li>
                        <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                    </li>
                    <li>
                        <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                    </li>
                    <li>
                        <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                    </li>
                    <li>
                        <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                    </li>
                    <li>
                        <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                    </li>
                    <li>
                        <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">View All</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" style="background-color: #ecf6ff;border-color:#ecf6ff">
            <ul class="nav navbar-nav side-nav">
                <li class="active">
                    <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                </li>
                <li>
                    <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                </li>
                <li>
                    <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                </li>
                <li>
                    <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                </li>
                <li>
                    <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                </li>
                <li>
                    <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                </li>
                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="demo" class="collapse">
                        <li>
                            <a href="#">Dropdown Item</a>
                        </li>
                        <li>
                            <a href="#">Dropdown Item</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                </li>
                <li>
                    <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        注册用户？视频？
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.html">Jplay</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> 用户信息
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6">
                    <h2>注册用户</h2>
                    <div class="table-responsive">
                        <table 	id="dg_buslist"
                                  data-show-columns="true">
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form method="post" class="form" role="form" >
                        <div class="form-group  required"><label class="control-label" for="password">ID</label>
                            <input class="form-control" placeholder="" id="ID" name="ID" disabled="disabled">
                        </div>
                        <div class="form-group  required"><label class="control-label" for="phone">phone</label>
                            <input class="form-control" placeholder="input to modify" id="phone" name="phone" required type="text" value="">
                        </div>
                        <div class="form-group  required"><label class="control-label" for="email">email</label>
                            <input class="form-control" placeholder="input to modify" id="email" name="email" required type="text" value="">
                        </div>

                    </form>
                    <div id="message"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal" onclick="cancel()">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="edit()">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    window.onload = function() {
        data = {"userID":0,"username":"Catherine","birthday":"1996-1-1","gender":1,"email":"casualxg@gmail.com","realname":"Yin Lu","lastupdate":"2016-7-14","created":"2016-7-14","university":"SJTU"};
        console.log(JSON.parse(JSON.stringify(data)));
        $('#dg_buslist').bootstrapTable({
            data:JSON.stringify(data),
            search:true,
            pagination:true,
            pageList:[5,10,20],
            pageSize:5,
            pageNumber:1,
            columns:[{
                title: 'ID',
                field: 'userID',
                align: 'center',
                valign: 'middle'
            },
                {
                    title: 'name',
                    field: 'username',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'birthday',
                    field: 'birthday',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'gender',
                    field: 'gender',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'email',
                    field: 'email',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'real name',
                    field: 'realname',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'last update',
                    field: 'lastupdate',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'created',
                    field: 'created',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: 'university',
                    field: 'university',
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter:function(value,row,index){
                        var e = '<a href="#" mce_href="#" onclick="modal(\''+ row.ID + '\')">编辑</a> ';
                        var d = '<a href="#" mce_href="#" onclick="remove(\''+ row.ID +'\')">删除</a> ';
                        return e+d;
                    }}]
        });
    }

    function initData(){
        var data;
        $.ajax({
            url:'getAllUser.action',
            dataType:'json',
            type:'POST',
            data:data,
            success:function(data){
//                console.log(JSON.stringify(data));
                data={"userID":0,"username":"Catherine","birthday":"1996-1-1","gender":1,"email":"casualxg@gmail.com","realname":"Yin Lu","lastupdate":"2016-7-14","created":"2016-7-14","university":"SJTU"};
                console.log(JSON.stringify(data));
                $('#dg_buslist').bootstrapTable({
                    data:data,
                    search:true,
                    pagination:true,
                    pageList:[5,10,20],
                    pageSize:5,
                    pageNumber:1,
                    columns:[{
                        title: 'ID',
                        field: 'userID',
                        align: 'center',
                        valign: 'middle'
                    },
                        {
                            title: 'name',
                            field: 'username',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'birthday',
                            field: 'birthday',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'gender',
                            field: 'gender',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'email',
                            field: 'email',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'real name',
                            field: 'realname',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'last update',
                            field: 'lastupdate',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'created',
                            field: 'created',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'university',
                            field: 'university',
                            align: 'center',
                            valign: 'middle'
                        }, {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter:function(value,row,index){
                                var e = '<a href="#" mce_href="#" onclick="modal(\''+ row.ID + '\')">编辑</a> ';
                                var d = '<a href="#" mce_href="#" onclick="remove(\''+ row.ID +'\')">删除</a> ';
                                return e+d;
                            }}]
                });

            }
        });

    }

    function buttonCancel() {
        window.location.href="listOrderBy.jsp";
    }

    function rowStyle(row, index) {
        var classes = ['active', 'active', 'active', 'active', 'active'];

        if (index % 2 === 0 && index / 2 < classes.length) {
            return {
                classes: classes[index / 2]
            };
        }
        return {};
    }
    function runningFormatter(value, row, index) {
        return index;
    }
//    initData();
</script>
<script type="text/javascript">
    var phone = document.getElementById("phone");
    var email = document.getElementById("email");
    var Id;
    function modal(ID){
        $('#myModal').modal('show');
        var id = document.getElementById("ID");
        id.value=ID;
        Id = ID;
    }

    function edit(){
        $.ajax({
            data:{"ID":Id,"phone":phone.value,"email":email.value},
            dataType:'JSON',
            type:'POST',
            url:"updateXXX.action",
            timeout:3000,
            cache:false,
            success:function(){
                document.getElementById("message").innerHTML="<center><b>修改成功</b></center>";
            },
            error:function(){
                document.getElementById("message").innerHTML="<center><b>改你麻痹</b></center>";
            }
        })
    }
    function remove(ID) {
        $.ajax({
            data:{"ID":ID},
            dataType:'JSON',
            type:'POST',
            url:'deleteXXX.action',
            timeout:3000,
            cache:false,
            success:function(){
                alert("删除成功");
            },
            error:function(){
                alert("删除失败");
            }
        })
    }
    function cancel(){
        document.getElementById("message").innerHTML="";
        phone.value="";
        email.value="";
    }
//    $.post("/Bilibili/getAllUser.action", function(result){
//        $("#xg").text(JSON.stringify(result));
//    });
</script>
<div id="xg"></div>
</html>
