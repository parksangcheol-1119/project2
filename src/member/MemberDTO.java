package member;

public class MemberDTO {
	private String id;
	private String NAME;
	private String pass;
	private String birthday;
	private String zipcode;
	private String address1;
	private String address2;
	private String email;
	private String email2;
	private String phone;
	private String checkbox1;
	private String checkbox2;
	private String regidate;
	
	public MemberDTO() {}
	public MemberDTO(String id, String NAME, String pass, String birthday, String zipcode, String address1,
			String address2, String email, String email2, String phone, String checkbox1, String checkbox2,
			String regidate) {
		super();
		this.id = id;
		this.NAME = NAME;
		this.pass = pass;
		this.birthday = birthday;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.email = email;
		this.email2 = email2;
		this.phone = phone;
		this.checkbox1 = checkbox1;
		this.checkbox2 = checkbox2;
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String NAME) {
		this.NAME = NAME;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCheckbox1() {
		return checkbox1;
	}
	public void setCheckbox1(String checkbox1) {
		this.checkbox1 = checkbox1;
	}
	public String getCheckbox2() {
		return checkbox2;
	}
	public void setCheckbox2(String checkbox2) {
		this.checkbox2 = checkbox2;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
}