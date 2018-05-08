package myoa.dao;

import java.util.List;

import myoa.entity.Activity;

public interface ActivityDao {
	void add(Activity activity);
	void detele(int id);
	void update(Activity activity);
	List<Activity> getByEmployeeName(String ename);
	List<Activity> getByEmployeeId(int id);
	Activity fetchById(int id);
}
