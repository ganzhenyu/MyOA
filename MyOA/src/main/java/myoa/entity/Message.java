package myoa.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Message {
	
	
	private int id;
	private String title;
	private String content;
	//@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date sendTime;
	private String receivers;
	private int level;
	private int status;
	private int isSent;
	private Employee employee;
	private List<MessageAttachment> attachments;
	private MessageReception messagereception;
	
	
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

	
	public MessageReception getMessagereception() {
		return messagereception;
	}
	public void setMessagereception(MessageReception messagereception) {
		this.messagereception = messagereception;
	}
	public List<MessageAttachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<MessageAttachment> attachments) {
		this.attachments = attachments;
	}
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
//	public String getSendTime() {
//		return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(sendTime);
//	}
//	public void setSendTime(Date sendTime) {
//		this.sendTime = sendTime;
//	}
	
	public String getReceivers() {
		return receivers;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
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
