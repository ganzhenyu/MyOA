package myoa.entity;

public class MessageAttachment {
	public MessageAttachment() {}
	public MessageAttachment(int id, String name, String fileurl, Message message) {
		super();
		this.id = id;
		this.name = name;
		this.fileurl = fileurl;
		this.message = message;
	}
	private int id;
	private String name;
	private String fileurl;
	private Message message;
	private int messageId;
	
	public MessageAttachment(int id, String name, String fileurl, int messageId) {
		super();
		this.id = id;
		this.name = name;
		this.fileurl = fileurl;
		this.messageId = messageId;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	
	
}
