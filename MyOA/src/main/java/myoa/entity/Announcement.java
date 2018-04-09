package myoa.entity;

import java.util.Date;

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
	private Employee approver;
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
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastEditTime() {
		return lastEditTime;
	}
	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}
	public Date getApproveTime() {
		return approveTime;
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
	
}
