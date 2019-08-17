<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>重置密码 - {$config["appName"]}</title>
    <link href="/theme/assets/home/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/home/css/bimoe.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/layui/layui.css" rel="stylesheet" type="text/css" />
</head>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none">
    <symbol id="icon-lock" viewBox="0 0 448 512"><path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" /></symbol>
</svg>
<body>
    <div id="wrap-reset">
        <div class="container">
            <div class="bimoe-wrap">
                <div class="bimoe-inner">
                    <h3 class="bimoe-form-title">
                        重置密码<span class="bimoe-switch pull-right"><a href="/auth/login">登录</a> | <a href="/auth/register">注册</a></span>
                    </h3>
                    <form class="bimoe-form" action="javascript:void(0);"  method="POST">
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-lock" /></svg>
                                <input type="text" id="password" class="bimoe-form-input require" placeholder="密码" />
                            </label>
                        </div>
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-lock" /></svg>
                                <input type="text" id="repasswd" class="bimoe-form-input require" placeholder="重复密码" />
                            </label>
                        </div>
                        <div class="last">
                            <input class="btn btn-login btn-block btn-lg" type="submit" id="reset" value="确认" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <p class="text-center" style="padding-top: 20px;">
            <script type="text/javascript">document.write(new Date().getFullYear());</script> © <a href="/staff">STAFF</a> - {$config["appName"]}
        </p>
    </div>
    <script src="/theme/assets/home/js/jquery.min.js"></script>
    <script src="/theme/assets/layui/layui.js"></script>
    <script>
        $(document).ready(function(){
            layui.use('layer', function(){});
            function reset(){
                $.ajax({
                    type:"POST",
                    url:"/password/token/{$token}",
                    dataType:"json",
                    data:{
                        password: $("#password").val(),
                        repasswd: $("#repasswd").val(),
                    },
                    success:function(data){
                        if(data.ret){
                            layer.msg(data.msg);
                            window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                        }else{
                            layer.msg(data.msg);
                        }
                    },
                    error:function(jqXHR){
                        layer.msg("发生错误：" + jqXHR.status);
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                    }
                });
            }
            $("html").keydown(function(event){
                if(event.keyCode==13){
                    reset();
                }
            });
            $("#reset").click(function(){
                reset();
            });
        })
    </script>
</body>
</html>