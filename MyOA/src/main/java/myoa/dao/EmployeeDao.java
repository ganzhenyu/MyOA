package myoa.dao;

import java.util.List;

import myoa.entity.Employee;

public interface EmployeeDao {
	List<Employee> getByDid(int did);
}
