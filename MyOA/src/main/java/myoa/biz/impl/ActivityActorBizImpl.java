package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.ActivityActorBiz;
import myoa.dao.ActivityActorDao;
import myoa.entity.Activity;
import myoa.entity.ActivityActor;
import myoa.entity.Employee;
@Service
public class ActivityActorBizImpl implements ActivityActorBiz{

	@Autowired
	private ActivityActorDao actorDao;
	
	@Override
	public List<ActivityActor> getByActivityId(int id) {
		return actorDao.getByActivityId(id);
	}

	@Override
	public void add(ActivityActor actor) {
		actorDao.add(actor);
		
	}

	@Override
	public void detele(int id) {
		actorDao.detele(id);	
	}

	@Override
	public void update(ActivityActor actor) {
		actorDao.update(actor);
		
	}

	@Override
	public ActivityActor fetchById(int id) {
		return actorDao.fetchById(id);
	}

	@Override
	public List<ActivityActor> getByActorId(int id) {
		return actorDao.getByActorId(id);
	}

	@Override
	public void addActorIdList(Activity activity, int[] aid) {
		if(aid!=null && aid.length!=0) {
			for(int s:aid) {
				Employee e=new Employee();
				e.setId(s);
				ActivityActor addActor=new ActivityActor(0, activity,e );
				actorDao.add(addActor);
			}
		}
	}

	@Override
	public List<ActivityActor> getActorNameInfoId(int id, String name) {
		return actorDao.getActorNameInfoId(id, name);
	}
	
}
