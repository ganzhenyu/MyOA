package myoa.biz;

import java.util.List;

import myoa.entity.Employee;

public interface EmployeeBiz {
	List<Employee> getByDid(int did);
	Employee checkUserLogin(String nr,String password);

	List<Employee> getByDidName(int did,String name);
	List<Employee> getAllNotMy(Employee employee);
	List<Employee> getByNameNotMy(Employee employee,String name);

	Employee findByName(String name);
	
}
