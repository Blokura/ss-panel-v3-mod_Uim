<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>资料编辑 - {$config["appName"]}</title>
{include file='user/assets/css.tpl'}
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">
{include file='user/assets/header.tpl'}
    <main id="app-main" class="app-main">
        <div class="wrap">
			<section class="app-content">
    			<div class="row">
      				<div class="col-md-12">
                        <div class="row">
							<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-info-circle"></i>&nbsp;个人信息</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                  						<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">用户昵称</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="{$user->user_name}" readonly />
                          					    </div>
                          					</div>
                           					<div class="layui-form-item">
                           						<label class="layui-form-label">用户邮箱</label>
                           						<div class="layui-input-block">
                           					    	<input type="text" class="layui-input" value="{$user->email}" readonly />
                           					 	</div>
                          					</div>
                           					<div class="layui-form-item">
                           						<label class="layui-form-label">到期时间</label>
                           						<div class="layui-input-block">
                           					    	<input type="text" class="layui-input" value="{date("Y-m-d",strtotime($user->class_expire))}" readonly />
                           					 	</div>
                          					</div>
                        				</div>
   										<p class="text-right"><a class="layui-btn" href="kill">注销</a></p>
									</div>
								</div>
                            </div>
      						<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-cluster"></i>&nbsp;连接信息</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                        <table class="lj layui-table">
                                    		<tbody>
                                                <tr><td>节点端口</td><td>{$user->port}</td></tr>
                                                <tr><td>节点密码</td><td>{$user->passwd}</td></tr>
                                                <tr><td>加密方式</td><td>{$user->method}</td></tr>
                                                <tr><td>节点协议</td><td>{$user->protocol}</td></tr>
                                                <tr><td>混淆方式</td><td>{$user->obfs}</td></tr>
                                            </tbody>
                                        </table>
									</div>
								</div>
                            </div>
							<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-lock"></i>&nbsp;登录密码修改</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                  						<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">当前密码</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" id="oldpwd">
                          					    </div>
                          					</div>
                           					<div class="layui-form-item">
                           						<label class="layui-form-label">更新密码</label>
                           						<div class="layui-input-block">
                           					    	<input type="text" class="layui-input" id="pwd">
                           					 	</div>
                          					</div>
                           					<div class="layui-form-item">
                           						<label class="layui-form-label">重复密码</label>
                           						<div class="layui-input-block">
                           					    	<input type="text" class="layui-input" id="repwd">
                           					 	</div>
                          					</div>
                        				</div>
   										<p class="text-right"><button class="layui-btn" id="pwd-update">提交</button></p>
									</div>
								</div>
                            </div>
                        </div>
                        <div class="row">
      						<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-lock"></i>&nbsp;连接密码修改</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                    	<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">当前密码</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="{$user->passwd}" readonly />
                          					    </div>
                          					</div>
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">设置密码</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" id="sspwd">
                          					    </div>
                          					</div>
                                        </div>
	    								<p class="text-right"><button class="layui-btn" id="ss-pwd-update">提交</button></p>
									</div>
								</div>
                            </div>
          					<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-edit"></i>&nbsp;加密方式修改</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                    	<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">加密方式</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="{$user->method}" readonly />
                          					    </div>
                          					</div>
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">新加密方式</label>
                          					    <div class="layui-input-block">
                          					    	<select id="method" class="layui-textarea">
														{$method_list = $config_service->getSupportParam('method')}
														{foreach $method_list as $method}
														<option value="{$method}" {if $user->method == $method}selected="selected"{/if}>[{if URL::CanMethodConnect($method) == 2}SS/SSD{else}SS/SSD/SSR{/if} 可连接] {$method}</option>
														{/foreach}
                                                    </select>
                          					    </div>
                          					</div>
                                        </div>
	    								<p class="text-right"><button class="layui-btn" id="method-update">提交</button></p>
									</div>
								</div>
                            </div>
          					<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-mail"></i>&nbsp;邮件接收设置</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                    	<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">当前状态</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="{if $user->sendDailyMail==1} 接收 {else} 拒收 {/if}" readonly />
                          					    </div>
                          					</div>
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">发送设置</label>
                          					    <div class="layui-input-block">
                                                    <select id="mail" class="layui-select">
														<option value="1">接收</option>
														<option value="0">拒收</option>
                          					    	</select>
                          						</div>
                                        	</div>
										</div>
 		   								<p class="text-right"><button class="layui-btn" id="mail-update">提交</button></p>
									</div>
								</div>
        					</div>
						</div>
                        <div class="row">
							<div class="col-md-8">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-wrench"></i>&nbsp;协议&混淆设置</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
										<div class="layui-form layui-form-pane">
                                            <div class="row">
                                          		<div class="col-md-6">
                                            		<div class="layui-form-item">
														<label class="layui-form-label">当前协议</label>
                                            			<div class="layui-input-block">
                          					    			<input type="text" class="layui-input" value="{$user->protocol}" readonly />
                          					    		</div>
													<!-- p>1：如果需要兼容 SS/SSD 请选择带_compatible的兼容选项！</p -->
													<!-- p>2：如果您使用 SS/SSD 此处请直接设置为 origin！</p -->
													<!-- p>3：auth_chain 系为实验性协议，可能造成不稳定或无法使用，开启前请询问是否支持</p -->
                                            		</div>
                                            	</div>
                                            	<div class="col-md-6">
                                            		<div class="layui-form-item">
														<label class="layui-form-label">设置新协议</label>
                                            			<div class="layui-input-block">
                          					    			<select id="protocol" class="form-control">
																{$protocol_list = $config_service->getSupportParam('protocol')}
																{foreach $protocol_list as $protocol}
																<option value="{$protocol}" {if $user->protocol == $protocol}selected="selected"{/if}>[{if URL::CanProtocolConnect($protocol) == 3}SS/SSD/SSR{else}SSR{/if} 可连接] {$protocol}</option>
																{/foreach}
															</select>
                          					    		</div>
                                            		</div>
                                            	</div>
                                            </div>
                                            <div class="row">
                                          		<div class="col-md-6">
                    								<div class="layui-form-item">
														<label class="layui-form-label">当前混淆</label>
														<div class="layui-input-block">
                          					    			<input type="text" class="layui-input" value="{$user->obfs}" readonly />
                          								</div>
													<!-- p>注意1：如果需要兼容 SS/SSD 请选择带_compatible的兼容选项！</p -->
													<!-- p>注意2：SS/SSD 和 SSR 支持的混淆类型有所不同，simple_obfs_* 为 SS/SSD 的混淆方式，其他为 SSR 的混淆方式！</p -->
                                            		</div>
                                                </div>
                                                <div class="col-md-6">
													<div class="layui-form-item">
														<label class="layui-form-label">设置新混淆</label>
														<div class="layui-input-block">
                          					    			<select id="obfs" class="form-control">
																{$obfs_list = $config_service->getSupportParam('obfs')}
																{foreach $obfs_list as $obfs}
																<option value="{$obfs}" {if $user->obfs == $obfs}selected="selected"{/if}>[{if URL::CanObfsConnect($obfs) >= 3}SS/SSD/SSR{else}{if URL::CanObfsConnect($obfs) == 1}SSR{else}SS/SSD{/if}{/if} 可连接] {$obfs}</option>
																{/foreach}
															</select>
                    									</div>
                                            		</div>
                                                </div>
                                            </div>
                                            <div class="row">
                                          		<div class="col-md-6">
                    								<div class="layui-form-item">
														<label class="layui-form-label">混淆参数</label>
														<div class="layui-input-block">
                          							    	<input type="text" class="layui-input" value="{$user->obfs_param}" readonly />
                          								</div>
                                            			<!-- p>注意：如果需要兼容 SS/SSD 请留空！</p -->
                                            		</div>
                                                </div>
                                            	<div class="col-md-6">
                    								<div class="layui-form-item">
														<label class="layui-form-label">设置新参数</label>
														<div class="layui-input-block">
                          							    	<input type="text" class="layui-input" id="obfs-param" />
                          								</div>
                                            			<!-- p>注意：如果需要兼容 SS/SSD 请留空！</p -->
                                            		</div>
                                                </div>
                                            </div>
                    					</div>
	    								<p class="text-right"><button class="layui-btn" id="ssr-update">提交</button></p>
									</div>
								</div>
                                {if $config['enable_telegram'] == 'false'}
                            </div>
							<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-reload"></i>&nbsp;重置端口</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                   		<div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">温馨提示</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="随机更换一个端口" readonly />
                          					    </div>
                          					</div>
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">当前端口</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" value="{$user->port}" readonly />
                          					    </div>
                          					</div>
                    					</div>
 		   								<p class="text-right"><button class="layui-btn" id="portreset">重置</button></p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-piechart"></i>&nbsp;更换主题</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
                                		<div class="layui-form layui-form-pane">
                                			<div class="layui-form-item">
                          						<label class="layui-form-label">当前主题</label>
                          						<div class="layui-input-block">
                          							<input type="text" class="layui-input" value="{$user->theme}" readonly />
                          						</div>
                                			</div>
                          					<div class="layui-form-item">
                          						<label class="layui-form-label">选择主题</label>
                          							<div class="layui-input-block">
                          								<select id="theme" class="">
                                		                	{foreach $themes as $theme}
															<option value="{$theme}">{$theme}</option>
															{/foreach}
														</select>
                          							</div>
                          						</div>
                    						</div>
 		   									<p class="text-right"><button class="layui-btn" id="theme-update">提交</button></p>
										</div>
									</div>
								</div><!-- .col-md-6 -->
                                {/if}
                              	{if $config['enable_telegram'] == 'true'}
                            	<div class="row">
									<div class="col-md-6">
										<div class="widget">
											<header class="widget-header">
												<div class="widget-title pull-left"><i class="iconfont icon-reload"></i>&nbsp;重置端口</div>
											</header><!-- .widget-header -->
              								<hr class="widget-separator" />
											<div class="widget-body">
                                    			<div class="layui-form layui-form-pane">
													<div class="layui-form-item">
														<label class="layui-form-label">温馨提示</label>
														<div class="layui-input-block">
															<input type="text" class="layui-input" value="随机更换一个端口" readonly />
														</div>
													</div>
                          							<div class="layui-form-item">
                          							    <label class="layui-form-label">当前端口</label>
                          							    <div class="layui-input-block">
                          							    	<input type="text" class="layui-input" value="{$user->port}" readonly />
                          							    </div>
                          							</div>
                    							</div>
 		   										<p class="text-right"><button class="layui-btn" id="portreset">重置</button></p>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget">
											<header class="widget-header">
												<div class="widget-title pull-left"><i class="iconfont icon-piechart"></i>&nbsp;更换主题</div>
											</header><!-- .widget-header -->
              								<hr class="widget-separator" />
											<div class="widget-body">
                                		    	<div class="layui-form layui-form-pane">
                                		            <div class="layui-form-item">
                          							    <label class="layui-form-label">当前主题</label>
                          							    <div class="layui-input-block">
                          							    	<input type="text" class="layui-input" value="{$user->theme}" readonly />
                          							    </div>
                                		            </div>
                          							<div class="layui-form-item">
                          							    <label class="layui-form-label">选择主题</label>
                          							    <div class="layui-input-block">
                          							    	<select id="theme" class="">
                                		                       	{foreach $themes as $theme}
																<option value="{$theme}">{$theme}</option>
																{/foreach}
															</select>
                          							    </div>
                          							</div>
                    							</div>
 		   										<p class="text-right"><button class="layui-btn" id="theme-update">提交</button></p>
											</div>
										</div>
									</div><!-- .col-md-6 -->
                                </div>
                            </div>					
                            <div class="col-md-4">
								<div class="widget">
									<header class="widget-header">
										<div class="widget-title pull-left"><i class="iconfont icon-rise"></i>&nbsp;Telegram 绑定</div>
									</header><!-- .widget-header -->
              						<hr class="widget-separator" />
									<div class="widget-body">
										<p>Telegram 添加机器人账号 <a href="https://t.me/{$telegram_bot}">@{$telegram_bot}</a>，拍下下面这张二维码发给它。</p>
										<div class="text-center">
											<div id="telegram-qr"></div>
											<br/>
										</div>
                                        <div class="pull-left" style="padding: 10px;height: 38px;">{if $user->telegram_id != 0}当前绑定：<a href="https://t.me/{$user->im_value}">@{$user->im_value}</a>{/if}</div> 
 		   								<p class="text-right"><a class="layui-btn" href="/user/telegram_reset" >解绑</a></p> 
									</div> 
								</div>
                            </div>
            				{/if}
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
	$(document).ready(function () {
		$("#pwd-update").click(function () {
			$.ajax({
				type: "POST",
				url: "password",
				dataType: "json",
				data: {
					oldpwd: $("#oldpwd").val(),
					pwd: $("#pwd").val(),
					repwd: $("#repwd").val()
				},
				success: function (data) {
					if (data.ret) {
						layer.open({ content: data.msg });
					} else {
						layer.open({ content: data.msg });
					}
				},
				error: function (jqXHR) {
					layer.open({ content: data.msg+'     出现了一些错误。' });
				}
			})
		})
	})
</script>
<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                 success: function (data) {
                    if (data.ret) {
                        layer.open({ content: '成功了！' });
                    } else {
                        layer.open({ content: '失败了！' });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        layer.open({ content: '成功了！' });
                    } else {
						layer.open({ content: data.msg });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#mail-update").click(function () {
            $.ajax({
                type: "POST",
                url: "mail",
                dataType: "json",
                data: {
                    mail: $("#mail").val()
                },
                success: function (data) {
                    if (data.ret) {
						layer.open({ content: data.msg });
                    } else {
						layer.open({ content: data.msg });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#ssr-update").click(function () {
            $.ajax({
                type: "POST",
                url: "ssr",
                dataType: "json",
                data: {
                    protocol: $("#protocol").val(),
					obfs: $("#obfs").val(),
					obfs_param: $("#obfs-param").val()
                },
                success: function (data) {
                    if (data.ret) {
						$("#ajax-user-obfs-param").html($("#obfs-param").val());
                        layer.open({ content: data.msg });
                    } else {
                        layer.open({ content: data.msg });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#portreset").click(function () {
            $.ajax({
                type: "POST",
                url: "resetport",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    if (data.ret) {
                        layer.open({ content: '重置的端口为：'+ data.msg });
                    } else {
						layer.open({ content: data.msg });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#theme-update").click(function () {
            $.ajax({
                type: "POST",
                url: "theme",
                dataType: "json",
                data: {
                    theme: $("#theme").val()
                },
                success: function (data) {
                    if (data.ret) {
						layer.open({ content: data.msg });
						window.setTimeout("location.href='/user/edit'", {$config['jump_delay']});
                    } else {
						layer.open({ content: data.msg });
                    }
                },
                error: function (jqXHR) {
                    layer.open({ content: data.msg+'     出现了一些错误。' });
                }
            })
        })
    })
</script>
{if $config['enable_telegram'] == 'true'}
<script src="/theme/assets/user/js/jquery.qrcode.min.js"></script>
<script>
	var ga_qrcode = '{$user->getGAurl()}';
	jQuery('#ga-qr').qrcode({
		"text": ga_qrcode
	});

	{if $config['enable_telegram'] == 'true'}
	var telegram_qrcode = 'mod://bind/{$bind_token}';
	jQuery('#telegram-qr').qrcode({
		"text": telegram_qrcode
	});
	{/if}
</script>
{/if}
</body>
</html>