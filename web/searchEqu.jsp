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
