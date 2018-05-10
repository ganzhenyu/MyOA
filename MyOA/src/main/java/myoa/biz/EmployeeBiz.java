package myoa.biz;

import java.util.List;

import myoa.entity.Employee;

public interface EmployeeBiz {
	List<Employee> getAll();
	List<Employee> getByDid(int did);
	Employee checkUserLogin(String nr,String password);
	Employee fetchById(int id);
	List<Employee> getByDidName(int did,String name);
	List<Employee> fetchByDidName(int did,String name);
	List<Employee> fetchEmployees(String nr,String name,int did,int gender);
	List<Employee> getAllNotMy(Employee employee);
	List<Employee> getByNameNotMy(Employee employee,String name);


	Employee findByName(String name);
	

	void add(Employee employee);
	void update(Employee employee);

}
