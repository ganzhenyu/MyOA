package myoa.entity;

public class MessageReception {
	private int id;
	private int messageid;
	private int receiverid;
	private int isread;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMessageid() {
		return messageid;
	}
	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}
	public int getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(int receiverid) {
		this.receiverid = receiverid;
	}
	public int getIsread() {
		return isread;
	}
	public void setIsread(int isread) {
		this.isread = isread;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public MessageReception(int id, int messageid, int receiverid, int isread, int status) {
		super();
		this.id = id;
		this.messageid = messageid;
		this.receiverid = receiverid;
		this.isread = isread;
		this.status = status;
	}
	public MessageReception() {}
}
