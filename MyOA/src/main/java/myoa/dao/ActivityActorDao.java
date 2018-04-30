package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.ActivityActor;

public interface ActivityActorDao {
	void add(ActivityActor actor);
	void detele(int id);
	void update(ActivityActor actor);
	List<ActivityActor> getByActivityId(int id);
	List<ActivityActor> getByActorId(int id);
	ActivityActor fetchById(int id);
	List<ActivityActor> getActorNameInfoId(@Param("id")int id,@Param("name")String name);
}
