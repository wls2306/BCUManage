<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/26
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="script/jquery-3.3.1.js"></script>
<html>
<head>
    <title>搜索资产信息</title>
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




<style>

    #byname{
        padding-bottom: 20px;
        margin-top: 10px;
    }

    #byid{
        padding-bottom: 10px;
    }

</style>



<body>
    <h2>搜索资产信息</h2>

    <div id="byname">

        <div class=" info"> 通过资产名称搜索</div>
        <div><input type="text" name="name" id="name" > <button id="search-N" >搜索</button></div>

    </div>


    <div id="byid">

        <div class=" info"> 通过资产编号搜索</div>
        <div><input type="text" id="id" name="id">  <button id="search-I" >搜索</button></div>

    </div>


    <div id="frame">
        <iframe id="resultframe" width="880px" height="500px"  frameborder="0"></iframe>
    </div>



</body>




<script>




    $(document).ready(function () {
        $("#search-N").click( function () {

            $("#resultframe").attr('src', 'doSearchEqu?type=1&id=0&name='+$("#name").val());


        } )

        $("#search-I").click(function () {
            $("#resultframe").attr('src', 'doSearchEqu?type=2&name=0&id='+$("#id").val());

        } )
    })

/*
    function SearchByName() {
        var name=document.getElementsByName("name").values();
        var url="doSearchEqu?type=1&name="+name+"&id=0";
        document.getElementsByName("frame").src=url;

    }


    function SearchById() {
        var id=document.getElementsByName("id").values();
        var url="doSearchEqu?type=2&name=0&id="+id;
        document.getElementsByName("frame").src=url;

    }
*/

</script>



</html>
