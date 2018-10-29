<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/26
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账户信息</title>
</head>

<style type="text/css">
    table{
        border-collapse: collapse;
    }
</style>



<body>

    <h2>账号信息</h2>

    <div class="table" >
        <table   border="1px solid #1E90FF" align="center" >



            <tr>
                <td class="object">姓名：</td>
                <td> ${user.userName} </td>

            </tr>

            <tr>
                <td class="object">密码：</td>
                <td><button>修改密码</button></td>
            </tr>


            <tr>
                <td class="object">身份类型:</td>
                <td> <c:choose>
                    <c:when test="${user.userType eq '1'}">
                        教师
                    </c:when>

                    <c:when test="${user.userType eq '2'}">
                        设备管理员
                    </c:when>

                    <c:when test="${user.userType eq '3'}">
                        专业秘书
                    </c:when>

                    <c:when test="${user.userType eq '4'}">
                       最高管理员
                    </c:when>

                    <c:when test="${user.userType eq '5'}">
                        系统管理员
                    </c:when>

                </c:choose></td>

            </tr>

        </table>



    </div>

</body>
</html>
