<%--
  Created by IntelliJ IDEA.
  User: 戴智维
  Date: 2021/1/16
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课室管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        h1{text-align: center;
            height:40px;
            line-height:40px
        }
        td,th，{
            text-align: center;}
        h3{
            text-align: center;}
    </style>

</head>
<body>
<div class="container" >
    <div class="row"><h1  >课室管理系统</h1></div></div>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">菜鸟教程</a>
        </div>
        <div class="collapse navbar-collapse " id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="Course_check.jsp" target="main">课程管理</a></li>
                <li ><a href="classroom_check.jsp" target="main">教室管理</a></li>
                <li><a href="Courseroom_check.jsp" target="main">排课管理</a></li>
                <li><a href="Teacher_check.jsp" target="main">教室信息管理</a></li>
                <li style=" float:right"><a href="#">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container-fluid">
    <iframe scrolling="auto" rameborder="0" src="Course_check.jsp" name="main" width="100%" height="100%"></iframe>
</div>
</body>
</html>