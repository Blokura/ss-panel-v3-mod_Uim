<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>节点列表 - {$config["appName"]}</title>
    {include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
    {include file='user/assets/header.tpl'}
    {function displayV2rayNode node=null}
    {assign var=server_explode value=";"|explode:$node['server']}
    <table class="layui-table">
        <tbody>
            <tr><td>节点地址</td><td>{$server_explode[0]}</td></tr>
            <tr><td>节点端口</td><td>{$server_explode[1]}</td></tr>
            <tr><td>协议参数</td><td>{$server_explode[0]}</td></tr>
            <tr><td>用户UUID</td><td>{$user->getUuid()}</td></tr>
            <tr><td>流量比例</td><td>{$node['traffic_rate']}</td></tr>
            <tr><td>AlterId</td><td>{$server_explode[2]}</td></tr>
            <tr><td>VMess链接</td><td><input type="txt" class="layui-input" value="{URL::getV2Url($user, $node['raw_node'])}"></td></tr>
        </tbody>
    </table>
    {/function}
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    {$class=-1}
                    {foreach $nodes as $node}
                    {if $node['class']!=$class}
                    {$class=$node['class']}
                    <div class="col-md-12">
                        <blockquote class="layui-elem-quote">
                            {if $class == 0} Lv.0 {elseif $class == 1}Lv.1 死库水{elseif $class == 2}Lv.2 女仆装{elseif $class == 3}Lv.3 天使婚纱{/if}
                        </blockquote>
                    </div>
                    {/if}
                    <div class="col-lg-4 col-md-6">
                        <div class="widget box">
                            <div class="widget-body">
                                <div class="node_bt">
                                    {if $config['enable_flag']=='true'}
                                    <img class="country" src="/theme/assets/user/images/country/{$node['flag']}"
                                    width="32" height="32" style="float: left;" />
                                    {/if}
                                    <span class="node_name">
                                        {$node['name']}
                                    </span>
                                    <div class="node_zt">
                                        {if $node['online']=="1"}
                                        <img src="/theme/assets/user/images/tips/yes.png" title="在线" />
                                        {elseif $node['online']=='0'}
                                        <img src="/theme/assets/user/images/tips/no.png" title=" 离线" />
                                        {else}
                                        <img src="/theme/assets/user/images/tips/warning.png" title="警告" />
                                        {/if}
                                    </div>
                                </div>
                                <div class="node_nr">
                                    <p class="node_xx">{$node['info']}</p>
                                    <div class="node_gd">
                                        <div class="node_left">
                                            <p>
                                                人数：{if $node['online_user'] == -1}N/A{else}{$node['online_user']}{/if}
                                            </p>
                                            <p>
                                                倍率：{$node['traffic_rate']}
                                            </p>
                                            <p>
                                                负载：{if $node['latest_load'] == -1}N/A{else}{$node['latest_load']}%{/if}
                                            </p>
                                            <p>
                                                流量：{if $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}GB{else}{$node['traffic_used']}GB{/if}
                                            </p>
                                        </div>
                                        <div class="node_right">
                                            {if $node['class'] > $user->class}
                                            <a class="layui-btn layui-btn-danger" href="/user/shop">升级套餐</a>
                                            {else}
                                            {if $node['mu_only'] != 1 && $node['sort'] != 11}
                                            <p>
                                                <a class="layui-btn" href="/user/node/{$node['id']}">普通配置</a>
                                            </p>
                                            {elseif $node['sort'] == 11}
                                            <p>
                                                <a class="layui-btn" href="javascript:void(0);" onclick="nodeid{$node['id']}()">V2ray 配置</a>
                                            </p>
                                            <script>function nodeid{$node['id']}() { $("#v2ray_modal_{$node['id']}").modal(); }</script>
                                            {/if} 
                                            {if $node['sort'] == 0 || $node['sort'] == 10} {$point_node=$node}{/if}
                                            {if ($node['sort'] == 0 || $node['sort'] == 10) && $node['mu_only'] != -1}
                                            {foreach $nodes_muport as $single_muport}
                                            {if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
                                                {continue}
                                            {/if}
                                            {if !($single_muport['user']->class >= $node['class'] && ($node['group'] == 0 || $single_muport['user']->node_group == $node['group']))}
                                                {continue}
                                            {/if}
                                            {$relay_rule = null}
                                            {if $node['sort'] == 10 && $single_muport['user']['is_multi_user'] != 2} 
                                            {$relay_rule = $tools->pick_out_relay_rule($node['id'], $single_muport['server']->server, $relay_rules)} 
                                            {/if}
                                            <p>
                                                <a class="layui-btn" href="/user/node/{$node['id']}?ismu={$single_muport['server']->server}&relay_rule={if $relay_rule != null}{$relay_rule->id}{else}0{/if}">
                                                    {$single_muport['server']->server}端口
                                                </a>
                                            </p>
                                            {/foreach}
                                            {/if}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- .widget -->
                    </div>
                    {if $node['sort'] == 11}
                    <div class="modal fade" id="v2ray_modal_{$node['id']}" tabindex="-1" role="dialog"
                    aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                   <h4 class="modal-title" id="myModalLabel">提示</h4>
                                </div>
                                <div class="modal-body">
                                    {displayV2rayNode node=$node}
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="layui-btn" data-dismiss="modal">确定</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    {/if}
                    {$point_node=null}
                    {/foreach}
                </div>
            </section>
         </div>
        {include file='user/dialog.tpl'} {include file='user/footer.tpl'}
     </main>
     {include file='user/assets/js.tpl'}
</body>
</html>