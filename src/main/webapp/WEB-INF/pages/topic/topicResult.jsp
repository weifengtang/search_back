<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li class="active">课题调查结果详情</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						调查课题:<font style="font-size:15px ;color: red;">${topic.title}</font>
						<div style="float:right;cursor:pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div style="font: 30px/1.5 '仿宋';" class="panel-body">
						<form role="form">
							<c:forEach items="${topic.questions}" var="question">
								<label>问题${question.id}:${question.title}&nbsp;(${question.type})</label>&nbsp;
									<a><i class="glyphicon glyphicon-zoom-in" onclick="goResultPage('+${question.id}+')"></i></a>
								</br>
								<c:forEach items="${question.options}" var="option">
									<label>${option.number}:${option.title }</label>
								</c:forEach>
								</br></br>
							</c:forEach>
						</form>
						<button type="button" class="btn btn-success" onclick="index()">
							<i class="glyphicon glyphicon-arrow-left"></i> 返回
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${PATH}/script/docs.min.js"></script>
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
		function index() {
			window.location.href = "${PATH}/topic/index.action";
		}
		function goResultPage(question_id) {
			alert("查看结果");
			window.location.href = "${PATH}/topic/goResultPage.action";
		}
	</script>
</body>
</html>
