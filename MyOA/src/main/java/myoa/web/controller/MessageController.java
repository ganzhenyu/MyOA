package myoa.web.controller;

import java.awt.event.ItemEvent;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
public class MessageController {
	
	@Autowired
	private MessageBiz messageBiz;	
	
	@Autowired
	private MessageAttachmentBiz messageAttachmentBiz;	
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private MessageReceptionBiz messageReceptionBiz;
	
	@RequestMapping("/manuscript")
	public String findMessageAll(Model model,
			@RequestParam(name="status", required=true, defaultValue="0")int status,
			@RequestParam(name="isSent", required=true, defaultValue="0")int isSent) 
	{
		List<Message> mlist=messageBiz.findMessageAll(0, 0);
		model.addAttribute("mlist", mlist);
		return "pages/manuscript";
	}
	
	@RequestMapping("/retrieve")
	public String findMessageAllr(Model model) {
		List<Message> mlist=messageBiz.findMessageAllStatus();
		model.addAttribute("mlist", mlist);
		return "pages/retrieve";
	}
	
	@RequestMapping("/dispatch")
	public String findMessageAlldispatch(Model model,
			@RequestParam(name="status", required=true, defaultValue="0")int status,
			@RequestParam(name="isSent", required=true, defaultValue="0")int isSent) 
	{
		List<Message> mlist=messageBiz.findMessageAll(1,isSent);
		model.addAttribute("mlist", mlist);
		return "pages/dispatch";
	}
	
	@RequestMapping("/mcaogaodelete")
	public String mcaogaodelete(Model model,Integer id){
		messageBiz.MessageUpdateStatusTwo(id);
		return "redirect:/pages/manuscript";
	}

	@RequestMapping("/mfasongdelete")
	public String mfasongdelete(Model model,Integer id){
		messageBiz.MessageUpdateStatusTwo(id);
		return "redirect:/pages/dispatch";
	}
	@RequestMapping("/mhuishoudelete")
	public String mhuishoudelete(Model model,Integer id){
		messageBiz.MessageUpdateStatusTwo(id);
		return "redirect:/pages/retrieve";
	}
	
	@RequestMapping("mdel")
	public String mdelete(int[] chkItem,Model model) {
		try {
			messageBiz.delete(chkItem);
			model.addAttribute("erre", "删除成功");
		} catch (DaoException e) {
			model.addAttribute("erre", e.getMessage());		
		}
		return "redirect:/pages/manuscript";
	}
	
	@RequestMapping("rdel")
	public String rdelete(int[] chkItem,Model model) {
		try {
			messageBiz.delete(chkItem);
			model.addAttribute("erre", "删除成功");
		} catch (DaoException e) {
			model.addAttribute("erre", e.getMessage());		
		}
		return "redirect:/pages/retrieve";
	}
	
	@RequestMapping("ddel")
	public String ddelete(int[] chkItem,Model model) {
		try {
			messageBiz.delete(chkItem);
			model.addAttribute("erre", "删除成功");
		} catch (DaoException e) {
			model.addAttribute("erre", e.getMessage());		
		}
		return "redirect:/pages/dispatch";
	}
	
	@RequestMapping("/messageUpdatestatus")
	public String messageUpdatestatus(Model model,int id){
		messageBiz.MessageUpdateStatus(id);
		return "redirect:/pages/retrieve";
	}
	@RequestMapping("/UpdateisSent1")
	public String messageUpdateisSent1(Model model,int id){
		messageBiz.MessageUpdateIsSent1(id);
		return "redirect:/pages/dispatch";
	}
	@RequestMapping("/UpdateisSent0")
	public String messageUpdateisSent0(Model model,int id){
		messageBiz.MessageUpdateIsSent0(id);
		return "redirect:/pages/manuscript";
	}

	@RequestMapping("/newEmail")
	public String messageNewEmail(Model model){		
		List<Map<String, Object>> list = new ArrayList<>();
		for (Department department : departmentBiz.getAll()) {
			 Map<String,Object> item = new HashMap();
			 item.put("id",department.getId());
			 item.put("name",department.getName());
			 item.put("employee",employeeBiz.getByDid(department.getId()));
			 list.add(item);
		}
		model.addAttribute("departments",list);
		return "pages/newEmail";
	}
	
	@RequestMapping("/mById")
	public String messagemById(Model model,Integer id){
		Message m=messageBiz.MessageById(id);
		model.addAttribute("mById", m);
		List<Map<String, Object>> list = new ArrayList<>();
		for (Department department : departmentBiz.getAll()) {
			 Map<String,Object> item = new HashMap();
			 item.put("id",department.getId());
			 item.put("name",department.getName());
			 item.put("employee",employeeBiz.getByDid(department.getId()));
			 list.add(item);
		}
		model.addAttribute("departments",list);
		return "pages/newEmail";
	}
//http://localhost:8080/static/file/timg.png
//	@RequestMapping("test_upload") 
//    public String test_upload(MessageAttachment messageAttachment, HttpSession session,MultipartFile file){  
//		//获取静态资源对应的真实文件路径
//		String pathName = session.getServletContext().getRealPath("/static");
//		//获取上传文件名称
//		String fileName = file.getOriginalFilename();
//		System.out.println(fileName);
//		//获取上传文件的文件类型，以供后面判断是否可以上传使用
//		String extension = FilenameUtils.getExtension(fileName);
//		//名称请使用自定义命名替换，至少要保证在该系统中唯一
//		pathName= pathName+File.separator+"file"+File.separator+fileName ;
//		System.out.println(pathName);
//		File dest = new File(pathName);
//		if(!dest.exists()){
//			dest.mkdirs();
//		}
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		
//		Message message= new Message();
//		messageAttachment.setMessageId(message.getId());
//		messageAttachment.setName(fileName);
//		messageAttachment.setFileurl(pathName);
//		messageAttachmentBiz.mAaddAll(messageAttachment);
//		return "redirect:/pages/dispatch";
//		
//    }  
	@RequestMapping("/upload") 
    public String upload(Message message,String receivers,MessageAttachment messageAttachment,@RequestParam(name="id",required=true,defaultValue="0")Integer id, HttpSession session,MultipartFile file){
		
		System.out.println(id);
		if(id>0) {
			messageBiz.MessageUpdate(message);
		}else {
/*			String Receivers = "";*/
			
/*			for (int i = 0;i<listReceivers.length;i++) {
				try {
					Receivers+=listReceivers[i];
					if(listReceivers[i+1]!=null) {
						Receivers+=",";
					}
				} catch (Exception e) {
					break;
				}
			}*/
			message.setReceivers(receivers);
			messageBiz.MessageAdd(message);
			//获取静态资源对应的真实文件路径
			String pathName = session.getServletContext().getRealPath("/static");
			//获取上传文件名称
			String fileName = file.getOriginalFilename();
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

			messageAttachment.setMessageId(message.getId());
			messageAttachment.setName(fileName);
			messageAttachment.setFileurl(pathName);
			messageAttachmentBiz.mAaddAll(messageAttachment);
			//这里写一个方法，把字符串写进去,输出一个Employee数组
			List<Employee> wlist= messageBiz.getByReceiversStr(receivers);
			//这里把员工数组添加
			for (int i = 0; i < wlist.size(); i++) {
				MessageReception m = new MessageReception();
				m.setMessage(messageBiz.MessageById(message.getId()));
				m.setEmployee(wlist.get(i));
				messageReceptionBiz.messageRAddAll(m);
			}
		}
		return "redirect:/pages/newEmail";
		
    }  
	
	@RequestMapping("/replyTwo")
	public String messageById(Model model,Integer id){
		model.addAttribute("mById", messageBiz.MessageById(id));
		return "pages/replyTwo";
	}

	
}
