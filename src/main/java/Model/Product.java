package Model;

import java.util.Date;

public class Product {
	String name, img, color, size, des;
	int status, quantity, sell, cateId, userId, id;
	float price;
	Date createDate;
	
	public Product(String name, String img, String color, int status, int quantity, int sell, int cateId, int userId,
			float price, Date createDate, String size, String des, int id) {
		super();
		this.name = name;
		this.img = img;
		this.color = color;
		this.status = status;
		this.quantity = quantity;
		this.sell = sell;
		this.cateId = cateId;
		this.userId = userId;
		this.price = price;
		this.createDate = createDate;
		this.size = size;
		this.des = des;
		this.id = id;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSell() {
		return sell;
	}

	public void setSell(int sell) {
		this.sell = sell;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
	
}
