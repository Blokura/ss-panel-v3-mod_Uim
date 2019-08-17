<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>添加中转规则 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
      				<div class="col-lg-6 col-lg-offset-3">
            			<div class="widget">
                            <header class="widget-header">
							    <div class="widget-title pull-left">添加中转规则</div>
							</header><!-- .widget-header -->
              				<hr class="widget-separator" />
                            <div class="widget-body">
                                <form id="main_form">
                                    <div class="layui-form layui-form-pane">
                          		        <div class="layui-form-item">
                          		            <label class="layui-form-label" for="source_node">起源节点</label>
                          		            <div class="layui-input-block">
                          		        	    <select id="source_node" class="layui-select" name="source_node">
								                    <option value="0">请选择起源节点</option>
								                    {foreach $source_nodes as $source_node}
								    	                <option value="{$source_node->id}">{$source_node->name}</option>
								                    {/foreach}
								    		    </select>
                          		            </div>
                          		        </div>
                           			    <div class="layui-form-item">
                           			    	<label class="layui-form-label" for="dist_node">目标节点</label>
                           			    	<div class="layui-input-block">
                           			        	<select id="dist_node" class="layui-select" name="dist_node">
									                <option value="-1">不进行中转</option>
									                {foreach $dist_nodes as $dist_node}
									                    <option value="{$dist_node->id}">{$dist_node->name}</option>
									                {/foreach}
                                                </select>
                           			     	</div>
                          			    </div>
                           			    <div class="layui-form-item">
                           			    	<label class="layui-form-label" for="port">端口</label>
                           			    	<div class="layui-input-block">
                           			        	<select id="port" class="layui-select" name="port">
									            {foreach $ports as $port}
									    	        <option value="{$port}">{$port}</option>
									            {/foreach}
                                                </select>
                           			     	</div>
                          			    </div>
                           			    <div class="layui-form-item">
                           			    	<label class="layui-form-label" for="priority">优先级</label>
                           			    	<div class="layui-input-block">
                           			        	<input type="text" class="layui-input" id="priority" name="priority" type="text" value="0" />
                           			     	</div>
                          			    </div>
                        		    </div>
                                    <p class="text-right"><button class="layui-btn" id="submit">添加</button></p>
                                </form>
                            </div>
						</div><!--.widget-->
                    </div>
				</div>
			</section>
		</div>
{include file='user/dialog.tpl'}
{include file='user/footer.tpl'}
	</main>
{include file='user/assets/js.tpl'}
{literal}
<script>

	$('#main_form').validate({
		rules: {
		  priority: {required: true}
		},


		submitHandler: function() {



		$.ajax({

				type: "POST",
				url: "/user/relay",
				dataType: "json",
				{/literal}
				data: {
						source_node: $("#source_node").val(),
						dist_node: $("#dist_node").val(),
						port: $("#port").val(),
						priority: $("#priority").val()
				{literal}
					},
					success: function (data) {
						if (data.ret) {
						layer.open({ content: data.msg });
									{/literal}
						window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
									{literal}
						} else {
						layer.open({ content: data.msg });
						}
					},
					error: function (jqXHR) {
						layer.open({ content: data.msg + ' 出现了一些错误。' });
					}
					});
				}
		});

</script>
{/literal}
</body>
</html>