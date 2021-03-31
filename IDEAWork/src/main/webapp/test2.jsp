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


<script type="text/javascript">


    $(document).ready(function paging(page){

        $.ajax({
            type: "GET",
            url: "checkp.do",
            dataType:"json",
            success: function(resp){
                console.log(resp.data.length);
                for(var i=0;i<resp.data.length;i++) {
                    tbody.innerHTML+="<tr><td>"+resp.data[i].id+"</td>"+
                        "<td>"+resp.data[i].name+"</td></tr>";
                }
                var a = document.getElementById("tbody").getElementsByTagName("tr");
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
        document.getElementById("tbody").innerHTML="";//全部清空
        for(var i=0;i<pagesize;i++)
        {
            var div =document.createElement("tr");//建立div对象
            div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素
            document.getElementById("tbody").appendChild(div);//加入tbody中
            if(zz[(e-1)*pagesize+i+1]==null)//超出范围跳出
                break
        }
        var ye="";
        for(var j=1;j<=pageall;j++)
        {
            if(e==j)
            {ye=ye+"<span><a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a></span> "}
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
        pageall=$("#p").text();
        pageno=e;
        if(e <1)//如果输入页<1页
        { e=1;pageno=1}//就等于第1页 ， 当前页为1
        if(e>pageall)//如果输入页大于最大页
        {e=pageall;pageno=pageall}//输入页和当前页都=最大页
        document.getElementById("tbody").innerHTML="";//全部清空
        for(var i=0;i<pagesize;i++)
        {
            var div =document.createElement("tr");//建立div对象
            div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素
            document.getElementById("tbody").appendChild(div);//加入tbody中
            if(zz[(e-1)*pagesize+i+1]==null)//超出范围跳出
                break
        }
        var ye="";
        for(var j=1;j<=pageall;j++)
        {
            if(e==j)
            {ye=ye+"<span><a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a></span> "}
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

</script>

<body>
<div align="center">

<table>
    <!--表头-->
    <thead>
    <tr>
        <th>序号</th>
        <th>密码</th>
    </tr>
    </thead>
    <!--数据渲染区域-->
    <tbody id="tbody">
    </tbody>
</table>

<!--分页-->
<!--用来存放总页数，放置在body中-->
    <div class="page">

        <a id="down" href="#" onClick="change1(--pageno)">上一页</a>　　
        <span id="a3"></span><a id="up" href="#" onClick="change1(++pageno)">下一页</a>
        <span class="ho">第<span id="a2"></span>/<span id="a1"></span>页</span>
    </div>
    <!--用来存放总页数，放置在body中-->
    <div style="display:block" id="p"></div>



</body>
</html>
