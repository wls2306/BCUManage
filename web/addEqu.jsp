<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/26
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加资产信息</title>
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
    <h2>添加资产信息</h2>

    <div id="main">

            <form action="addEqu" method="post" id="form">
            <table border="1" cellspacing="0"cellspacing="10" >
                <tr>
                    <td>资产编号</td>
                    <td><input type="text" name="equId"></td>
                </tr>
                <tr>
                    <td>资产名称</td>
                    <td><input type="text" name="equName" id="equName"></td>
                </tr>
                <tr>
                    <td>型号</td>
                    <td><input type="text" name="equModel"></td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td><input type="text" name="equType"></td>
                </tr>
                <tr>
                    <td>规格</td>
                    <td><input type="text" name="equFormat"></td>
                </tr>
                <tr>
                    <td>单价</td>
                    <td><input type="text" name="equPrice"></td>
                </tr>
                <tr>
                    <td>主件数量</td>
                    <td><input type="text" name="equMainCount"></td>
                </tr>
                <tr>
                    <td>总金额</td>
                    <td><input type="text" name="equTotalPrice" ></td>
                </tr>
                <tr>
                    <td>单位</td>
                    <td><input type="text" name="equUnit" ></td>
                </tr>
                <tr>
                    <td>单据</td>
                    <td><input type="text" name="equTicket"></td>
                </tr>
                <tr>
                    <td>生产厂家</td>
                    <td><input type="text" name="equFactory" > </td>
                </tr>
                <tr>
                    <td>出厂号</td>
                    <td><input type="text" name="equFactoryNo" ></td>
                </tr>
                <tr>
                    <td>出厂日期</td>
                    <td><input type="date" name="equFactoryDate"></td>
                </tr>
                <tr>
                    <td>购置日期</td>
                    <td><input type="date" name="equBoughtDate" ></td>
                </tr>
                <tr>
                    <td>使用方向</td>
                    <td><input type="text" name="equUseDirection"></td>
                </tr>
                <tr>
                    <td>当前状态</td>
                    <td><input type="text" name="equStatus"></td>
                </tr>
                <tr>
                    <td>管理人</td>
                    <td><input type="text" name="equManager"></td>
                </tr>
                <tr>
                    <td>存放位置</td>
                    <td><input type="text" name="equLocation"></td>
                </tr>
                <tr>
                    <td>归属</td>
                    <td><input type="text" name="equBelong" ></td>
                </tr>


                </table>
                <div id="button"> <button id="b" > 提交 </button> </div>

            </form>

    </div>




</body>
</html>
