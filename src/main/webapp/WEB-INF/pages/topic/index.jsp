<%@page pageEncoding="UTF-8"%>
<html >
<head>
<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${PATH}/css/main.css">
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

table tbody td:nth-child(even) {
/*	color: #2031cc;*/
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"2543",secure:"2205"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float:left;">
							<div class="form-group has-feedback">
								<div class="input-group">

									<div class="input-group-addon">课题</div>
									<input class="form-control has-success" type="text"
										placeholder="请输入查询条件" id="queryText">
								</div>
							</div>
							<button type="button" class="btn btn-warning"  onclick="queryButton()">
								<i class="glyphicon glyphicon-search"></i> 搜索
							</button>
						</form>
						<%--<button type="button" class="btn btn-danger"
							style="float:right;margin-left:10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary" style="float:right;"
							onclick="window.location.href='${PATH}/role/addRole.action'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>--%>
						<br>
						<hr style="clear:both;">
						<div  class="table-responsive">
							<table  class="table  table-bordered">
								<thead>
									<tr >
										<th width="30">#</th>
										<%--<th width="50"><input type="checkbox" id="allCheckBox"></th>--%>
										<th  >课题</th>
										<th width="100">调查时间</th>
										<th   width="100">是否使用</th>
										<th   width="100">添加时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="tableData">

								</tbody>
								<tfoot >
									<tr>
										<td colspan="6" align="center">
											<ul class="pagination">

											</ul>
										</td>
									</tr>

								</tfoot>
							</table>
						</div>
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
			pageQuery(1);
		/*	//全选框
			$("#allCheckBox").click(function() {
				var flag = this.checked;
				$("#tableData :checkbox").each(function() {
					this.checked = flag;
				});
			});*/
			
		});

		//到课题问卷：题目详情页
		function  goTopic_questionPage(topic_id) {
			window.location.href="${PATH}/topic/goTopic_questionPage.action?id="+topic_id;//课题id
		}
		
		//到课题问卷详情页
		function  goTopicPage(topic_id) {
			window.location.href="${PATH}/topic/goTopicPage.action?topic_id="+topic_id;//课题id
		}
	
		//修改课题问卷页面
		function goUpdatePage(topic_id){
			window.location.href="${PATH}/topic/goUpdatePage.action?topic_id="+topic_id;
		}
		//调查数据统计卷页面
		function goQueryResult(topic_id){
			window.location.href="${PATH}/topic/goQueryResult.action?topic_id="+topic_id;
		}
		//停止功能
		function goStop(topic_id){
			layer.msg("停止功能开发中...............", {time : 2000,icon : 5,shift : 6}, function() {});
		}

		//删除角色
		function deleteButton(id,title){
			layer.confirm("确定要删除["+title+"]这个课题嘛！！",  {icon: 3, title:'提示'}, function(cindex){
			  $.ajax({
			  	type:"POST",
			  	url:"${PATH}/topic/deleteTopic.action",
			  	data:{"topic_id":id},
			  	success:function(result){
			  		if(result.success){
			  			layer.msg("删除课题成功！", {time : 1000,icon : 6,shift : 6}, function() {pageQuery(1);});
			  			
			  		}else{
			  			layer.msg("删除课题失败！", {time : 1000,icon : 5,shift : 6}, function() {});
			  		}
			  	}
			  
			  });
			}, function(cindex){});
		}
		
		
		//模糊查询
		function queryButton(){
			var queryText = $("#queryText").val();
			if(queryText!=""){
				likeFlag=true;
				pageQuery(1);
			}else{
				layer.msg("请输入查询条件！", {time : 2000,icon : 6,shift : 6}, function() {pageQuery(1);
				});
			}

		}
		
		//分页查询
		function pageQuery(pageno) {

			var loadingIndex = null;
			var JsonData = {
				"pageno" : pageno,
				"pagesize" :5
			};
			if (likeFlag) { //有查询条件
				JsonData.queryText = $("#queryText").val();
			}
			$.ajax({
				type : "post",
				url : "${PATH}/topic/pageTopicQuery.action",
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
						var pageContent ="";
						//从返回结果中，取到pageBean
						var userPage = result.data;
						var topics = userPage.datas;
						$.each(topics, function(i, topic) {
							tableContent+='<tr>';
							tableContent+='<td>'+(i+1)+'</td>';
						/*	tableContent+='<td><input type="checkbox"></td>';*/
							tableContent+='<td>'+topic.title+'</td>';

							tableContent+='	<td>'+topic.active_time+'分钟</td>';


							if(topic.delete_token==0){
								tableContent+='<td>是</td>';
							}else{
								tableContent+='<td>否</td>';
							}
							tableContent+='	<td>'+topic.create_time+'</td>';
							tableContent+='<td>';
							tableContent+='	<button type="button" onclick="goTopicPage('+topic.id+')" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-eye-open"></i></button>';
							tableContent+='<button type="button" onclick="goUpdatePage('+topic.id+')"   class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
							tableContent+='<button type="button"  onclick="deleteButton('+topic.id+',\''+topic.title+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
							tableContent+='<a href="#" onclick="goStop('+topic.id+')">停用</a>';
							tableContent+='	<a href="#"  onclick="goTopic_questionPage('+topic.id+')">调查题目管理</a>';
							tableContent+='	<a href="#" onclick="goQueryResult('+topic.id+')">调查数据查询</a>';
							tableContent+='	</td>';
							tableContent+='	</tr>';

						});

						if (pageno > 1) {
							pageContent += '<li><a href="#" onclick="pageQuery(' + (pageno - 1) + ')">上一页</a></li>';
						}

						for (var i = 1; i <= userPage.pageCount; i++) {
							if (i == pageno) {
								pageContent += '<li class="active"><a  href="#">' + i + '</a></li>';
							} else {
								pageContent += '<li ><a href="#" onclick="pageQuery(' + i + ')">' + i + '</a></li>';
							}
						}

						if (pageno < userPage.pageCount) {
							pageContent += '<li><a href="#" onclick="pageQuery(' + (pageno + 1) + ')">下一页</a></li>';
						}
						pageContent += '<li><p >共有'+userPage.size+'条记录 </p></li>';
						$("#tableData").html(tableContent);
						$(".pagination").html(pageContent);
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
