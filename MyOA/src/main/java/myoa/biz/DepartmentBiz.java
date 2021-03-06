package myoa.biz;

import java.util.List;

import myoa.entity.Department;

public interface DepartmentBiz {
	List<Department> getAll(int status);
	
	void delete(int id);
	void update(Department department);
	void add(Department department);
	Department fetchById(int id);
	int checkIsUsing(int id);
	int checkNameIsUsing(String name);
	List<Department> getFullAll();
	List<Department> getFullAllByEname(String ename);
}
