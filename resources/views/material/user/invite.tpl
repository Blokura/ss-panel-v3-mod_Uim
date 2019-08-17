<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>邀请好友 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
      				<div class="col-sm-10 col-sm-offset-1">
                        <div class="row">
        					<div class="col-md-6">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title"><i class="iconfont icon-bulb"></i>&nbsp;说明</div>
									</header><!-- .widget-header -->
									<hr class="widget-separator" />
									<div class="widget-body">
										<p>邀请链接请给认识或者需要的人。</p>
                                        <p>您会获得 <font color="red">{$config["invite_gift"]}G</font> 流量奖励。</p>
                        				<p>对方充值时您还会获得对方充值金额的 <font color="red">{$config["code_payback"]} %</font> 的返利。</p>
                        				<p>已获得返利：<font color="red">{$paybacks_sum}</font> 元</p>
									</div><!--.widget-body-->
								</div><!--.widget--> 
      						</div>
				
							{if $user->class>=1}
            				{if $user->invite_num!=-1}
            				<div class="col-md-6">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-link"></i>&nbsp;邀请链接</div>
                                        <div class="pull-right">
                    				        <button type="button" class="layui-btn bg-color-blue layui-btn-sm btn-top" id="reset-link">重置链接</button>
								        </div>
									</header><!-- .widget-header -->
									<hr class="widget-separator" />
									<div class="widget-body">
                        				<p>剩余可邀请次数：{if $user->invite_num<0}<font color="red">无限</font>{else}<font color="red">{$user->invite_num}</font>{/if}</p>
                						<div class="input-group">	
											<input type="text" class="input form-control form-control-monospace" readonly value="{$config["baseUrl"]}/auth/register?code={$code->code}" readonly="true">
                      						<span class="input-group-btn"><button type="button" class="layui-btn copy-text" data-clipboard-text="{$config["baseUrl"]}/auth/register?code={$code->code}">复制</button></span>
                						</div>
									</div><!--.widget-body-->
								</div><!--.widget-->
            					{/if}

		    					{if $config['invite_price']>=0}
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title"><i class="iconfont icon-adduser"></i>&nbsp;购买邀请次数</div>
									</header><!-- .widget-header -->
									<hr class="widget-separator" />
									<div class="widget-body">
                        				<p>邀请码价格：<font color="red">{$config['invite_price']}</font> 元/个</p>
                						<div class="input-group">	
											<input type="num" class="input form-control form-control-monospace" id="buy-invite-num" placeholder="请输入购买数量">
                      						<span class="input-group-btn"><button type="button" class="layui-btn" id="buy-invite">购买</button></span>
                						</div>
									</div><!--.widget-body-->
								</div><!--.widget--> 
							{/if}
                            </div>
							{else}
      						<div class="col-md-6">
								<div class="widget">
									<header class="widget-header">
										<h4 class="widget-title"><i class="iconfont icon-link"></i>&nbsp;邀请链接</h4>
									</header><!-- .widget-header -->
									<hr class="widget-separator" />
									<div class="widget-body">
                						<div class="input-group">	
											<p><font color="red">尊敬的 {$user->user_name}，您无法使用邀请链接，请 <a href="/user/shop">升级</a> 成为会员。</font></p>
                						</div>
									</div><!--.widget-body-->
								</div><!--.widget-->
            				</div>
							{/if}


							<div class="col-md-12">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title"><i class="iconfont icon-unorderedlist"></i>&nbsp;邀请记录</div>
									</header><!-- .widget-header -->
									<hr class="widget-separator" />
									<div class="widget-body">
										{$paybacks->render()}
										<table class="table ">
                        					<thead>
												<tr>
                                					<th>ID</th>
													<th>被邀请用户ID</th>
													<th>获得返利</th>
                            					</tr>
                            				</thead>
                            				{foreach $paybacks as $payback}
                            				<tr>
                                				<td>{$payback->id}</td>
												<td>{$payback->userid}</td>
												<td>{$payback->ref_get} 元</td>
                            				</tr>
                            				{/foreach}
                        				</table>
										{$paybacks->render()}
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
{include file='user/assets/js.tpl'}
</body>
<script>
	$(function(){
		new Clipboard('.copy-text');
	});
	$(".copy-text").click(function () {
		layer.open({ content: '已复制到您的剪贴板，请您继续接下来的操作。' });
	});
  
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
					layer.open({ content: '发生错误：' + jqXHR.status });
                }
            })
        })
    })
</script>
<script>
{include file='table/js_1.tpl'}

$("#buy-invite").click(function () {
    $.ajax({
        type: "POST",
        url: "/user/buy_invite",
        dataType: "json",
        data: {
            num: $("#buy-invite-num").val(),
        },
        success: function (data) {
             if (data.ret) {
     			layer.open({ content: data.msg });
				window.setTimeout("location.href='/user/invite'", {$config['jump_delay']});
	        } else {
                layer.open({ content: data.msg });
            }
	    },
        error: function (jqXHR) {
            layer.open({ content: data.msg+'     出现了一些错误。' });
        }
    })
});
</script>
<script>
$("#reset-link").click(function () {
    layer.open({ content: "已重置您的邀请链接！" });
	window.setTimeout("location.href='/user/inviteurl_reset'", {$config['jump_delay']});
});
</script>
</html>