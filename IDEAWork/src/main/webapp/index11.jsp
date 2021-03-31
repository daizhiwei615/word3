<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<center>
<h2>注册页面</h2>
    ${ageerrorl}
    ${Nameerror}
    <form action="addstu.do" method="post">
        id
        <input type="text" name="id" >
        名字
        <input type="text" name="name" >
        年龄
        <input type="text" name="age" >
        <input type="submit" class="btn btn-default " value="注册">
    </form>

<a href="show2.jsp" >查询学生信息</a>
    <br><br>
    <form action="checkstu.do" method="post">
        查询的账号
        <input type="text" name="id" >
        <input type="submit" class="btn btn-default " value="查询">
    </form>
</center>
</body>
</html>
