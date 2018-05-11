package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.DepartmentBiz;
import myoa.dao.DepartmentDao;
import myoa.entity.Department;

@Service
public class DepartmentBizImpl implements DepartmentBiz {

	@Autowired
	private DepartmentDao departmentDao;
	
	
	@Override
	public List<Department> getAll(int status) {
		return departmentDao.getAll(status);
	}

	@Override
	public void delete(int id) {
		departmentDao.delete(id);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public Department fetchById(int id) {
		return departmentDao.fetchById(id);
	}

	@Override
	public void add(Department department) {
		departmentDao.add(department);
	}

	@Override
	public int checkIsUsing(int id) {
		return departmentDao.checkIsUsing(id);
	}

	@Override
	public int checkNameIsUsing(String name) {
		return departmentDao.checkNameIsUsing(name);
	}

	@Override
	public List<Department> getFullAll() {
		return departmentDao.getFullAll();
	}

	@Override
	public List<Department> getFullAllByEname(String ename) {
		return departmentDao.getFullAllByEname(ename);
	}

}
