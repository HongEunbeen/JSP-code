package mirim.hs.kr;

public class Menu {
	private int code;
	private String date;
	private String menu;
	private String kcal;
	private String info;

	private String number;
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}

	public Menu() {
		
	}
	public Menu(int code, String date, String menu) {
		this.code = code;
		this.date = date;
		this.menu = menu;
	}
	public Menu(String date, int code, String info, String kcal) {
		this.code = code;
		this.date = date;
		this.info = info;
		this.kcal = kcal;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
