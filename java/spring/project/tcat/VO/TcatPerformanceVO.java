package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatPerformanceVO {
//ver2 by mh

	/*
		<performanceInfo>
			per_id          NUMBER(20)       NOT NULL, 
		    perf_title      VARCHAR2(255)    NOT NULL, 
		    cateNum         NUMBER(20)       DEFAULT '0', --수정
		    perf_Image      VARCHAR2(150)    DEFAULT '0', 
		    startDate       TIMESTAMP        DEFAULT SYSDATE, 
		    endDate         TIMESTAMP        DEFAULT SYSDATE, 
		    hall_id         NUMBER(20)       DEFAULT '0', 
		    first_grade     VARCHAR2(100)    DEFAULT '0', 
		    per_step        VARCHAR2(20)     DEFAULT '0', 
		    remain_round    VARCHAR2(150)    DEFAULT '0', 
		    possible_age    NUMBER(10)       DEFAULT 0, 
	    
	   <category>
		   	cateNum     NUMBER(20)       NOT NULL, 
		    category    VARCHAR2(20)     DEFAULT '0', 
		    mDev        VARCHAR2(150)    DEFAULT '0', 
		    sDev        VARCHAR2(150)    DEFAULT '0', 
		    
	   <hallInfo>
		    hall_id          NUMBER(20)        NOT NULL, 
		    hall_name        VARCHAR2(50)      DEFAULT '0', 
		    place_num        NUMBER(20)        DEFAULT 0, 
		    VIP_seatPrice    NUMBER(20)        DEFAULT 0, 
		    R_seatPrice      NUMBER(20)        DEFAULT 0, 
		    S_seatPrice      NUMBER(20)        DEFAULT 0, 
		    A_seatPrice      NUMBER(20)        DEFAULT 0, 
		    B_seatPrice      NUMBER(20)        DEFAULT 0, 
		    VIP_seat         VARCHAR2(2000)    DEFAULT '0', 
		    R_seat           VARCHAR2(2000)    DEFAULT '0', 
		    S_seat           VARCHAR2(2000)    DEFAULT '0', 
		    A_seat           VARCHAR2(2000)    DEFAULT '0', 
		    B_seat           VARCHAR2(2000)    DEFAULT '0', 
		    
		<place>
			place_num    NUMBER(20)       NOT NULL, 
		    province     VARCHAR2(250)    DEFAULT '0', 
		    city         VARCHAR2(20)     DEFAULT '0', 
		    gu           VARCHAR2(20)     DEFAULT '0', 
		    address      VARCHAR2(100)    DEFAULT '0', 
		    
		<DetailPage>  
		    detail_num      NUMBER(20)       NOT NULL, 
		    refNum          NUMBER(10)       DEFAULT 0, 
		    per_ex          VARCHAR2(255)    DEFAULT '0', 
		    Detail_Image    VARCHAR2(255)    DEFAULT '0', 
		    per_id          NUMBER(20)       DEFAULT 0, 
	    
	*/
	//performanceInfo
	int per_id;				//공연코드
    String perf_title;		//공연명
    int cateNum; 			//카테고리 코드       
    String perf_Image; 		//공연 이미지    
    Timestamp startDate;	//공연 시작 날짜     
    Timestamp endDate;		//공연 끝 날짜   
    int hall_id;			//공연장 코드        
    String first_grade;		//우선순위    
    String per_step;		//공연 스텝        
    String remain_round;	//회차(하루간 공연회차)    
    int possible_age; 		//관람가능연령
    String movie_url;
    
	//category
    String category;		//카테고리(스토어,공연)
    String mDev;			//중분류
    String sDev;			//소분류
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
    int hall_step;
    //place
    String province ;		//도
    String city;			//시
    String postNum ;				//우편번호
    String address; 		//세부주소
    //DetailPage
    int detail_num;			//상세페이지 코드
    int refNum;				//조회수
    String per_ex;			//상품상세소개
    String Detail_Image; 	//추가 이미지
    int rNum;
 
	//ticketing
    int round;
    Timestamp ticet_date;
    String seat_type;
    String seat_num;
    String ticet_max;  //영민 핫리스트 판매량 
    int sale_rate;
    String sale_div;
    String buydate;
    int count;
    //get,setter
 
    
    
    public int getCount() {
		return count;
	}
	public int getHall_step() {
		return hall_step;
	}
	public void setHall_step(int hall_step) {
		this.hall_step = hall_step;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public String getSale_div() {
		return sale_div;
	}
	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
	}
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	public String getTicet_max() {
		return ticet_max;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public void setTicet_max(String ticet_max) {
		this.ticet_max = ticet_max;
	}
    public String getMovie_url() {
		return movie_url;
	}
	public void setMovie_url(String movie_url) {
		this.movie_url = movie_url;
	}
    public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
    public String getSeat_type() {
		return seat_type;
	}
	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}
	public Timestamp getTicet_date() {
		return ticet_date;
	}
	public void setTicet_date(Timestamp ticet_date) {
		this.ticet_date = ticet_date;
	}
    public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}

    public String getSeat_line() {
		return seat_line;
	}
	public void setSeat_line(String seat_line) {
		this.seat_line = seat_line;
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
	public int getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(int detail_num) {
		this.detail_num = detail_num;
	}
	public int getRefNum() {
		return refNum;
	}
	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}
	public String getPer_ex() {
		return per_ex;
	}
	public void setPer_ex(String per_ex) {
		this.per_ex = per_ex;
	}
	public String getDetail_Image() {
		return Detail_Image;
	}
	public void setDetail_Image(String detail_Image) {
		Detail_Image = detail_Image;
	}
 
    
}





