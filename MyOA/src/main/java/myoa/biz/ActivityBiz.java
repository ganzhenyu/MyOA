package myoa.biz;

import java.util.List;

import myoa.entity.Activity;

public interface ActivityBiz {
	void add(Activity activity);
	void detele(int id);
	void update(Activity activity);
	List<Activity> getByEmployeeName(String ename);
	List<Activity> getByEmployeeId(int id);
	Activity fetchById(int id);
	List<Activity> getToday(int num,int id);
	List<Activity> getFutureEndTime(int num,int id);
}
