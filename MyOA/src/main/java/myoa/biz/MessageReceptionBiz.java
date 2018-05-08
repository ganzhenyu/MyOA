package myoa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.dao.DaoException;
import myoa.entity.MessageReception;

public interface MessageReceptionBiz {
	
	List<MessageReception> findMessageReception();
	
	List<MessageReception> findMessageReceptionInbox(
			int status,
			int id,
			int pageNum,
			int pageSize);
	
	int numRow(int status);
	
	void MessageReceptionDel(int id);
	
	void delete(int[] id) throws DaoException;
	
	void mReceptionUpdateStatus(int id);

	void mReceptionUpdateIsRead(int id);
	
	MessageReception MessageReceptionById(int id);
	
	MessageReception MessageReceptionMessageId(int messageId);
	
	List<MessageReception> findMessageReceptionStatus(int status);
	
	void messageRAddAll(MessageReception messageReception);
	
}
