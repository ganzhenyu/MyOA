package myoa.biz;

import java.util.List;

import myoa.entity.RoleFunction;

public interface RoleFunctionBiz {
	List<RoleFunction> FechID(int id);
	void update(int roleId,int functinId);
	void cancel(int id);
}
