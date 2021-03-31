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
             getcourse();
             getteacher();
             getclassroom();
            $("#upcourseroom").on("click",function () {
                var  id=$("input[id='id']").val();
                var cno=$("#cno>option:selected").val();
                var Tid=$("#Tid>option:selected").val();
                var cid=$("#cid>option:selected").val();
                var week=$("#week>option:selected").val();
                var starttime=$("input[id='starttime']").val();
                var  lasttime=$("input[id='lasttime']").val();
                $.post("upcourseroom.do",{id:id,cno:cno,Tid:Tid,cid:cid,week:week,starttime:starttime,lasttime:lasttime},function (resp) {
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
        function getteacher() {
            $.ajax({
                url: "checkteacher.do",
                dataType: "json",
                success: function (resp) {
                    $.each(resp.data, function (i, n) {
                        $("#Tid").append("<option value='" + n.tid + "'>" +n.tname+"</option>")
                    })
                }
            })
        }
        function getcourse() {
            $.ajax({
                url: "checkcourse4.do",
                dataType: "json",
                success: function (resp) {

                    $.each(resp.data, function (i, n) {
                        $("#cno").append("<option value='" + n.cno + "'>" + n.cname + "</option>")
                    })
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <center><h3>修改课程信息</h3></center>

        <!--隐藏字符集 -->
        <input type="hidden" name="cno" value="${cno}">
    <div class="form-group">
        <label for="id">编号</label>
        <input type="text" id="id" name="id" class="form-control" value="${id}">
    </div>
    <div class="form-group">
        <label for="cno">课程名字</label>
        <select name="cno" id="cno" class="form-control">
            <option value="${cno}">${cname}</option>
        </select>
    </div>
    <div class="form-group">
        <label for="Tid">任课老师</label>
        <select name="Tid" id="Tid" class="form-control">
            <option value="${Tid}">${Tname}</option>
        </select>
    </div>
    <div class="form-group">
        <label for="cid">教室</label>
        <select name="cid" id="cid" class="form-control">
            <option value="${cid}">${houseroom}</option>
        </select>
    </div>
    <div class="form-group">
        <label for="week">星期节数</label>
        <select name="week" id="week" class="form-control">
            <option value="${week}" selected>${week}</option>
            <option value="星期一 1-2节">星期一 1-2节</option>
            <option value="星期一 3-4节">星期一 3-4节</option>
            <option value="星期一 5-6节">星期一 5-6节</option>
            <option value="星期一 7-8节">星期一 7-8节</option>
            <option value="星期二 1-2节">星期二 1-2节</option>
            <option value="星期二 3-4节">星期二 3-4节</option>
            <option value="星期二 5-6节">星期二 5-6节</option>
            <option value="星期二 7-8节">星期二 7-8节</option>
            <option value="星期三 1-2节">星期三 1-2节</option>
            <option value="星期三 3-4节">星期三 3-4节</option>
            <option value="星期三 5-6节">星期三 5-6节</option>
            <option value="星期三 7-8节">星期三 7-8节</option>
            <option value="星期四 1-2节">星期四 1-2节</option>
            <option value="星期四 3-4节">星期四 3-4节</option>
            <option value="星期四 5-6节">星期四 5-6节</option>
            <option value="星期四 7-8节">星期四 7-8节</option>
            <option value="星期五 1-2节">星期五 1-2节</option>
            <option value="星期五 3-4节">星期五 3-4节</option>
            <option value="星期五 5-6节">星期五 5-6节</option>
            <option value="星期五 7-8节">星期五 7-8节</option>
        </select>
    </div>
    <div class="form-group">
        <label for="starttime">开始上课时间</label>
        <input type="date" id="starttime" name="starttime" class="form-control" value="${starttime}">
    </div>
    <div class="form-group">
        <label for="lasttime">结束上课时间</label>
        <input type="date" id="lasttime" name="lasttime" class="form-control" value="${lasttime}">
    </div>

        <div class="form-group" style="...">
            <input class="btn btn-primary" type="button" id="upcourseroom"  value="提交">
            <a class="btn btn-primary" href="Courseroom_check.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>
