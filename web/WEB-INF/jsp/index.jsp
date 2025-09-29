<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <style>
        #login{
           height: 50%;
            width: 28%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            display: block;
            position: center;
        }

        .form-group {
            margin-bottom: 0;
        }
        * {
            padding:0;
            margin:0;
        }
    </style>
</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<h2 style="text-align: center; color: white; font-family: '华文行楷'; font-size: 500%">图 书 管 理 系 统</h2>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff; display: flex; justify-content: space-between; align-items: center; border-radius: 8px 8px 0 0; padding: 24px 24px 12px 24px; border-bottom: 1px solid #eee;">
        <div style="display: flex; align-items: center;">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" style="margin-right: 10px;"><circle cx="12" cy="12" r="10" fill="#007bff"/><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" fill="#fff"/></svg>
            <span style="font-size: 1.5rem; font-weight: 600; color: #222;">欢迎登录</span>
        </div>
        <a href="register" class="btn btn-outline-primary" style="font-weight: 500; border-radius: 20px; padding: 6px 24px;">去注册</a>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
    <button id="loginButton"  class="btn btn-primary btn-block" style="font-size: 1.2rem; border-radius: 20px; margin-top: 18px;">登录</button>
    </div>
</div>
    <script>

        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', JSON.stringify({
                username: username,
                password: password,
                remember: checked
            }), {expires: 30, path: ''})
        }
        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#username').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus();
        
        // 检查是否是从logout页面跳转来的，如果是则不自动填充
        if (document.referrer.includes('logout.html')) {
            $('#username').val('');
            $('#passwd').val('');
            $("#remember").prop('checked', false);
            Cookies.remove('loginStatus');
        }
        
        // 当用户手动更改用户名或密码时，取消记住密码的勾选
        var originalUsername = $('#username').val();
        var originalPassword = $('#passwd').val();
        
        $('#username, #passwd').on('input', function() {
            var currentUsername = $('#username').val();
            var currentPassword = $('#passwd').val();
            
            // 如果用户名或密码发生了变化，且当前不是自动填充的状态
            if ((currentUsername !== originalUsername || currentPassword !== originalPassword) && 
                (originalUsername !== '' || originalPassword !== '')) {
                $("#remember").prop('checked', false);
            }
        });
        $("#loginButton").click(function () {
            var username =$("#username").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');
            if (username == '') {
                $("#info").text("提示:账号不能为空");
            }
            else if( passwd ==''){
                $("#info").text("提示:密码不能为空");
            }

            else {

                $.ajax({
                    type: "POST",
                    url: "loginCheck",
                    data: {
                        username:username,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            alert("提示:账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            // 管理员登录成功
                            if(remember){
                                rememberLogin(username,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            alert("提示:登陆成功，跳转中...");
                            window.parent.location.href = "admin_books.html";

                        } else if (data.stateCode.trim() === "2") {
                            // 读者登录成功
                            if(remember){
                                rememberLogin(username,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            alert("提示:登陆成功，跳转中...");
                            window.parent.location.href = "reader_books.html";

                        }
                    }
                });
            }
        })

    </script>
</div>

</body>
</html>
