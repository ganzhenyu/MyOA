package myoa.biz;

import java.util.List;

import myoa.entity.EmployeeRole;

public interface EmployeeRoleBiz {
	List<EmployeeRole> getRoleId(int id);
	void add(EmployeeRole er);
	void delete(int id);
}
