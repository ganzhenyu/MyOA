package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import myoa.entity.Employee;

public interface EmployeeDao {

	List<Employee> getAll();
	List<Employee> getByDid(int did);

	List<Employee> getByDidName(@Param("did")int did,@Param("name")String name);
	List<Employee> fetchByDidName(@Param("did")int did,@Param("name")String name);
	Employee checkUserLogin(@Param("nr")String nr,@Param("password")String password);


	@Select("SELECT * FROM Employee WHERE name=#{name}")
	Employee findByName(String name);

	Employee fetchById(int id);
	List<Employee> fetchEmployees(@Param("nr")String nr,@Param("name")String name,@Param("did")int did,@Param("gender")int gender);
	int add(Employee employee);
	void update(Employee employee);

}
