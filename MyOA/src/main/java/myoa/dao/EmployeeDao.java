package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Employee;

public interface EmployeeDao {
	List<Employee> getByDid(int did);
	
	Employee checkUserLogin(@Param("nr")String nr,@Param("password")String password);
}
