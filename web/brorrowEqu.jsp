<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/27
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资产借用申请</title>
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




<style>
    #main{
        margin-left: 10px;
    }

</style>



<body>
        <h2>资产借用申请</h2>

        <div id="main">

                <div id="rstable">

                    <table id="table"></table>

                </div>

        </div>





        </div>


<span id="id" hidden></span>
<span id="name" hidden></span>
</body>

<script>

    window.operateEvents={
        "click .submit":function (e,value,row,index) {
            var r=confirm("请确认您的借用信息！\n资产编号："+row.equId+"\n资产名称："+row.equName);
            if(r)
                submit(10,row.equId,row.equName);

        }
    }


    $('#table').bootstrapTable({

        url: 'doSearchEqu?type=3',         //请求后台的URL（*）
        method: 'get',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortOrder: "asc",                   //排序方式
        //    queryParams: oTableInit.queryParams,//传递参数（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        // clickToSelect: true,                //是否启用点击选中行
        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "equId",                     //每一行的唯一标识，一般为主键列
        showExport: true,                     //是否显示导出
        exportDataType: "basic",
        columns: [ {
            field:'equId',
            title:'资产编号',
            align:'center'
        },{
            field:'equName',
            title:'资产名称',
            align:'center'
        },{
            field:'equUseDirection',
            title:'使用方向',
            align:'center'
        },{
            field:'equLocation',
            title:'存放位置',
            align:'center'
        },{
            field: 'operation',
            title: '操作',
            align: 'center',
            events:operateEvents,//给按钮注册事件
            formatter:addFunctionAlty//表格中增加按钮
        }]
    });


    function addFunctionAlty(value,row,index)
    {
        return [
            '<button id="submit" type="button" class="btn btn-default submit">申请</button>',
        ].join('');

    }



    /**
     * String reqType,String reqGoalId,String reqGoalName,String reqContent,String reqApprovalLevel,String reqInitiator,String reqPostTime
     */

    var submit=function submit(type,goalid,goalname) {
            $.post(
                "createreq",{
                    type:10,
                    goalid:goalid,
                    goalname:goalname,
                    content:"对"+goalname+"的借用申请",
                    level:"2",
                    initiator:"${user.userName}"
                },function (data) {
                    alert(data);
                }
            )
    }

</script>




</html>
