package myoa.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.entity.Announcement;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class AnnouncementDaoTest {

	@Autowired
	private AnnouncementDao target; 
	
	@Test
	public void testFetchById() {
		Announcement a=target.fetchById(3);
		System.out.println(a.getId());
		System.out.println(a.getTitle());
		System.out.println(a.getContent());
	}

}
