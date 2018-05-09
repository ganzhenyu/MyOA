package myoa.biz;

import java.util.List;

import myoa.dao.DaoException;
import myoa.entity.Employee;
import myoa.entity.Message;

public interface MessageBiz {
	List<Message> findMessageAll(String title,int status,int isSent,int pageNum,int pageSize);
	
	
	List<Message> findMessageAllStatus();
	
	void MessageUpdate(Message message);

	void MessageAdd(Message message);
	
	void MessageDelete(int id);
	
	void delete(int[] id) throws DaoException;
	
	int  numMessageRow(int status,int isSent);
	
	void MessageUpdateStatus(int id);
	
	void MessageUpdateIsSent1(int id);
	
	void MessageUpdateIsSent0(int id);
	
	Message MessageById(int id);
	
	List<Message> getById(int id);
	
	List<Employee> getByReceiversStr(String Receivers);
}
