<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>


</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 50px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">用户注册</h3>
        </div>
        <div class="panel-body">
            <form action="reader_add" method="post" id="readeredit" >
                <div class="form-group">
                    <label for="name">用户名</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                </div>
                <div class="form-group">
                    <label for="ruserPassword">确认密码</label>
                    <input type="password" class="form-control" name="ruserPassword" id="ruserPassword" placeholder="请再次输入密码">
                </div>
                <div class="form-group">
                    <label for="sex">性别</label>
                    <select class="form-control" name="sex" id="sex">
                        <option value="">请选择性别</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="birth">出生日期</label>
                    <input type="text" class="form-control Wdate" id="birth" name="birth"
                           readonly="readonly" onclick="WdatePicker();" placeholder="请选择出生日期">
                </div>
                <div class="form-group">
                    <label for="address">居住地址</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="请输入居住地址">
                </div>
                <div class="form-group">
                    <label for="phone">通讯电话</label>
                    <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入手机号码">
                </div>
                <div class="form-group text-center" style="margin-top: 30px;">
                    <button type="submit" class="btn btn-success btn-lg" style="margin-right: 15px;">注册</button>
                    <a href="login" class="btn btn-default btn-lg">返回</a>
                </div>

                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#password").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                        if($("#password").val() !== $("#ruserPassword").val()){
                            alert("两次输入的密码不一致！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>