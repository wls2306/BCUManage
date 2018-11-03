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


<!-- 对话框  -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>





<style type="text/css">

    #rstable{
        margin-left: 10px;
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

    window.operateEvents= {
        "click .details": function (e, value, rows, index) {
            BootstrapDialog.alert("功能正在开发中！")
        },

        "click .delete":function (e,value,rows,idex) {
            BootstrapDialog.confirm({
                title: "确认删除该资产信息？",
                message: '请确认你将要删除的资产信息\n资产编号：'+rows.equId+"",
                type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                closable: true, // <-- Default value is false
                draggable: true, // <-- Default value is false
                btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                btnOKLabel: '确认', // <-- Default value is 'OK',
                btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
                callback: function(result ) {
                    // result will be true if button was click, while it will be false if users close the dialog directly.
                    if(result) {
                        alert(rows.equId);
                        deleteEqu(rows.equId);
                    }
                }
            })
        },


        "click .change":function (e,value,rows,idex,status) {
            BootstrapDialog.show({
                  title:"修改当前资产的使用状态"  ,
                  message:$('<span>当前选择的资产ID：</span>\n' +
                      '        <div> 请选择要修改的状态\n' +
                      '                     \n' +
                      '\n' +
                      '               <select id="status">\n' +
                      '                   <option value="-1">维修</option>\n' +
                      '                   <option value="0">占用</option>\n' +
                      '                   <option value="1">空闲</option>\n' +
                      '               </select>\n' +
                      '\n' +
                      '            <br>\n' +
                      '            \n' +
                      '            <div id="inputuser" >使用人：<input type="text" name="user" id="user"></div>\n' +
                      '\n' +

                      '\n' +
                      '        </div>\n')  ,
                data:{
                      "status":status,
                        "user":$("#user").val(),
                        "id":rows.equId,
                },
                buttons:[
                    {
                        label:"提交",
                        icon: 'glyphicon glyphicon-check',
                        cssClass: 'btn-primary',
                        action:function (dialogRef) {
                            submit(1,dialogRef.getData("status"),dialogRef.getData("id"));
                            dialogRef.close();
                        }
                    }

                ]




                })

        }



    }




    $('#table').bootstrapTable({

        url: 'doSearchEqu?type=4',         //请求后台的URL（*）
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
            title:'编号',
            align:'center'
        },{
            field:'equName',
            title:'名称',
            align:'center'
        },{
            field:'equUseDirection',
            title:'方向',
            align:'center'
        },{
            field:'equLocation',
            title:'存放位置',
            align:'center'
        },{
            field:'equStatus',
            title:'状态',
            align:'center'
        },{
            field:'equUser',
            title:'使用人',
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
            '<button id="details" type="button" class="btn btn-info btn-sm details">详情</button>',
            '<button id="change" type="button" class="btn btn-primary btn-sm  change">修改状态</button>',
            '<button id="fix" type="button" class="btn btn-warning btn-sm fix">申请维修</button>',
            '<button id="scrap" type="button" class="btn btn-warning btn-sm scrap">申请报废</button>',
            '<button id="delete" type="button" class="btn btn-danger btn-sm delete">删除资产</button>',
        ].join('');

    }





    var type=1;

    $(document).ready(function () {
        $("#changestatus").hide();
        $("#inputuser").hide();
        $(".remark").click(function () {

            $("#changestatus").show();
            $("#chooseid").text($(this).attr('bind'));

        })

        $("#statussubmit").click(submit);

        var status=1;
        $("#status").change(function () {
            var v=$(this).val();
            status=v;

        })


    })




    var appear=function appear() {
        $("#changestatus").show()

    }

    var inputuserappear=function inputuserappear() {
        type=2;
        $("#inputuser").show()
    }



   function submit(type,status,id,user) {

        alert(type,status,id,user);


        $.get("changeEquStatus",
            {
                type:type,
                status:status,
                id:id,
                user:user
            },function (data) {
                BootstrapDialog.alert(data);
                $("#table").bootstrapTable("refresh");

            }
        )
    }


    $(".delete").click(function () {

        $("#deleteid").val($(this).attr("bind"));
        var rs=confirm("确认删除本条资产信息吗？\n您将要删除的资产编号是:"+$("#deleteid").val());

        if(rs)
            deleteequ();
    })



    function deleteEqu(id) {
    //    alert($("#deleteid").val());
        $.get("changeEquStatus", {
                type:"3",
                id:id
            }, function (data) {
            BootstrapDialog.alert(data);
            $("#table").bootstrapTable("refresh");
            }
        )}




</script>



</html>
