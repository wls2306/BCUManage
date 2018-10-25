<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/25
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>

<html>
<head>
    <title>北京城市学院资产管理系统</title>
</head>

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
       /* height: 1000px;*/
        border-right: black solid 1px;
        display: table-cell;

    }

    #content{
        width: 980px;
        display: table-cell;

    }

    footer{
       padding-left: 500px;
    }




    footer{
        border-top: black solid 1px;
    }


</style>

<body>
    <div id="all">
            <div id="title">
                <span id="title-1">北京城市学院资产管理系统</span>
                <span id="title-2">欢迎你！[ ${user.userType} ] ${user.userName}</span>
            </div>
            <div id="main">
               <!-- <nav id="nav"> </nav>   顶部导航栏 ，暂不使用 -->
                    <div id="row">
                            <div id="menu">


                            </div>

                            <div id="content">
                                <iframe name="frame" width="900px" height="800px" src="login.jsp" frameborder="0" scrolling="1">
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
