package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.ContentFavoriteVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.VO.WishListVO;

public interface JMHGuestDAO {

	// 아이디 찾기 이메일 전송
	public void sendIdMail(String member_email, String admit_code);

	// 아이디 이메일 유효성
	public int id_emailChk(Map<String, Object> map);

	// 아이디 찾기
	public String findIdPwd(Map<String, Object> map);

	// 로그인 처리
	public int loginPro(Map<String, String> map);

	// 호스트 로그인
	public int host_loginPro(Map<String, String> map);

	// 접속일 갱신
	public void updateLastDate(Map<String, String> map);

	// 회원정보 가져오기
	public MemberVO myPageInfo(Map<String, Object> map);

	// 해당회원의 구매정보
	public ArrayList<TcatDiscBuyVO> memDiscBuy(Map<String, Object> map);

	// getPerfList 공연 리스트
	public ArrayList<TcatPerformanceVO> getPerfList(Map<String, Object> map);

	// getPerfListCnt 공연 갯수
	public int getPerfListCnt(Map<String, Object> map);

	// 스토어 리스트
	public ArrayList<TcatPerDiscVO> getStoreList(Map<String, Object> map);

	// 스토어 리스트 갯수
	public int getStoreListCnt(Map<String, Object> map);

	// getContent 공연 상세정보 가져오기
	public TcatPerformanceVO getContent(int per_id);

	// getAge 연령별 선호도
	public ArrayList<ContentFavoriteVO> getAge(int per_id);

	public ArrayList<ContentFavoriteVO> getGender(int per_id);

	public ArrayList<ContentFavoriteVO> getAge_store(int disc_code);

	public ArrayList<ContentFavoriteVO> getGender_store(int disc_code);

	// getContent_store 스토어 상세페이지
	public TcatPerDiscVO getContent_store(int disc_code);

	// getWishList 위시리스트
	public ArrayList<WishListVO> getWishList(Map<String, Object> map);

	// addWishList 위시리스트 추가
	public void addWishList(Map<String, Object> map);

	// delWishList
	public void delWishList(Map<String, Object> map);

	// getWishListIn 위시리스트 존배여부
	public int getWishListIn(Map<String, Object> map);

	// 로그인 후 상세페이지 조회시 조회수 업
	public void upHits(int per_id);

	// buyCancel 결제 취소
	public int buyCancel(int disc_num);

	// 환불요청
	public int perfRefund(int disc_num);
	
	//교환 요청
	public int perfChange(int disc_num);

	// 티켓 배송번호 가져오기
	public ArrayList<Integer> getDel_nums(Map<String, Object> map);

	// 배송번호에 해당하는 티켓 정보 가져오기
	public ArrayList<TcatTicketingVO> getTickets(Map<String, Object> map);

	// 예매 스텝 업데이트
	public int ticStepUpdate(Map<String, Object> map);

	/////////////////////////////////////////////////////////////////////////
	// HOST
	// 연령별 총 판매량
	public ArrayList<ContentFavoriteVO> getAgeHostCount();

	// 연령별 선호 장르
	public ArrayList<ContentFavoriteVO> getAgeGenre();

	// 연령별 선호 작품
	public ArrayList<ContentFavoriteVO> getAgePerf(int ages);

	// getAgeHostCount_store
	public ArrayList<ContentFavoriteVO> getAgeHostCount_store();

	// getAgeGenre_store
	public ArrayList<ContentFavoriteVO> getAgeGenre_store();

	// getAgePerf_store
	public ArrayList<ContentFavoriteVO> getAgePerf_store(int ages);
	
	//성별 총 판매량
	public ArrayList<ContentFavoriteVO> getGenderHostCount();
	//성별 장르 선호
	public ArrayList<ContentFavoriteVO> getGenderGenre();
	//성별 작품 선호
	public ArrayList<ContentFavoriteVO> getGenderPerf(int ages);
	
	//getGenderHostCount_store 성별 스토어 총 판매량
	public ArrayList<ContentFavoriteVO> getGenderHostCount_store();
	//getGenderGenre_store 성별 스토어 장르 선호도
	public ArrayList<ContentFavoriteVO> getGenderGenre_store();
	// 성별 스토어 선호 제품
	public ArrayList<ContentFavoriteVO>  getGenderPerf_store(int gender);
	
	
	//////////////////////////////////////////////////////////////////////
	//안드로이드
	//아이디확인(존재여부)
	public int and_idChk(Map<String,Object> map);
	//로그인(존재여부)
	public int and_login(Map<String,Object> map);
	
	//getAnd_perfInfo 비콘 접근 해당 공연정보
	public TcatPerformanceVO getAnd_perfInfo(Map<String,Object> map);
	//getAnd_ticketingNow 비콘 접근 해당 예매정보
	public ArrayList<TcatTicketingVO> getAnd_ticketingNow(Map<String,Object> map);
	
	//getPer_id
	public String getPer_id(String hall_id);
	
	//현석이형
	//예매정보 가져오기 [안드로이드]
	public ArrayList<TcatTicketingVO> searchTcat01(Map<String,String> map);
	
	//dk android
	public TcatPerformanceVO and_perf(Map<String,Object> map);
	
}
