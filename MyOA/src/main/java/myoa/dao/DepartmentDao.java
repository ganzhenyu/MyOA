package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Department;

public interface DepartmentDao {
	List<Department> getAll(@Param("status")int status);
	void delete(int id);
	void update(Department department);
	void add(Department department);
	Department fetchById(int id);
	int checkIsUsing(int id);
	int checkNameIsUsing(String name);
	List<Department> getFullAll();
	List<Department> getFullAllByEname(@Param("ename")String ename);
}
