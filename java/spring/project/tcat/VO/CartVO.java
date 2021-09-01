package spring.project.tcat.VO;

import java.sql.Timestamp;

public class CartVO {
	int cart_num; //장바구니 번호
	String member_id; //고객 id
	String member_pwd; //고객 pwd
	String member_name; //고객 이름
	String member_hp; //고객 연락처
	String member_addr; //고객 주소
	String member_email; //고객 email
	String member_gender; //고객 성별
	String member_birth; //고객 생년월일
	int point; //고객 포인트
	Timestamp lastDate; //고객 마지막 접속일
	String Rating; //고객 등급
	String member_step; //고객 상태
	Timestamp member_joindate; //고객 가입일
	Timestamp cart_inDate; //장바구니 담은시간
	int disc_code; //상품코드
	String disc_title; //상품이름
	int disc_price; //상품가격
	String disc_image; //상품이미지
	String disc_con; //상품설명
	int cateNum; //카테고리번호
	String category; //카테고리
	String mDev; //중분류
	String sDev; //소분류
	String first_grade; //상품우선순위
	String disc_step; //상품스텝
	int disc_count; //상품수량
	int cart_count; //장바구니 담은 수량
	
	
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
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
	public Timestamp getCart_inDate() {
		return cart_inDate;
	}
	public void setCart_inDate(Timestamp cart_inDate) {
		this.cart_inDate = cart_inDate;
	}
	public int getDisc_code() {
		return disc_code;
	}
	public void setDisc_code(int disc_code) {
		this.disc_code = disc_code;
	}
	public String getDisc_title() {
		return disc_title;
	}
	public void setDisc_title(String disc_title) {
		this.disc_title = disc_title;
	}
	public int getDisc_price() {
		return disc_price;
	}
	public void setDisc_price(int disc_price) {
		this.disc_price = disc_price;
	}
	public String getDisc_image() {
		return disc_image;
	}
	public void setDisc_image(String disc_image) {
		this.disc_image = disc_image;
	}
	public String getDisc_con() {
		return disc_con;
	}
	public void setDisc_con(String disc_con) {
		this.disc_con = disc_con;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getmDev() {
		return mDev;
	}
	public void setmDev(String mDev) {
		this.mDev = mDev;
	}
	public String getsDev() {
		return sDev;
	}
	public void setsDev(String sDev) {
		this.sDev = sDev;
	}
	public String getFirst_grade() {
		return first_grade;
	}
	public void setFirst_grade(String first_grade) {
		this.first_grade = first_grade;
	}
	public String getDisc_step() {
		return disc_step;
	}
	public void setDisc_step(String disc_step) {
		this.disc_step = disc_step;
	}
	public int getDisc_count() {
		return disc_count;
	}
	public void setDisc_count(int disc_count) {
		this.disc_count = disc_count;
	}
	
	
	
	
}
