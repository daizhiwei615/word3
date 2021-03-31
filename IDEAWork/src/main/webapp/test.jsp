<%--
  Created by IntelliJ IDEA.
  User: 戴智维
  Date: 2021/3/16
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 模态框（Modal）插件事件</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</head>
<script  type="text/javascript">
    $(function () {
        getteacher();
        getclassroom();
        getcourse();
        $("#addcity").on("click",function () {
            var provinceid=$("#province>option:selected").val();
            var  name=$(":text").val();
            $.post("addc.do",{name:name,provinceid:provinceid},function (resp) {
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
                $("#cid").empty();
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
                $("#Tid").empty();
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
                $("#cno").empty();
                $.each(resp.data, function (i, n) {
                    $("#cno").append("<option value='" + n.cno + "'>" + n.cname + "</option>")
                })
            }
        })
    }
</script>
<body>


<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    添加排课信息
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加课程安排信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="cno">课程名字</label>
                    <select name="cno" id="cno" class="form-control">
                        <option value="0">请选择..</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Tid">任课老师</label>
                    <select name="Tid" id="Tid" class="form-control">
                        <option value="0">请选择..</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cid">教室</label>
                    <select name="cid" id="cid" class="form-control">
                        <option value="0">请选择..</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="week">星期节数</label>
                    <select name="week" id="week" class="form-control">
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
                <input type="date" id="starttime" name="starttime" class="form-control">
                </div>
                <div class="form-group">
                    <label for="lasttime">结束上课时间</label>
                <input type="date" id="lasttime" name="lasttime" class="form-control" >
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    $(function () { $('#myModal').modal('hide')});
</script>
<script>
    $(function () { $('#myModal').on('hide.bs.modal', function () {
        alert('嘿，我听说您喜欢模态框...');})
    });
</script>

</body>
</html>
