package myoa.entity;

public class Function {
	public Function() {}
	public Function(int id, String name, String code, int isMenuItem, String menuLog, String menuEntry, int parentId) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.isMenuItem = isMenuItem;
		this.menuLog = menuLog;
		this.menuEntry = menuEntry;
		this.parentId = parentId;
	}
	private int id;
	private String name;
	private String code;
	private int isMenuItem;
	private String menuLog;
	private String menuEntry;
	private int parentId;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getIsMenuItem() {
		return isMenuItem;
	}
	public void setIsMenuItem(int isMenuItem) {
		this.isMenuItem = isMenuItem;
	}
	public String getMenuLog() {
		return menuLog;
	}
	public void setMenuLog(String menuLog) {
		this.menuLog = menuLog;
	}
	public String getMenuEntry() {
		return menuEntry;
	}
	public void setMenuEntry(String menuEntry) {
		this.menuEntry = menuEntry;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
}
