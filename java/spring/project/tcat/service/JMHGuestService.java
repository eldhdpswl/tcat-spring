package spring.project.tcat.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.project.tcat.VO.TcatPerformanceVO;

public interface JMHGuestService {
	
	//아이디,비밀번호 찾기
	public void findIdPwd(HttpServletRequest req,Model model);
	//아이디, 비밀번호 찾기 결과 
	public void findResult(HttpServletRequest req,Model model);
	//로그인 처리
	public void loginPro(HttpServletRequest req,Model model);
	//마이페이지 정보가져오기
	public void myPageInfo(HttpServletRequest req,Model model);
	
	//공연정보 리스트 가져오기
	public void  getPerfList(HttpServletRequest req,Model model);
	//스토어 리스 가져오기
	public void  getStoreList(HttpServletRequest req,Model model);
	//공연 상세 정보 가져오기
	public void  getContent(HttpServletRequest req,Model model);
	//스토어 상세정보
	public void  getContent_store(HttpServletRequest req,Model model);
	//getFavorite 연령,성별 선호도
	public void  getFavorite(HttpServletRequest req,Model model);
	//연령별, 성별별 선호도 가져오기
	public void  getFavorite_store(HttpServletRequest req,Model model);
	
	//위시 리스트
	public void getWishList(HttpServletRequest req,Model model);
	//addWishList 위시리스트 추가
	public void  addWishList(HttpServletRequest req,Model model);
	//해당 위시리스트 삭제
	public void delWishList(HttpServletRequest req,Model model);
	//getWishListIn 위시리스트 해당 공연 존재 확인
	public void getWishListIn(HttpServletRequest req,Model model);
	
	//결제취소
	public void buyCancel(HttpServletRequest req,Model model);
	//perfRefund 환불요청
	public void perfRefund(HttpServletRequest req,Model model);
	//perfChange 교환요청
	public void perfChange(HttpServletRequest req,Model model);
	
	//호스트 로그인
	public void host_loginPro(HttpServletRequest req,Model model);
	
	//getTicketInfo예매 정보
	public void getTicketInfo(HttpServletRequest req,Model model);
	//예매취소 ticCancel
	public void ticStepUpdate(HttpServletRequest req,Model model);
	
	/////////////////////////////////////////////////////////////////
	//HOST
	//getAgeAnalysis 연령별 분석
	public void  getAgeAnalysis(HttpServletRequest req,Model model);
	// 연령별 분석 스토어
	public void  getAgeAnalysis_store(HttpServletRequest req,Model model);
	//getGenderAnalysis 성별 예약 분석
	public void  getGenderAnalysis(HttpServletRequest req,Model model);
	//getGenderAnalysis_store 성별 스토어 분석
	public void  getGenderAnalysis_store(HttpServletRequest req,Model model);
	
	//////안드로이드
	public Map<String, Object> and_login(HttpServletRequest req,Model model);
	
	//beacon_react
	public Map<String, Object> beacon_react(HttpServletRequest req,Model model);
	
	//공연 아이디 가져오기
	public String getPer_id(HttpServletRequest req);
	//현석이형
	//안드로이드 통신[예매정보 가져오기]
	public void Tcat_android01(HttpServletRequest req);
	
	//dk android
	public TcatPerformanceVO and_content(HttpServletRequest req,Model model);
}
