<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>节点信息 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
                	<div class="col-md-6">
                    	<div class="widget">
                    		<div class="panel-body">
                            	<p><i class="iconfont icon-info-circle"></i>&nbsp;温馨提示：配置信息以及二维码请勿泄露，截图请打码！</p>
                        	</div>
                    	</div>
						{$ssr_prefer = URL::SSRCanConnect($user, $mu)}
						<div class="widget">
                  			<ul class="nav nav-tabs" id="info">
  								<li{if !$ssr_prefer} class="active"{/if}><a href="#ss_info" data-toggle="tab">SS 配置信息</a></li>
  								<li{if $ssr_prefer} class="active"{/if}><a href="#ssr_info" data-toggle="tab">SSR 配置信息</a></li>
							</ul>
                    		<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_info">
                        			{if URL::SSCanConnect($user, $mu)}
									{$ss_item = URL::getItem($user, $node, $mu, $relay_rule_id, 1)}
									<ul class="list-group">       
										<li class="list-group-item">服务器地址：{$ss_item['address']}</li>
										<li class="list-group-item">服务器端口：{$ss_item['port']}</li>
										<li class="list-group-item">加密方式：{$ss_item['method']}</li>
										<li class="list-group-item">密码：{$ss_item['passwd']}</li>
										<li class="list-group-item">协议：{$ss_item['protocol']}</li>
										<li class="list-group-item">协议参数：{$ss_item['protocol_param']}</li>
										<li class="list-group-item">混淆：{$ss_item['obfs']}</li>
										<li class="list-group-item">混淆参数：{$ss_item['obfs_param']}</li>
									</ul>
									{else}
                                	<div class="panel-body">
										<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
                                	</div>
									{/if}
                            	</div>
								<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_info">
                        			{if URL::SSRCanConnect($user, $mu)}
									{$ssr_item = URL::getItem($user, $node, $mu, $relay_rule_id, 0)}
									<ul class="list-group">       
										<li class="list-group-item">服务器地址：{$ssr_item['address']}</li>
										<li class="list-group-item">服务器端口：{$ssr_item['port']}</li>
										<li class="list-group-item">加密方式：{$ssr_item['method']}</li>
										<li class="list-group-item">密码：{$ssr_item['passwd']}</li>
										<li class="list-group-item">协议：{$ssr_item['protocol']}</li>
										<li class="list-group-item">协议参数：{$ssr_item['protocol_param']}</li>
										<li class="list-group-item">混淆：{$ssr_item['obfs']}</li>
										<li class="list-group-item">混淆参数：{$ssr_item['obfs_param']}</li>
									</ul>
									{else}
                                	<div class="panel-body">
                                		<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SSR 客户端下无法连接。请您选用 SS 客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
										<p class="center">同时，SSR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
                                	</div>
									{/if}
                            	</div>
                        	</div>
						</div><!-- .widget --> 
					</div><!-- .col-md-6 -->

					<div class="col-md-6">
						<div class="widget">
                  			<ul class="nav nav-tabs" id="url">
  								<li{if !$ssr_prefer} class="active"{/if}><a href="#ss_url" data-toggle="tab">SS 链接</a></li>
  								<li{if $ssr_prefer} class="active"{/if}><a href="#ssr_url" data-toggle="tab">SSR 链接</a></li>
							</ul>
                    		<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_url">
                            		<div class="panel-body">
                            			{if URL::SSCanConnect($user, $mu)}
                                		<div class="input-group">
											<input type="text" class="input form-control form-control-monospace" value="{URL::getItemUrl($ss_item, 1)}">
                                			<span class="input-group-btn"><button type="button" class="btn btn-default ss_url" data-clipboard-text="{URL::getItemUrl($ss_item, 1)}">复制</button></span>
                                		</div>
                            			<br />
                            			<p class="text-center"><a href="{URL::getItemUrl($ss_item, 1)}"/>手机上用浏览器打开</a></p>
                      					{else}
                      					<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
										{/if}
                  					</div>
                  				</div>
								<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_url">
									<div class="panel-body">
                          				{if URL::SSRCanConnect($user, $mu)}
                                		<div class="input-group">
											<input type="text" class="input form-control form-control-monospace" value="{URL::getItemUrl($ssr_item, 0)}">
                                			<span class="input-group-btn"><button type="button" class="layui-btn ssr_url" data-clipboard-text="{URL::getItemUrl($ssr_item, 0)}">复制</button></span>
                                		</div>
                            			<br />
                            			<p class="text-center"><a href="{URL::getItemUrl($ssr_item, 0)}"/>手机上用浏览器打开</a></p>
                      					{else}
                      					<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SSR 客户端下无法连接。请您选用 SS 客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
										{/if}
									</div>
								</div>
							</div>
						</div><!--widget-->  

						<div class="widget">
                  			<ul class="nav nav-tabs" id="qrcode">
  								<li{if !$ssr_prefer} class="active"{/if}><a href="#ss_qrcode" data-toggle="tab">SS 二维码</a></li>
  								<li{if $ssr_prefer} class="active"{/if}><a href="#ssr_qrcode" data-toggle="tab">SSR 二维码</a></li>
							</ul>
                    		<div id="myTabContent" class="tab-content">
                        		<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_qrcode">
    								<div class="panel-body">
                                		{if URL::SSCanConnect($user, $mu)}
      									<div class="text-center">
											<div id="ss-qr"></div>
      									</div>
                                		{else}
                                		<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 		客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
                                		{/if}
    								</div>
                        		</div>
                        		<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_qrcode">
                            		<div class="panel-body">
                                		{if URL::SSRCanConnect($user, $mu)}
                                		<div class="text-center">
											<div id="ss-qr-n"></div>
										</div>
                                		{else}
                                		<p class="center">您好，您目前的 加密方式，混淆，或者协议设置在 SSR 客户端下无法连接。请您选用 SS 客户端来连接，或者到「资料编辑」页面修改后再来查看此处。</p>
                                		{/if}
                            		</div>
                        		</div>
                    		</div>
						</div><!-- .widget --> 
					</div><!-- .col-md-6 --> 
				</div>
			</section>
		</div>
{include file='user/dialog.tpl'}
{include file='user/footer.tpl'}
	</main>
{include file='user/assets/js.tpl'}
</body>
<script src="/theme/assets/user/js/jquery.qrcode.min.js"></script>
<script>
$(function(){
	new Clipboard('.ss_url');
});
$(".ss_url").click(function () {
	$("#result").modal();
	$("#msg").html("已复制 SS 链接，请前往客户端粘贴。");
});
</script>
<script>
$(function(){
	new Clipboard('.ssr_url');
});
$(".ssr_url").click(function () {
	$("#result").modal();
	$("#msg").html("已复制 SSR 链接，请前往客户端粘贴。");
});
</script>
<script>
{if URL::SSCanConnect($user, $mu)}
	var text_qrcode = '{URL::getItemUrl($ss_item, 1)}';
	jQuery('#ss-qr').qrcode({
		"text": text_qrcode
	});
	var text_qrcode_win = '{URL::getItemUrl($ss_item, 2)}';
	jQuery('#ss-qr-win').qrcode({
		"text": text_qrcode_win
	});
	{/if}
	{if URL::SSRCanConnect($user, $mu)}
	var text_qrcode2 = '{URL::getItemUrl($ssr_item, 0)}';
	jQuery('#ss-qr-n').qrcode({
		"text": text_qrcode2
	});
	{/if}
</script>
</html>