<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/25
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>北京城市学院资产管理系统</title>
</head>
<script src="script/jquery-3.3.1.js"></script>
<style type="text/css">



    #all{
        width: 1280px;
        margin-left: auto;
        margin-right: auto;

    }

    #main{
        display: table;
    }

    #title{

        border-bottom: black solid 1px;
    }

    #title-1{
        align-content: left;
        font-size: 35px;


    }

    #title-2{
        margin-left: 325px;
    }

    #row{
        display: table-row;
    }
    #nav{
        width: 100%;
    }

    #menu{
        width: 300px;
        border-right: black solid 1px;
        display: table-cell;
        vertical-align: top;

    }

    #content{
        width: 980px;
        display: table-cell;
        vertical-align: top;
    }

    footer{
       padding-left: 500px;
    }




    footer{
        border-top: black solid 1px;
    }

    #menu-content{
        margin-top: 30px;
        margin-left: 45px;
    }

    .menu-item{
        padding-bottom: 10px;
    }

</style>

<body>
    <div id="all">
            <div id="title">
                <span id="title-1">北京城市学院资产管理系统</span>
                <span id="title-2">欢迎你！[<c:choose>
                    <c:when test="${user.userType eq '1'}">
                        <span style="color: blue;">教师</span>
                    </c:when>

                    <c:when test="${user.userType eq '2'}">
                        <span style="color: green;">设备管理员</span>
                    </c:when>

                    <c:when test="${user.userType eq '3'}">
                        <span style="color:#CC00CC;">专业秘书</span>
                    </c:when>

                    <c:when test="${user.userType eq '4'}">
                        <span style="color:red;">专业主任</span>
                    </c:when>

                    <c:when test="${user.userType eq '5'}">
                        <span style="color:deeppink;">实践中心主任</span>
                    </c:when>

                    <c:when test="${user.userType eq '6'}">
                        <span style="color:pink;">系统管理员</span>
                    </c:when>

                </c:choose> ] ${user.userName}</span>
            </div>
            <div id="main">
               <!-- <nav id="nav"> </nav>   顶部导航栏 ，暂不使用 -->
                    <div id="row">
                            <div id="menu">
                                    <div id="menu-content">

                                        <!-- 规定： Type ： 1 为正常菜单链接  2 为 加粗字-->
                                            <c:forEach var="list" items="${menuList}">
                                                    <c:choose>

                                                        <c:when test="${list.menuType eq '2'}">
                                                           <div class="menu-item"> <strong> ${list.menuName} </strong></div>
                                                        </c:when>

                                                        <c:when test="${list.menuType eq '1'}">
                                                            <div class="menu-item"> &nbsp; &nbsp; <a href="${list.menuUrl}" target="frame">${list.menuName}</a>
                                                                
                                                            </div>
                                                        </c:when>

                                                    </c:choose>
                                            </c:forEach>
                                    </div>
                            </div>

                            <div id="content">
                                <iframe name="frame" width="1000px" height="800px" src="myinfo.jsp" frameborder="0" scrolling="1">
                                    您的浏览器不支持HTML5，请升级浏览器再试
                                </iframe>

                            </div>
                    </div>



            </div>
        <footer >
            北城移动应用开发工作室 制作
        </footer>
    </div>
</body>
</html>
