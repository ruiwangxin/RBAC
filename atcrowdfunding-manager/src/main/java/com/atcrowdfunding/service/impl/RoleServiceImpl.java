package com.atcrowdfunding.service.impl;

import java.util.List;
import java.util.Map;

import com.atcrowdfunding.bean.Role;
import com.atcrowdfunding.dao.RoleDao;
import com.atcrowdfunding.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;


	public List<Role> pageQueryData(Map<String, Object> map) {
		return roleDao.pageQueryData(map);
	}

	public int pageQueryCount(Map<String, Object> map) {
		return roleDao.pageQueryCount(map);
	}

	public List<Role> queryAll() {
		return roleDao.queryAll();
	}

	public void insertRolePermission(Map<String, Object> paramMap) {
		roleDao.deleteRolePermissions(paramMap);		//因为第二次添加时会添加到表后面会产生重复,先将以前的数据删除,新数据就不会有重复
		roleDao.insertRolePermission(paramMap);
	}

	@Override
	public void deleteRoleById(Integer id) {
		roleDao.deleteRoleById(id);
	}

}
