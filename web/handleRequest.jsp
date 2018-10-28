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
                    <button class="agree" bind="${items.reqId}">同意</button>\n
                    <button class="refuse" bind="${items.reqId}">拒绝</button>\n
                    <button class="refuse" bind="${items.reqId}">移交上级</button>

            </td>
        </tr>
        </c:forEach>
    </div>

    <div>

    </div>
</body>
</html>
