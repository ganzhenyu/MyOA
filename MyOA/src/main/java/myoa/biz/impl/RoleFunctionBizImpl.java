package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.RoleFunctionBiz;
import myoa.dao.RoleFunctionDao;
import myoa.entity.RoleFunction;
@Service
@Transactional
public class RoleFunctionBizImpl implements RoleFunctionBiz{
	@Autowired
	private RoleFunctionDao rd;
	
	@Override
	public List<RoleFunction> FechID(int id) {
		// TODO Auto-generated method stub
		return rd.FechID(id);
	}

	@Override
	public void update(int roleId, int functinId) {
		// TODO Auto-generated method stub
		RoleFunction ro=new RoleFunction(0, roleId, functinId);		
		rd.add(ro);
	}

	@Override
	public void cancel(int id) {
		// TODO Auto-generated method stub
		rd.cancel(id);
	}

}
