<%--
  Created by IntelliJ IDEA.
  User: 李炎昊
  Date: 2018/11/19
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>配件管理</title>
</head>


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


<!-- 对话框  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>






<body>
    <h2>配件管理</h2>
    <div id="partstable">
          <table id="table"></table>
    </div>

</body>


<!-- 增加数量 -->

<div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">为配件增加数量</h4>
            </div>
            <div class="modal-body">
                <div>您要增加的项目名称为：<span id="projectName"></span></div>
                <div>请输入要增加多少个配件？</div>
                <div><input type="text" id="count"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addsubmit()" data-dismiss="modal">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div id="chooseid"></div>
<div id="choosecount" ></div>


<script>

    /**
     *   private String partsId;//id
     private String partsName;//名字
     private String partsUnit;//单位
     private String partsNumber;//数量
     private String partsStock;//库存
     private String partsStatus;//现状
     private String partsManager;//管理人
     private String partsLocation;//存放地
     */

    window.operateEvents= {
        "click .add": function (e, value, rows, index) {
            $("#chooseid").val(rows.partsId);
            $("#projectName").text(rows.partsId);
            $("#addModel").modal(open);
        },
        "click .delete":function (e, value, rows, index) {
            $("#chooseid").val(rows.partsId);
            $("#projectName").text(rows.partsId);
            BootstrapDialog.confirm({
                title: "确认删除该配件吗？",
                message: '请确认你将要删除的配件信息\n配件编号：'+ $("#chooseid").val() +"",
                type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                closable: true, // <-- Default value is false
                draggable: true, // <-- Default value is false
                btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                btnOKLabel: '确认', // <-- Default value is 'OK',
                btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
                callback: function(result ) {
                    // result will be true if button was click, while it will be false if users close the dialog directly.
                    if(result) {
                        deleteSubmit();
                    }
                }
            })
        },
    }


    $('#table').bootstrapTable({

        url: 'handleparts?type=5',         //请求后台的URL（*）
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
            field:'partsId',
            title:'编号',
            align:'center'
        },{
            field:'partsName',
            title:'名称',
            align:'center'
        },{
            field:'partsUnit',
            title:'单位',
            align:'center'
        },{
            field:'partsNumber',
            title:'剩余数量',
            align:'center'
        },{
            field:'partsManager',
            title:'管理人',
            align:'center'
        },{
            field:'partsLocation',
            title:'存放地',
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
            '<button id="delete" type="button" class="btn btn-info btn-sm delete">删除配件</button>',
            '<button id="add" type="button" class="btn btn-primary btn-sm  add">增加数量</button>'
        ].join('');

    }


    function addsubmit() {
        $.get(
            "handleparts?type=3",
            {
                id:$("#chooseid").val(),
                count:$("#count").val()
            },function (data) {
                BootstrapDialog.show({
                    title:"反馈",
                    message:  data
                });
                $("#table").bootstrapTable('refresh');
            }

        )
    }



    function deleteSubmit() {
        $.get(
            "handleparts?type=2",
            {
                id:$("#chooseid").val()
            },function (data) {
                BootstrapDialog.show({
                    title:"反馈",
                    message:data
                });
                $("#table").bootstrapTable('refresh');
            }
        )

    }

</script>





</html>
