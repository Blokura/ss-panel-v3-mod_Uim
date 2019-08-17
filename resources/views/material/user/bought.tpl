<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>购买记录 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
              		{foreach $shops as $shop}
					<div class="col-lg-3 col-md-6">
						<div class="widget box">
	    					<header class="widget-header">
                				<div class="widget-title"><i class="iconfont icon-gift"></i>&nbsp;{$shop->shop()->name}</div>
                			</header>
	    					<hr class="widget-separator">
							<div class="widget-body">
	    						<p>价格：{$shop->price} 元</p>
								<p>{if $shop->shop()->auto_reset_bandwidth==0}不自动重置流量{else}自动重置流量{/if}</p>
	    						<p>{if $shop->renew==0}不自动续费{else}在 {$shop->renew_date()} 续费{/if}</p>
								<hr/>
								<div class="text-center">
									<a class="layui-btn btn-sm {if $shop->renew==0}layui-btn-disabled{/if}" {if $shop->renew != 0} href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')"{/if}>关闭自动续费</a>
								</div>
							</div>
	    				</div>
                    </div>
              		{/foreach}
                    <div class="col-md-12">
              			<div class="pull-right">{$shops->render()}</div>
                    </div>
				</div>

				<div aria-hidden="true" class="modal fade" id="delete_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
								</button>
								<h4 class="modal-title">确认要关闭自动续费吗？</h4>
							</div>
							<div class="modal-body">
								<p>请确认！</p>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="layui-btn" data-dismiss="modal" type="button">取消</button><button class="layui-btn" data-dismiss="modal" id="delete_input" type="button">确定</button></p>
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
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}
$(document).ready(function(){
	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/bought",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					layer.open({ content: data.msg });
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}else{
					layer.open({ content: data.msg });
				}
			},
			error:function(jqXHR){
				layer.open({ content: data.msg+'  发生错误了。' });
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})
</script>
</html>