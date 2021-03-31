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

            $("#upcourse").on("click",function () {
                var  cno=$(":text").val();
                var  cname=$("input[id='cname']").val();
                var cstartyear=$("#cstartyear>option:selected").val();
                var cstartterm=$("#cstartterm>option:selected").val();
                $.post("upcourse.do",{cno:cno,cname:cname,cstartyear:cstartyear,cstartterm:cstartterm},function (resp) {
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
    <center><h3>修改课程信息</h3></center>

        <!--隐藏字符集 -->
        <input type="hidden" name="cno" value="${cno}">
        <div class="form-group">
            <label for="cno">课程号</label>
            <input type="text" class="form-control" id="cno" name="cno" value="${cno}">
        </div>
        <div class="form-group">
            <label for="cname">课程名</label>
            <input type="text" class="form-control" id="cname" name="cname"  value="${cname}">
        </div>

        <div class="form-group">

            <label for="cstartyear">学年</label>
            <select name="cstartyear" class="form-control" id="cstartyear">
                    <option value="${cstartyear}" selected>${cstartyear}</option>
                    <option value="2020-2021学年" >2020-2021学年</option>
                    <option value="2019-2020学年">2019-2020学年</option>
                    <option value="2018-2019学年">2018-2019学年</option>
                    <option value="2017-2018学年">2017-2018学年</option>
            </select>
        </div>
        <div class="form-group">
            <label for="cstartterm">学期</label>
            <select name="cstartterm" class="form-control" id="cstartterm">
                    <option value="${cstartterm}" selected>${cstartterm}</option>
                    <option value="第一学期" >第一学期</option>
                    <option value="第二学期" >第二学期</option>
            </select>
        </div>
        <div class="form-group" style="...">
            <input class="btn btn-primary" type="button" id="upcourse"  value="提交">
            <a class="btn btn-primary" href="Course_check.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>
