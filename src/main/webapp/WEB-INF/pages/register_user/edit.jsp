<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${PATH}/css/main.css">
<link rel="stylesheet" href="${PATH}/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"2543",secure:"2205"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-9" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/register_user/edit.jsp">

<%@include file="/WEB-INF/pages/common/top.jsp"%>

	<div class="container-fluid" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-9" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/register_user/edit.jsp">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<%@include file="/WEB-INF/pages/common/menu.jsp"%>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">数据列表</a></li>
					<li class="active">个人信息修改</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						个人信息
						<div style="float:right;cursor:pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form">

							<div class="form-group">
								<label for="exampleInputPassword1">用户名称</label> <input
									type="text" class="form-control" id="inputName"
									placeholder="请输入用户名称" value="${user.name}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">登陆账号</label> <input
									type="text" class="form-control" disabled="disabled" id="inputUserName"
									placeholder="请输入登陆账号" value="${user.userName }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">登陆密码</label> <input
									type="password" class="form-control" id="inputPassword"
									placeholder="请输入登陆密码" value="${user.passWord}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">邮箱地址</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="请输入邮箱地址" value="${user.email}">
								<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为：
									xxxx@xxxx.com</p>
							</div>
							<button type="button" class="btn btn-success" id="updateButton">
								<i class="glyphicon glyphicon-edit"></i> 修改
							</button>
							<button type="reset" class="btn btn-danger" <!-- onclick="resetPage() -->">
								<i class="glyphicon glyphicon-refresh" ></i> 重置
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${PATH}/script/docs.min.js"></script>
	<script src="${PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			$("#updateButton").click(function(){
				var name = $("#inputName").val();
				var userName = $("#inputUserName").val();
				var passWord = 	$("#inputPassword").val();
				var email = $("#inputEmail").val();
			
				if(name==""){
					layer.msg("账号名称不能为空！", {time : 3000,icon : 5,shift : 6}, function() {});
					return;
				}
				if(userName==""||userName.length<4){
					layer.msg("登录账号不能为空或长度不少于4位！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
	        	if(passWord==""||passWord.length<4){
	        		layer.msg("登录密码不能为空或长度不少于4位！", {time : 2000,icon : 5,shift : 6}, function() {});
	        		return;
	        	}
	        	var regex = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
	        	if(email==""||!(regex.test(email))){
	        		layer.msg("电子邮箱不能为空或格式不正确！！", {time : 2000,icon : 5,shift : 6}, function() {});
	        		return;
	        	}
	        	var JsonData = {"id":${user.id},
	        				"group":${user.group},
			          		"name":name,
			          		 "userName":userName,
			          		 "passWord":passWord,
			          		 "email":email
			          		};
			    
				$.ajax({
			          type:"POST",
			          url:"${PATH}/register_user/updateUser.action",
			          data:JsonData,
			          success:function(result){	
			          	if(result.success){
			              	layer.msg("修改用户成功！", {time : 500,icon : 6,shift : 6}, function() {
			              		window.location.href="${PATH}/register_user/index.action";});
			              }else{
			              	layer.msg("修改用户失败！", {time : 1000,icon : 5,shift : 6}, function() {
			              		 });
			              }
			          
			          }
					
			});
			
			});
			
		});
	</script>
</body>
</html>
