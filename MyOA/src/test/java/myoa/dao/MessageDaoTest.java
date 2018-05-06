package myoa.dao;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import myoa.biz.MessageBiz;
import myoa.entity.Message;
import myoa.entity.MessageAttachment;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback
public class MessageDaoTest {

	@Autowired
	private MessageBiz traget;
	
	@Test
	public void testGetById() {
		List<Message> list= traget.getById(1);
		for(Message m:list) {
			for(MessageAttachment a:m.getAttachments()) {
				System.out.println(a.getName());
			}
		}
	}
	
	@Test
	public void testMessageById() {
		
		Message m= traget.MessageById(1);
		System.out.println(m.getTitle()+","+m.getId());
	}

}
