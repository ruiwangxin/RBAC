<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/main.css">
	<link rel="stylesheet" href="${APP_PATH}/jquery/ztree/zTreeStyle.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <%@include file="/jsp/common/head.jsp"%>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<%@include file="/jsp/common/menu1.jsp"%>
<%--				<ul style="padding-left:0px;" class="list-group">--%>
<%--					<li class="list-group-item tree-closed" >--%>
<%--						<a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> --%>
<%--					</li>--%>
<%--					<li class="list-group-item">--%>
<%--						<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span> --%>
<%--						<ul style="margin-top:10px;">--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="/user/index1" ><i class="glyphicon glyphicon-user"></i> 用户维护</a>--%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="/role/index" style="color:red;"><i class="glyphicon glyphicon-king"></i> 角色维护</a>--%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a> --%>
<%--							</li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					<li class="list-group-item tree-closed">--%>
<%--						<span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span> --%>
<%--						<ul style="margin-top:10px;display:none;">--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a> --%>
<%--							</li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					<li class="list-group-item tree-closed">--%>
<%--						<span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span> --%>
<%--						<ul style="margin-top:10px;display:none;">--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a> --%>
<%--							</li>--%>
<%--							<li style="height:30px;">--%>
<%--								<a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a> --%>
<%--							</li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					<li class="list-group-item tree-closed" >--%>
<%--						<a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a> --%>
<%--					</li>--%>
<%--				</ul>--%>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
			      <button class="btn btn-success" onclick="doAssign()">分配许可</button>
                  <ul id="permissionTree" class="ztree"></ul>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script src="${APP_PATH}/jquery/ztree/jquery.ztree.all-3.5.min.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    
			    var setting = {
			    	/*
			    		三种状态;
			    			完全选择
			    			未选择状态
			    			未完全选择状态（父节点里面的子节点有一些没被选中）
			    	 */
		    		check : {
		    		    enable : true //启用复选框
		    		},
		    		async: {
		    			enable: true,
		    			url:"${APP_PATH}/permission/loadAssignData?roleid=${param.id}",
		    			autoParam:["id", "name=n", "level=lv"]
		    		},
					view: {
						selectedMulti: false,
						addDiyDom: function(treeId, treeNode){
							var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
							if ( treeNode.icon ) {
								icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
							}
                            
						}
					}
			    };
			   
			    $.fn.zTree.init($("#permissionTree"), setting);
            });
            function doAssign() {
            	var treeObj = $.fn.zTree.getZTreeObj("permissionTree");  //读取当前树的对象
            	var nodes = treeObj.getCheckedNodes(true);	//获取被选中的节点
            	if ( nodes.length == 0 ) {		//没有选中
                    layer.msg("请选择需要分配的许可信息", {time:2000, icon:5, shift:6}, function(){
                    	
                    });
            	} else {
            		var d = "roleid=${param.id}";	//拿到对应角色id
            		$.each(nodes, function(i, node){
            			d += "&permissionids="+node.id	//拿到权限id
            		});
            		$.ajax({
            			type : "POST",
            			url  : "${APP_PATH}/role/doAssign",
            			data : d,
            			success : function (result) {
            				if ( result ) {
                                layer.msg("分配许可信息成功", {time:2000, icon:6}, function(){
                                	
                                });
            				} else {
                                layer.msg("分配许可信息失败", {time:2000, icon:5, shift:6}, function(){
                                	
                                });
            				}
            			}
            		});
            	}
            }
        </script>
  </body>
</html>
