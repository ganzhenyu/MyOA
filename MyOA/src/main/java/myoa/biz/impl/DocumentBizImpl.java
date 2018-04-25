package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.DocumentBiz;
import myoa.dao.DocumentDao;
import myoa.entity.Document;
@Service
public class DocumentBizImpl implements DocumentBiz{
	@Autowired
	private DocumentDao doc;
	
	@Override
	public List<Document> getDocument(int id) {
		// TODO Auto-generated method stub
		List<Document> document;
		if(id==0) {
			 document=doc.getRootDocument();
		}else {
			document=doc.getDocumentsLength(id);
		}
		
		if(document.size()!=0) {
			for (Document d : document) {
				List<Document> docs=doc.getDocumentsLength(d.getId());
				d.setDocuments(docs);
			}
			
		}
		return document;
		
		
	}

	@Override
	public Document getFileUrl(int id) {
		// TODO Auto-generated method stub		
		List<Document> docss=doc.getDocumentsLength(id);
		Document docs=doc.getFileUrl(id);
		docs.setDocuments(docss);
		return docs;
		
		
	}

	@Override
	public void addFile(Document document) {
		// TODO Auto-generated method stub
		doc.addFile(document);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		List<Document> document;
		for(int i=0;i<1;i=0) {
			document=doc.getDocumentsLength(id);			
			if(document.size()==0) {			
				System.out.println(id);
				doc.delete(id);
				return;
			}else {				
				for(int s=0;s<document.size();s++) {			
					 delete(document.get(i).getId());				 
				}
			}			
		}
		
	
	}

	@Override
	public void updateName(String name, int id) {
		// TODO Auto-generated method stub
		doc.updateName(name, id);
	}

	
	

}
