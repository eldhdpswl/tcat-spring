package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatTicketingVO {

	/*
	 * <Ticketing> ticket_num NUMBER(20) NOT NULL, member_id VARCHAR2(50) NOT NULL,
	 * per_id NUMBER(20) NOT NULL, ticet_date TIMESTAMP DEFAULT SYSDATE, seat_type
	 * VARCHAR2(20) DEFAULT '0', seat_num VARCHAR2(150) DEFAULT '0', sale_div
	 * VARCHAR2(50) NOT NULL, del_num NUMBER(20) NOT NULL, ticket_step NUMBER(20)
	 * DEFAULT 0,
	 * 
	 * <sale> sale_div VARCHAR2(50) NOT NULL, sale_rate NUMBER(10) NOT NULL,
	 * 
	 * <delevaryInfo> del_num NUMBER(20) NOT NULL, del_name VARCHAR2(50) NOT NULL,
	 * del_addr VARCHAR2(255) NOT NULL, del_hp VARCHAR2(50) NOT NULL,
	 */

	// <Ticketing>
	int ticket_num; // 예매번호
	String member_id; // 예매자 아이디
	int per_id; // 공연 번호
	Timestamp ticet_date; // 공연날짜
	String seat_type; // 좌석 타입
	String seat_num; // 좌석번호
	String sale_div; // 할인조건
	int del_num; // 배송번호
	int ticket_step; // 예매스텝
	// performanceInfo
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
    //<sale>
 	int 		sale_rate; 			//할인률
	//<delevaryInfo>
 	String 		del_name;			//이름
 	String 		del_addr;			//주소
 	String 		del_hp;				//연락처
 	
 	//hallInfo
    String hall_name; 		//공연장명
    int place_num;			//공연지역번호fk
    int VIP_seatPrice;		//vip좌석가격
    int R_seatPrice; 		//R좌석가격
    int S_seatPrice;		//S좌석가격
    int A_seatPrice;		//A좌석가격
    int B_seatPrice;		//B좌석가격
    String VIP_seat;		//vip물리번호
    String R_seat;			//R물리번호
    String S_seat;			//S물리번호
    String A_seat;			//A물리번호
    String B_seat;			//B물리번호
    String seat_line;
 	String buyDate;
 	int perCount;
 	int storeCount;
 	int totalPrice;
 	int perPrice;
 	int storePrice;
 	
 	
 	
 	public int getStorePrice() {
		return storePrice;
	}
	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}
	public int getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(int perPrice) {
		this.perPrice = perPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getStoreCount() {
		return storeCount;
	}
	public void setStoreCount(int storeCount) {
		this.storeCount = storeCount;
	}
	public int getPerCount() {
		return perCount;
	}
	public void setPerCount(int perCount) {
		this.perCount = perCount;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
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
	public int getVIP_seatPrice() {
		return VIP_seatPrice;
	}
	public void setVIP_seatPrice(int vIP_seatPrice) {
		VIP_seatPrice = vIP_seatPrice;
	}
	public int getR_seatPrice() {
		return R_seatPrice;
	}
	public void setR_seatPrice(int r_seatPrice) {
		R_seatPrice = r_seatPrice;
	}
	public int getS_seatPrice() {
		return S_seatPrice;
	}
	public void setS_seatPrice(int s_seatPrice) {
		S_seatPrice = s_seatPrice;
	}
	public int getA_seatPrice() {
		return A_seatPrice;
	}
	public void setA_seatPrice(int a_seatPrice) {
		A_seatPrice = a_seatPrice;
	}
	public int getB_seatPrice() {
		return B_seatPrice;
	}
	public void setB_seatPrice(int b_seatPrice) {
		B_seatPrice = b_seatPrice;
	}
	public String getVIP_seat() {
		return VIP_seat;
	}
	public void setVIP_seat(String vIP_seat) {
		VIP_seat = vIP_seat;
	}
	public String getR_seat() {
		return R_seat;
	}
	public void setR_seat(String r_seat) {
		R_seat = r_seat;
	}
	public String getS_seat() {
		return S_seat;
	}
	public void setS_seat(String s_seat) {
		S_seat = s_seat;
	}
	public String getA_seat() {
		return A_seat;
	}
	public void setA_seat(String a_seat) {
		A_seat = a_seat;
	}
	public String getB_seat() {
		return B_seat;
	}
	public void setB_seat(String b_seat) {
		B_seat = b_seat;
	}
	public String getSeat_line() {
		return seat_line;
	}
	public void setSeat_line(String seat_line) {
		this.seat_line = seat_line;
	}

	int round;
 	
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
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
	public int getTicket_num() {
		return ticket_num;
	}

	public void setTicket_num(int ticket_num) {
		this.ticket_num = ticket_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPer_id() {
		return per_id;
	}

	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}

	public Timestamp getTicet_date() {
		return ticet_date;
	}

	public void setTicet_date(Timestamp ticet_date) {
		this.ticet_date = ticet_date;
	}

	public String getSeat_type() {
		return seat_type;
	}

	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}

	public String getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}

	public String getSale_div() {
		return sale_div;
	}

	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
	}

	public int getDel_num() {
		return del_num;
	}

	public void setDel_num(int del_num) {
		this.del_num = del_num;
	}

	public int getTicket_step() {
		return ticket_step;
	}

	public void setTicket_step(int ticket_step) {
		this.ticket_step = ticket_step;
	}

	public int getSale_rate() {
		return sale_rate;
	}

	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}

	public String getDel_name() {
		return del_name;
	}

	public void setDel_name(String del_name) {
		this.del_name = del_name;
	}

	public String getDel_addr() {
		return del_addr;
	}

	public void setDel_addr(String del_addr) {
		this.del_addr = del_addr;
	}

	public String getDel_hp() {
		return del_hp;
	}

	public void setDel_hp(String del_hp) {
		this.del_hp = del_hp;
	}

}
