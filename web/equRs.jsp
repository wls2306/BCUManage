<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/26
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>资产查询结果</title>
</head>
<script src="script/jquery-3.3.1.js"></script>

<!-- 引入bootstrap样式 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">

<!-- jquery -->
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- bootstrap-table.min.js -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="script/tableExport.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>






<style type="text/css">

    table{

        border-collapse: collapse;
    }

</style>




<body>
    <h2>资产查询结果</h2>

    <!--
                <th>编号</th>
                <th>名称</th>
                <th>使用方向</th>
                <th>存放位置</th>
                <th>状态</th>
                <th>使用者</th>
                <th>操作</th>
     -->





    <div id="rstable">
        <table id="table"></table>
    </div>








    <div id="changestatus" >
        <h3>修改资产状态</h3>
        <span>当前选择的资产ID：</span><span id="chooseid"></span>
        <div> 请选择要修改的状态
                     

               <select id="status">
                   <option value="-1">维修</option>
                   <option value="0">占用</option>
                   <option value="1">空闲</option>
               </select>

            <br>
            
            <div id="inputuser" >使用人：<input type="text" name="user" id="user"></div>

            <button id="statussubmit">提交</button>

        </div>


    </div>

<span id="deleteid" hidden></span>




</body>


<script>

    var type=1;

    $(document).ready(function () {
        $("#changestatus").hide();
        $("#inputuser").hide();
        $(".remark").click(function () {

            $("#changestatus").show();
            $("#chooseid").text($(this).attr('bind'));

        })

        $("#statussubmit").click(submit);

        $("#status").change(function () {
            var v=$(this).val();

            if(v=="0") {
                type = 2;
                inputuserappear();
            }
        else {
                type = 1;
                $("#inputuser").hide();
            }
        })


    })




    var appear=function appear() {
        $("#changestatus").show()

    }

    var inputuserappear=function inputuserappear() {
        type=2;
        $("#inputuser").show()
    }



   var submit= function submit() {
        $.get("changeEquStatus",
            {
                type:type,
                status:$("#status").val(),
                id:$("#chooseid").text(),
                user:$("#user").val()
            },function (data) {
                alert(data);
                window.location.href=document.referrer;

            }
        )
    }


    $(".delete").click(function () {

        $("#deleteid").val($(this).attr("bind"));
        var rs=confirm("确认删除本条资产信息吗？\n您将要删除的资产编号是:"+$("#deleteid").val());

        if(rs)
            deleteequ();
    })



    var deleteequ=function () {
    //    alert($("#deleteid").val());
        $.get("changeEquStatus", {
                type:"3",
                id:$("#deleteid").val()
            }, function (data) {
                alert(data);
                window.location.href=document.referrer;
            }
        )}




</script>



</html>
