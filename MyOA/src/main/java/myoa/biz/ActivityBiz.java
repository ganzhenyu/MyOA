package myoa.biz;

import java.util.List;

import myoa.entity.Activity;

public interface ActivityBiz {
	void add(Activity activity);
	void detele(int id);
	void update(Activity activity);
	List<Activity> getByEmployeeName(String ename);
	Activity fetchById(int id);
}
