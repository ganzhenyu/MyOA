package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.RoleFunction;

public interface RoleFunctionDao {
	List<RoleFunction> FechID(int id);
	void add(RoleFunction roleFunction);
	void cancel(int roleId);
}
