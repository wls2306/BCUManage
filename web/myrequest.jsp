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

<style>
    table{
        border-collapse: collapse;
    }

</style>


<body>
    <h2>我的请求</h2>



    <table  border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th>请求编号</th>
            <th>请求类别</th>
            <th>目标</th>
            <th>描述</th>
            <th>状态</th>
            <th>反馈</th>
            <th>审核人</th>
            <th>发起时间</th>
            <th>操作</th>
        </tr>


        <c:if test="${request==null||fn:length(request)<1}">
            <td colspan="9" align="center" > 未找到相应信息 </td>

        </c:if>

            <c:forEach var="items" items="${request}">
             <tr>
                <td>${items.reqId}</td>
                <td>${items.reqType}</td>
                <td>${items.reqGoalId}</td>
                <td>${items.reqContent}</td>
                <td>
                    <c:choose>
                        <c:when test="${items.reqStatus eq '0'}">
                            <span style="color: darkorange">待审核</span>
                        </c:when>

                        <c:when test="${items.reqStatus eq '1'}">
                            <span style="color:#34fc48" >通过</span>
                        </c:when>

                        <c:when test="${items.reqStatus eq '-1'}">
                            <span style="color:red">拒绝</span>
                        </c:when>

                        <c:when test="${items.reqStatus eq '2'}">
                            <span style="color:blue">上级审核</span>
                        </c:when>


                    </c:choose>

                </td>
                <td>${items.reqBack}</td>
                <td>${items.reqAuditor}</td>
                <td>${items.reqPostTime}</td>
                 <td></td>
            </tr>
            </c:forEach>



    </>
</body>
</html>
