package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.MessageReceptionBiz;
import myoa.dao.DaoException;
import myoa.dao.MessageReceptionDao;
import myoa.entity.MessageReception;

@Service
public class MessageReceptionBizImpl implements MessageReceptionBiz{

	@Autowired
	MessageReceptionDao messageReceptionDao;
	
	@Override
	public List<MessageReception> findMessageReception() {
		return messageReceptionDao.findMessageReception();
	}
	@Override
	public List<MessageReception> findMessageReceptionInbox(int status,int isread,int id) {
		// TODO Auto-generated method stub
		return messageReceptionDao.findMessageReceptionInbox(status,isread,id);
	}
	@Override
	public int numRow(int status) {
		return messageReceptionDao.numRow(status).size();
	}

	@Override
	public void MessageReceptionDel(int id) {
		messageReceptionDao.MessageReceptionDel(id);
	}

	@Override
	public void delete(int[] id) throws DaoException {
		try {
			for (int i : id) {
				messageReceptionDao.delete(i);
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DaoException("删除失败");
		}
	}

	@Override
	public void mReceptionUpdateStatus(int id) {
			messageReceptionDao.mReceptionUpdateStatus(id);
	}
	
	@Override
	public void mReceptionUpdateIsRead(int id) {
			messageReceptionDao.mReceptionUpdateIsRead(id);
	}

	@Override
	public MessageReception MessageReceptionById(int id) {
		// TODO Auto-generated method stub
		return messageReceptionDao.MessageReceptionById(id);
	}

	@Override
	public MessageReception MessageReceptionMessageId(int messageId) {
		// TODO Auto-generated method stub
		return messageReceptionDao.MessageReceptionMessageId(messageId);
	}

	@Override
	public List<MessageReception> findMessageReceptionStatus(int status) {
		
		return messageReceptionDao.findMessageReceptionStatus(status);
	}

	@Override
	public void messageRAddAll(MessageReception messageReception) {
		messageReceptionDao.messageRAddAll(messageReception);
	}
	

	@Override
	public List<MessageReception> findMessageR(int status, int isread,int id) {
		// TODO Auto-generated method stub
		return messageReceptionDao.findMessageR(status, isread,id);
	}

}
