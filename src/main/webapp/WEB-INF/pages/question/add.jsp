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
					<li class="active">新增问题</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						问题详情
						<div style="float:right;cursor:pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<div class="form-group">
									<label for="exampleInputPassword1">问题:</label> <input
										id="title" type="text" class="form-control"
										placeholder="请输入问题名称">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">问题类型：</label> <input
										id="type" type="text" class="form-control"
										placeholder="单选题/多选题/简答题">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">A选项：</label> <input
										id="option1" type="text" class="form-control"
										placeholder="请输入A选项内容">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">B选项：</label> <input
										id="option2" type="text" class="form-control"
										placeholder="请输入B选项内容">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">C选项：</label> <input
										id="option3" type="text" class="form-control"
										placeholder="请输入C选项内容">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">D选项：</label> <input
										id="option4" type="text" class="form-control"
										placeholder="请输入D选项内容">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">正确选项为：</label>
									<div class="form-group has-success has-feedback">
										<select id="select_id" class="form-control">
											<option value="A">A选项</option>
											<option value="B">B选项</option>
											<option value="C">C选项</option>
											<option value="D">D选项</option>
										</select>
									</div>
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
			window.location.href="${PATH}/topic/goTopic_questionPage.action?id="+${param.id};
		}
			//增加问题
			function insertTopic(){
				//问题
				var title = $("#title").val();
				if(title==""){
					layer.msg("问题不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				//问题类型
				var type = $("#type").val();
				if(type==""){
					layer.msg("问题类型不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				//问题选项
				var option1 = $("#option1").val();
				var option2 = $("#option2").val();
				var option3 = $("#option3").val();
				var option4 = $("#option4").val();
				if(option1==""){
					layer.msg("A选择不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				if(option2==""){
					layer.msg("B选择不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
			
				var JsonData = {};
				JsonData.title=title;
				JsonData.type=type;

	        	var loadingIndex= null;
	        	
	        	$.ajax({
	        		type:"POST",
				url : "${PATH}/question/addQuestion.action",
	        		data:JsonData,
	        		beforeSend:function(){
	        			loadingIndex = layer.msg('正在加载....', {icon : 16});
	        		},
	        		success:function(result){
	        			layer.close(loadingIndex);
	        			if (result.success) {
	        				layer.msg("添加问题成功!", {
	        					time : 500,
	        					icon : 6,
	        					shift : 6
	        				}, function() {index();});
	        					
	        			}else{
	        				layer.msg("添加问题失败！！", {
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
