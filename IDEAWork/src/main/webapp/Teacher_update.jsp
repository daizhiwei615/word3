<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选课系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td,th{
            text-align: center;
        }
    </style>
    <script  type="text/javascript">
        $(function () {
            $("#upteacher").on("click",function () {
                var  Tid=$("input[id='Tid']").val();
                var  Tname=$("input[id='Tname']").val();
                var  Tage=$("input[id='Tage']").val();
                $.post("upteacher.do",{Tid:Tid,Tname:Tname,Tage:Tage},function (resp) {
                    if (resp.code==0){
                        alert(resp.msg);
                    }else {
                        alert(resp.msg);
                    }
                },"json")

            })

        })
    </script>
</head>
<body>
<div class="container">
    <center><h3>修改老师信息</h3></center>



    <div class="form-group">
        <label for="Tid">编号</label>
        <input type="text" id="Tid" name="Tid" class="form-control" value="${Tid}">
    </div>

    <div class="form-group">
        <label for="Tname">名字</label>
        <input type="text" id="Tname" name="Tname" class="form-control" value="${Tname}">
    </div>

    <div class="form-group">
        <label for="Tage">年龄</label>
        <input type="text" id="Tage" name="Tage" class="form-control" value="${Tage}">
    </div>

        <div class="form-group" style="...">
            <input class="btn btn-primary" type="button" id="upteacher"  value="提交">
            <a class="btn btn-primary" href="Teacher_check.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>
