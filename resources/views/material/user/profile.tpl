<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>我的账户 - {$config["appName"]}</title>
    {include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
    {include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
            <section class="app-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;最近五分钟使用IP</div>
                            </header>
                            <div class="widget-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <th>IP</th><th>归属地</th>
                                        {foreach $userip as $single=>$location}
                                        <tr>
                                            <td>{$single}</td>
                                           <td>{$location}</td>
                                        </tr>  
                                        {/foreach}
                                    </table>
                                </div>
                            </div>
                        </div>
                      
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;最近十次登录IP</div>
                            </header>
                            <div class="widget-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <th>IP</th><th>归属地</th>
                                        {foreach $userloginip as $single=>$location}
                                        <tr>
                                            <td>{$single}</td>
                                           <td>{$location}</td>
                                        </tr>  
                                        {/foreach}
                                    </table>
                                </div>
                            </div>
                        </div>
                      
                        <div class="widget">
                            <header class="widget-header">
                                <div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;返利记录</div>
                            </header>
                            <div class="widget-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <th>ID</th><th>返利用户</th><th>返利佣金</th>
                                        {foreach $paybacks as $payback}
                                        <tr>
                                            <td><b>{$payback->id}</b></td>
                                            {if $payback->user()!=null}
                                           <td>{$payback->user()->user_name}</td>
                                            {else}
                                           <td>已注销</td>
                                          {/if}
                                            <td>{$payback->ref_get} 元</td>
                                        </tr>  
                                        {/foreach}
                                    </table>
                                </div>
                            </div>
                            {$paybacks->render()}
                        </div>
                    </div>
                </div>
            </section>
        </div>
    {include file='user/dialog.tpl'}
    {include file='user/footer.tpl'}
    </main>
    {include file='user/assets/js.tpl'}
</body>
</html>