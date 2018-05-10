package myoa.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.biz.MessageAttachmentBiz;
import myoa.biz.MessageBiz;
import myoa.biz.MessageReceptionBiz;
import myoa.dao.DaoException;
import myoa.entity.Department;
import myoa.entity.Employee;
import myoa.entity.Message;
import myoa.entity.MessageAttachment;
import myoa.entity.MessageReception;

@Controller
@RequestMapping("/pages")
public class MessageReceptionController {
	@Autowired
	private MessageBiz messageBiz;	
	@Autowired
	private MessageAttachmentBiz messageAttachmentBiz;	
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private MessageReceptionBiz messageReceptionbiz;
	
	@RequestMapping("/inbox")
	public String messageReceptionInbox(Model model,
			@RequestParam(name="status", required=true, defaultValue="0")int status,
			@RequestParam(name="isread", required=true, defaultValue="-1")int isread,Integer id){
		List<MessageReception> mrilist = messageReceptionbiz.findMessageReceptionInbox(0,isread,id);
		model.addAttribute("mrilist", mrilist);
		return "pages/inbox";
	}
	//√	
	@RequestMapping("/mrdelete")
	public String messageReceptionDelete(Model model,Integer id,HttpSession session){
		messageReceptionbiz.MessageReceptionDel(id);
		Employee e = (Employee) session.getAttribute("loginUser");
		return "redirect:/pages/inbox?id="+e.getId();
	}
	//√
	@RequestMapping("mRdelete")
	public String delete(int[] chkItem,Model model,HttpSession session) {
		try {
			messageReceptionbiz.delete(chkItem);
			model.addAttribute("erre", "删除成功");
		} catch (DaoException e) {
			model.addAttribute("erre", e.getMessage());		
		}
		Employee e = (Employee) session.getAttribute("loginUser");
		return "redirect:/pages/inbox?id="+e.getId();
	}
	//√
	@RequestMapping("/mrUpdatestatus")
	public String mReceptionUpdateStatus(Model model,int id){
		messageReceptionbiz.mReceptionUpdateStatus(id);
		return "redirect:/pages/retrieve";
	}
	@RequestMapping("/mrUpdateIsRead")
	public String mReceptionUpdateIsRead(Model model,int id,HttpSession session){
		messageReceptionbiz.mReceptionUpdateIsRead(id);
		Employee e = (Employee) session.getAttribute("loginUser");
		return "redirect:/pages/inbox?id="+e.getId();
	}
	
	@RequestMapping("/reply")
	public String messageReceptionById(Model model,Integer eid,Integer mid){
		messageReceptionbiz.mReceptionUpdateIsRead(mid);
		model.addAttribute("mrById",messageReceptionbiz.MessageReceptionById(mid));
		model.addAttribute("eid",eid);
		model.addAttribute("mid",mid);
		return "pages/reply";
	}
	@RequestMapping("/newEmailTwo")
	public String messageRById(Model model,Integer mid,Integer eid){
		List<Map<String, Object>> list = new ArrayList<>();
		for (Department department : departmentBiz.getAll()) {
			 Map<String,Object> item = new HashMap();
			 item.put("id",department.getId());
			 item.put("name",department.getName());
			 item.put("employee",employeeBiz.getByDid(department.getId()));
			 list.add(item);
		}
		model.addAttribute("departments",list);
		model.addAttribute("mrById",messageReceptionbiz.MessageReceptionById(mid));
		model.addAttribute("mid",mid);
		model.addAttribute("eid",eid);
		
		
		model.addAttribute("mById", messageBiz.MessageById(mid));
		return "pages/newEmailTwo";
	}

	
	
	@RequestMapping("mRupload") 
    public String mRupload(Message message,String [] listReceivers,int[] listReceiversid,MessageAttachment messageAttachment,MessageReception messageReception, HttpSession session,MultipartFile file){
		
 		String Receivers = "";
		for (int i = 0;i<listReceivers.length;i++) {
			try {
				Receivers+=listReceivers[i];
				if(listReceivers[i+1]!=null) {
					Receivers+=",";
				}
			} catch (Exception e) {
				break;
			}
		}
		message.setIsSent(1);
		message.setReceivers(Receivers);
		messageBiz.MessageAdd(message);
		
		//获取静态资源对应的真实文件路径
		String pathName = session.getServletContext().getRealPath("/static");
		//获取上传文件名称
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		//获取上传文件的文件类型，以供后面判断是否可以上传使用
		String extension = FilenameUtils.getExtension(fileName);
		//名称请使用自定义命名替换，至少要保证在该系统中唯一
		pathName= pathName+File.separator+"file"+File.separator+fileName ;
		File dest = new File(pathName);
		if(!dest.exists()){
			dest.mkdirs();
		}
		try {
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//Message message= new Message();
		messageAttachment.setMessageId(message.getId());
		messageAttachment.setName(fileName);
		messageAttachment.setFileurl(pathName);
		messageAttachmentBiz.mAaddAll(messageAttachment);
		
		System.out.println(listReceiversid.length);
		
		
		for (int i = 0; i < listReceiversid.length; i++) {
			MessageReception m = new MessageReception();		
			m.setEmployee(employeeBiz.fetchById(listReceiversid[i]));
			m.setMessage(message);
			System.out.println(listReceiversid[i]);													
			messageReceptionbiz.messageRAddAll(m);
		}	
		
		
		
		return "redirect:/pages/dispatch";
    }  
	
	
}
