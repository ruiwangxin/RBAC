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
<%--				<ul style="padding-left:0px;" class="list-group">--%>
<%--					<li class="list-group-item tree-closed" >--%>
<%--						<a href="/main"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>--%>
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
<%--								<a href="/permission/index"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>--%>
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
		<%@include file="/jsp/common/menu1.jsp"%>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
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
		    		async: {
		    			enable: true,
		    			url:"${APP_PATH}/permission/loadData",
		    			autoParam:["id", "name=n", "level=lv"]
		    		},
					view: {
						selectedMulti: false,           //是否支持多选
						//addDiyDom：在节点上固定显示用户自定义控件（自己做一些时间）
						//treeid：对应ztreeid,便于用户操控
						//treeNode：自定义控件节点的JSON数据,tId唯一标识（初始化节点数据时，由ztree添加此属性）
						addDiyDom: function(treeId, treeNode){     //取到图标的元素，改变菜单的图标
							var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
							if ( treeNode.icon ) {
								//把数据库中的样式添加到结构当中
								icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
							}
                            
						},
						//addHoverDom：当鼠标移动到节点上时显示用户自定义控件,显示隐藏状态网zTree内部的编辑
						addHoverDom: function(treeId, treeNode){  
                        //   <a><span></span></a>
							var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
							aObj.attr("href", "javascript:;");
							if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
							var s = '<span id="btnGroup'+treeNode.tId+'">';
							//level:记录了节点的层级
							if ( treeNode.level == 0 ) {
								s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
							} else if ( treeNode.level == 1 ) {
								s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
								if (treeNode.children.length == 0) {
									s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
								}
								s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
							} else if ( treeNode.level == 2 ) {
								s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
								s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
							}
			
							s += '</span>';
							aObj.after(s);     //表示拼接到(var aObj = $("#" + treeNode.tId + "_a"); )的后面
						},
						//removeHoverDom：鼠标移出时隐藏显示
						removeHoverDom: function(treeId, treeNode){
							$("#btnGroup"+treeNode.tId).remove();
						}
					}
			    };
			    /*
				var zNodes =[
					{ name:"父节点1 - 展开11111", open:true,
						children: [
							{ name:"父节点11 - 折叠",
								children: [
									{ name:"叶子节点111"},
									{ name:"叶子节点112"},
									{ name:"叶子节点113"},
									{ name:"叶子节点114"}
								]},
							{ name:"父节点12 - 折叠",
								children: [
									{ name:"叶子节点121"},
									{ name:"叶子节点122"},
									{ name:"叶子节点123"},
									{ name:"叶子节点124"}
								]},
							{ name:"父节点13 - 没有子节点", isParent:true}
						]},
					{ name:"父节点2 - 折叠",
						children: [
							{ name:"父节点21 - 展开", open:true,
								children: [
									{ name:"叶子节点211"},
									{ name:"叶子节点212"},
									{ name:"叶子节点213"},
									{ name:"叶子节点214"}
								]},
							{ name:"父节点22 - 折叠",
								children: [
									{ name:"叶子节点221"},
									{ name:"叶子节点222"},
									{ name:"叶子节点223"},
									{ name:"叶子节点224"}
								]},
							{ name:"父节点23 - 折叠",
								children: [
									{ name:"叶子节点231"},
									{ name:"叶子节点232"},
									{ name:"叶子节点233"},
									{ name:"叶子节点234"}
								]}
						]},
					{ name:"父节点3 - 没有子节点", isParent:true}

				];
			    */
			    // 异步获取树形结构数据
			    $.fn.zTree.init($("#permissionTree"), setting);
            });
            
            function addNode(id) {
            	window.location.href = "${APP_PATH}/permission/add?id="+id;
            }
            
            function editNode(id) {
            	window.location.href = "${APP_PATH}/permission/edit?id="+id;
            }
            
            function deleteNode(id) {
    			layer.confirm("删除许可信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
    				// 删除选择的用户信息
    				$.ajax({
    					type : "POST",
    					url  : "${APP_PATH}/permission/delete",
    					data : {
    						id : id
    					},
    					success : function(result) {
    						if ( result.success ) {
    							// 刷新数据
    							var treeObj = $.fn.zTree.getZTreeObj("permissionTree");  //获取树形对象
    							/*
    								强行异步加载父节点的子节点数据
    								参数：
    								第一个参数：parentNode(JSON)：父节点的对象（JSON） 如果等于null相当于从根节点ROOT进行异步加载（全部重新加载）
    								第二个参数reloadType(String)：
    											reloadType="refresh" 表示清空后重新加载（以前的去掉新的加载出来）
    											reloadType!="refresh" 表示追加子节点处理
    								第三个参数is Silent（Boolean）：设置异步加载后是否自动加载节点
    							 */
    							treeObj.reAsyncChildNodes(null, "refresh");
    						} else {
                                layer.msg("许可信息删除失败", {time:2000, icon:5, shift:6}, function(){
                                	
                                });
    						}
    					}
    				});
    				
    				layer.close(cindex);
    			}, function(cindex){
    			    layer.close(cindex);
    			});
            }
        </script>
  </body>
</html>
