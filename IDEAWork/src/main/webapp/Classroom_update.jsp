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
            $("#upclassroom").on("click",function () {
                var  cid=$("input[id='cid']").val();
                var house=$("#house>option:selected").val();
                var  room=$("input[id='room']").val();
                $.post("upclassroom.do",{cid:cid,house:house,room:room},function (resp) {
                    if (resp.code==0){
                        alert(resp.msg);
                    }else {
                        alert(resp.msg);
                    }
                },"json")

            })

        })
        function getclassroom() {
            $.ajax({
                url: "checkclassroom.do",
                dataType: "json",
                success: function (resp) {
                    // $("#cid").empty();
                    $.each(resp.data, function (i, n) {
                        $("#cid").append("<option value='" + n.cid + "'>" + n.house+n.room+ "</option>")

                    })
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <center><h3>修改课程信息</h3></center>



    <div class="form-group">
        <label for="cid">编号</label>
        <input type="text" id="cid" name="cid" class="form-control" value="${cid}">
    </div>

    <div class="form-group">
        <label for="house">教学楼</label>
        <select name="house" id="house" class="form-control">
            <option value="${house}">${house}</option>
        </select>
    </div>

    <div class="form-group">
        <label for="room">教室</label>
        <input type="text" id="room" name="room" class="form-control" value="${room}">
    </div>

        <div class="form-group" style="...">
            <input class="btn btn-primary" type="button" id="upclassroom"  value="提交">
            <a class="btn btn-primary" href="Classroom_check.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>
