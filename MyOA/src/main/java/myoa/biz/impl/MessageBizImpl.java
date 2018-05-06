package myoa.biz.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import myoa.biz.MessageBiz;
import myoa.dao.DaoException;
import myoa.dao.MessageDao;
import myoa.entity.Message;
import myoa.entity.MessageReception;
@Service
public class MessageBizImpl implements MessageBiz{
	@Autowired
	private MessageDao messageDao;

	@Override
	public List<Message> findMessageAll(String title,int status,int isSent,int pageNum,int pageSize) {
		return messageDao.findMessageAll(isSent,status,title,pageNum,pageSize);
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
	public void MessageDelete(int id) {
		messageDao.MessageDelete(id);
		
	}

	@Override
	public void delete(int[] id) throws DaoException {
		try {
			for (int i : id) {
				messageDao.delete(i);
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DaoException("删除失败");
		}
		
	}

	@Override
	public int numMessageRow(int status,int isSent) {
		return messageDao.numMessageRow(status,isSent).size();
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
	public List<Message> findMessageAllStatus() {
		// TODO Auto-generated method stub
		return messageDao.findMessageAllStatus();
	}
}
