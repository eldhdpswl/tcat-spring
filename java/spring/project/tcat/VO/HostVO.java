package spring.project.tcat.VO;

public class HostVO {
	String host_id; //관리자 아이디
	String host_pwd; //관리자 비밀번호
	String host_name; //관리자 이름
	String host_Department; //부서
	String host_grade; //직급
	String host_email; //이메일
	String host_phone; //연락처
	int host_authority; //권한
	
	
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getHost_pwd() {
		return host_pwd;
	}
	public void setHost_pwd(String host_pwd) {
		this.host_pwd = host_pwd;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_Department() {
		return host_Department;
	}
	public void setHost_Department(String host_Department) {
		this.host_Department = host_Department;
	}
	public String getHost_grade() {
		return host_grade;
	}
	public void setHost_grade(String host_grade) {
		this.host_grade = host_grade;
	}
	public String getHost_email() {
		return host_email;
	}
	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}
	public String getHost_phone() {
		return host_phone;
	}
	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}
	public int getHost_authority() {
		return host_authority;
	}
	public void setHost_authority(int host_authority) {
		this.host_authority = host_authority;
	}
	
	
	
}
