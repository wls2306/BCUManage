<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/28
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>处理请求</title>
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
    #tableArea{
        margin-left:10px;
    }

</style>


<body>
    <h2>审核申请</h2>

    <span id="reqId" hidden></span>
    <span id="goalid" hidden></span>
    <span id="type" hidden></span>
    <span id="initiator" hidden></span>
    <span id="auditor"  hidden></span>
    <span id="content" hidden></span>
    <div id="tableArea" >
    <table id="table"></table>
    </div>
            <!--
            <th>请求编号</th>
            <th>请求类别</th>
            <th>目标</th>
            <th>描述</th>
            <th>申请人</th>
            <th>发起时间</th>
            <th>操作</th>
             -->

    <!-- 拒绝模态框 -->

    <div class="modal fade" id="rejectModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">拒绝该请求</h4>
                </div>
                <div class="modal-body">
                    <div>请您简述拒绝该请求的原因</div>
                    <div><textarea id="refusereason" cols="50" rows="6"></textarea></div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="rejectsubmit()" data-dismiss="modal">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- 移交上级模态框 -->
    <div class="modal fade" id="upModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="upModalLabel">将该请求移交上级</h4>
                </div>
                <div class="modal-body">
                    <div>请选择处理人的权限:  <select id="access">
                            <option value="2">设备管理员</option>
                            <option value="3">专业秘书</option>
                            <option value="4">最高管理员</option>
                            <option value="5">系统管理员</option>
                    </select>   </div>
                    <div>请您简述移交该请求的原因</div>
                    <div><textarea id="upreason" cols="50" rows="6" ></textarea></div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="upsubmit()" >提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->



</body>


<script>

    window.operateEvents={
        "click .agree":function (e,value,rows,idex) {
            $("#reqId").text(rows.reqId);
            $("#goalid").text(rows.reqGoalId);
            $("#type").text(rows.reqType);
            $("#content").text(rows.reqContent);
            $("#initiator").text(rows.reqInitiator);
            $("#auditor").text("${user.userName}");
            BootstrapDialog.confirm(
                {
                    title: "请再次确认",
                    message: "确认通过该申请吗？",
                    btnCancelLabel: "取消",
                    btnOKLabel: "确认",
                    callback: function (result) {
                        // result will be true if button was click, while it will be false if users close the dialog directly.
                        if (result) {
                            agreesubmit();

                        }
                    }
                }

            )



        },

        "click .reject":function (e,value,rows,idex) {
            $("#reqId").text(rows.reqId);
            $("#goalid").text(rows.reqGoalId);
            $("#type").text(rows.reqType);
            $("#initiator").text(rows.reqInitiator);
            $("#content").text(rows.reqContent);
            $("#auditor").text("${user.userName}");
            $("#rejectModel").modal(open);
        },

        "click .up":function (e,value,rows,idex) {
            $("#reqId").text(rows.reqId);
            $("#goalid").text(rows.reqGoalId);
            $("#type").text(rows.reqType);
            $("#initiator").text(rows.reqInitiator);
            $("#content").text(rows.reqContent);
            $("#auditor").text("${user.userName}");
            $("#upModel").modal(open);
        }





        
    }
        




        $("#table").bootstrapTable({

            url: 'getreq?type=2',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortOrder: "desc",                   //排序方式
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
                title:'请求编号',
                align:'center'
            },{
                field:'reqType',
                title:'请求类别',
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
                field:'reqInitiator',
                title:'发起人',
                align:'center'
            },{
                field:'reqPostTime',
                title:'发起时间',
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
                '<button id="agree" type="button" class="btn btn-primary agree">同意</button>',
                '<button id="reject" type="button" class="btn btn-danger reject">拒绝</button>',
                '<button id="up" type="button" class="btn btn-info up">转移</button>',
            ].join('');

        }


        function agreesubmit() {

            //修改请求状态
            $.get(
                "changereq",
                {
                    type: "1",
                    id: $("#reqId").text(),
                    back: "审核通过",
                    auditor: $("#auditor").text()
                },
                function (data) {
                    BootstrapDialog.show({
                        title:"反馈",
                        message: "请求状态修改服务器反馈：" + data
                    });
                    $("#table").bootstrapTable('refresh');
                }

            )
            //进行相应操作
            $.get(
                "handlereq",
                {
                    type: $("#type").text(),
                    goalId: $("#goalid").text(),
                    content:$("#content").text(),
                    auditor: $("#auditor").text(),
                    initiator: $("#initiator").text()
                },
                function (data) {
                    BootstrapDialog.show({
                        title:"反馈",
                        message: "事件处理服务器反馈：" + data

                    });
                    $("#table").bootstrapTable('refresh');
                }
            )


        }


        function rejectsubmit() {
            //修改请求状态
            $.get(
                "changereq",
                {
                    type: "2",
                    id: $("#reqId").text(),
                    back: $("#refusereason").val(),
                    auditor: $("#auditor").text()
                },
                function (data) {
                    BootstrapDialog.show({
                        title: "反馈",
                        message: "请求状态修改服务器反馈：" + data
                    });
                    $("#table").bootstrapTable('refresh');
                }
            )
        }
            
            
            function upsubmit() {
                //
                $.get(
                    "changereq",
                    {
                        type: "3",
                        id: $("#reqId").text(),
                        back: $("#refusereason").val(),
                        level:$("#access").val(),
                        content:$("#content").text(),
                        auditor: $("#auditor").text()
                    },
                    function (data) {
                        BootstrapDialog.show({
                            title:"反馈",
                            message: "请求状态修改服务器反馈：" + data
                        });
                        $("#table").bootstrapTable('refresh');
                    }
                )

        }
        
        





</script>




</html>
