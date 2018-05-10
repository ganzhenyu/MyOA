package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import myoa.entity.MessageReception;

public interface MessageReceptionDao {
	
	//新接收的尚未阅读的消息列表
	List<MessageReception> findMessageReception();
	
	//收件箱--------已完成
	List<MessageReception> findMessageReceptionInbox(
			@Param("status")int status,
			@Param("id")int id,
			@Param("pageNum")int pageNum,
			@Param("pageSize")int pageSize);
	
	@Select("SELECT * FROM MessageReception where status=0")
	List<MessageReception> numRow(int status);
	
	//删除单条-------已完成
	@Delete("DELETE FROM MessageReception WHERE id=#{id}")
	void MessageReceptionDel(int id);

	//数组删除 ------已完成
	@Delete("DELETE FROM MessageReception WHERE id=#{id}")
	void delete(int id);
	
	//修改收件箱-垃圾桶 ------已完成
	@Update("UPDATE MessageReception SET `status`=1 WHERE id=#{id}")
	void mReceptionUpdateStatus(@Param("id")int id);

	//是否已读--已读 
	@Update("UPDATE MessageReception SET IsRead=1 ,status=0 WHERE id=#{id}")
	void mReceptionUpdateIsRead(int id);
	
	//按照 MessageReception id查询数据
	MessageReception MessageReceptionById(int id);
	

	MessageReception MessageReceptionMessageId(int messageId);
	
	//回收箱差全部--------
	@Select("SELECT * FROM MessageReception where status=1")
	List<MessageReception> findMessageReceptionStatus(int status);
	
	//新建信息提交完---添加
	@Insert("INSERT INTO MessageReception VALUES(0,#{message.id},#{employee.id},0,0);")
	void messageRAddAll(MessageReception messageReception);
	
	
	void messageRUpdateAll(MessageReception messageReception);
}



