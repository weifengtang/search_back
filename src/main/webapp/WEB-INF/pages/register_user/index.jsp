<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: black;
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

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-10"
	data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/register_user/index.jsp">
	<%@include file="/WEB-INF/pages/common/top.jsp"%>
	<div class="container-fluid" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc1-10"
		data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/register_user/index.jsp">
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
							<i class="glyphicon glyphicon-th"></i>注册用户信息
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float:left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" id="queryText"
										type="text" placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" class="btn btn-warning"
								onclick="queryPageButton()">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float:right;margin-left:10px;" onclick="deleteUsers()">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary" style="float:right;"
							onclick="window.location.href='${PATH}/user/addUser.action'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear:both;">
						<div  class="table-responsive">
							<form id="userform">
								<table class="table  table-bordered">
									<thead>
										<tr>
											<th width="30">#</th>
											<th width="30"><input type="checkbox" id="allCheckBox"></th>
											<th>用户名称</th>
											<th>账户</th>
											<th>账户密码</th>
											<th>邮箱地址</th>
											<th width="100">操作</th>
										</tr>
									</thead>
									<tbody id="tableData">

									</tbody>
									<tfoot>
										<tr>
											<td colspan="7" align="center">
												<ul class="pagination">

												</ul>
											</td>

										</tr>

									</tfoot>
								</table>
							</form>
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
		var likeFlag = false; //模糊查询标志
	
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
	
			//全选框
			$("#allCheckBox").click(function() {
				var flag = this.checked;
				$("#tableData :checkbox").each(function() {
					this.checked = flag;
				});
			});
	
	
		});
		$("tbody .btn-success").click(function() {
			window.location.href = "assignRole.jsp";
		});
		$("tbody .btn-primary").click(function() {
			window.location.href = "edit.jsp";
		});
	
		//批量删除用户
		function deleteUsers() {
			var i = 0;
			$("#tableData :checkbox").each(function() {
				if (this.checked) {
					i++;
				}
			});
			if (i < 1) {
				layer.msg("请选择要删除的用户", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {});
			} else {
				layer.confirm("确定删除选中的用户信息，是否继续？", {
					icon : 3,
					title : '警告'
				}, function(cindex) {
					$.ajax({
						type : "POST",
						url : "${PATH}/user/deleteUsers.action",
						data : $("#userform").serialize(),
						success : function(result) {
							if (result.success) {
								layer.msg("删除用户成功！", {
									time : 1000,
									icon : 5,
									shift : 6
								}, function() {
									pageQuery(1);
								});
							} else {
								layer.msg("删除用户失败！", {
									time : 1000,
									icon : 6,
									shift : 6
								}, function() {});
							}
						}
					});
				}, function(cindex) {});
			}
	
		}
	
	
	
		//分配角色页面
		function goAssignPage(id) {
			layer.msg("开发中........", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
		}
		//编辑用户信息
		function goUpdatePage(id) {
			window.location.href = "${PATH}/register_user/goEdit.action?id="+id;
		}
		//删除用户信息
		function deleteUser(id, name) {
			layer.confirm("确定删除【" + name + "】用户信息，是否继续？", {
				icon : 3,
				title : '警告'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${PATH}/user/deleteUser.action",
					data : {
						"id" : id
					},
					success : function(result) {
						if (result.success) {
							layer.msg("删除用户成功！", {
								time : 1000,
								icon : 5,
								shift : 6
							}, function() {
								pageQuery(1);
							});
						} else {
							layer.msg("删除用户失败！", {
								time : 1000,
								icon : 6,
								shift : 6
							}, function() {});
						}
					}
				});
			}, function(cindex) {});
	
	
		}
		//模糊查询
		function queryPageButton() {
			var queryText = $("#queryText").val();
			if (queryText != "") {
				likeFlag = true;
				pageQuery(1);
			} else {
				layer.msg("请输入查询条件！", {
					time : 1000,
					icon : 6,
					shift : 6
				}, function() {
					pageQuery(1);
				});
			}
	
		}
	
		//异步 分页查询
		function pageQuery(pageno) {
			var queryText = $("#queryText").val();
			var loadingIndex = null;
			var JsonData = {
				"pageno" : pageno,
				"pagesize" : 5
			};
			if (likeFlag) { //有查询条件
				JsonData.queryText = queryText;
			}
			$.ajax({
				type : "post",
				url : "${PATH}/register_user/pageRegisterUserQuery.action",
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
						var tableContent = "";
						var pageContent = "";
						//从返回结果中，取到pageBean
						var userPage = result.data;
						var users = userPage.datas;
						$.each(users, function(i, user) {
							tableContent += '<tr>';
							tableContent += '  <td>' + (i + 1) + '</td>';
							tableContent += '  <td><input type="checkbox" name="userid" id="userid" value="' + user.id + '"></td>';
	
							if (user.id ==${LoginUser.id}) {							
								tableContent += '	 <td style="color:red" >' + user.name + '</td>';
								tableContent += '  <td style="color:red" >' + user.userName + '</td>';
								tableContent += '  <td style="color:red" >' + user.passWord + '</td>';
								tableContent += '  <td style="color:red" >' + user.email + '</td>';
							} else {
								tableContent += '	 <td>' + user.name + '</td>';
								tableContent += '  <td>' + user.userName + '</td>';
								tableContent += '  <td>' + user.passWord + '</td>';
								tableContent += '  <td>' + user.email + '</td>';
							}
							tableContent += '  <td>';
							tableContent += ' <button type="button" onclick="goAssignPage(' + user.id + ')" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
							tableContent += ' <button type="button" onclick="goUpdatePage(' + user.id + ')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
							tableContent += '<button  type="button" onclick="deleteUser(' + user.id + ',\'' + user.name + '\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
							tableContent += '  </td>';
							tableContent += '</tr>';
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
	
						$("#tableData").html(tableContent);
						$(".pagination").html(pageContent);
					} else {
						layer.msg("用户信息分页查询失败", {
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
