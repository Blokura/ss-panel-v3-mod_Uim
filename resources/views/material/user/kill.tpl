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
                        <div class="col-md-6 col-md-offset-3">
 							<div class="widget">
								<header class="widget-header">
									<div class="widget-title pull-left"><i class="iconfont icon-error"></i>&nbsp;确认注销？</div>
								</header><!-- .widget-header -->
								<hr class="widget-separator" />
								<div class="widget-body">
									<div class="layui-form layui-form-pane">
                        	  			<div class="layui-form-item">
                        	  			    <label class="layui-form-label">验证密码</label>
                        	  			    <div class="layui-input-block">
                        	  			    	<input type="text" class="layui-input" id="passwd">
                        	  			    </div>
                        	  			</div>
                                        <p class="text-right"><button class="layui-btn" id="kill">注销</button></p>
                        			</div>
								</div><!-- .widget-body -->
							</div><!-- .widget -->
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
        $("#kill").click(function () {
            $.ajax({
                type: "POST",
                url: "kill",
                dataType: "json",
                data: {
                    passwd: $("#passwd").val(),
                },
                success: function (data) {
                    if (data.ret) {
                        layer.open({ content: data.msg }); 
                        window.setTimeout("location.href='/'", {$config['jump_delay']});
                    } else {
                        layer.open({ content: data.msg }); 
                    }
                },
                error: function (jqXHR) {
					layer.open({ content: '发生错误：' + jqXHR.status + data.msg }); 
                }
            })
        })
    })
</script>
</body>
</html>