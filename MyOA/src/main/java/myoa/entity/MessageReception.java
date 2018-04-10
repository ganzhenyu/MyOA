package myoa.entity;

public class MessageReception {
	public MessageReception() {}
	public MessageReception(int id, int isread, int status, Message message, Employee employee) {
		super();
		this.id = id;
		this.isread = isread;
		this.status = status;
		this.message = message;
		this.employee = employee;
	}
	private int id;
	private int isread;
	private int status;
	private Message message;
	private Employee employee;
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
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
}
