package com.atcrowdfunding.dao;

import java.util.List;
import java.util.Map;

import com.atcrowdfunding.bean.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;



public interface RoleDao {

	List<Role> pageQueryData(Map<String, Object> map);

	int pageQueryCount(Map<String, Object> map);

	@Select("select * from t_role")
	List<Role> queryAll();

	void insertRolePermission(Map<String, Object> paramMap);

	void deleteRolePermissions(Map<String, Object> paramMap);

	//删除一个
	@Delete("delete from t_role where id = #{id}")
	void deleteRoleById(Integer id);

}
