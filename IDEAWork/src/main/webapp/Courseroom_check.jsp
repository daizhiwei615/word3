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
        td,th{
            text-align: center;
        }
    </style>
    <script  type="text/javascript">
        $(function () {
            getteacher();
            getclassroom();
            gethouse();
            getcourse();
            $("#delSelected").click(function () {
                confirm("确定删除？")
                var  flag=false;
                var ids=document.getElementsByName("id");
                for (var i=0;i<ids.length;i++){
                    if (ids[i].checked){
                        flag=true;
                        break;
                    }
                }
                if (flag){
                    document.getElementById("form").submit();
                }
            })
            $("#firstCb").click(function () {
                var ids=document.getElementsByName("id");
                for (var i=0;i<ids.length;i++){
                    ids[i].checked=this.checked;
                }
            })
            $("#addcourse").on("click",function () {
                var  cname=$("input[id='cname2']").val();
                var cstartyear=$("#cstartyear2>option:selected").val();
                var cstartterm=$("#cstartterm2>option:selected").val();
                $.post("addcourse.do",{cname:cname,cstartyear:cstartyear,cstartterm:cstartterm},function (resp) {
                    if (resp.code==0){
                        alert(resp.msg);
                    }else {
                        alert(resp.msg);
                    }
                },"json")
            })
            $("#checkcourse4").click(function () {
                var  cname=$("input[id='cname']").val();
                var cstartyear=$("#cstartyear>option:selected").val();
                var cstartterm=$("#cstartterm>option:selected").val();
                var house=$("#house>option:selected").val();
                $(document).ready(function paging(page){
                    $.ajax({
                        type: "GET",
                        url: "checkcourseroom.do",
                        data:{cname:cname,house:house,cstartyear:cstartyear,cstartterm:cstartterm},
                        dataType:"json",
                        success: function(resp){
                            if (resp.code==0){
                                console.log(resp.data.length);
                                alert(resp.msg);
                                $("#courseroominfo").empty();
                                $.each(resp.data,function (i,n) {
                                    $("#courseroominfo").append(
                                        "<tr><td>" +
                                        "<input type='checkbox' name='id' value="+n.id+"></td><td>" +
                                        ""+n.id+"</td><td>" +
                                        ""+n.cno+"</td><td>" +
                                        "" +n.cname+"</td><td>" +
                                        "" +n.tname+"</td><td>" +
                                        "" +n.house+n.room+"</td><td>" +
                                        "" +n.week+"</td><td>" +
                                        "" +n.starttime+"</td><td>" +
                                        "" +n.lasttime+"</td><td>" +
                                        "" +n.cstartyear+"</td><td>" +
                                        "" +n.cstartterm+"</td><td>" +
                                        "<a  class='btn btn-primary' href='${pageContext.request.contextPath}/checkcourseroom3.do?id="+n.id+"'>修改</a></td></td>")
                                })
                            }
                            else {
                                alert(resp.msg);
                                $("#courseroominfo").empty();
                            }
                            var a = document.getElementById("courseroominfo").getElementsByTagName("tr");
                            //alert(a.length);
                            var zz =new Array(a.length);
                            //alert(zz.length);
                            for(var i=0;i<a.length;i++)
                            { zz[i]=a[i].innerHTML } //div的字符串数组付给zz
                            var pageno=1;               //当前页
                            var pagesize=4;            //每页多少条信息
                            if(zz.length%pagesize==0)
                            {var  pageall =zz.length/pagesize }
                            else
                            {var  pageall =parseInt(zz.length/pagesize)+1}       //一共多少页
                            $("#p").text(pageall);      //将pageall的值存放到div中，便于下次使用
                            change(1,pageall,zz);
                        }
                    })
                })
            })
            $("#checkcourseroom").on("click",function () {
                var cno=$("#cno>option:selected").val();
                var cid=$("#cid>option:selected").val();
                var Tid=$("#Tid>option:selected").val();
                var week=$("#week>option:selected").val();
                var starttime=$("input[id='starttime']").val();
                var lasttime=$("input[id='lasttime']").val();
                if (starttime==null||lasttime==null||starttime==""||lasttime==""){
                    alert("请输入相关时间！！")
                }
                $.get("addcourseroom.do",{cno:cno,cid:cid,Tid:Tid,week:week,starttime:starttime,lasttime:lasttime},function (resp) {
                    if (resp.code==0){
                        alert(resp.msg);
                    }else {
                        alert(resp.msg);
                    }
                },"json")
            })

        })
        var k;
        function change(e,all,zu){
            zz=zu;
            var pagesize=4;   //每页多少条信息
            pageall=all;     //总页数
            pageno=e;        //当前页
            if(e <1)//如果输入页<1页
            { e=1;pageno=1}//就等于第1页 ， 当前页为1
            if(e>pageall)//如果输入页大于最大页
            {e=pageall;pageno=pageall}//输入页和当前页都=最大页
            document.getElementById("courseroominfo").innerHTML="";//全部清空
            for(var i=0;i<pagesize;i++)
            {
                var div =document.createElement("tr");//建立div对象
                div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素
                document.getElementById("courseroominfo").appendChild(div);//加入tbody中
                if(zz[(e-1)*pagesize+i+1]==null)//超出范围跳出
                    break
            }
            var ye="";
            for(var j=1;j<=pageall;j++)
            {
                if(e==j)
                {ye=ye+"<a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a>"}
                else
                {ye=ye+"<a href='#' onClick='change1("+j+")'>"+j+"</a> "}
            }
            document.getElementById("a1").innerHTML=pageall;
            document.getElementById("a2").innerHTML=pageno;
            document.getElementById("a3").innerHTML=ye;
            /*如果当前是第一页则：*/
            if (pageno == 1)
            {
                $('#down').hide();//隐藏
            }else {
                $('#down').show();//显示
            }
            /*如果是最后一页则：*/
            if (pageno == pageall)
            {
                $('#up').hide();//隐藏
            }else {
                $('#up').show();//显示
            }
            k=zu;
        }
        function change1(e){
            zz=k;
            var pagesize=4;
            pageno=e;
            if(e <1)//如果输入页<1页
            { e=1;pageno=1}//就等于第1页 ， 当前页为1
            if(e>pageall)//如果输入页大于最大页
            {e=pageall;pageno=pageall}//输入页和当前页都=最大页
            document.getElementById("courseroominfo").innerHTML="";//全部清空
            for(var i=0;i<pagesize;i++)
            {
                var div =document.createElement("tr");//建立div对象
                div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素
                document.getElementById("courseroominfo").appendChild(div);//加入tbody中
                if(zz[(e-1)*pagesize+i+1]==null)//超出范围跳出
                    break
            }
            var ye="";
            for(var j=1;j<=pageall;j++)
            {
                if(e==j)
                {ye=ye+"<a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a> "}
                else
                {ye=ye+"<a href='#' onClick='change1("+j+")'>"+j+"</a> "}
            }
            document.getElementById("a1").innerHTML=pageall;
            document.getElementById("a2").innerHTML=pageno;
            document.getElementById("a3").innerHTML=ye;
            /*如果当前是第一页则：*/
            if (pageno == 1)
            {
                $('#down').hide();//隐藏
            }else {
                $('#down').show();//显示
            }

            /*如果是最后一页则：*/

            if (pageno == pageall)
            {
                $('#up').hide();//隐藏
            }else {
                $('#up').show();//显示
            }
        }
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
        }function gethouse() {
            $.ajax({
                url: "checkclassroom.do",
                dataType: "json",
                success: function (resp) {
                    $("#house").empty();
                    $.each(resp.data, function (i, n) {
                        $("#house").append("<option value='" + n.house + "'>" + n.house+"</option>")

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
</head>
<body>
<div class="container">
    <h3>课室安排情况</h3>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/checkcourse4.do" method="post">
            <div class="form-group">
                <label for="cname">课程名字</label>
                <input type="text" class="form-control" id="cname" name="cname" value="${cname[0]}">
            </div>
            <div class="form-group">
                <label for="house">教学楼</label>
                <select name="house" id="house" class="form-control">
                    <option value=""></option>
                </select>
            </div>
            <div class="form-group">
                <label for="cstartyear">学年</label>
                <select name="cstartyear" id="cstartyear" class="form-control">
                    <option value=""></option>
                    <option value="2020-2021学年">2020-2021学年</option>
                    <option value="2019-2020学年">2019-2020学年</option>
                    <option value="2019-2020学年">2019-2020学年</option>
                    <option value="2018-2019学年">2018-2019学年</option>
                    <option value="2018-2019学年">2018-2019学年</option>
                    <option value="2017-2018学年">2017-2018学年</option>
                    <option value="2017-2018学年">2017-2018学年</option>
                    <option value="2016-2017学年">2016-2017学年</option>
                    <option value="2016-2017学年">2016-2017学年</option>
                    <option value="2015-2016学年">2015-2016学年</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cstartterm">学期</label>
                <select name="cstartterm" id="cstartterm" class="form-control">
                    <option value=""></option>
                    <option value="第一学期">第一学期</option>
                    <option value="第二学期">第二学期</option>
                </select>
            </div>
            <input type="button" id="checkcourse4"  class="btn btn-default" value="查询">
        </form>

    </div>
    <div style="float: right;margin: 5px" >
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="666">
            添加课程
        </button>
        <a class="btn btn-primary" href="javascript:void(0);" id= "delSelected">删除课程</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/delcourseroom.do" method="post">
   <div>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success"  style="font-size: 13px">
                <th style="text-align: center" ><input type="checkbox" id="firstCb"></th>
                <th style="text-align: center">编号</th>
                <th style="text-align: center">课程号</th>
                <th style="text-align: center">课程名字</th>
                <th style="text-align: center">任课老师</th>
                <th style="text-align: center">上课地点</th>
                <th style="text-align: center">上课周次节数</th>
                <th style="text-align: center">开始上课时间</th>
                <th style="text-align: center">结束上课时间</th>
                <th style="text-align: center">开课学年</th>
                <th style="text-align: center">开课学期</th>
                <th style="text-align: center">执行</th>
            </tr>
            <tbody class="success" style="font-size: 13px" id="courseroominfo">
            </tbody>
        </table>
       <div class="page">
           <ul class="pagination">
               <li> <a id="down" href="#" onClick="change1(--pageno)">上一页</a>　　</li>
               <li id="a3"></li>

               <li><a id="up" href="#" onClick="change1(++pageno)">下一页</a></li>

               <li>  <span class="ho">第<span id="a2"></span>/<span id="a1"></span>页</span> </li>
           </ul>
       </div>
       <!--用来存放总页数，放置在body中-->

   </div>
    </form>
</div>
<div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加课程信息
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
                <button type="button" class="btn btn-primary" id="checkcourseroom">
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
    })})
</script>
</div>

</body>
</html>

