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
	.table{
		background: #ededed;
	}
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #ededed;
}
</style>
</head>


<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/index.jsp">

<%@include file="/WEB-INF/pages/common/top.jsp"%>

	<div class="container-fluid" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/index.jsp">
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
					<li class="active">修改课题</li>
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
									<label>调查课题:</label> <input id="title"
										type="text" class="form-control" value="${topic.title }">
								</div>
								<div class="form-group">
									<label >创建人：</label> <input id="create_name"
										type="text" class="form-control" value="${topic.create_name}">
								</div>
								<div class="form-group">
									<label>调查时间（单位：分钟）：</label> <input   id="active_time"
										type="text" class="form-control" value="${topic.active_time}">
								</div>
								<div class="form-group">
									<label >课题创建时间：</label> <input  
										type="text" class="form-control" value="${topic.create_time}" disabled="disabled">
								</div>
								<div class="form-group">
									<label >调查简介:</label> <input  id="text"
										type="text" class="form-control" value="${topic.text}">
								</div>
							</div>
							<button type="button" class="btn btn-success" id="updateButton">
								<i class="glyphicon glyphicon-edit"></i> 修改
							</button>
							<button type="reset" class="btn btn-danger">
								<i class="glyphicon glyphicon-refresh"></i> 重置
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
				var create_name = $("#create_name").val();
				if(create_name==""){
					layer.msg("课题创建人不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				var title = $("#title").val();
				if(title==""){
					layer.msg("调查课题不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				var active_time = $("#active_time").val();
				if(active_time==""){
					layer.msg("调查时间不能为空！", {time : 2000,icon : 5,shift : 6}, function() {});
					return;
				}
				var JsonData = {"id":${topic.id}};
				JsonData.title=title;
				JsonData.create_name=create_name;
				JsonData.active_time=active_time;
				JsonData.text=$("#text").val();
				
				$.ajax({
			          type:"POST",
			          url:"${PATH}/topic/updateTopic.action",
			          data:JsonData,
			          success:function(result){	
			          	if(result.success){
			              	layer.msg("修改用户成功！", {time : 1000,icon : 6,shift : 6}, function() {
			              		window.location.href="${PATH}/topic/index.action";});
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
