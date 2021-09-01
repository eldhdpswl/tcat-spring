package spring.project.tcat.VO;

import java.sql.Timestamp;

public class WishListVO {

	// performanceInfo
	int per_id; // 공연코드
	String perf_title; // 공연명
	int cateNum; // 카테고리 코드
	String perf_Image; // 공연 이미지
	Timestamp startDate; // 공연 시작 날짜
	Timestamp endDate; // 공연 끝 날짜
	int hall_id; // 공연장 코드
	String first_grade; // 우선순위
	String per_step; // 공연 스텝
	String remain_round; // 회차(하루간 공연회차)
	int possible_age; // 관람가능연령
	// category
	String category; // 카테고리(스토어,공연)
	String mDev; // 중분류
	String sDev; // 소분류

	// hallInfo
	String hall_name; // 공연장명
	int place_num; // 공연지역번호fk

	// place
	String province; // 도
	String city; // 시
	String postNum; // 우편번호
	String address; // 세부주소

	// wish
	int wish_num;
	Timestamp wish_inDate;
	int disc_code;
	String wish_step;

	// perDisc
	String disc_title; // 상품명
	int disc_price; // 상품가격
	String disc_image; // 상품이미지
	String disc_con; // 상품 상세내용
	String disc_step; // 상품 스텝
	int disc_count; // 상품수량

	
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

	public int getPer_id() {
		return per_id;
	}

	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}

	public String getPerf_title() {
		return perf_title;
	}

	public void setPerf_title(String perf_title) {
		this.perf_title = perf_title;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getPerf_Image() {
		return perf_Image;
	}

	public void setPerf_Image(String perf_Image) {
		this.perf_Image = perf_Image;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}

	public String getFirst_grade() {
		return first_grade;
	}

	public void setFirst_grade(String first_grade) {
		this.first_grade = first_grade;
	}

	public String getPer_step() {
		return per_step;
	}

	public void setPer_step(String per_step) {
		this.per_step = per_step;
	}

	public String getRemain_round() {
		return remain_round;
	}

	public void setRemain_round(String remain_round) {
		this.remain_round = remain_round;
	}

	public int getPossible_age() {
		return possible_age;
	}

	public void setPossible_age(int possible_age) {
		this.possible_age = possible_age;
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

	public String getHall_name() {
		return hall_name;
	}

	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}

	public int getPlace_num() {
		return place_num;
	}

	public void setPlace_num(int place_num) {
		this.place_num = place_num;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getWish_num() {
		return wish_num;
	}

	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}

	public Timestamp getWish_inDate() {
		return wish_inDate;
	}

	public void setWish_inDate(Timestamp wish_inDate) {
		this.wish_inDate = wish_inDate;
	}

	public int getDisc_code() {
		return disc_code;
	}

	public void setDisc_code(int disc_code) {
		this.disc_code = disc_code;
	}

	public String getWish_step() {
		return wish_step;
	}

	public void setWish_step(String wish_step) {
		this.wish_step = wish_step;
	}

}
