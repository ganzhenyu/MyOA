package myoa.biz;

import java.util.List;

import myoa.dao.DaoException;
import myoa.entity.Employee;
import myoa.entity.Message;

public interface MessageBiz {
	List<Message> findMessageAll(int status,int isSent,int id);
	
	
	List<Message> findMessageAllStatus(int id);
	
	void MessageUpdate(Message message);

	void MessageAdd(Message message);
	
	
	void delete(int[] id) throws DaoException;
	
	void MessageUpdateStatus(int id);
	
	void MessageUpdateIsSent1(int id);
	
	void MessageUpdateIsSent0(int id);
	
	void MessageUpdateStatusTwo(int id);
	
	Message MessageById(int id);
	
	List<Message> getById(int id);
	

	List<Employee> getByReceiversStr(String Receivers);

	List<Message> fetchByReceiverId(int id,int num);
	
	List<Message> fetchByIsRead(int id,int num);
	
	List<Message> fetchByLevel(int id,int num);

}
