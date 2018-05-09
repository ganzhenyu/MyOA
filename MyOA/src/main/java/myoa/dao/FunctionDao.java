package myoa.dao;

import java.util.List;

import myoa.entity.Function;

public interface FunctionDao {
	List<Function> getFunctionParent();
	List<Function> getFunctionZi();
}
