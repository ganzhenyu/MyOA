package myoa.dao;

import myoa.entity.Announcement;

public interface AnnouncementDao {
	Announcement getByDid(int did);
}
