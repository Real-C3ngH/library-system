<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
        
        // 删除读者确认功能
        $(document).on('click', '.delete-reader-btn', function(e) {
            e.preventDefault();
            var readerId = $(this).data('reader-id');
            var readerName = $(this).data('reader-name');
            
            if (confirm('确定要删除读者《' + readerName + '》吗？\n\n删除读者会同时删除其借书记录，此操作不可撤销！')) {
                window.location.href = 'reader_delete.html?readerId=' + readerId;
            }
        });
    </script>
</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="allreaders.html"</script>
</c:if>

<!-- 成功和错误消息弹窗 -->
<c:if test="${!empty succ}">
    <script>
        alert("${succ}");
    </script>
</c:if>
<c:if test="${!empty error}">
    <script>
        alert("${error}");
    </script>
</c:if>




<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            全部读者
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>读者号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>电话</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers}" var="reader">
                <tr>
                    <td><c:out value="${reader.readerId}"></c:out></td>
                    <td><c:out value="${reader.name}"></c:out></td>
                    <td><c:out value="${reader.sex}"></c:out></td>
                    <td><c:out value="${reader.birth}"></c:out></td>
                    <td><c:out value="${reader.address}"></c:out></td>
                    <td><c:out value="${reader.phone}"></c:out></td>
                    <td><a href="reader_edit.html?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                    <td><button type="button" class="btn btn-danger btn-xs delete-reader-btn" data-reader-id="<c:out value="${reader.readerId}"></c:out>" data-reader-name="<c:out value="${reader.name}"></c:out>">删除</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
