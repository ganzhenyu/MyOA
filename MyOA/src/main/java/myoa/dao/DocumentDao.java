package myoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import myoa.entity.Document;



public interface DocumentDao {
	List<Document> getRootDocument();
	List<Document> getDocumentsLength(int id);
	Document getFileUrl(int id);
	void addFile(Document document);
	void delete(int id);
	void updateName(@Param("name")String name,@Param("id")int id);
}
