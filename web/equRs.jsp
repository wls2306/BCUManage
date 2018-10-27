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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>资产查询结果</title>
</head>
<script src="script/jquery-3.3.1.js">
</script>

<script>

</script>

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
                <th>使用者</th>
                <th>操作</th>

            </tr>

            <c:if test="${result==null||fn:length(result)<1}">
                <td colspan="7" align="center" > 未找到相应信息 </td>

            </c:if>
            <c:forEach var="items" items="${result}">

                <tr>


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
                            占用
                        </c:when>

                        <c:when test="${items.equStatus eq '-1'}">
                            维修中
                        </c:when>

                    </c:choose>

                </td>

                    <td>${items.equUser}</td>

                <td>
                    <button class="look" bind="${items.equId}">详情</button>
                    <button class="remark"  bind="${items.equId}"  id="remark">修改状态</button>

                    <button class="repair"  bind="${items.equId}">申请维修</button>
                    <button  class="scrap"  bind="${items.equId}">申请报废</button>
                    <button  class="delete" bind="${items.equId}">删除资产</button>
                </td>

                </tr>

            </c:forEach>



        </table>



    </div>


    <div id="changestatus" >
        <h3>修改资产状态</h3>
        <span>当前选择的资产ID：</span><span id="chooseid"></span>
        <div> 请选择要修改的状态
                     

               <select id="status">
                   <option value="-1">维修</option>
                   <option value="0">占用</option>
                   <option value="1">空闲</option>
               </select>

            <br>
            
            <div id="inputuser" >使用人：<input type="text" name="user" id="user"></div>

            <button id="statussubmit">提交</button>

        </div>


    </div>

<span id="deleteid" hidden></span>




</body>


<script>

    var type=1;

    $(document).ready(function () {
        $("#changestatus").hide();
        $("#inputuser").hide();
        $(".remark").click(function () {

            $("#changestatus").show();
            $("#chooseid").text($(this).attr('bind'));

        })

        $("#statussubmit").click(submit);

        $("#status").change(function () {
            var v=$(this).val();

            if(v=="0") {
                type = 2;
                inputuserappear();
            }
        else {
                type = 1;
                $("#inputuser").hide();
            }
        })


    })




    var appear=function appear() {
        $("#changestatus").show()

    }

    var inputuserappear=function inputuserappear() {
        type=2;
        $("#inputuser").show()
    }



   var submit= function submit() {
        $.get("changeEquStatus",
            {
                type:type,
                status:$("#status").val(),
                id:$("#chooseid").text(),
                user:$("#user").val()
            },function (data) {
                alert(data);
                window.location.href=document.referrer;

            }
        )
    }


    $(".delete").click(function () {

        $("#deleteid").val($(this).attr("bind"));
        var rs=confirm("确认删除本条资产信息吗？\n您将要删除的资产编号是:"+$("#deleteid").val());

        if(rs)
            deleteequ();
    })



    var deleteequ=function () {
    //    alert($("#deleteid").val());
        $.get("changeEquStatus", {
                type:"3",
                id:$("#deleteid").val()
            }, function (data) {
                alert(data);
                window.location.href=document.referrer;
            }
        )}




</script>



</html>
