package com.atcrowdfunding.service;

import java.util.List;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.bean.User;


public interface PermissionService {

	//查找根节点
	Permission queryRootPermission();

	//查找子节点
	List<Permission> queryChildPermissions(Integer pid);

	List<Permission> queryAll();

	void insertPermission(Permission permission);

	Permission queryById(Integer id);

	void updatePermission(Permission permission);

	void deletePermission(Permission permission);

	List<Integer> queryPermissionidsByRoleid(Integer roleid);

	List<Permission> queryPermissionsByUser(User dbUser);

}
