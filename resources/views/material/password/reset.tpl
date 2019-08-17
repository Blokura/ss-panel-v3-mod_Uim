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
    <symbol id="icon-envelope" viewBox="0 0 512 512"><path d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z" /></symbol>
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
                                <svg class="font-icon"><use xlink:href="#icon-envelope" /></svg>
                                <input type="text" id="email" class="bimoe-form-input require" placeholder="电子邮箱" />
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
                layer.msg("正在发送，请稍候。");
                $.ajax({
                    type:"POST",
                    url:"/password/reset",
                    dataType:"json",
                    data:{
                        email: $("#email").val(),
                    },
                    success:function(data){
                        if(data.ret == 1){
                            layer.msg(data.msg);
                            window.setTimeout("location.href='/auth/login'", 2000);
                        }else{
                            layer.msg(data.msg);
                        }
                    },
                    error:function(jqXHR){
                        layer.msg(data.msg);
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