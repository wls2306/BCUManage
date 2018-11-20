<%--
  Created by IntelliJ IDEA.
  User: 李炎昊
  Date: 2018/11/6
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加配件</title>
</head>




  <style>
    table{
        border-collapse: collapse;
        border:1px solid black;
        padding-top:35px;

        border-spacing: 100px;
    }

    #main{
        margin-left: 150px;
    }

    #button{
        margin-top: 20px;
        margin-left: 50px;
    }

</style>


<body>
<h2>添加配件信息</h2>

<div id="main">

    <form action="handleparts" method="get" id="form">
        <table border="1" cellspacing="0"cellspacing="10" >
            <tr>
                <td>配件编号</td>
                <td><input type="text" name="partsId"></td>
            </tr>
            <tr>
                <td>配件名称</td>
                <td><input type="text" name="partsName" id="partsName"></td>
            </tr>
            <tr>
                <td>单位</td>
                <td><input type="text" name="partsUnit"></td>
            </tr>
            <tr>
                <td>数量</td>
                <td><input type="text" name="partsNumber"></td>
            </tr>
            <tr>
                <td>当前状态</td>
                <td><input type="text" name="partsStatus"></td>
            </tr>
            <tr>
                <td>管理人</td>
                <td><input type="text" name="partsManager"></td>
            </tr>
            <tr>
                <td>存放位置</td>
                <td><input type="text" name="partsLocation"></td>
            </tr>



        </table>

        <div hidden><input type="text" name="type" value="1"></div>

        <div id="button"> <button id="b" > 提交 </button> </div>

    </form>

</div>






</body>

</html>
