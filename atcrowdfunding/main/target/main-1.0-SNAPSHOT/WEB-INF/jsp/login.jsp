<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/login.css">
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="${APP_PATH}/index.htm" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">
    ${exception.message}
    <form id="loginForm" action="${APP_PATH}/doLogin.do" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="floginacct" name="loginacct" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" id="fuserpswd" name="userpswd" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <select id="ftype" class="form-control" name="type">
                <option value="member">会员</option>
                <option value="user">管理</option>
            </select>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
            <br>
            <label>
                忘记密码
            </label>
            <label style="float:right">
                <a href="${APP_PATH}/reg.htm">我要注册</a>
            </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/jquery/layer/layer.js"></script>
<script>
    function dologin() {
        var floginacct = $("#floginacct");
        var fuserpswd = $("#fuserpswd");
        var ftype = $("#ftype");

        var loadingIndex = -1;

        //对于表单数据不能用null进行判断，如果文本框为空，获取的是""
        if($.trim(floginacct.val()) == ""){
            // alert("用户账号不能为空，请重新输入！");
            layer.msg("用户账号不能为空，请重新输入！", {time:1000, icon:5, shift:6}, function () {
                floginacct.val("");
                floginacct.focus();
            });
            return false;
        }

        $.ajax({
            type : "post",
            data :{
                "loginacct" : floginacct.val(),
                "userpswd" : fuserpswd.val(),
                "type" : ftype.val()
            },
            url : "${APP_PATH}/doLogin.do",
            beforeSend : function () {
                //表单校验
                loadingIndex = layer.msg('处理中', {icon: 16});
                return true;
            },
            success : function(result){
                layer.close(loadingIndex);
                if(result.success){
                    window.location.href="${APP_PATH}/main.htm";
                }else{
                    layer.msg(result.message , {time: 1000, icon: 5, shift: 6});
                }
            },
            error : function(){
                layer.msg("登录失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
        // var type = $(":selected").val();
        // if ( type == "user" ) {
        //     window.location.href = "main.html";
        // } else {
        //     window.location.href = "index.html";
        // }
    }
</script>
</body>
</html>