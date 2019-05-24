package com.atcrowdfunding.dao;

import java.util.List;

import com.atcrowdfunding.bean.Permission;
import com.atcrowdfunding.bean.User;
import org.apache.ibatis.annotations.Select;


public interface PermissionDao {

	@Select("select * from t_permission where pid is null")
	Permission queryRootPermission();

	//如果顶级（父）节点为0,就不需要pid is null上面的这条语句,可以进行递归算法调用
	@Select("select * from t_permission where pid = #{pid}")
	List<Permission> queryChildPermissions(Integer pid);

	@Select("select * from t_permission")
	List<Permission> queryAll();

	void insertPermission(Permission permission);

	@Select("select * from t_permission where id = #{id}")
	Permission queryById(Integer id);

	void updatePermission(Permission permission);

	void deletePermission(Permission permission);

	@Select("select permissionid from t_role_permission where roleid = #{roleid}")
	List<Integer> queryPermissionidsByRoleid(Integer roleid);

	List<Permission> queryPermissionsByUser(User dbUser);

}
