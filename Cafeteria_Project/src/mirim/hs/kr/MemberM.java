package mirim.hs.kr;

public class MemberM {
	private String email;
	private String password;
	private String name;
	private int height;
	private int weight;
	private String number;
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public MemberM() {}
	public MemberM(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public MemberM(int weight, int height) {
		super();
		this.weight = weight;
		this.height = height;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
}
