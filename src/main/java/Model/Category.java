package Model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Category {
	private int cateId;
	private String name;
	private int status;
	private int user_id;
	private LocalDateTime curDate;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int cateId, String name, int status, int user_id, LocalDateTime curDate) {
		super();
		this.cateId = cateId;
		this.name = name;
		this.status = status;
		this.user_id = user_id;
		this.curDate = curDate;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public LocalDateTime getCurDate() {
		return curDate;
	}
	public void setCurDate(LocalDateTime curDate) {
		this.curDate = curDate;
	}
	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", name=" + name + ", status=" + status + ", user_id=" + user_id
				+ ", curDate=" + curDate + "]";
	}
	
	
	

}
