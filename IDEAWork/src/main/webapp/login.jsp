<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style >
        body{
            background: url(image/7779.jpg)  no-repeat center; background-size:100% 100%;
            background-attachment: fixed;"
        }
    </style>
    <script  type="text/javascript">
        $(function () {
            $("#checklogin").on("click",function () {
                var  Tid=$("input[name='type']").val();
                var  Tname=$("input[id='tname2']").val();
                var  Tage=$("input[id='tage2']").val();
                if (Tid==null||Tname==null||Tage==null||Tid==""||Tname==""||Tage==""){
                    alert("请输入全部相关信息！！")
                }else {
                    $.get("addteacher.do",{Tid:Tid,Tname:Tname,Tage:Tage},function (resp){
                        if (resp.code==0){
                            alert(resp.msg);
                        }else {
                            alert(resp.msg);
                        }
                    },"json")
                }
            })
        })

    </script>
    <title>课设管理系统</title>
</head>
<body >
<h1 style="text-align: center">课室管理系统</h1>
<div class=" container">
<div style="float: right;margin-right: 60px;margin-top:180px; width: 340px; height: 260px;background-color:rgba(255, 255, 255, 0.7)"   >
    <div align="center" style="line-height: 20px" >登录窗口</div>
    <br class="bs-example bs-example-form" role="form">
    <div class=" container-fluid"  >
        <div class="input-group ">
            <span class="input-group-addon glyphicon glyphicon-user">账号</span>
            <input type="text" name="uname" placeholder="请填写账号"  class="form-control"/>
        </div>
        </br>
            <div class="input-group">
                <span class="input-group-addon   glyphicon glyphicon-lock">密码</span>
                <input type="password"  name="upassword" placeholder="请填写密码" class="form-control"/>
            </div>
        </br>
        <div class="form-group" >
            <span >账号类型：</span>
            <input type="radio" name="type" value="admin" id="admin">管理员
            <input type="radio" name="type" value="teacher" id="teacher">老师
            <input type="radio" name="type" value="student" id="student">学生
        </div>
        </br>
        <div class="form-group" >
            <input type="button" class="btn btn-default " value="登录" id="checklogin">
            <input type="reset"  class=" btn btn-default"  value="重置">
        </div>
    </form>
    </div>
</div>
</div>
</body>
</html>