<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>用户面板 - {$config["appName"]}</title>
    {include file='user/assets/css.tpl'}
    <style>.text-bz{ overflow: hidden;text-overflow: ellipsis;white-space: nowrap; }</style>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
    {include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="widget widget-mb">
                            <div class="widget-body">
                                <a href="user/profile">
                                    <img class="tx" src="/theme/assets/user/images/loading.gif" id="tx" />
                                </a>
                                <span class="text-primary" style="font-size: 24px;">
                                     {$user->user_name}&nbsp;
                                </span>
                                <span class="layui-badge layui-bg-blue badge-mb">
                                    {include file='user/assets/level.tpl'}
                                </span>
                               <div class="text-1 shebei">
                                    <span class="label label-info" title="在线设备">
                                        {if $user->node_connector!=0}{$user->online_ip_count()} / {$user->node_connector}{else}{$user->online_ip_count()} / 无限{/if}
                                    </span>
                                </div>
                                <h4 class="text-down down-mb">
                                    <span class="iconfont icon-redenvelope"></span>&nbsp;
                                    <span title="余额">{$user->money} 元</span>&nbsp;&nbsp;&nbsp;
                                    <span class="iconfont icon-time-circle"></span>&nbsp;
                                    <span title="到期时间">{date("Y-m-d",strtotime($user->class_expire))}</span>
                                </h4>
                            </div>
                        </div>
    
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title pull-left"><i class="iconfont icon-notification"></i>&nbsp;最新公告</div>
                                <div class="pull-right">
                                    <a href="/user/announcement">更多››</a>
                                </div>
                            </header>
                            <hr class="widget-separator" />
                            <div class="widget-body">
                                {if $ann != null}{$ann->content}{/if}
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title"><i class="iconfont icon-linechart"></i>&nbsp;流量信息</div>
                            </header>
                            <hr class="widget-separator" />
                            <div class="widget-body">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6 col-lg-4">
                                        <p>今日流量：<span class="pull-right">{$user->TodayusedTraffic()}</span></p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {if $user->transfer_enable != 0}{number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}{else}0{/if}%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-4">
                                        <p>已用流量：<span class="pull-right">{$user->LastusedTraffic()}</span></p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {if $user->transfer_enable != 0}{number_format($user->last_day_t/$user->transfer_enable*100,2)}{else}0{/if}%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-4">
                                        <p>剩余流量：<span class="pull-right">{$user->unusedTraffic()}</span></p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {if $user->transfer_enable != 0}{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}{else}0{/if}%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title"><i class="iconfont icon-cloud-download"></i>&nbsp;工具下载（<a href="javascript:void(0);" onclick ="bowser();">查看使用教程</a>）</div>
                            </header>
                            <hr class="widget-separator" />
                            <div class="widget-body">
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <ul class="tab-download">
                                          <li>
                                            <a class="windows" hidefocus="true" href="javascript:void(0);" onclick="windows_go()">Windows</a>
                                          </li>
                                          <li>
                                            <a class="android" hidefocus="true" href="javascript:void(0);" onclick="android_go()">Android</a>
                                          </li>
                                          <li>
                                              <a class="ios" hidefocus="true" href="javascript:void(0);" onclick="ios_go()">iOS</a>
                                          </li>
                                          <li>
                                              <a class="mac" hidefocus="true" href="javascript:void(0);" onclick="mac_go()">MAC</a>
                                          </li>
                                        </ul>
                                      </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <div class="widget">
                                            <header class="widget-header">
                                                <div class="widget-title pull-left"><i class="iconfont icon-link"></i>&nbsp;节点订阅</div>
                                                <div class="pull-right">
                                                    <a href="javascript:void(0);" id="url_reset">重置链接</a>
                                                </div>
                                            </header><!-- .widget-header -->
                                            <hr class="widget-separator" />
                                            <div class="widget-body">
                                                <div class="input-group">
                                                    <input type="text" class="input form-control form-control-monospace" name="input1" readonly value="{$subUrl}{$ssr_sub_token}?mu=0" readonly="true">
                                                    <span class="input-group-btn"><button type="button" class="layui-btn copy-text" data-clipboard-text="{$subUrl}{$ssr_sub_token}?mu=0">复制 SSR</button></span>
                                                </div>
                                                {* <!-- V2ray -->
                                                <div class="input-group" style="padding-top: 10px;">
                                                    <input type="text" class="input form-control form-control-monospace" name="input2" readonly value="{$subUrl}{$ssr_sub_token}?mu=2" readonly="true">
                                                    <span class="input-group-btn"><button type="button" class="layui-btn copy-text1" data-clipboard-text="{$subUrl}{$ssr_sub_token}?mu=2">复制 V2ray</button></span>
                                                </div>
                                                *}
                                            </div>
                                        </div><!-- .widget -->
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <div class="widget">
                                            <header class="widget-header">
                                                <div class="widget-title"><i class="iconfont icon-location"></i>&nbsp;每日卖萌</div>
                                            </header><!-- .widget-header -->
                                            <hr class="widget-separator" />
                                            <div class="widget-body">
                                                <div class="layui-form layui-form-pane">
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">可获得流量</label>
                                                        <div class="layui-input-block">
                                                            <input type="text" class="layui-input" value="{$config['checkinMin']}~{$config['checkinMax']}MB" readonly />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-center"> 
                                                    {if $user->class == 0}
                                                        <p><a class="layui-btn btn-block layui-btn-disabled">禁止签到</a></p>
                                                    {else}
                                                        {if $user->isAbleToCheckin()}
                                                            <p><a class="layui-btn btn-block" id="checkin">日常卖萌</a></p>
                                                        {else}
                                                            <p><a class="layui-btn btn-block layui-btn-disabled">卖萌大成功</a></p>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        </div><!--.widget-->
                                    </div>
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
    <input value="{$user->email}" id="qq-mail" style="display: none;" />
    {include file='user/assets/js.tpl'}
    {include file='user/assets/doc-link.tpl'}
    <script type="text/javascript" src="/theme/assets/user/js/herd-portrait.js"></script>
    <script>
        var time = DateMinus('{date("Y-m-d",time())}','{date("Y-m-d",strtotime($user->class_expire))}');
        function DateMinus(date1,date2){
            var sdate = new Date(date1);
            var now = new Date(date2);
            var days = now.getTime() - sdate.getTime();
            var day = parseInt(days / (1000 * 60 * 60 * 24));
            if(day < 0) {
                setTimeout(daoqi,500);
                function daoqi() {
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg('套餐已到期，请及时购买新套餐！');
                    });   
                }
            }
        }
    </script>
    <script>
        $(function(){
            new Clipboard('.copy-text');
        });
        $(".copy-text").click(function () {
            layer.open({ content: '已拷贝 SSR 链接至剪切板。' }); 
        });
        $(function(){
            new Clipboard('.copy-text1');
        });
        $(".copy-text1").click(function () {
            layer.open({ content: '已拷贝 V2ray 链接至剪切板。' }); 
        });
    </script>
    <script>
        $(document).ready(function () { 
            $("#checkin").click(function () {
                $.ajax({
                    type: "POST",
                    url: "/user/checkin",
                    dataType: "json",
                    success: function (data) {
                        layer.open({ content: data.msg }); 
                        setTimeout(function(){ window.location.reload(); }, 1300);
                    },
                    error: function (jqXHR) {
                        layer.open({ content: '发生错误：' + jqXHR.status }); 
                    }
                })
            })
            $("#url_reset").click(function () {
                layer.open({ content: '重置节点订阅链接成功！' }); 
                window.setTimeout("location.href='/user/url_reset'");
            })
        })
    </script>
</body>
</html>