package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.AnnouncementBiz;
import myoa.dao.AnnouncementDao;
import myoa.entity.Announcement;
@Service
public class AnnouncementBizImpl implements AnnouncementBiz{

	@Autowired
	private AnnouncementDao announcementDao;
	
	@Override
	public void add(Announcement announcement) {
		announcementDao.add(announcement);
	}

	@Override
	public void delete(int id) {
		announcementDao.delete(id);
		
	}

	@Override
	public void update(Announcement announcement) {
		announcementDao.update(announcement);
		
	}

	@Override
	public Announcement fetchById(int id) {
		return announcementDao.fetchById(id);
	}

	@Override
	public List<Announcement> getByStatus(int num, int status,int creatorId) {
		return announcementDao.getByStatus(num, status,creatorId);
	}

}
