<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册 - {$config["appName"]}</title>
    <link href="/theme/assets/home/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/home/css/bimoe.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/layui/layui.css" rel="stylesheet" type="text/css" />
    {include file='tongji.tpl'}
</head>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none">
    <symbol id="icon-user" viewBox="0 0 448 512"><path d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z" /></symbol>
    <symbol id="icon-envelope" viewBox="0 0 512 512"><path d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z" /></symbol>
    <symbol id="icon-envelope-open" viewBox="0 0 512 512"><path d="M512 464c0 26.51-21.49 48-48 48H48c-26.51 0-48-21.49-48-48V200.724a48 48 0 0 1 18.387-37.776c24.913-19.529 45.501-35.365 164.2-121.511C199.412 29.17 232.797-.347 256 .003c23.198-.354 56.596 29.172 73.413 41.433 118.687 86.137 139.303 101.995 164.2 121.512A48 48 0 0 1 512 200.724V464zm-65.666-196.605c-2.563-3.728-7.7-4.595-11.339-1.907-22.845 16.873-55.462 40.705-105.582 77.079-16.825 12.266-50.21 41.781-73.413 41.43-23.211.344-56.559-29.143-73.413-41.43-50.114-36.37-82.734-60.204-105.582-77.079-3.639-2.688-8.776-1.821-11.339 1.907l-9.072 13.196a7.998 7.998 0 0 0 1.839 10.967c22.887 16.899 55.454 40.69 105.303 76.868 20.274 14.781 56.524 47.813 92.264 47.573 35.724.242 71.961-32.771 92.263-47.573 49.85-36.179 82.418-59.97 105.303-76.868a7.998 7.998 0 0 0 1.839-10.967l-9.071-13.196z" /></symbol>
    <symbol id="icon-lock" viewBox="0 0 448 512"><path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" /></symbol>
    <symbol id="icon-code" viewBox="0 0 640 512"><path d="M278.9 511.5l-61-17.7c-6.4-1.8-10-8.5-8.2-14.9L346.2 8.7c1.8-6.4 8.5-10 14.9-8.2l61 17.7c6.4 1.8 10 8.5 8.2 14.9L293.8 503.3c-1.9 6.4-8.5 10.1-14.9 8.2zm-114-112.2l43.5-46.4c4.6-4.9 4.3-12.7-.8-17.2L117 256l90.6-79.7c5.1-4.5 5.5-12.3.8-17.2l-43.5-46.4c-4.5-4.8-12.1-5.1-17-.5L3.8 247.2c-5.1 4.7-5.1 12.8 0 17.5l144.1 135.1c4.9 4.6 12.5 4.4 17-.5zm327.2.6l144.1-135.1c5.1-4.7 5.1-12.8 0-17.5L492.1 112.1c-4.8-4.5-12.4-4.3-17 .5L431.6 159c-4.6 4.9-4.3 12.7.8 17.2L523 256l-90.6 79.7c-5.1 4.5-5.5 12.3-.8 17.2l43.5 46.4c4.5 4.9 12.1 5.1 17 .6z" /></symbol>
</svg>
<body>
    <div id="wrap-register">
        <div class="container">
            <div class="bimoe-wrap">
                <div class="bimoe-inner">
                    <h3 class="bimoe-form-title">
                    注册<span class="bimoe-switch pull-right">已经有帐号？<a href="login">马上登录</a></span>
                    </h3>
                    <form class="bimoe-form" action="javascript:void(0);"  method="POST">
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-user" /></svg>
                                <input type="text" id="name" class="bimoe-form-input" placeholder="昵称">
                            </label>
                        </div>
                        <div class="bimoe-form-group">
                            <label class="label-yx">
                                <svg class="font-icon"><use xlink:href="#icon-envelope" /></svg>
                                <input type="text" id="email" class="bimoe-form-input bimoe-yx" placeholder="电子邮箱">
                            </label>
                            <span class="bimoe-lx">
                                <select class="bimoe-select" id="type">
                                    {include file='auth/email.tpl'}
                                </select>
                            </span>
                        </div>
                        {if $enable_email_verify == 'true'}
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-envelope-open" /></svg>
                                    <input type="text" id="email_code" class="bimoe-form-input" placeholder="邮箱验证码">
                                <div class="email_verify">
                                    <button type="button" id="email_verify" class="btn btn-login layui-btn-sm">获取验证码</button>
                                </div>
                            </label>
                        </div>
                        {/if}
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-lock" /></svg>
                                <input type="password" id="passwd" class="bimoe-form-input" placeholder="密码">
                            </label>
                        </div>
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-lock" /></svg>
                                <input type="password" id="repasswd" class="bimoe-form-input" placeholder="确认密码">
                            </label>
                        </div>
                        {if $config['register_mode'] == 'invite'}
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-code" /></svg>
                                <input type="text" id="code" class="bimoe-form-input" placeholder="邀请码（必填，没有就填moessr）">
                            </label>
                        </div>
                        {/if}
                        {if $geetest_html != null}
                        <div class="bimoe-form-group">
                            <label>
                                <div id="embed-captcha"></div>
                            </label>
                        </div>
                        {/if}
                        {if $recaptcha_sitekey != null}
                        <div class="bimoe-form-group">
                            <label>
                                <div align="center" class="g-recaptcha" data-sitekey="{$recaptcha_sitekey}"></div>
                            </label>
                        </div>
                        {/if}
                        <div class="bimoe-form-group">
                            <div class="checkbox">
                                <label class="bimoe-checkbox">
                                     <input id="tos_check" type="checkbox" checked><span class="bimoe-check"></span>我已阅读并同意 <a href="">服务条款</a>
                                </label>
                            </div>
                        </div>
                        {if $config['register_mode']!='close'}
                        <input class="btn btn-login btn-block btn-lg" type="submit" id="reg" value="注册">
                        {else}
                        <div class="text-center"><font color="red">管理员已禁止新用户注册！</font></div>
                        {/if}
                    </form>
                </div>
            </div>
        </div>
        <p class="text-center" style="padding-top: 20px;">
            <script type="text/javascript">document.write(new Date().getFullYear());</script> © <a href="/staff">STAFF</a> - {$config["appName"]}
        </p>
    </div>
    <script src="/theme/assets/home/js/jquery.min.js"></script>
    <script src="//static.geetest.com/static/tools/gt.js"></script>
    <script src="/theme/assets/layui/layui.js"></script>
    <script>
        $(document).ready(function(){
            layui.use('layer', function(){});
            register = function(){
                if (!$('#tos_check').is(":checked")) {
                    layer.msg("请勾选服务条款，同意方可使用本服务");
                    return false;
                }  
                var wechat=$("#email").val() + $("#type").val();
                var imtype= 2;
                code = $("#code").val();
                {if $config['register_mode'] != 'invite'}
                code = 0;
                if ((getCookie('code'))!=''){
                    code = getCookie('code');
                }
                {/if}
                layer.load(2);
                $.ajax({
                    type:"POST",
                    url:"/auth/register",
                    dataType:"json",
                    data:{
                        email: $("#email").val() + $("#type").val(),
                        name: $("#name").val(),
                        passwd: $("#passwd").val(),
                        repasswd: $("#repasswd").val(),
                        wechat: wechat,
                        imtype: imtype,{if $recaptcha_sitekey != null}
                        recaptcha: grecaptcha.getResponse(),{/if}
                        code:code{if $enable_email_verify == 'true'},
                        emailcode: $("#email_code").val(){/if}{if $geetest_html != null},
                        geetest_challenge: validate.geetest_challenge,
                        geetest_validate: validate.geetest_validate,
                        geetest_seccode: validate.geetest_seccode
                        {/if}
                    },
                    success:function(data){
                        if(data.ret == 1){
                            layer.closeAll('loading');
                            layer.msg(data.msg);
                            window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                        }else{
                            layer.closeAll('loading');
                            layer.msg(data.msg);
                            setCookie('code','',0);
                            $("#code").val(getCookie('code'));
                            {if $geetest_html != null}
                                captcha.reset();
                            {/if}
                        }
                    },
                    error:function(jqXHR){
                        layer.closeAll('loading');
                        layer.msg("发生错误："+jqXHR.status);
                        {if $geetest_html != null}
                            captcha.reset();
                        {/if}
                    }
                });
            }
            $("#reg").click(function(){
                {if $geetest_html != null}
                if(typeof validate == 'undefined') {
                    layer.msg("请滑动验证码来完成验证。");
                    return;
                }
                if (!validate) {
                    layer.msg("请滑动验证码来完成验证。");
                    return;
                }
                {/if}
                register();
            });
        })
    </script>
    {if $enable_email_verify == 'true'}
    <script>
        layui.use('layer', function(){});
        var wait=60;
        function time(o) {
            if (wait == 0) {
                o.removeAttr("disabled");
                o.text("获取验证码");
                wait = 60;
            } else {
                o.attr("disabled","disabled");
                o.text("重新发送(" + wait + ")");
                wait--;
                setTimeout(function() {
                    time(o)
                },
                1000)
            }
        }
        $(document).ready(function () {
            $("#email_verify").click(function () {
                layer.load(2);
                time($("#email_verify"));
                $.ajax({
                    type: "POST",
                    url: "send",
                    dataType: "json",
                    data: {
                        email: $("#email").val() + $("#type").val()
                    },
                    success: function (data) {
                        if (data.ret) {
                            layer.closeAll('loading');
                            layer.msg(data.msg);
                        } else {
                            layer.closeAll('loading');
                            layer.msg(data.msg);
                        }
                    },
                    error: function (jqXHR) {
                        layer.closeAll('loading');
                        layer.msg(data.msg+"     出现了一些错误。");
                    }
                })
            })
        })
    </script>
    {/if}
    {if $geetest_html != null}
    <script>
        var handlerEmbed = function (captchaObj) {
            captchaObj.onSuccess(function () {
                validate = captchaObj.getValidate();
            });
            captchaObj.appendTo("#embed-captcha");
            captcha = captchaObj;
        };
        initGeetest({
            gt: "{$geetest_html->gt}",
            challenge: "{$geetest_html->challenge}",
            product: "embed",
            offline: {if $geetest_html->success}0{else}1{/if}
        }, handlerEmbed);
    </script>
    {/if}
    {*dumplin:aff链*}
    <script>
        {*dumplin：轮子1.js读取url参数*}
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){
                    return pair[1];
                }
            }
            return "";
        }
        {*dumplin:轮子2.js写入cookie*}
        function setCookie(cname,cvalue,exdays) {
            var d = new Date();
            d.setTime(d.getTime()+(exdays*24*60*60*1000));
            var expires = "expires="+d.toGMTString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }
        {*dumplin:轮子3.js读取cookie*}
        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i].trim();
                if (c.indexOf(name)==0) return c.substring(name.length,c.length);
            }
            return "";
        }
        {*dumplin:读取url参数写入cookie，自动跳转隐藏url邀请码*}
        if (getQueryVariable('code')!=''){
            setCookie('code',getQueryVariable('code'),30);
            window.location.href='/auth/register'; 
        }
        {if $config['register_mode'] == 'invite'}
        {*dumplin:读取cookie，自动填入邀请码框*}
        if ((getCookie('code'))!=''){
            $("#code").val(getCookie('code'));
        }
        {/if}
    </script>
    {if $recaptcha_sitekey != null}<script src="https://recaptcha.net/recaptcha/api.js" async defer></script>{/if}
</body>
</html>