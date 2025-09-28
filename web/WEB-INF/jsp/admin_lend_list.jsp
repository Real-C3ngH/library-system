<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借还日志</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
        
        // 删除借还记录确认功能
        $(document).on('click', '.delete-lend-btn', function(e) {
            e.preventDefault();
            var serNum = $(this).data('ser-num');
            var bookId = $(this).data('book-id');
            var readerId = $(this).data('reader-id');
            
            if (confirm('确定要删除借还记录吗？\n\n记录详情：\n图书ID：' + bookId + '\n读者ID：' + readerId + '\n流水号：' + serNum + '\n\n此操作不可撤销！')) {
                window.location.href = 'deletelend.html?serNum=' + serNum;
            }
        });
    </script>
</head>
<body background="img/login_bg.jpeg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>

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

<div style="position: relative;padding-top: 100px">
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>流水号</th>
                <th>图书号</th>
                <th>读者证号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="alog">
                <tr>
                    <td><c:out value="${alog.ser_num}"></c:out></td>
                    <td><c:out value="${alog.bookId}"></c:out></td>
                    <td><c:out value="${alog.readerId}"></c:out></td>
                    <td><c:out value="${alog.lendDateStr}"></c:out></td>
                    <td><c:out value="${alog.backDateStr}"></c:out></td>
                    <td>
                        <c:if test="${!empty alog.backDateStr}">
                            <button type="button" class="btn btn-danger btn-xs delete-lend-btn" data-ser-num="<c:out value='${alog.ser_num}'></c:out>" data-book-id="<c:out value='${alog.bookId}'></c:out>" data-reader-id="<c:out value='${alog.readerId}'></c:out>">删除</button>
                        </c:if>
                        <c:if test="${empty alog.backDateStr}">
                            <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
