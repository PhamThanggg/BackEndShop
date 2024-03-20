package Model;

public class Account {
	private int user_id;
	private String user_name;
	private String password;
	private String gmail;
	private String phone;
	private int is_sell;
	private int is_admin;
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(int user_id, String user_name, String password, String gmail, String phone, int is_sell,
			int is_admin) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.gmail = gmail;
		this.phone = phone;
		this.is_sell = is_sell;
		this.is_admin = is_admin;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGmail() {
		return gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIs_sell() {
		return is_sell;
	}

	public void setIs_sell(int is_sell) {
		this.is_sell = is_sell;
	}

	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}

	@Override
	public String toString() {
		return "Register [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", gmail="
				+ gmail + ", phone=" + phone + ", is_sell=" + is_sell + ", is_admin=" + is_admin + "]";
	}
	
	
	
}
