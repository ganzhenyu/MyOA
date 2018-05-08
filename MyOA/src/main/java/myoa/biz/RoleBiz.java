package myoa.biz;

import java.util.List;



import myoa.dao.RoleDao;
import myoa.entity.Role;

public interface RoleBiz {
	List<RoleDao> getAll();
	void add(String name);
	void delete(int id);
	void update(Role role);
}
