package myoa.biz.impl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.RoleBiz;
import myoa.dao.RoleDao;
import myoa.entity.Role;
@Service
public class RoleBizImpl implements RoleBiz{

	@Autowired 
	private RoleDao rd;
	
	@Override
	public List<RoleDao> getAll() {
		// TODO Auto-generated method stub
		return rd.getAll();
	}

	@Override
	public void add(String name) {
		// TODO Auto-generated method stub
		rd.add(name);
	}

	


	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		rd.delete(id);
	}



	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		rd.update(role);
	}
	
}
