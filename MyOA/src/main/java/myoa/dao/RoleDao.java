package myoa.dao;

import java.util.List;

import myoa.entity.Role;



public interface RoleDao {
	List<RoleDao> getAll();
	void add(String name);
	void update(Role role);
	void delete(int id);
}
