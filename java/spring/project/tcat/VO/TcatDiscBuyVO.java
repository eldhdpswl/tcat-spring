package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatDiscBuyVO {
	/*
		<DiscBuy>
		  	disc_num        NUMBER(20)      NOT NULL, 
		    del_num         NUMBER(20)      NOT NULL, 
		    disc_buyDate    TIMESTAMP       DEFAULT SYSDATE, 
		    disc_code       NUMBER(20)      NOT NULL, 
		    member_id       VARCHAR2(50)    NOT NULL, 
		    disc_buyStep    NUMBER(20)      NOT NULL, 
		    sale_div        VARCHAR2(50)    DEFAULT '0', 
		    
	  	<sale>
		 	sale_div     VARCHAR2(50)    NOT NULL, 
			sale_rate    NUMBER(10)      NOT NULL, 
				
    	<delevaryInfo>
    		del_num     NUMBER(20)       NOT NULL, 
		    del_name    VARCHAR2(50)     NOT NULL, 
		    del_addr    VARCHAR2(255)    NOT NULL, 
		    del_hp      VARCHAR2(50)     NOT NULL, 
	*/ 
	//<DiscBuy>
  	int disc_num;
  	int del_num;
  	Timestamp disc_buyDate;
    int disc_code;
    String member_id;
    int disc_buyStep;
    String sale_div ;
    int buy_count;
	//<sale>
 	int sale_rate;
 	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	//<delevaryInfo>
 	String del_name;
 	String del_addr;
 	String del_hp; 
 	//category
 	String 		category;
 	String		mDev;
 	String 		sDev;
 	//perDisc
 	String 		perf_title;
 	String 		disc_title;		//상품명
 	int rNum;
 	String movie_url; 
 	int count;
 	
 	
	//perDisc
    int disc_price;			//상품가격
    
	
	String disc_image;		//상품이미지
    String disc_con;		//상품 상세내용
    int cateNum; 			//카테고리구분번호
    String first_grade;		//우선순위
    String disc_step; 		//상품 스텝
    int disc_count;			//상품수량
    String buydate;
    

	
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
    public String getMovie_url() {
		return movie_url;
	}
	public void setMovie_url(String movie_url) {
		this.movie_url = movie_url;
	}
    public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
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
	
	public int getDisc_num() {
		return disc_num;
	}
	public void setDisc_num(int disc_num) {
		this.disc_num = disc_num;
	}
	public int getDel_num() {
		return del_num;
	}
	public void setDel_num(int del_num) {
		this.del_num = del_num;
	}
	public Timestamp getDisc_buyDate() {
		return disc_buyDate;
	}
	public void setDisc_buyDate(Timestamp disc_buyDate) {
		this.disc_buyDate = disc_buyDate;
	}
	public int getDisc_code() {
		return disc_code;
	}
	public void setDisc_code(int disc_code) {
		this.disc_code = disc_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getDisc_buyStep() {
		return disc_buyStep;
	}
	public void setDisc_buyStep(int disc_buyStep) {
		this.disc_buyStep = disc_buyStep;
	}
	public String getSale_div() {
		return sale_div;
	}
	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
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
	public String getPerf_title() {
		return perf_title;
	}
	public void setPerf_title(String perf_title) {
		this.perf_title = perf_title;
	}
	public String getDisc_title() {
		return disc_title;
	}
	public void setDisc_title(String disc_title) {
		this.disc_title = disc_title;
	}
 	
 	
 	
 	
 	
}
