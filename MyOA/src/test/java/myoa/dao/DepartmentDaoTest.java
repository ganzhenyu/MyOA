package myoa.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.DepartmentBiz;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class DepartmentDaoTest {

	@Autowired
	private DepartmentBiz target;
	
	@Test
	public void testGetFullAll() {
		assertEquals(5, target.getFullAll().size());
	}
	
	@Test
	public void testgetFullAllByEname() {
		System.out.println(target.getFullAllByEname("张").size());
		System.out.println(target.getFullAllByEname(null).size());
		System.out.println(target.getFullAllByEname("").size());
	}

}
