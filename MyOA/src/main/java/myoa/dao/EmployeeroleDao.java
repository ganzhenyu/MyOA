package myoa.dao;

import java.util.List;

import myoa.entity.EmployeeRole;

public interface EmployeeroleDao {
	List<EmployeeRole> getRoleId(int id);
	void add(EmployeeRole er);
}
