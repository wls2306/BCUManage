<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Wls
  Date: 2018/10/27
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资产借用申请</title>
</head>
<script src="script/jquery-3.3.1.js"></script>
<body>
        <h2>资产借用申请</h2>

        <div id="main">

                <div id="rstable">
                    <table  border="1" cellspacing="0" cellpadding="10">
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>使用方向</th>
                            <th>存放位置</th>

                            <th>操作</th>

                        </tr>
                        <c:if test="${result==null||fn:length(result)<1}">
                            <td colspan="7" align="center" > 未找到相应信息 </td>

                        </c:if>

                        <c:forEach var="items" items="${result}">
                            <c:if test="${empty items.equName}">
                                <td colspan="5" > 未找到相应信息 </td>

                            </c:if>
                            <tr>


                                <td> ${items.equId}</td>
                                <td> ${items.equName}</td>
                                <td> ${items.equUseDirection}</td>
                                <td> ${items.equLocation}</td>


                                <td>
                                    <button class="borrow" bindid="${items.equId}" bindname="${items.equName}">申请借用</button>

                                </td>

                            </tr>

                        </c:forEach>
                    </table>

                </div>

        </div>





        </div>


<span id="id" hidden></span>
<span id="name" hidden></span>
</body>

<script>
    $(document).ready(function () {



    })


    $(".borrow").click(function () {
        $("#id").text($(this).attr('bindid'));
        $("#name").text($(this).attr('bindname'));

        var r=confirm("请确认申请信息\n申请资产编号:" +$(this).attr('bindid')+"\n申请资产名称:"+$(this).attr('bindname'));
        if(r)
            submit();
    })


    /**
     * String reqType,String reqGoalId,String reqGoalName,String reqContent,String reqApprovalLevel,String reqInitiator,String reqPostTime
     */

    var submit=function submit() {
            $.post(
                "createreq",{
                    type:10,
                    goalid:$("#id").text(),
                    goalname:$("#name").text(),
                    content:"对"+$("#name").text()+"的借用申请",
                    level:"2",
                    initiator:"${user.userName}"
                },function (data) {
                    alert(data);
                }
            )
    }

</script>




</html>
