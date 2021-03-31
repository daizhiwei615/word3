<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
}
<script type="text/javascript" src="js/jquery-3.4.1.js">
</script >
<script  type="text/javascript">
    $(function () {
        getprovince();
        $("#checkc").click(function () {
            //选择得下拉列表的
            var provinceid=$("#province>option:selected").val();
            $.get("checkc.do",{provinceid:provinceid},function (resp) {
                if (resp.code==0){
                    alert(resp.msg);
                    $("#cityinfo").empty();
                    $.each(resp.data,function (i,n) {
                        $("#cityinfo").append("<tr><td>"+n.provinceid+"</td><td>"+n.name+"</td></tr>")


                    })
                }else {
                    alert(resp.msg);
                    $("#cityinfo").empty();

                }
            },"json" )

        })
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



    function getprovince() {
        $.ajax({
            url: "checkp.do",
            dataType: "json",
            success: function (resp) {
                $("#province").empty();
                $.each(resp.data, function (i, n) {
                    $("#province").append("<option value='" + n.id + "'>" + n.name + "</option>")


                })

            }
        })

    }

</script>
<body>
<div align="center">
    <table>
        <tr>
            <td>省份</td>
            <td>
                <select id="province" >
                    <option value="0">请选择..</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>城市名称</td>
            <td>
               <input type="text" id="cityname">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" id="addcity" value="添加城市">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" id="checkc" value="查询城市">
            </td>
        </tr>
    </table>
    <br>
    <div id="dataTable">
        <table border="1">
            <thead>
            <tr>
                <td>城市ID</td>
                <td>城市名称</td>
            </tr>
            </thead>
            <tbody id="cityinfo">

            </tbody>
        </table>
    </div>

</div>
</body>
</html>
