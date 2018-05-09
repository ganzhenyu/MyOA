package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import myoa.entity.Employee;
import myoa.entity.Message;
import myoa.entity.MessageReception;

public interface MessageDao {
	
	//查询全部------已完成
	List<Message> findMessageAll(		
			@Param("status")int status,
			@Param("isSent")int isSent,
			@Param("title")String title,
			@Param("pageNum")int pageNum,
			@Param("pageSize")int pageSize
			);

		
		//查询全部------已完成
		List<Message> findMessageAllStatus(	
			);
		
		//------已完成
	@Select("SELECT * FROM Message where status=0 and isSent=0")
	List<Message> numMessageRow(
			@Param("status")int status,
			@Param("isSent")int isSent);
	
	//更新全部
	@Update("update Message set title=#{title},content=#{content},sendTime=#{sendTime},receivers=#{receivers},level=#{level},status=#{status},isSent=#{isSent} ")
	void MessageUpdate(Message message);
	
	@Options(useGeneratedKeys = true, keyProperty = "id")
	//添加------已完成
	@Insert("INSERT INTO Message VALUES(0,#{title},#{content},#{employee.id},NOW(),#{receivers},#{level},#{status},#{isSent});")
	void MessageAdd(Message message);
	
	//删除------已完成
	@Delete("DELETE FROM Message WHERE id=#{id}")
	void MessageDelete(int id);

	//数组删除 ------已完成
	@Delete("DELETE FROM Message WHERE id=#{id}")
	void delete(int id);
	
	//修改收件箱-垃圾桶 ------已完成
	@Update("UPDATE Message SET status=1 WHERE id=#{id}")
	void MessageUpdateStatus(int id);
	
	//修改成发送-垃圾桶 ------已完成
	@Update("UPDATE Message SET IsSent=1,status=0  WHERE id=#{id}")
	void MessageUpdateIsSent1(int id);
	
	//修改成草稿-垃圾桶 ------已完成
	@Update("UPDATE Message SET IsSent=0,status=0  WHERE id=#{id}")
	void MessageUpdateIsSent0(int id);
	
	//按照 Message id查询数据
	Message MessageById(int id);
	
	List<Message> getById(int id);
	
}
