package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Activity;
import myoa.entity.ActivityActor;

public interface ActivityActorBiz {
	void add(ActivityActor actor);
	void detele(int id);
	void update(ActivityActor actor);
	List<ActivityActor> getByActivityId(int id);
	List<ActivityActor> getByActorId(int id);
	ActivityActor fetchById(int id);
	void addActorIdList(Activity activity,int[] aid);
	List<ActivityActor> getActorNameInfoId(int id,String name);
}
