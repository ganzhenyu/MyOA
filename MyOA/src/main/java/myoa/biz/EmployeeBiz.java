package myoa.biz;

import java.util.List;

import myoa.entity.Employee;

public interface EmployeeBiz {
	List<Employee> getByDid(int did);
	Employee checkUserLogin(String nr,String password);
}
