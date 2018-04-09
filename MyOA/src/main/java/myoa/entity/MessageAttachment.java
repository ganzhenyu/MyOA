package myoa.entity;

public class MessageAttachment {
	private int id;
	private String name;
	private String fileurl;
	private int messageid;
	
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
	
	public int getMessageid() {
		return messageid;
	}
	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}
	public MessageAttachment() {}
	public MessageAttachment(int id, String name, String fileurl, int messageid) {
		super();
		this.id = id;
		this.name = name;
		this.fileurl = fileurl;
		this.messageid = messageid;
	}
	
	
}
