<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>创建工单 - {$config["appName"]}</title>
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
                				<div class="widget-title pull-left">创建工单</div>
                                <div class="pull-right"><small>工单处理时间 20:00 ~ 24:00</small></div>
                			</header>
							<div class="widget-body">
                                        <div class="layui-form layui-form-pane">
                          					<div class="layui-form-item">
                          					    <label class="layui-form-label">工单标题</label>
                          					    <div class="layui-input-block">
                          					    	<input type="text" class="layui-input" id="title">
                          					    </div>
                          					</div>
                           					<div class="layui-form-item">
                                                <div id="editor">
                                                    <p></p>
                                                </div>
                          					</div>
                                            <div class="text-center">
                                                <a class="layui-btn" id="submit">提交工单</a>
                                            </div>
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
<script>
    $(document).ready(function () {
        var E = window.wangEditor;
        var editor = new E('#editor');
        editor.customConfig.menus = ['head','link','emoticon','image','undo','redo'];
        editor.customConfig.zIndex = 100;
        editor.create();
        function submit() {
            $.ajax({
                type: "POST",
                url: "/user/ticket",
                dataType: "json",
                data: {
                    content: editor.txt.html(),
					title: $("#title").val()
                },
                success: function (data) {
                    if (data.ret) {
                        layer.msg( data.msg );
                        window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                    } else {
                        layer.msg( data.msg );
                    }
                },
                error: function (jqXHR) {
                    layer.msg( "发生错误：" + jqXHR.status );
                    
                }
            });
        }
		
        $("#submit").click(function () {
            submit();
        });
    });
</script>
</body>
</html>