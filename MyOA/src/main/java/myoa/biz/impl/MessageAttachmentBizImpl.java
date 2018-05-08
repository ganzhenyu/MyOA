package myoa.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.MessageAttachmentBiz;
import myoa.dao.MessageAttachmentDao;
import myoa.entity.MessageAttachment;
@Service
public class MessageAttachmentBizImpl implements MessageAttachmentBiz{
	@Autowired
	private MessageAttachmentDao messageAttachmentDao;
	@Override
	public void mAaddAll(MessageAttachment messageAttachment) {
		messageAttachmentDao.mAaddAll(messageAttachment);
	}
	@Override
	public void mUpdateAll(MessageAttachment messageAttachment) {
		messageAttachmentDao.mUpdateAll(messageAttachment);
	}

}
