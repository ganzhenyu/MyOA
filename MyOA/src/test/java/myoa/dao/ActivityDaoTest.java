package myoa.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.ActivityBiz;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class ActivityDaoTest {

	@Autowired
	private ActivityBiz traget;
	
	@Test
	public void testGetByEmployeeName() {
		assertEquals("人事部", traget.getByEmployeeName("张三").get(0).getEmployee().getDepartment().getName());
	}
	
	@Test
	public void testDelete() {
		traget.detele(13);
	}

}
