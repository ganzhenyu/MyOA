package myoa.web.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lowagie.text.DocumentException;

import myoa.biz.DocumentBiz;
import myoa.entity.Document;
import myoa.entity.Employee;
import myoa.util.ReadCreatePdf;
import myoa.util.UploadFileResult;
import myoa.util.XDocReport;

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
	
	@RequestMapping("/addDocuments")
	public String addDocument(int  parentId,int creatorId,Model model){
		
		model.addAttribute("creatorId", creatorId);
		model.addAttribute("parentId", parentId);
		return "pages/addDocument";
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
	@RequestMapping("/modifier")
	public Map<String,Object> modifier(int id,String name,HttpServletResponse response){
		response.setContentType("text/html;charsset=utf-8");
		Map<String,Object> model = new HashMap<>();				
		dbz.updateName(name, id);			
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/addfile")
	public Map<String,Object> addfile(Integer parentId,String type,HttpSession session){
		Map<String,Object> model = new HashMap<>();
		Document documents=new Document(0, "新建文件夹", "", new Date(), type, "", null, parentId, 1);
		dbz.addFile(documents);
		model.put("id", documents.getId());
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,Object> delete(int id){
		Map<String,Object> model = new HashMap<>();
		dbz.delete(id);
		return model;
	}
	 
	
	//在线阅读docx文档
	@ResponseBody
	@RequestMapping("/readDocx")
	public Map<String,Object> readDocx(String path, HttpServletRequest req){
		Map<String,Object> model = new HashMap<>();
		String vPath = path;
		String outPath = req.getServletContext().getRealPath("static/"+path);	
		XDocReport.wordConverterToPdf(outPath, outPath.replace("docx", "pdf"), "STSong-Light","UniGB-UCS2-H");		
		String getSignInfo = path.substring(0, path.lastIndexOf("."));
		StringBuffer mBuffer = new StringBuffer(getSignInfo);
		mBuffer.append(".pdf");
		model.put("hrefs", mBuffer.toString());
		return model;
	}
	
	//在线阅读txt文档
		@ResponseBody
		@RequestMapping("/readTxt")
		public Map<String,Object> readTxt(String path, HttpServletRequest req){
			Map<String,Object> model = new HashMap<>();
			String getSignInfo = path.substring(0, path.lastIndexOf("."));
			StringBuffer mBuffer = new StringBuffer(getSignInfo);		
			String my = path.substring(0, path.lastIndexOf("."));
			String outPath = req.getServletContext().getRealPath("static/"+path);
			String myou = req.getServletContext().getRealPath("static/"+my);
			try {
				ReadCreatePdf.zhuantext(outPath, myou+".pdf", getSignInfo);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			mBuffer.append(".pdf");						
			model.put("hrefs", mBuffer.toString());
			return model;
		}
		
		//上传文件
		@ResponseBody
		@RequestMapping(value="/addDocument")
		public Map<String,Object> addDocument(@RequestParam("myfile")MultipartFile[] myfile,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException{
			List<UploadFileResult> data=new ArrayList<>();
			Map<String,Object> model = new HashMap<>();	
			int parentId=Integer.valueOf(request.getParameter("parentId"));	
			Employee employee=(Employee) session.getAttribute("loginUser");
			int creatorId=employee.getId();
			//		System.out.println(parentId);
			//int creatorId=Integer.valueOf(request.getParameter("creatorId"));
			for (MultipartFile m : myfile) {				
				if(!m.isEmpty()) {																			
					String filename=m.getOriginalFilename();
					String my = filename.substring(filename.indexOf(".")+1);
					long tim=System.currentTimeMillis();
					String path=request.getSession().getServletContext().getRealPath("/static/Upload/"+tim+"."+my);
					System.out.println(path);
					m.transferTo(new File(path));
					UploadFileResult upoald=new UploadFileResult(filename,11, m.getContentType(), true, "上传成功", path);
					data.add(upoald);
					Document document=new Document(0, filename, "", new Date(), my,"Upload/"+tim+'.'+my, null, parentId, creatorId);
					dbz.addFile(document);					
				}					
			}
			model.put("data", data);
			return model;
			
		}
		
		
		
		
	
}
