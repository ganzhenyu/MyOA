package myoa.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import myoa.biz.AnnouncementBiz;
import myoa.entity.Announcement;
import myoa.entity.Employee;

@Controller
public class AnnouncementController {

	@Autowired
	private AnnouncementBiz announcementBiz;
	
	@RequestMapping("/addAnnouncement")
	public String addAnnouncement(Model model,Announcement announcement,HttpServletRequest request) {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		announcement.setCreator(loginUser);
		announcement.setCreateTime(new Date(System.currentTimeMillis()));
		announcement.setLastEditTime(new Date(System.currentTimeMillis()));
		String message=null;
		if(announcement.getStatus()==0) {
			message="已存放草稿！";
		}else {
			message="申请成功！";
		}
		announcementBiz.add(announcement);
		model.addAttribute("message",message);
		return "ann_add";
	}
	
	@RequestMapping("/checkAnnouncement")
	public String check(Model model,Integer id,String title,String content,int no,int status,HttpServletRequest request) {
		if(id==null)
			return "ann_add";
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		Announcement announcement =announcementBiz.fetchById(id);
		announcement.setLastEditTime(new Date(System.currentTimeMillis()));
		announcement.setStatus(status);
		if(no==0) {
			announcement.setTitle(title);
			announcement.setContent(content);
			announcementBiz.update(announcement);
			return "redirect:/ann_compile";
		}else {
			announcement.setApprover(loginUser);
			announcement.setApproveTime(new Date(System.currentTimeMillis()));
			announcementBiz.update(announcement);
			return "redirect:/ann_audit";
		}	
	}
	@RequestMapping("/deleAnnouncement")
	public String deleAnnouncement(int deleid) {
		announcementBiz.delete(deleid);
		return "redirect:/ann_compile";
	}
	
}
