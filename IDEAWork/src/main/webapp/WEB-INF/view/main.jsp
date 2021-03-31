<%--
  Created by IntelliJ IDEA.
  User: 戴智维
  Date: 2021/3/30
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>系统主页</title>
</head>
<body>
当前用户：${USER_SESSION.username}
<a href="${pageContext.request.contextPath }/logout.do">退出</a>
</body>
</html>
