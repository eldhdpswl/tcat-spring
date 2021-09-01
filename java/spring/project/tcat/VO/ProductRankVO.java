package spring.project.tcat.VO;

public class ProductRankVO {
	//performance
	int 	per_id;		//공연번호
	String 	perf_title;	//공연명
	//store
	int		disc_code;	//상품코드
	String 	disc_title;	//상품명
	//category
	String mDev;
	String sDev;
	//공통
	int		sellCnt;	//판매량
	int 	rNum;		//순위
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
	public int getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
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
