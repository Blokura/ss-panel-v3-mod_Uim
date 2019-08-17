<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>服装商店 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
  <style>.text-bz{ overflow: hidden;text-overflow: ellipsis;white-space: nowrap; }</style>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
              	<div class="row">
        			<div class="col-md-12">
                        <div class="layui-elem-quote">
                            <p>温馨提示：您购买的商品有效期会从当前时间开始计算，流量将会重置，请确保流量使用完毕再购买。</p>
                            <span>账户余额：<font color="red">{$user->money}</font> 元 {if $user->money == 0}（余额不足，请 <a href="/user/code">充值</a>）{/if}</span>
                        </div>
                   		<div class="row">
          					{foreach $shops as $shop}
        					<div class="col-lg-4 col-md-6">
								<div class="widget box">
	    							<header class="widget-header">
                						<div class="widget-title"><i class="iconfont icon-tag"></i>&nbsp;{$shop->name}</div>
                					</header>
	    							<div class="widget-body" style="padding-top: 0;">
                                        <table class="layui-table">
                                            <tr>
                                                <td>获得流量</td>
                                                <td>{$shop->bandwidth()} G</td>
                                            </tr>
                                            <tr>
                                                <td>等级提升</td>
                                                <td>
                                                    {if $shop->user_class() == "0"}
                                                        Lv.0 无衣服
													{elseif $shop->user_class() == "1"}
                                                        Lv.1 死库水
                                                    {elseif $shop->user_class() == "2"}
                                                        Lv.2 女仆装
                                                    {elseif $shop->user_class() == "3"}
                                                        Lv.3 天使婚纱
                                                    {/if}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>套餐时长</td>
                                                <td>{if $shop->class_expire() == "0"}无{else}{$shop->class_expire()} 天{/if}</td>
                                            </tr>
                                            <tr>
                                                <td>流量重置</td>
                                                <td>{if $shop->reset_value() == '0' }无{else}{$shop->reset_value()} G{/if}</td>
                                            </tr>
                                            <tr>
                                                <td>端口速率</td>
                                                <td>{if {$shop->speedlimit()} == '0' }无限制{else}{$shop->speedlimit()} Mbps{/if}</td>
                                            </tr>
                                            <tr>
                                                <td>设备限制</td>
                                                <td>{if {$shop->connector()} == '0' }无限制{else}{$shop->connector()} 台{/if}</td>
                                            </tr>
                                        </table>
                                        {foreach $shop->content_extra() as $service}
									         <p class="text-bz"><b>介绍：</b>{$service[1]}</p>
									    {/foreach}
                                        <hr />
                                        <div class="shop-footer" style="height: 38px;">
                                        <div class="pull-left" style="padding: 10px;height: 38px;">
                                            价格：{$shop->price} 元
	    								</div>
                                        <div class="pull-right">
                                            {if $shop->user_class() == "0" && $user->class == 0}
                                                <a class="layui-btn {$shop->auto_renew} layui-btn-disabled" href="javascript:void(0);">购买</a>
                                            {else}
                                                <a class="layui-btn" href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew})">购买</a>
                                            {/if}
                                        </div>
                                        </div>
                					</div>
	    						</div>  
							</div>
        					{/foreach}
                        </div>
					</div>
				</div>
              
				<div aria-hidden="true" class="modal fade" id="coupon_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title">
                                	您有优惠码吗？
                                </h4>
							</div>
							<div class="modal-body">
								<div class="form-group form-group-label">
									<label class="floating-label" for="coupon">有的话，请在这里输入。没有的话，直接确定吧</label>
									<input class="form-control" id="coupon" type="text">
								</div>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="layui-btn" data-dismiss="modal" id="coupon_input" type="button">确定</button></p>
							</div>
						</div>
					</div>
				</div>
					
				<div aria-hidden="true" class="modal fade" id="order_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title">
                                	订单确认
                                </h4>
							</div>
							<div class="modal-body">
								<p id="name">商品名称：</p>
								<p id="credit">优惠额度：</p>
								<p id="total">总金额：</p>
                                <label for="disableothers">
                                    <input checked  id="disableothers" type="checkbox">&nbsp;关闭旧套餐自动续费
                                </label>
                                <br />
                                <label for="autorenew" id="autor">
                                    <input checked id="autorenew" type="checkbox">&nbsp;自动续费
                                </label>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="layui-btn" data-dismiss="modal" id="order_input" type="button">确定</button></p>
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
function buy(id,auto) {
    var usermoney = "{$user->money}";
    if (usermoney < "1") {
        layui.use('layer', function(){
            var layer = layui.layer;
	        layer.alert('余额不足，请充值！', function(index){
		        window.setTimeout("location.href='/user/code'");
	        });   
         }); 
    return false;
    }

	if(auto == 0)
	{
		document.getElementById('autor').style.display="none";
	}
	else
	{
		document.getElementById('autor').style.display="";
	}
	
	shop = id;
	$("#coupon_modal").modal();
}


$("#coupon_input").click(function () {
		$.ajax({
			type: "POST",
			url: "coupon_check",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop
			},
			success: function (data) {
				if (data.ret) {
					$("#name").html("商品名称："+data.name);
					$("#credit").html("优惠额度："+data.credit);
					$("#total").html("总金额："+data.total);
					$("#order_modal").modal();
				} else {
					layer.open({ content: data.msg });
				}
			},
			error: function (jqXHR) {
				layer.open({ content: data.msg+'  发生了错误。' });
			}
		})
	});
	
$("#order_input").click(function () {

		if(document.getElementById('autorenew').checked)
		{
			var autorenew=1;
		}
		else
		{
			var autorenew=0;
		}

		if(document.getElementById('disableothers').checked){
			var disableothers=1;
		}
		else{
			var disableothers=0;
		}
  
		$.ajax({
			type: "POST",
			url: "buy",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop,
				autorenew: autorenew,
				disableothers:disableothers
			},
			success: function (data) {
				if (data.ret) {
					layer.open({ content: data.msg });
					window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
				} else {
					layer.open({ content: data.msg });
				}
			},
			error: function (jqXHR) {
				layer.open({ content: data.msg+'  发生了错误。' });
			}
		})
	});

</script>
</html>