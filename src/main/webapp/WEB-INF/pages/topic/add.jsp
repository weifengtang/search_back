<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script>"undefined" == typeof CODE_LIVE && (!function(e) {
		var t = {
				nonSecure : "2543",
				secure : "2205"
			},
			c = {
				nonSecure : "http://",
				secure : "https://"
			},
			r = {
				nonSecure : "127.0.0.1",
				secure : "gapdebug.local.genuitec.com"
			},
			n = "https:" === window.location.protocol ? "secure" : "nonSecure";
		script = e.createElement("script"), script.type = "text/javascript", script.async = !0, script.src = c[n] + r[n] + ":" + t[n] + "/codelive-assets/bundle.js", e.getElementsByTagName("head")[0].appendChild(script)
	}(document), CODE_LIVE = !0);
</script>
</head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-12"
	data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/add.jsp">

	<%@include file="/WEB-INF/pages/common/top.jsp"%>

	<div class="container-fluid" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc1-12"
		data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/add.jsp">
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
					<li class="active">新增课题</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						课题详情
						<div style="float:right;cursor:pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<div class="form-group">
									<label for="exampleInputPassword1">调查课题:</label> <input
										id="title" type="text" class="form-control"
										placeholder="请输入调查课题名称">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">创建人：</label> <input
										id="create_name" type="text" class="form-control"
										value="${LoginUser.name }">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">调查时间（单位：分钟）：</label> <input
										id="active_time" type="text" class="form-control"
										placeholder="请输入调查时间（单位：分钟）">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">调查简介:</label> <input
										id="text" type="text" class="form-control"
										placeholder="请输入调查简介">
								</div>
							</div>
							<button type="button" class="btn btn-success"
								onclick="insertTopic()">
								<i class="glyphicon glyphicon-plus"></i> 新增
							</button>
							<button type="reset" class="btn btn-danger">
								<i class="glyphicon glyphicon-refresh"></i> 重置
							</button>
							<button type="button" class="btn btn-success" onclick="index()">
								<i class="glyphicon glyphicon-arrow-left"></i> 返回
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
			
		});
		function index(){
			window.location.href="${PATH}/topic/index.action";
		}
			//增加课题
			function insertTopic(){
				//课题标题
				var title = $("#title").val();
				if(title==""){
					layer.msg("调查课题不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				//课题创建人
				var create_name = $("#create_name").val();
				if(create_name==""){
					layer.msg("课题创建人不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				//调查时间
				var active_time = $("#active_time").val();
				if(active_time==""){
					layer.msg("调查时间不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				//课题简介
				var text = $("#text").val();
				if(text==""){
					layer.msg("课题简介不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				var JsonData = {};
				JsonData.title=title;
				JsonData.create_name=create_name;
				JsonData.active_time=active_time;
				JsonData.text=text;
				
	        	var loadingIndex= null;
	        	
	        	$.ajax({
	        		type:"POST",
				url : "${PATH}/topic/insertTopic.action",
	        		data:JsonData,
	        		beforeSend:function(){
	        			loadingIndex = layer.msg('正在加载....', {icon : 16});
	        		},
	        		success:function(result){
	        			layer.close(loadingIndex);
	        			if (result.success) {
	        				layer.msg("添加课题成功!", {
	        					time : 500,
	        					icon : 6,
	        					shift : 6
	        				}, function() {index();});
	        					
	        			}else{
	        				layer.msg("添加课题失败！！", {
	        					time : 1000,
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
