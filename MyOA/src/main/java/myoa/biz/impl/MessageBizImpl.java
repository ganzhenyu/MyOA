package myoa.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.EmployeeBiz;
import myoa.biz.MessageBiz;
import myoa.dao.DaoException;
import myoa.dao.MessageDao;
import myoa.entity.Employee;
import myoa.entity.Message;

@Service
public class MessageBizImpl implements MessageBiz {

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private EmployeeBiz employeeBiz;

	@Override
	public List<Message> findMessageAll(int status,int isSent,int id) {
		return messageDao.findMessageAll(isSent,status,id);
	}

	@Override
	public void MessageUpdate(Message message) {
		messageDao.MessageUpdate(message);
	}

	@Override
	public void MessageAdd(Message message) {
		messageDao.MessageAdd(message);
		
	}


	@Override
	public void delete(int[] id) throws DaoException {
		try {
			for (int i : id) {
				messageDao.MessageUpdateStatusTwo(i);
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DaoException("删除失败");
		}
		
	}

	@Override
	public void MessageUpdateStatus(int id) {
		messageDao.MessageUpdateStatus(id);
	}

	@Override
	public Message MessageById(int id) {
		// TODO Auto-generated method stub
		return messageDao.MessageById(id);
	}

	@Override
	public void MessageUpdateIsSent1(int id) {
		// TODO Auto-generated method stub
		messageDao.MessageUpdateIsSent1(id);
	}

	@Override
	public void MessageUpdateIsSent0(int id) {
		// TODO Auto-generated method stub
		messageDao.MessageUpdateIsSent0(id);
	}

	@Override
	public List<Message> getById(int id) {
		return messageDao.getById(id);
	}
	
	public static void main(String[] args) {
		ApplicationContext ctx= new ClassPathXmlApplicationContext("spring-beans.xml");
		MessageBiz dao=ctx.getBean(MessageBiz.class);
		System.out.println(dao.MessageById(1).getReceivers());
	}


	@Override
	public List<Message> findMessageAllStatus(int id) {
		// TODO Auto-generated method stub
		return messageDao.findMessageAllStatus(id);
	}

	@Override

	public List<Employee> getByReceiversStr(String Receivers) {
		String[] enameList=Receivers.split(",");
		List<Employee> list=new ArrayList<>();
		for(String s:enameList) {
			Employee e=employeeBiz.findByName(s);
			list.add(e);
		}
		return list;
	}

	

	public List<Message> fetchByReceiverId(int id, int num) {
		return messageDao.fetchByReceiverId(id, num);
	}

	@Override
	public List<Message> fetchByIsRead(int id, int num) {
		return messageDao.fetchByIsRead(id, num);
	}

	@Override
	public List<Message> fetchByLevel(int id, int num) {
		return messageDao.fetchByLevel(id, num);
	}

	@Override
	public void MessageUpdateStatusTwo(int id) {
		messageDao.MessageUpdateStatusTwo(id);
		
	}


}
