package myoa.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.ActivityActorBiz;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class ActivityActorDaoTest {

	@Autowired
	private ActivityActorBiz traget;

	@Test
	public void testGetByActivityId() {
		assertEquals(3, traget.getByActivityId(1).size());
	}

	@Test
	public void testGetByActorId() {
		assertEquals(1, traget.getByActorId(2).size());
	}

}
