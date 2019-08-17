<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>中转规则 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
                <div class="row">
					<div class="col-md-12">
            			<div class="widget">
							<div class="widget-body">
                                <p>1.中转规则一般由中国中转至其他国外节点；</p>
                                <p>2.请设置端口号为您自己的端口；</p>
                                <p>3.优先级越大，代表其在多个符合条件的规则并存时会被优先采用，当优先级一致时，先添加的规则会被采用；</p>
                                <p>4.节点不设置中转时，这个节点就可以当作一个普通的节点来做代理使用。</p>
							</div><!--.widget-body-->
						</div><!--.widget-->
					</div>
				</div>
    			<div class="row">
      				<div class="col-lg-12">
            			<div class="widget">
	    					<header class="widget-header">
                				<div class="widget-title pull-left"><i class="iconfont icon-unorderedlist"></i>&nbsp;中转规则</div>
                                <div class="pull-right"><a class="layui-btn layui-btn-sm btn-top" href="/user/relay/create">添加规则</a></div>
                			</header>
                            <hr class="widget-separator" />
                            <div class="widget-body">
                  			<ul class="nav nav-tabs" id="info">
  								<li class="active" style="width: 50%;"><a href="#rule_table" data-toggle="tab">规则表</a></li>
  								<li style="width: 50%;"><a href="#link_table" data-toggle="tab">链路表</a></li>
							</ul>
                    		<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="rule_table">
                                    {$rules->render()}
									<table class="table">
									    <tr><!-- th>ID</th --><th>起源节点</th><th>目标节点</th><th>端口</th><th>优先级</th><th>操作</th></tr>
										{foreach $rules as $rule}
										<tr>
											<!-- td>#{$rule->id}</td -->
											{if $rule->source_node_id == 0}
											    <td>所有节点</td>
											{else}
											    <td>{$rule->Source_Node()->name}</td>
											{/if}
											{if $rule->Dist_Node() == null}
											    <td>不进行中转</td>
											{else}
											    <td>{$rule->Dist_Node()->name}</td>
											{/if}
											    <td>{if $rule->port == 0}所有端口{else}{$rule->port}{/if}</td>
											    <td>{$rule->priority}</td>
                                                <td>
											        <a class="layui-btn layui-btn-xs" {if $rule->user_id == 0}disabled{else}href="/user/relay/{$rule->id}/edit"{/if}>编辑</a>
											        <a class="layui-btn layui-btn-xs" id="delete" value="{$rule->id}" {if $rule->user_id == 0}disabled{else}href="javascript:void(0);" onClick="delete_modal_show('{$rule->id}')"{/if}>删除</a>
												</td>
										</tr>
										{/foreach}
									</table>
									{$rules->render()}
								</div>
								<div class="tab-pane fade" id="link_table">
                                    <table class="table">
								        <tr><th>端口</th><th>始发节点</th><th>终点节点</th><th>途径节点</th><th>状态</th></tr>
                                        {foreach $pathset as $path}
                                        <tr>
                                            <td>{$path->port}</td>
                                            <td>{$path->begin_node->name}</td>
                                            <td>{$path->end_node->name}</td>
                                            <td>{$path->path}</td>
                                            <td>{$path->status}</td>
                                        </tr>
                                        {/foreach}
					                </table>
                                </div>
							</div>
                            </div>
						</div><!--.widget-->
					    <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-hidden="true">
					        <div class="modal-dialog">
					    	    <div class="modal-content">
					    		    <div class="modal-header">
					    			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					    				    &times;
					    			    </button>
					    			    <h4 class="modal-title">
					    				    确认要删除？
					    			    </h4>
					    		    </div>
					    		    <div class="modal-body">
					    			    <div class="text-center">
					    			    	<p>请您确认。</p>
                	    			    </div>
					    		    </div>
            		    		    <div class="modal-footer">
                	    			    <button type="button" class="layui-btn layui-btn-sm" data-dismiss="modal">取消</button>
                                        <button type="button" class="layui-btn layui-btn-sm" data-dismiss="modal" id="delete_input">确认</button>
            		    		    </div>
					    	    </div><!-- /.modal-content -->
					        </div><!-- /.modal -->
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
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}


$(document).ready(function(){

	{if !$is_relay_able}
	layer.open({ content: "为了中转的稳定，您需要在 资料编辑 里设置协议为以下协议之一： <br>{foreach $relay_able_protocol_list as $single_text}{$single_text}<br>{/foreach}后方可设置中转规则！ });
	{/if}

	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/relay",
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
				$("#msg").html(data.msg+" 发生错误了。");
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})

</script>
</body>
</html>