package myoa.web.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import myoa.biz.DocumentBiz;
import myoa.entity.Document;

@Controller
@RequestMapping("/pages")
public class DocumentController {
	
	private  List<Integer> ss = new ArrayList<>();
	private  int xi=0;

	
	@Autowired
	private DocumentBiz dbz;
	
	@ResponseBody
	@RequestMapping(value="/dm-lode",produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	public String modify(int id){
		List<Document> doc=dbz.getDocument(id);
		ObjectMapper mapper = new ObjectMapper();  
		String jsonfromList="";
		try {
			 jsonfromList = mapper.writeValueAsString(doc);			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		if(ss.size()==0) {
			ss.add(0, 0);
			xi=1;
			return jsonfromList;
		}else {
			boolean bo=true;
			for (int i = 0; i < ss.size(); i++) {				
				if(ss.get(i).equals(id)) {					
					bo =false;
					return "[]";
				}else if(i==ss.size()-1) {					
					ss.add(xi,id);
					xi++;
					return jsonfromList;
				}
			}			
			if(bo) {
				return jsonfromList;
			}else {
				return "[]";
			}
			
		}
		
	}
	@RequestMapping("/indextest")
	public String indextest(){
		 ss = new ArrayList<>();
		xi=0;
		return "pages/test";
	}
	
	@ResponseBody
	@RequestMapping(value="/me-lode",produces=MediaType.APPLICATION_JSON_VALUE+";charset=utf-8")
	public String clickLoadMessage(int id) {
		Document document=dbz.getFileUrl(id);	
		ObjectMapper mapper = new ObjectMapper();
		String mapJakcson="";
        try {
			 mapJakcson = mapper.writeValueAsString(document);						
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}       
		return mapJakcson;     			
	}
	
	
	@ResponseBody
	@RequestMapping("/addfile")
	public Map<String,Object> addfile(int parentId,String type){
		Map<String,Object> model = new HashMap<>();
	
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,Object> delete(int id){
		Map<String,Object> model = new HashMap<>();
		dbz.delete(id);
		return model;
	}
	
	
}
