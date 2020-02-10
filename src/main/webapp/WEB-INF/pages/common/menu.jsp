<%@page pageEncoding="UTF-8"%>

<ul style="padding-left:0px;" class="list-group" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-0" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/common/menu.jsp">
	<li class="list-group-item tree-closed" >
		<a href="${PATH}/user/main.action"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
	</li>
	<li class="list-group-item tree-closed">
		<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 调查课题管理 <span class="badge" style="float:right">2</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="${PATH}/topic/index.action"><i class="glyphicon glyphicon-user"></i>调查课题管理</a>
			</li>
			<li style="height:30px;">
				<a href="${PATH}/topic/goAddTopicPage.action"><i class="glyphicon glyphicon-plus"></i>添加新课题</a>
			</li>
		</ul>
	</li>
	<li class="list-group-item tree-closed">
		<span><i class="glyphicon glyphicon-ok"></i> 留言信息管理<span class="badge" style="float:right">1</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 留言信息管理</a>
			</li>
		</ul>
	</li>
	<li class="list-group-item tree-closed">
		<span><i class="glyphicon glyphicon-user"></i> 注册用户管理 <span class="badge" style="float:right">1</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="${PATH}/register_user/index.action"><i class="glyphicon glyphicon-user"></i> 注册用户管理</a>
			</li>

		</ul>
	</li>
	<li class="list-group-item tree-expanded" >
		<span><i class="glyphicon glyphicon-search"></i> 调查记录查询 <span class="badge" style="float:right">1</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="${PATH}/register_user/index.action" ><i class="glyphicon glyphicon-search"></i> 调查记录查询</a>
			</li>
		</ul>
	</li>
	<li class="list-group-item tree-expanded" >
		<span><i class="glyphicon glyphicon-th-large"></i> 个人信息管理 <span class="badge" style="float:right">1</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="${PATH}/register_user/goEdit.action?id=${LoginUser.id}" ><i class="glyphicon glyphicon-pencil"></i> 修改个人资料</a>
			</li>
		<!-- 	<li style="height:30px;">
				<a href=""><i class="glyphicon glyphicon-picture"></i> 修改个人密码</a>
			</li> -->
		</ul>
	</li>
	<li class="list-group-item tree-expanded" >
		<span><i class="glyphicon glyphicon-off"></i> 退出登录 <span class="badge" style="float:right">1</span></span>
		<ul style="margin-top:10px;display:none;">
			<li style="height:30px;">
				<a href="${PATH}/user/logout.action"><i class="glyphicon glyphicon-off"></i> 退出登录</a>
			</li>
		</ul>
	</li>
</ul>