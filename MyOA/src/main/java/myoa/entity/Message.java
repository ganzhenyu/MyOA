package myoa.entity;

import java.util.Date;

public class Message {
	
	public Message() {
		super();
	}
	public Message(int id, String title, String content, Date sendTime, String receivers, int level, int status,
			int isSent, Employee employee) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.sendTime = sendTime;
		this.receivers = receivers;
		this.level = level;
		this.status = status;
		this.isSent = isSent;
		this.employee = employee;
	}

	private int id;
	private String title;
	private String content;
	private Date sendTime;
	private String receivers;
	private int level;
	private int status;
	private int isSent;
	private Employee employee;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
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
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getReceivers() {
		return receivers;
	}
	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIsSent() {
		return isSent;
	}
	public void setIsSent(int isSent) {
		this.isSent = isSent;
	}
	
}
