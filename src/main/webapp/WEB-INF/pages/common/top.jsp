<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-1" data-genuitec-path="/s_back/src/main/webapp/WEB-INF/pages/common/top.jsp">
    <div class="container-fluid">
        <div class="navbar-header">
            <div>
                <a class="navbar-brand" style="font-size:32px;" href="#">问卷调研管理系统</a>
            </div>
                  
        </div>
       
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button"
                                class="btn btn-default btn-success dropdown-toggle"
                                data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>
                             ${LoginUser.name}
                             <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${PATH}/register_user/goEdit.action?id=${LoginUser.id}">
                            <i class="glyphicon glyphicon-cog"></i>
                                个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i>
                                消息</a></li>
                            <li class="divider"></li>
                            <li><a href="${PATH}/user/logout.action"><i
                                    class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <%--<form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>--%>
        </div>
    </div>
</nav>