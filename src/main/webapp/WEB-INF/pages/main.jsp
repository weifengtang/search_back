<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

.tree-closed {
	height: 40px;
}

.tree-expanded {
	height: auto;
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

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-3"
	data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/main.jsp">
	<%@include file="/WEB-INF/pages/common/top.jsp"%>
	<div class="container-fluid" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc1-3"
		data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/main.jsp">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<%@include file="/WEB-INF/pages/common/menu.jsp"%>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">控制面板</h1>
				<p style="font: 20px/1.5 '华文隶书';text-align: right" id="time"></p>
				<div style="font-size:32px;text-align: center;">
					<span></span>
				</div>
				<div
					style=" font: 40px/1.5 '华文隶书';margin-top:200px;text-align: center">
					欢迎
					<c:if test="${LoginUser.group==1}">超级管理员&nbsp;</c:if>
					<c:if test="${LoginUser.group==0}">会员&nbsp;</c:if>
					<font style="color: red;"> ${LoginUser.name}&nbsp;</font>操作本系统，请选择左边菜单栏操作
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
				// jquery对象的回调方法中的this关键字为DOM对象
				// $(DOM) ==> JQuery
				if ($(this).find("ul")) { // 3 li
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
		});
		var myVar = setInterval(function() {
			myTimer()
		}, 1000);
		function myTimer() {
			var t2 = new Date().toLocaleString();
			$("#time").text("当前时间为：" + t2);
		}
	</script>
</body>
</html>
