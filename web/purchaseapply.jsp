<%--
  Created by IntelliJ IDEA.
  User: 王镭树
  Date: 2018/11/26
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>新建采购申请</title>
</head>
<script src="script/jquery-3.3.1.js"></script>
<!-- 对话框  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<!-- 引入bootstrap样式 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

<script src="script/tableExport.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- 对话框  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

<style type="text/css">
    #content{
        width: 500px;
        margin-left: 20px;
    }


</style>

<body>
    <h2>采购申请</h2>

<div id="content">
    <table class="table table-hover table-condensed">
        <caption>请填写采购申请表</caption>
        <tr>
            <td>物品名称</td>
            <td><input type="text" id="equName" ></td>
        </tr>

        <tr>
            <td>品牌与型号</td>
            <td><input type="text" id="band"></td>
        </tr>

        <tr>
            <td>金额</td>
            <td><input type="text" id="money"></td>
        </tr>

        <tr>
            <td>购置理由</td>
            <td><input type="text" id="reason"></td>
        </tr>
            <tr>
                <td colspan="2"> <button class="btn btn-primary" data-loading-text="Loading..."type="button" onclick="submit">提交申请</button>   </td>

            </tr>
    </table>
</div>

</body>

<script>
    $(function() {
        $(".btn").click(function(){
           if(check())
               submit();
            $(this).button('loading').delay(1000).queue(function() {
                $(this).button('reset');
                $(this).dequeue();
            });
        });
    });

    function submit() {
        $.post(
            "createreq",{
                type:41,
                goalid:"-",
                goalname:$("#equName").val(),
                content:"采购申请，物品名称："+$("#equName").val()+"； 总金额为："+$("#money").val()+" 元， 品牌为："+$("#band").val()+"； 具体理由："+$("#reason").val(),
                level:"3",
                initiator:"${user.userName}"
            },function (data) {
               alert(data);
            }
        )
    }


    function check() {
        if($("#equName").val()==""||$("#money").val()==""||$("#band").val()=="")
        {
            alert("请确认表单没有空项");
            return false;
        }else
            return true;
    }




</script>




</html>
