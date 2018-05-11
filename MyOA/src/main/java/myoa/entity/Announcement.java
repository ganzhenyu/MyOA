package myoa.entity;

import java.util.Date;

import myoa.web.until.ConvertTime;

public class Announcement {
	public Announcement() {}
	public Announcement(int id, String title, String content, Date createTime, Date lastEditTime, Date approveTime,
			int status, Employee creator, Employee approver) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.lastEditTime = lastEditTime;
		this.approveTime = approveTime;
		this.status = status;
		this.creator = creator;
		this.approver = approver;
	}
	private int id;
	private String title;
	private String content;
	private Date createTime;
	private Date lastEditTime;
	private Date approveTime;
	private int status;
	private Employee creator;
	private Employee approver=new Employee();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public String getCreateTimeLong() {
		if(this.createTime==null)
			return null;
		String time=ConvertTime.DateToLongStr(this.createTime);
		return time;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastEditTime() {
		return lastEditTime;
	}
	public String getLastEditTimeLong() {
		if(this.lastEditTime==null)
			return null;
		String time=ConvertTime.DateToLongStr(this.lastEditTime);
		return time;
	}
	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}
	public Date getApproveTime() {
		return approveTime;
	}
	public String getApproveTimeLong() {
		if(this.approveTime==null)
			return null;
		String time=ConvertTime.DateToLongStr(this.approveTime);
		return time;
	}
	
	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Employee getCreator() {
		return creator;
	}
	public void setCreator(Employee creator) {
		this.creator = creator;
	}
	public Employee getApprover() {
		return approver;
	}
	public void setApprover(Employee approver) {
		this.approver = approver;
	}
	
	public String getApproveTimeInfo() {
		if(this.approveTime==null)
			return "";
		else
			return this.approveTime.toLocaleString();
	}
	
}
