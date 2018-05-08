package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Activity;

public interface ActivityDao {
	void add(Activity activity);
	void detele(int id);
	void update(Activity activity);
	List<Activity> getByEmployeeName(String ename);
	List<Activity> getByEmployeeId(int id);
	Activity fetchById(int id);
	List<Activity> getToday(@Param("num")int num,@Param("id")int id);
	List<Activity> getFutureEndTime(@Param("num")int num,@Param("id")int id);
}
