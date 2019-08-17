<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 - {$config["appName"]}</title>
    <link href="/theme/assets/home/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/home/css/bimoe.css" rel="stylesheet" type="text/css" />
    <link href="/theme/assets/layui/layui.css" rel="stylesheet" type="text/css" />
    {include file='tongji.tpl'}
</head>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none">
    <symbol id="icon-envelope" viewBox="0 0 512 512"><path d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z" /></symbol>
    <symbol id="icon-lock" viewBox="0 0 448 512"><path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" /></symbol>
    <symbol id="icon-shield" viewBox="0 0 512 512"><path d="M466.5 83.7l-192-80a48.15 48.15 0 0 0-36.9 0l-192 80C27.7 91.1 16 108.6 16 128c0 198.5 114.5 335.7 221.5 380.3 11.8 4.9 25.1 4.9 36.9 0C360.1 472.6 496 349.3 496 128c0-19.4-11.7-36.9-29.5-44.3zM256.1 446.3l-.1-381 175.9 73.3c-3.3 151.4-82.1 261.1-175.8 307.7z" /></symbol>
</svg>
<body>
    <div id="wrap-login">
        <div class="container">
            <div class="bimoe-wrap">
                <div class="bimoe-inner">
                    <h3 class="bimoe-form-title">
                        登录<span class="bimoe-switch pull-right">还没有帐号？<a href="register">立即注册</a></span>
                    </h3>
                    <form class="bimoe-form" action="javascript:void(0);"  method="POST">
                        <div class="bimoe-form-group">    
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-envelope" /></svg>
                                <input type="txt" id="email" class="bimoe-form-input require" name="Email" placeholder="电子邮箱" />
                            </label>
                        </div>
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-lock" /></svg>
                                <input type="password" id="passwd" class="bimoe-form-input require" name="Password" placeholder="登录密码" />
                            </label>
                        </div>
                        {*
                        <div class="bimoe-form-group">
                            <label>
                                <svg class="font-icon"><use xlink:href="#icon-shield" /></svg>
                                <input type="txt" id="code" class="bimoe-form-input require" name="Code" placeholder="两步验证码（未设置请忽略）" />
                            </label>
                        </div>
                        *}
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
                        <div class="checkbox">
                            <label class="bimoe-checkbox">
                                <input type="checkbox" id="remember_me" name="remember" checked><span class="bimoe-check"></span>记住登录状态
                            </label>
                            <div class="pull-right">
                                <a href="/password/reset">
                                    忘记密码？
                                </a>
                            </div>
                        </div>
                        <div class="last">
                            <input class="btn btn-login btn-block btn-lg" type="submit" id="login" value="登录">
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
    <script src="//static.geetest.com/static/tools/gt.js"></script>
    <script src="/theme/assets/layui/layui.js"></script>
    <script>
        $(document).ready(function () {
            layui.use('layer', function(){});
            {if $geetest_html != null}
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
            {/if}
            login = function() {
                {if $geetest_html != null}
                if (typeof validate == 'undefined') {
                    layer.msg("请滑动验证码来完成验证。");
                    return;
                }
                if (!validate) {
                    layer.msg("请滑动验证码来完成验证。");
                    return;
                }
                {/if}
                document.getElementById("login").disabled = true;
                $.ajax({
                    type: "POST",
                    url: "/auth/login",
                    dataType: "json",
                    data: {
                        email: $("#email").val(),
                        passwd: $("#passwd").val(),
                        code: $("#code").val(),{if $recaptcha_sitekey != null}
                        recaptcha: grecaptcha.getResponse(),{/if}
                        remember_me: $("#remember_me:checked").val(){if $geetest_html != null},
                        geetest_challenge: validate.geetest_challenge,
                        geetest_validate: validate.geetest_validate,
                        geetest_seccode: validate.geetest_seccode{/if}
                    },
                    success: function (data) {
                        if (data.ret == 1) {
                            layer.msg(data.msg);
                            window.setTimeout("location.href='/user'", {$config['jump_delay']});
                        } else {
                            layer.msg(data.msg);  
                            document.getElementById("login").disabled = false;
                            {if $geetest_html != null}
                                captcha.reset();
                            {/if}
                        }
                    },
                    error: function (jqXHR) {
                        layer.msg("发生错误：" + jqXHR.status);
                        document.getElementById("login").disabled = false;
                        {if $geetest_html != null}
                            captcha.reset();
                        {/if}
                    }
                });
            }
            $("html").keydown(function (event) {
                if (event.keyCode == 13) {
                    login();
                }
            });
            $("#login").click(function () {
                login();
            });
        })
    </script>
    {if $recaptcha_sitekey != null}<script src="https://recaptcha.net/recaptcha/api.js" async defer></script>{/if}
</body>
</html>