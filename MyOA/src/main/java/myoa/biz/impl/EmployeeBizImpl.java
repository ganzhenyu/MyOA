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

	@Override
	public Employee checkUserLogin(String nr, String password) {
		return employeeDao.checkUserLogin(nr, password);
	}

	@Override
	public List<Employee> getByDidName(int did, String name) {
		return employeeDao.getByDidName(did, name);
	}

	@Override
	public List<Employee> getAllNotMy(Employee employee) {
		List<Employee> list= employeeDao.getByDid(0);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getId()==employee.getId()) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}

	@Override
	public List<Employee> getByNameNotMy(Employee employee, String name) {
		List<Employee> list= employeeDao.getByDidName(0, name);
		if(list!=null) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getId()==employee.getId()) {
					list.remove(i);
					i--;
				}
			}
		}
		return list;
	}

	@Override
	public List<Employee> getAll() {
		return employeeDao.getAll();
	}

	@Override
	public Employee fetchById(int id) {
		return employeeDao.fetchById(id);
	}

	@Override
	public List<Employee> fetchByDidName(int did, String name) {
		return employeeDao.fetchByDidName(did, name);
	}

	@Override
	public List<Employee> fetchEmployees(String nr, String name, int did, int gender) {
		return employeeDao.fetchEmployees(nr, name, did, gender);
	}

	@Override
	public void add(Employee employee) {
		employeeDao.add(employee);
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
	}

}
