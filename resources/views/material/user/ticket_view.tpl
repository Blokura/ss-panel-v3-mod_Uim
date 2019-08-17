<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<title>查看工单 - {$config["appName"]}</title>
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
                				<div class="widget-title pull-left">查看工单</div>
                			</header>
							<div class="widget-body">
                                        <div class="layui-form layui-form-pane">
                           					<div class="layui-form-item">
                                                <div id="editor">
                                                    <p></p>
                                                </div>
                          					</div>
                                            <div class="text-center">
                                                <button class="layui-btn" id="submit">回复</button><button class="layui-btn" id="close">回复并关闭</button>
                                            </div>
                        				</div>
							</div><!--.widget-body-->
						</div><!--.widget-->

                        {$ticketset->render()}
                        {foreach $ticketset as $ticket}
                        <div class="widget">
							<header class="widget-header">
								<div class="widget-title pull-left">{$ticket->User()->user_name}</div>
                                <div class="widget-title pull-right"><small>{$ticket->datetime()}</small></div>
							</header>
                            <hr class="widget-separator">
                            <div class="widget-body">
                                {$ticket->content}
                            </div>
                        </div>
                        {/foreach}
                        {$ticketset->render()}
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
            var neirong = editor.txt.html();
            if(neirong == "<p></p><p><br></p>") {
                layer.open({ content: '内容不能为空。' });
                return false;
            }
            $.ajax({
                type: "PUT",
                url: "/user/ticket/{$id}",
                dataType: "json",
                data: {
                    content: editor.txt.html(),
					title: $("#title").val(),
					status:status
                },
                success: function (data) {
                    if (data.ret) {
                        layer.msg( data.msg );
                        document.getElementById("submit").disabled=true;
                        document.getElementById("close").disabled=true;
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
			status=1;
            submit();
        });
		
		$("#close").click(function () {
			status=0;
            submit();
        });
    });
</script>
</body>
</html>