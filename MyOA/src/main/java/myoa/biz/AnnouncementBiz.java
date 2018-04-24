package myoa.biz;

import java.util.List;

import myoa.entity.Announcement;

public interface AnnouncementBiz {
	void add(Announcement announcement);
	void delete(int id);
	void update(Announcement announcement);
	Announcement fetchById(int id);
	List<Announcement> getByStatus(int num,int status,int creatorId);
}
