package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Employee;

public interface EmployeeDao {
	List<Employee> getByDid(@Param("did")int did);
	List<Employee> getByDidName(@Param("did")int did,@Param("name")String name);
	Employee checkUserLogin(@Param("nr")String nr,@Param("password")String password);
}
