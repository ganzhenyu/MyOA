package myoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Announcement;

public interface AnnouncementDao {
	List<Announcement> getPaging(@Param("title")String title,@Param("status")int status,@Param("startIndex")int startIndex,@Param("maxRows")int maxRows);
	List<Announcement> getAnnouncementNew(@Param("num")int num,@Param("status")int status,@Param("startDate")Date startDate,@Param("endDate")Date endDate);
	int fetchRows(@Param("title")String title,@Param("status")int status);
	void add(Announcement announcement);
	void delete(int id);
	void update(Announcement announcement);
	Announcement fetchById(int id);
	List<Announcement> getByStatus(@Param("num")int num,@Param("status")int status,@Param("creatorId")int creatorId);
}
