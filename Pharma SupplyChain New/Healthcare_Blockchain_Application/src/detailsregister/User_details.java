package detailsregister;

public class User_details {
	int id;
	String mobileno;
	String username,Address,Password,EmailId,gender;
	public String getemail() {
		return EmailId;
	}
	public void setemail(String uemail) {
		EmailId = uemail;
	}
	public String getgender() {
		return gender;
	}
	public void setgender(String ugender) {
		gender = ugender;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMonbileNo() {
		return mobileno;
	}
	public void setMonbileNo(String Mobno) {
		this.mobileno = Mobno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddr() {
		return Address;
	}
	public void setAddr(String uaddr) {
	Address =uaddr;
	}
	public String getpwd() {
		return Password;
	}
	public void setpwd(String pwd) {
		Password = pwd;
	}
}
