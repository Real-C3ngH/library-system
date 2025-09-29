<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更改密码</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 100px"></div>

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


<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
            <form method="post" action="admin_repasswd_do" id="repasswd">
                <div class="form-group">
                    <label for="oldPasswd">旧密码</label>
                    <input type="password" class="form-control" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码">
                </div>
                <div class="form-group" style="margin-top: 15px;">
                    <label for="newPasswd">新密码</label>
                    <input type="password" class="form-control" id="newPasswd" name="newPasswd" placeholder="输入新密码">
                </div>
                <div class="form-group" style="margin-top: 15px;">
                    <label for="reNewPasswd">确认新密码</label>
                    <input type="password" class="form-control" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码">
                </div>
                <em id="tishi" style="color: red; display: block; margin-top: 10px;"></em>
                <div class="form-group text-center" style="margin-top: 20px;">
                    <input type="submit" value="提交" class="btn btn-default">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tishi").text("两次输入的新密码不同，请检查");
        } else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tishi").text("请填写完毕后提交");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tishi").text("两次输入的新密码不同，请检查");
            return false;
        }
    })
</script>
</body>
</html>
