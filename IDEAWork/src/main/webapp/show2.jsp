
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js">
    </script >
    <script  type="text/javascript">
        $(function () {
            $("#doAjxa").click(function () {
                var  id =$(":text").val();
                alert(id);
                $.ajax(
                    {
                        url: "checkdd.do",
                        data:{id:id},
                        dataType: "json",
                        success: function (resp) {
                            if (resp.code==0){
                                alert(resp.msg);
                                $("#stuinfo").empty();
                                $.each(resp.data,function (i,n) {
                                    $("#stuinfo").append("<tr><td>"+n.id+"</td><td>" +n.name+"</td><td>" +n.age+"</td></tr>")
                                })    }else {
                                alert(resp.msg);
                            }
                        }
                    })
            })
        })
    </script>
</head>
<body>
    <div align="center">
         <input type="text" name="id" ><button id="doAjxa" >查询</button>
        <table>
            <thead>
            <tr>
                <td>id</td>
                <td>名字</td>
                <td>年龄</td>
            </tr>
            </thead>
            <tbody id="stuinfo">
            </tbody>
        </table>
    </div>
</body>
</html>
