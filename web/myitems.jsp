<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/11/4
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的物品</title>
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



<!-- 注意 ！ 此页面仅显示 资产方面的物品 ，如后续添加 请增加servlet的相关接口 或 type属性！ -->



<style>
    #mytable{
        margin-left: 10px;
    }
</style>

<body>
<h2>我的物品</h2>
<span id="equid" ></span>
<span id="equname"></span>
<h4>我的资产</h4>
<div id="mytable">
    <table id="table"></table>
</div>


</body>

<script>
    window.operateEvents={
        "click .return":function (e,value,items,rows) {
      //      alert(items.equId);
           $("#equid").text(items.equId);
           $("#equname").text(items.equName);

            BootstrapDialog.confirm(
                {
                    title: "再次确认",
                    message:"请确认您即将申请归还的物品：\n 物品编号："+$("#equid").text()+"\n物品名称："+$("#equname").text(),
                    btnCancelLabel:"取消",
                    btnOKLabel:"确认",
                    callback:function (result) {
                        if(result)
                            submit(rows.equId);
                    }
                }
            )
        }
    }







    $('#table').bootstrapTable({

        url: 'doSearchEqu?type=5',         //请求后台的URL（*）
        method: 'get',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortOrder: "asc",                   //排序方式
        //    queryParams: oTableInit.queryParams,//传递参数（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
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
            field: 'operation',
            title: '操作',
            align: 'center',
            events:operateEvents,//给按钮注册事件
            formatter:addFunctionAlty//表格中增加按钮
        }]
    });

    function addFunctionAlty(value,rows,index) {
        return [

            '<button id="return" type="button" class="btn btn-primary return">归还</button>'

        ].join('');

    }

    function submit(id) {
        $.post(
            "createreq",
            {
                //归还申请 type根据规定为12
                type:12,
                goalid:$("#equid").text(),
                goalName:$("#equname").text(),
                content:"对"+$("#equname").text()+"的归还申请",
                level:"2",
                initiator:"${user.userName}"
            },function (data) {
                BootstrapDialog.show({
                    title:"反馈",
                    message:"服务器反馈："+data
                })

            }



        )
    }







</script>



</html>
