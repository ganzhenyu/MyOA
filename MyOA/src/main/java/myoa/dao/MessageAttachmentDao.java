package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import myoa.entity.MessageAttachment;

public interface MessageAttachmentDao {
	
	List<MessageAttachment> findMessageAttachment();
	
	@Insert("INSERT INTO MessageAttachment VALUES(0,#{name},#{fileurl},#{messageId})")
	void mAaddAll(MessageAttachment messageAttachment);

	@Update("UPDATE MessageAttachment SET name=#{name},fileurl=#{fileurl},messageid=#{messageid} where id=#{id}")
	void mUpdateAll(MessageAttachment messageAttachment);
	
	MessageAttachment byMessageId(int id);
}
