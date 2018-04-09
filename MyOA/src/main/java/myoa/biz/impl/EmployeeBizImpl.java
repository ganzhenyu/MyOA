package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.dao.EmployeeDao;
import myoa.entity.Employee;
@Service
public class EmployeeBizImpl implements EmployeeBiz{

	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public List<Employee> getByDid(int did) {
		return employeeDao.getByDid(did);
	}

}
