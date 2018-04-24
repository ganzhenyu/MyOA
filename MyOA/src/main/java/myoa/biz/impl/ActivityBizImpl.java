package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.ActivityBiz;
import myoa.dao.ActivityActorDao;
import myoa.dao.ActivityDao;
import myoa.entity.Activity;
import myoa.entity.ActivityActor;
@Service
public class ActivityBizImpl implements ActivityBiz{

	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private ActivityActorDao actorDao;
	
	@Override
	public List<Activity> getByEmployeeName(String ename) {
		return activityDao.getByEmployeeName(ename);
	}

	@Override
	public void add(Activity activity) {
		activityDao.add(activity);		
	}

	@Override
	public void detele(int id) {
		List<ActivityActor> list=actorDao.getByActivityId(id);
		for(ActivityActor a:list) {
			actorDao.detele(a.getId());
		}
		activityDao.detele(id);
	}

	@Override
	public void update(Activity activity) {
		activityDao.update(activity);
	}

	@Override
	public Activity fetchById(int id) {
		return activityDao.fetchById(id);
	}

}
