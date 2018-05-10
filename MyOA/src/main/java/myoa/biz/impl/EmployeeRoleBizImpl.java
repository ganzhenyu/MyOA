package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeRoleBiz;
import myoa.dao.EmployeeroleDao;
import myoa.entity.EmployeeRole;
@Service
public class EmployeeRoleBizImpl implements EmployeeRoleBiz{
	
	@Autowired
	private EmployeeroleDao ed;

	@Override
	public List<EmployeeRole> getRoleId(int id) {
		// TODO Auto-generated method stub
		return ed.getRoleId(id);
	}

}
