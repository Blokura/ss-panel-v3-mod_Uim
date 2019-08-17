<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>充值中心 - {$config["appName"]}</title>
    {include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
    {include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget qb">
                                    <header class="widget-header">
                                        <div class="widget-title pull-left"><i class="iconfont icon-redenvelope"></i>&nbsp;钱包</div>
                                        <div class="pull-right"><a href="javascript:void(0);" onclick="zfb()">支付宝红包领取</a></div>
                                    </header>
                                    <hr class="widget-separator">
                                    <div class="widget-body">
                                        <div class="text-center">
                                            <font size="400px" color="red">{$user->money}</font> 元
                                            <p>充值后没有到账请联系管理。</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="widget cz">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#wlcz" data-toggle="tab">在线充值</a></li>
                                        <li><a href="#kmcz" data-toggle="tab">充值码充值</a></li>
                                    </ul>
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade active in" id="wlcz">
                                            <div class="panel-body">
                                                {if $config["payment_system"] == "none"}
                                                    <div class="text-center" style="line-height: 100px;">暂未添加在线充值方式</div>
                                                {elseif $config["payment_system"] == "f2fpay"}
                                                    {include file='user/pay/aopf2f.tpl'}
                                                {elseif $config["payment_system"] == "codepay"}
                                                    {include file='user/pay/codepay.tpl'}
                                                {elseif $config["payment_system"] == "trimepay"}
                                                    {include file='user/pay/trimepay.tpl'}
                                                {elseif $config["payment_system"] == "tomatopay"}
                                                    {include file='user/pay/tomatopay.tpl'}
                                                {elseif $config["payment_system"] == "flyfoxpay"}
                                                    {include file='user/pay/flyfoxpay.tpl'}
                                                {elseif $config["payment_system"] == "bitpay"}
                                                    {include file='user/pay/bitpay.tpl'}
                                                {elseif $config["payment_system"] == "chenAlipay"}
                                                    {$pmw}
                                                {/if}
                                                {if $bitpay!=''}
                                                {$bitpay}
                                                {/if}
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="kmcz">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <p>购买充值卡：</p>
                                                        <p class="text-center"><a class="layui-btn" href="/">XX发卡</a></p>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>充值码充值：</p>
                                                        <div class="input-group">
                                                            <input class="form-control" id="code" placeholder="请输入充值码" type="text" />
                                                            <span class="input-group-btn"><button id="code-update" class="layui-btn">充值</button></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;充值记录</div>
                            </header>
                            <div class="widget-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <th>#</th><th>支付方式</th><th>充值金额</th><th>充值时间</th>
                                        {foreach $codes as $code}
                                        {if $code->type!=-2}
                                        <tr>
                                            <td>{$code->id}</td>
                                            <td>
                                                {if strlen($code->code) == 50}
                                                    chenPay-支付宝
                                                {elseif strlen($code->code) == 38}
                                                    chenPay-微信
                                                {elseif strlen($code->code) == 42}
                                                    充值码充值
                                                {else}
                                                    {$code->code}
                                                {/if}
                                            </td>
                                            {if $code->type==-1}
                                            <td>{$code->number}元</td>
                                            {/if}
                                            <td>{$code->usedatetime}</td>
                                        </tr>
                                        {/if}
                                        {/foreach}
                                    </table>
                                    <div class="pull-right">{$codes->render()}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="alipay" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        请使用支付宝App扫码充值：
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="text-center">
                                        <p id="title">手机端请点击二维码转跳app</p>
                                        <p id="qrarea"></p>
                                        <p id="info"></p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="layui-btn" id="alipay_cancel" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    {include file='user/dialog.tpl'}
    {include file='user/footer.tpl'}
    </main>
    {include file='user/assets/js.tpl'}
    <script>
        function zfb() {
            layer.open({
                type: 1,
                offset: '200px',
                area: '200px',
                title: '打开支付宝搜索',
                content: '<div style="padding: 20px;"><p class="text-center" style="font-size: 24px;font-weight: 700;padding: 20px;">1071832</p><p class="text-center"><small><a href="alipayqr://" id="mobile" style="display: none;">启动支付宝</a></small></p></div>',
            });
            pd();
        }
        function pd() {
            var ua = navigator.userAgent.toLowerCase();
            var shouji = ua.match(/mobile/i) == "mobile";
            if (shouji) {
                $("#mobile").attr("style","display:block;");
            }
        }
    </script>
    <script>
    $(document).ready(function () {
        $("#code-update").click(function () {
            $.ajax({
                type: "POST",
                url: "code",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        layer.open({ content: data.msg });
                        window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    } else {
                        layer.open({ content: data.msg });
                        window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: '发生错误：' + jqXHR.status });
                }
            })
        })
    })
    </script>
</body>
</html>