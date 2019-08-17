<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>我的工单 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
      				<div class="col-lg-10 col-lg-offset-1">
            			<div class="widget">
	    					<header class="widget-header">
                				<div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;我的工单</div>
                                <div class="pull-right"><a class="layui-btn layui-btn-sm btn-top" href="/user/ticket/create">创建工单</a></div>
                			</header>
							<div class="widget-body">
								<div class="table-responsive">
									<table class="table">
        								<!-- th>ID</th --><th>时间</th><th>标题</th><th>状态</th><th>操作</th>
        								{foreach $tickets as $ticket}
        								<tr>
                                			<!-- td>#{$ticket->id}</td -->
        					    			<td>{$ticket->datetime()}</td>
                                			<td>{$ticket->title}</td>
                                            {if $ticket->status==1}
                                			    <td>开启</td>
                                            {else}
                                                <td>关闭</td>
                                            {/if}
                                            <td>
										        <a href="/user/ticket/{$ticket->id}/view">查看 ››</a>
									        </td>
                            			</tr>
										{/foreach}
        							</table>
        							<div class="pull-right">{$tickets->render()}</div>
								</div>
							</div><!--.widget-body-->
						</div><!--.widget-->
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