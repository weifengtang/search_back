<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf_8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${PATH}/css/login.css">
	<style>

	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">问卷调查系统</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
		  <div class="form-group has-success has-feedback">
			<input id="userName" type="text" class="form-control" id="inputSuccess4" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input  id="passWord" type="text" class="form-control" id="inputSuccess4" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input id="email" type="text" class="form-control" id="inputSuccess4" placeholder="请输入邮箱地址" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<select id="select_id" class="form-control">
					<option value="0">调查用户</option>
					<option value="1">管理员</option>
				</select>
		  </div>
        <div class="checkbox">
          <label>
            	忘记密码
          </label>
          <label style="float:right">
            <a href="${PATH}/user/login.action">我有账号</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" href="#" onclick="doRegister()" > 注册</a>
      </form>
    </div>
    <div style="font-size:20px; color:#79ff61; display:block;width:100%; float:left; text-align:center; margin-top:400px;">@TWF版权所有©2019-技术支持电话：17346611033</div>
	<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${PATH}/layer/layer.js"></script>
	<script>
		function doRegister() {
	
			var userName = $("#userName").val();
			//非空校验
			if (userName == "" || userName.length<4) {
				layer.msg("账户不正确,请重新输入!", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			var passWord = $("#passWord").val();
			if (passWord == "") {
				layer.msg("账户密码不正确!", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			var email = $("#email").val();
			if (email == "") {
				layer.msg("邮箱格式不正确!", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			
			
			
			// document.form.action="${PATH}/user/login.action";
			//document.form.submit();
			//id选择器$("#form").submit();
			//使用ajax提交表单数据
			var loadingIndex = null;
			$.ajax({
				type :'post',
				url : '${PATH}/user/AJAXLogin.action',
				//contentType:'application/json',//加了之，前台数据不能传到后台 
				data :{"userName":userName,"passWord":passWord},
				beforeSend:function() {loadingIndex = layer.msg('处理中', {icon : 16});
				},
				success:function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						window.location.href="${PATH}/user/main.action";
					} else {
						layer.msg("账号或密码不正确，请重新输入!", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
			
		
			
			
		}
	</script>
  </body>
</html>