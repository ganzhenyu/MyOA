
package myoa.dao;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.EmployeeBiz;
import myoa.entity.Employee;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class EmployeeDaoTest {

	@Autowired
	private EmployeeBiz traget;
	
	@Test
	public void testGetByDid() {
		assertEquals(3, traget.getByDid(1).size());
	}
	@Test
	public void testcheckuser() {
		Employee loginUser=traget.checkUserLogin("Nr002", "123");
		System.out.println(loginUser.getIsManager());
	}
	@Test
	public void testfindname() {
		System.out.println(traget.findByName("张三").getId());
	}

}

