<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/27
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的请求</title>
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

<!-- 对话框  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>




<style>
    table{
        border-collapse: collapse;
    }

    #rst{
        margin-left: 10px;
    }

</style>


<body>
    <h2>我的请求</h2>

    <!--  <th>请求编号</th>
            <th>请求类别</th>
            <th>目标</th>
            <th>描述</th>
            <th>状态</th>
            <th>反馈</th>
            <th>审核人</th>
            <th>发起时间</th>
            <th>操作</th> -->

<div id="rst">
    <table id="table">  </table>
</div>

<script>
    $('#table').bootstrapTable({

        url: 'getreq?type=1',         //请求后台的URL（*）
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
        uniqueId: "reqId",                     //每一行的唯一标识，一般为主键列
        showExport: true,                     //是否显示导出
        exportDataType: "basic",
        columns: [ {
            field:'reqId',
            title:'申请编号',
            align:'center'
        },{
            field:'reqType',
            title:'申请类别',
            align:'center'
        },{
            field:'reqGoalId',
            title:'目标编号',
            align:'center'
        },{
            field:'reqContent',
            title:'描述',
            align:'center'
        },{
            field:'reqStatus',
            title:'状态',
            align:'center',
            formatter:p

        },{
            field:'reqBack',
            title:'反馈',
            align:'center'
        },{
            field:'reqAuditor',
            title:'审核人',
            align:'center'
        },{
            field:'reqPostTime',
            title:'发起时间',
            align:'center'
        }]
    });

    function p(rows,index) {

        switch (index.reqStatus) {
            case "-1":return ['<span style="color: red">拒绝</span>'].join('');break;
            case "0":return ['<span style="color:sandybrown">未处理</span> '].join('');break;
            case "1":return ['<span style="color: green">通过</span>'].join('');break;
            case "2":return ['<span style="color: blue">移交上级</span>'].join('');break;
        }
    }





</script>


</body>
</html>
