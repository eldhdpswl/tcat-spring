package spring.project.tcat.VO;

public class TcatPerDiscVO {
	/*
		<perDisc>
			disc_code      NUMBER(20)       NOT NULL, 
		    disc_title     VARCHAR2(100)    DEFAULT '0', 
		    disc_price     NUMBER(20)       DEFAULT 0, 
		    disc_image     VARCHAR2(150)    DEFAULT '0', 
		    disc_con       VARCHAR2(255)    DEFAULT '0', 
		    cateNum        NUMBER(20)       DEFAULT 0, 
		    first_grade    VARCHAR2(100)    DEFAULT '0', 
		    disc_step      VARCHAR2(20)     DEFAULT '0', 
		    disc_count     NUMBER(20)       DEFAULT 0,
		    
		 <category>   
		    cateNum     NUMBER(20)       NOT NULL, 
		    category    VARCHAR2(20)     DEFAULT '0', 
		    mDev        VARCHAR2(150)    DEFAULT '0', 
		    sDev        VARCHAR2(150)    DEFAULT '0',
	*/
	
	//perDisc
	int disc_code;			//상품코드
    String disc_title;		//상품명
    int disc_price;			//상품가격
    String disc_image;		//상품이미지
    String disc_con;		//상품 상세내용
    int cateNum; 			//카테고리구분번호
    String first_grade;		//우선순위
    String disc_step; 		//상품 스텝
    int disc_count;			//상품수량
    //category
    String category;		//카테고리(스토어,공연)
    String mDev;			//중분류
    String sDev;			//소분류
    //DetailPage
    int detail_num;			//상세페이지 코드
    int refNum;				//조회수
    String per_ex;			//상품상세소개
    String Detail_Image; 	//추가 이미지
    int total;
    
    

    public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
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
	//getter setter
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
    
    
    

}
