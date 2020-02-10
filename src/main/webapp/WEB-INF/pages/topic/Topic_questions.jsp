<%@page pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${PATH}/css/main.css">
<style>
.table {
	background: #ededed;
}

.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #ededed;
}

table tbody td:nth-child(even) {
	/*	color: #2031cc;*/
	
}

#question {
	font-size: 20px;
	text-align: left;
	color: green;
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

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11"
	data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/Topic_questions.jsp">

	<%@include file="/WEB-INF/pages/common/top.jsp"%>

	<div class="container-fluid" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc1-11"
		data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/topic/Topic_questions.jsp">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<%@include file="/WEB-INF/pages/common/menu.jsp"%>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 style="text-align: center" class="panel-title">
							<i class="glyphicon glyphicon-th"></i>课题详情页
						</h3>
						
					</div>
				</div>
				<div id="question">
					<form id="tableData">
						<p>
							测试：第一题：你喜欢农大嘛？(单选题)</br> </br> <input type="radio" name="question1"
								value="like">&nbsp;&nbsp;A:喜欢</br> <input type="radio"
								name="question1" value="disLike">&nbsp;&nbsp;B:不喜欢</br> </br>
						</p>
						<p>
							测试：第二题：你认为校园安全重要嘛？(单选题)</br> </br> <input type="radio" name="question2"
								value="like">&nbsp;&nbsp;A:非常重要</br> <input type="radio"
								name="question2" value="disLike">&nbsp;&nbsp;B:重要</br> <input
								type="radio" name="question2" value="disLike">&nbsp;&nbsp;C:一般</br>
							<input type="radio" name="question2" value="disLike">&nbsp;&nbsp;D:不重要</br>
							</br>
						</p>
						<p>
							测试：第三题：你对校园安全有什么建议？(可以不填)</br> </br>
							<textarea name="text" cols="50" row="100"></textarea>
							</br>
						</p>

						<div>
							<input type="button" value="提交">

						</div>
					</form>
				</div>


			</div>

		</div>
	</div>
	<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${PATH}/script/docs.min.js"></script>
	<script src="${PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		var likeFlag = false;
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
			
			pageQuery();
			
			
		});
		//回到topic主页
		function index(){
			window.location.href="${PATH}/topic/index.action";
		}
		
		//提交
		function updateButton(){
			layer.msg("提交成功！", {time : 1000,icon : 6,shift : 6}, function() {index();});
		}	
		//增加问题
		function addButton(id){
			//alert("增加问题");
			window.location.href="${PATH}/question/goAddquestionPage.action?id="+${param.id};
		}
		
		

		
		//分页查询
		function pageQuery() {

			var loadingIndex = null;
			var JsonData = {
				"topic_id":${param.id}
			};
			$.ajax({
				type : "post",
				url : "${PATH}/topic/pageTopic_questionsQuery.action",
				data : JsonData,
				beforeSend : function() {
					loadingIndex = layer.msg('正在加载....', {
						icon : 16
					});
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						//局部刷新数据
						var tableContent ="";
						//从返回结果中，取到pageBean
						var pageBean = result.data;
						var questions = pageBean.datas;
						$.each(questions, function(i, question) {
							if(question.type!="简答题"){
								tableContent+='<p>第'+question.number+'题:'+question.title+'('+question.type+')</p>';
							$.each(question.options, function(j,option) {
								tableContent+='<input type="radio" name="question'+option.question_id+'"  value="select'+option.id+'">&nbsp;&nbsp;'+option.number+':'+option.title+'</br></br>';
							});
							
							}else {
								tableContent+='<p>第'+question.number+'题:'+question.title+'('+question.type+')(可以不填)</br>';
								tableContent+='<textarea  name="text" cols="50" row="100" ></textarea></p></br>';

							}
						});
						tableContent+='<button type="button" class="btn btn-success" onclick="index()">';
						tableContent+='	<i class="glyphicon glyphicon-arrow-left"></i> 返回</button>&nbsp;&nbsp;';
						tableContent+='<button type="button" class="btn btn-success" onclick="updateButton()">';
						tableContent+='	<i class="glyphicon glyphicon-ok"></i>提交</button>&nbsp;&nbsp;&nbsp;';
						tableContent+='<button type="button" class="btn btn-success" onclick="addButton()">';
						tableContent+='	<i class="glyphicon glyphicon-plus"></i>增加新问题</button>&nbsp;&nbsp;';
						
						$("#tableData").html(tableContent);
					} else {
						layer.msg("信息查询失败", {
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
