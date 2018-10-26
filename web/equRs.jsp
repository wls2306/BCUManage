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
<html>
<head>
    <title>资产查询结果</title>
</head>

<style type="text/css">

    table{

        border-collapse: collapse;
    }

</style>


<body>
    <h2>资产查询结果</h2>

    <div id="rstable">
        <table  border="1" cellspacing="0" cellpadding="10">
            <tr>
                <th>编号</th>
                <th>名称</th>
                <th>使用方向</th>
                <th>存放位置</th>
                <th>状态</th>
                <th>操作</th>
            </tr>

            <c:forEach var="items" items="${result}">
               <c:if test="${empty items.equName}">
                   <td colspan="5" > 未找到相应信息 </td>

               </c:if>



                <td> ${items.equId}</td>
                <td> ${items.equName}</td>
                <td> ${items.equUseDirection}</td>
                <td> ${items.equLocation}</td>
                <td>
                    <c:choose>
                        <c:when test="${items.equStatus eq '1'}">
                            空闲
                        </c:when>

                        <c:when test="${items.equStatus eq '0'}">
                            被租用
                        </c:when>

                        <c:when test="${items.equStatus eq '-1'}">
                            维修中
                        </c:when>

                    </c:choose>

                </td>

                <td>
                    <button class="look" bind="${items.equId}">详情</button>
                    <button class="reamark"  bind="${items.equId}">修改状态</button>

                    <button class="repair"  bind="${items.equId}">申请维修</button>
                    <button  class="scrap"  bind="${items.equId}">申请报废</button>

                </td>



            </c:forEach>



        </table>



    </div>

</body>
</html>
