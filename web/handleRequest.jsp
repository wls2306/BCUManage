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
<script src="script/easyUI/easyloader.js"></script>
<script src="script/easyUI/jquery.easyui.min.js"></script>
<script src="script/easyUI/jquery.easyui.mobile.js"></script>
<script src="script/easyUI/jquery.min.js"></script>

<link href="css/icon.css">

<style>


</style>


<body>
    <h2>审核申请</h2>
    <div id="tableArea">
    <table  border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th>请求编号</th>
            <th>请求类别</th>
            <th>目标</th>
            <th>描述</th>
            <th>申请人</th>
            <th>发起时间</th>
            <th>操作</th>
        </tr>


        <c:if test="${request==null||fn:length(request)<1}">
        <td colspan="8" align="center" > 未找到相应信息 </td>

        </c:if>

        <c:forEach var="items" items="${request}">
        <tr>
            <td>${items.reqId}</td>
            <td>${items.reqType}</td>
            <td>${items.reqGoalId}</td>
            <td>${items.reqContent}</td>
            <td>${items.reqInitiator}</td>
            <td>${items.reqPostTime}</td>
            <td>
                    <button class="agree" bind="${items.reqId}">同意</button>
                    <button class="refuse" bind="${items.reqId}">拒绝</button>
                    <button class="up" bind="${items.reqId}">移交上级</button>

            </td>
        </tr>
        </c:forEach>
    </div>

    <div id="chooseid" hidden></div>


    <!-- 拒绝对话框 -->
    <div id="rejectWin" class="easyui-dialog" title="拒绝申请" style="width:300px;height:180px;" closed="true"  >
        <div style="padding-left: 15px">请详细描述拒绝原因</div>
        <div  style="padding-left: 15px"><textarea id="rejectback" rows="4" cols="30"></textarea></div>
        <div style="padding:5px;text-align:center;">
            <button href="#" class="easyui-linkbutton icon-ok" id="rejectSubmit" icon="icons/ok.png">提交</button>
            <!-- <button href="#" class="easyui-linkbutton cancel icon-cancel" icon="icons/cancel.png">取消</button> -->
        </div>
    </div>


    <!-- 移交上级处理对话框 -->

    <div id="upWin" class="easyui-dialog" title="向上级移交申请" style="width:300px;height:250px;" closed="true" >
        <div style="padding-left: 15px;padding-top:10px" >请选择处理人权限：
                <select id="level">
                    <option value="2">设备管理员</option>
                    <option value="3">专业秘书</option>
                    <option value="4">最高管理员</option>
                    <option value="5">系统管理员</option>
                </select>
        </div>
        <div style="padding-left: 15px">请简述原因：</div>
        <div  style="padding-left: 15px"><textarea id="upback" rows="4" cols="30"></textarea></div>
        <div style="padding:5px;text-align:center;">
        <button href="#" class="easyui-linkbutton icon-ok" id="upSubmit" icon="icons/ok.png">提交</button>
            <!--  <button href="#" class="easyui-linkbutton cancel icon-cancel" icon="icons/cancel.png">取消</button> -->
    </div>



    </div>


</body>


<script>
    /****
     * 弹出 拒绝原因输入对话框
     * */
    $(".refuse").click(
        function () {
            $("#chooseid").text($(this).attr('bind'));
            $("#rejectWin").window('open');
        }
    )

    /****
     * 弹出 向上级提交对话框
     * */
    $(".up").click(
        function () {
            $("#chooseid").text($(this).attr('bind'));
            $("#upWin").window('open');
        }
    )



/**
 * 拒绝申请
 * */

    $("#rejectSubmit").click(
        function () {
            $("#rejectWin").window('close');

            $.get(
                "changereq",{
                    type:2,
                    back:$("#rejectback").val(),
                    id:$("#chooseid").text(),
                    auditor: "${user.userName}"

                },function (data) {
                    alert(data);
                    window.location.href=document.referrer;
                }
            )
        }
    )
/**
 * 请求上级 申请提交
 * */

    $("#upSubmit").click(function () {
     //   $("#upSubmit").window('close');
        $.get(
            "changereq",{
                type:3,
                back:$("#upback").val(),
                id:$("#chooseid").text(),
                level:$("#level").val(),
                auditor: "${user.userName}"

            },function (data) {
                alert(data);
                window.location.href=document.referrer;
            }
        )
    })

/**
 * 提示框确认是否同意申请
 **/

    $(".agree").click(
        function () {
            $("#chooseid").text($(this).attr('bind'));
            var r=confirm("确认同意该申请吗？");
            if(r)
                agree();

        }
    )

    /**
     * 同意申请提交
     */
    var agree=function () {
            $.get(
                "changereq",{
                    type:1,
                    back:"审核通过",
                    id:$("#chooseid").text(),
                    auditor:"${user.userName}"
                },function (data) {
                    alert(data);
                    window.location.href=document.referrer;
                }
            )
        }

</script>





</html>
