<<<<<<< HEAD
package myoa.dao;

import static org.junit.Assert.assertEquals;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import myoa.biz.DocumentBiz;
import myoa.biz.EmployeeBiz;
import myoa.entity.Document;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class EmployeeDaoTest {

	@Autowired
	private EmployeeBiz traget;
	@Autowired
	private DocumentBiz bz;
	
	@Test
	public void testGetByDid() {
		assertEquals(3, traget.getByDid(1).size());
	}

	@Test
	public void testbz() {
		
			ObjectMapper mapper = new ObjectMapper();  
			
			try {
				String jsonfromList = mapper.writeValueAsString(bz.getDocument(0));
				System.out.println(jsonfromList);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
	}
	
	@Test
	public void delte() {
		
		bz.delete(0);
		
	
	}
	@Autowired
	private DocumentDao dao;
}
=======
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

}
>>>>>>> branch 'master' of https://github.com/ganzhenyu/MyOA.git
