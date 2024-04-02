package Model;

public class Cart {
	private int cartId;
	private int id_user;
	private int id_product;
	private int quantity;
	private double price;
	private String size;
	private String name;
	private String img;
	private String des;
	private double price_one;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Cart(int cartId, int id_user, int id_product, int quantity, double price, String size, String name,
			String img, String des, double price_one) {
		super();
		this.cartId = cartId;
		this.id_user = id_user;
		this.id_product = id_product;
		this.quantity = quantity;
		this.price = price;
		this.size = size;
		this.name = name;
		this.img = img;
		this.des = des;
		this.price_one = price_one;
	}



	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public double getPrice_one() {
		return price_one;
	}

	public void setPrice_one(double price_one) {
		this.price_one = price_one;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

}
