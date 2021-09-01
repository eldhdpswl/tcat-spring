package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatBoardVO {
	
	//Service
	
	/*service_num      NUMBER(20)       NOT NULL, 
    service_div      VARCHAR2(150)    DEFAULT '0', 
    service_title    VARCHAR2(255)    DEFAULT '0', 
    member_id        VARCHAR2(50)     NOT NULL, 
    writeDate        TIMESTAMP        DEFAULT SYSDATE, 
    AnswersStatus    NUMBER(10)       DEFAULT 0, 
    QuestionCon      VARCHAR2(255)    DEFAULT '0', 
    AnswersCon       VARCHAR2(255)    DEFAULT '0', 
    satisfction      VARCHAR2(50)     DEFAULT '0', 
    CONSTRAINT SERVICE_PK PRIMARY KEY (service_num)*/
	
	
	//Notice
	
	/*notice_num        NUMBER(20)       NOT NULL, 
    notice_title      VARCHAR2(255)    DEFAULT '0', 
    writeDate         TIMESTAMP        NOT NULL, 
    refNum            NUMBER(10)       DEFAULT 0, 
    contents          VARCHAR2(255)    DEFAULT '0', 
    notice_image      VARCHAR2(150)    DEFAULT '0', 
    notice_addfile    VARCHAR2(255)    DEFAULT '0', 
    notice_div        NUMBER(10)       NOT NULL, 
    member_id         VARCHAR2(50)     NOT NULL, 
    CONSTRAINT NOTICE_PK PRIMARY KEY (notice_num)*/
	
	
	//Service
	int service_num;
	String service_div;
	String service_title;
	String member_id;
	Timestamp writeDate;
	int AnswersStatus;
	String QuestionCon;
	String AnswersCon;
	String satisfction;
	
	//Notice
	int notice_num;
	String notice_title;
	int refNum;
	String contents;
	String notice_image;
	String notice_addfile;
	int notice_div;
	int category;
	int categoryComment;
	
	//태성 01/22추가 시작
	String perf_title;
	int per_id;
	String perf_image;
	String disc_title;
	int disc_code;
	
	
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getCategoryComment() {
		return categoryComment;
	}
	public void setCategoryComment(int categoryComment) {
		this.categoryComment = categoryComment;
	}
	
	public String getDisc_title() {
		return disc_title;
	}
	public void setDisc_title(String disc_title) {
		this.disc_title = disc_title;
	}
	public int getDisc_code() {
		return disc_code;
	}
	public void setDisc_code(int disc_code) {
		this.disc_code = disc_code;
	}
	public String getPerf_title() {
		return perf_title;
	}
	public void setPerf_title(String perf_title) {
		this.perf_title = perf_title;
	}
	public int getPer_id() {
		return per_id;
	}
	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}
	public String getPerf_image() {
		return perf_image;
	}
	public void setPerf_image(String perf_image) {
		this.perf_image = perf_image;
	}
	//태성 01/22추가 종료
	//Service
	public int getService_num() {
		return service_num;
		
	}
	public void setService_num(int service_num) {
		this.service_num = service_num;
	}
	public String getService_div() {
		return service_div;
	}
	public void setService_div(String service_div) {
		this.service_div = service_div;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public int getAnswersStatus() {
		return AnswersStatus;
	}
	public void setAnswersStatus(int answersStatus) {
		AnswersStatus = answersStatus;
	}
	public String getQuestionCon() {
		return QuestionCon;
	}
	public void setQuestionCon(String questionCon) {
		QuestionCon = questionCon;
	}
	public String getAnswersCon() {
		return AnswersCon;
	}
	public void setAnswersCon(String answersCon) {
		AnswersCon = answersCon;
	}
	public String getSatisfction() {
		return satisfction;
	}
	public void setSatisfction(String satisfction) {
		this.satisfction = satisfction;
	}
	
	//Notice
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public int getRefNum() {
		return refNum;
	}
	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}
	public String getNotice_addfile() {
		return notice_addfile;
	}
	public void setNotice_addfile(String notice_addfile) {
		this.notice_addfile = notice_addfile;
	}
	public int getNotice_div() {
		return notice_div;
	}
	public void setNotice_div(int notice_div) {
		this.notice_div = notice_div;
	}
	
	
	
}
