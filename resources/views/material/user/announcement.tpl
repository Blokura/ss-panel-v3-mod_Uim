<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>公告 - {$config["appName"]}</title>
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
                                <div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;公告喵</div>
                            </header>
                            <div class="widget-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <th>ID</th><th>日期</th><th>内容</th>
                                        {foreach $anns as $ann}
                                        <tr>
                                            <td>#{$ann->id}</td>
                                           <td>{$ann->date}</td>
                                            <td>{$ann->content}</td>
                                        </tr>  
                                        {/foreach}
                                    </table>
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
</body>
</html>