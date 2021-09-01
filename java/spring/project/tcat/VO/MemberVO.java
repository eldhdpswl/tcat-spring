package spring.project.tcat.VO;

import java.sql.Timestamp;

public class MemberVO {
	String member_id; 			//아이디
	String member_pwd; 			//비밀번호
	String member_name; 		//이름
	String member_hp; 			//연락처
	String member_addr; 		//주소-daum주소검색
	String member_email; 		//이메일
	String member_gender; 		//성별
	String member_birth; 		//생년월일
	int point; 					//포인트
	Timestamp lastDate; 		//마지막 접속일
	String Rating; 				//등급
	String member_step; 		//멤버스텝
	Timestamp member_joindate; 	//회원가입 날짜
	

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_hp() {
		return member_hp;
	}
	public void setMember_hp(String member_hp) {
		this.member_hp = member_hp;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getLastDate() {
		return lastDate;
	}
	public void setLastDate(Timestamp lastDate) {
		this.lastDate = lastDate;
	}
	public String getRating() {
		return Rating;
	}
	public void setRating(String rating) {
		Rating = rating;
	}
	public String getMember_step() {
		return member_step;
	}
	public void setMember_step(String member_step) {
		this.member_step = member_step;
	}
	public Timestamp getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(Timestamp member_joindate) {
		this.member_joindate = member_joindate;
	}
	
	
}
