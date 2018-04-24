package myoa.dao;

import java.util.List;

import myoa.entity.Department;

public interface DepartmentDao {
	List<Department> getAll();
	void delete(int id);
	void update(Department department);
	void add(Department department);
	Department fetchById(int id);
	int checkIsUsing(int id);
	int checkNameIsUsing(String name);
}
