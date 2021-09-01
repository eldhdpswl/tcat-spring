package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.ContentFavoriteVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.VO.WishListVO;
import spring.project.tcat.config.Configuration;

@Repository
public class JMHGuestDAOImp implements JMHGuestDAO {

	@Autowired
	private JavaMailSender mailSender;

	// 아이디 찾기 이메일 전송
	@Override
	public void sendIdMail(String member_email, String admit_code) {
		try {
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom("admin@Tcat.com");
			msg.setTo(member_email);
			msg.setSubject("아이디찾기 인증번호");
			msg.setText("인증번호 6자리:  " + admit_code);

			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 아이디 이메일 유효성
	@Override
	public int id_emailChk(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.id_emailChk(map);
		return cnt;
	}

	// 아이디 찾기
	@Override
	public String findIdPwd(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		String member = dao.findIdPwd(map);
		return member;
	}

	// 로그인 처리
	@Override
	public int loginPro(Map<String, String> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.loginPro(map);
		return cnt;
	}

	// 호스트 로그인
	public int host_loginPro(Map<String, String> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.host_loginPro(map);
		return cnt;
	}

	// 접속일 갱신
	@Override
	public void updateLastDate(Map<String, String> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.updateLastDate(map);
	}

	// 회원정보 가져오기
	@Override
	public MemberVO myPageInfo(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		MemberVO memInfo = dao.myPageInfo(map);
		return memInfo;
	}

	// 해당회원의 구매정보
	@Override
	public ArrayList<TcatDiscBuyVO> memDiscBuy(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatDiscBuyVO> memDiscBuyList = dao.memDiscBuy(map);
		return memDiscBuyList;
	}

	// getPerfList 공연 리스트
	public ArrayList<TcatPerformanceVO> getPerfList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatPerformanceVO> perfs = dao.getPerfList(map);
		return perfs;
	}

	// getPerfListCnt 공연 갯수
	public int getPerfListCnt(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getPerfListCnt(map);
		return cnt;
	}

	// 스토어 리스트
	public ArrayList<TcatPerDiscVO> getStoreList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatPerDiscVO> discs = dao.getStoreList(map);
		return discs;
	}

	// 스토어 갯수
	public int getStoreListCnt(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getStoreListCnt(map);
		return cnt;
	}

	// getContent 공연 상세정보 가져오기
	public TcatPerformanceVO getContent(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		TcatPerformanceVO perf = dao.getContent(per_id);
		return perf;
	}

	// getAge 연령별 선호도
	public ArrayList<ContentFavoriteVO> getAge(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAge(per_id);
		return fav;
	}

	// 성별별 선호도
	public ArrayList<ContentFavoriteVO> getGender(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGender(per_id);
		return fav;
	}

	public ArrayList<ContentFavoriteVO> getAge_store(int disc_code) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAge_store(disc_code);
		return fav;
	}

	public ArrayList<ContentFavoriteVO> getGender_store(int disc_code) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGender_store(disc_code);
		return fav;
	}

	// getContent_store 스토어 상세페이지
	public TcatPerDiscVO getContent_store(int disc_code) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		TcatPerDiscVO str = dao.getContent_store(disc_code);
		return str;
	}

	// 로그인 후 상세페이지 조회시 조회수 업
	public void upHits(int per_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.upHits(per_id);
	}

	// getWishList 위시리스트
	public ArrayList<WishListVO> getWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<WishListVO> wishs = dao.getWishList(map);
		return wishs;
	}

	// addWishList 위시리스트 추가
	public void addWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.addWishList(map);
	}

	// delWishList
	public void delWishList(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dao.delWishList(map);
	}

	// getWishListIn 위시리스트 존배여부
	public int getWishListIn(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.getWishListIn(map);
		return cnt;
	}

	// buyCancel 결제 취소
	public int buyCancel(int disc_num) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.buyCancel(disc_num);
		return cnt;
	}

	// 환불요청
	public int perfRefund(int disc_num) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.perfRefund(disc_num);
		return cnt;
	}

	// 교환 요청
	public int perfChange(int disc_num) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.perfChange(disc_num);
		return cnt;
	}

	// 티켓 배송번호 가져오기
	public ArrayList<Integer> getDel_nums(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<Integer> cnt = dao.getDel_nums(map);
		return cnt;
	}

	// 배송번호에 해당하는 티켓 정보 가져오기
	public ArrayList<TcatTicketingVO> getTickets(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatTicketingVO> cnt = dao.getTickets(map);
		return cnt;
	}

	// 예매 스텝 업데이트
	public int ticStepUpdate(Map<String, Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int cnt = dao.ticStepUpdate(map);
		return cnt;
	}

	/////////////////////////////////////////////////////////////////////////
	// HOST
	// 연령별 총 판매량
	public ArrayList<ContentFavoriteVO> getAgeHostCount() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgeHostCount();
		return fav;
	}

	// 연령별 선호 장르
	public ArrayList<ContentFavoriteVO> getAgeGenre() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgeGenre();
		return fav;
	}

	// 연령별 선호 작품
	public ArrayList<ContentFavoriteVO> getAgePerf(int ages) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgePerf(ages);
		return fav;
	}

	// getAgeHostCount_store
	public ArrayList<ContentFavoriteVO> getAgeHostCount_store() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgeHostCount_store();
		return fav;
	}

	// getAgeGenre_store
	public ArrayList<ContentFavoriteVO> getAgeGenre_store() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgeGenre_store();
		return fav;
	}

	// getAgePerf_store
	public ArrayList<ContentFavoriteVO> getAgePerf_store(int ages) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getAgePerf_store(ages);
		return fav;
	}

	// 성별 총 판매량
	public ArrayList<ContentFavoriteVO> getGenderHostCount() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderHostCount();
		return fav;
	}

	// 성별 장르 선호
	public ArrayList<ContentFavoriteVO> getGenderGenre() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderGenre();
		return fav;
	}

	// 성별 작품 선호
	public ArrayList<ContentFavoriteVO> getGenderPerf(int ages) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderPerf(ages);
		return fav;
	}

	// getGenderHostCount_store 성별 스토어 총 판매량
	public ArrayList<ContentFavoriteVO> getGenderHostCount_store() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderHostCount_store();
		return fav;
	}

	// getGenderGenre_store 성별 스토어 장르 선호도
	public ArrayList<ContentFavoriteVO> getGenderGenre_store() {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderGenre_store();
		return fav;
	}

	// 성별 스토어 선호 제품
	public ArrayList<ContentFavoriteVO> getGenderPerf_store(int gender) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<ContentFavoriteVO> fav = dao.getGenderPerf_store(gender);
		return fav;
	}
	
	
	//////////////////////////////////////////////////////////////////////
	//안드로이드
	//아이디확인(존재여부)
	public int and_idChk(Map<String,Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int rs = dao.and_idChk(map);
		return rs;
	}
	//로그인(존재여부)
	public int and_login(Map<String,Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		int rs = dao.and_login(map);
		return rs;
	}
	//getAnd_perfInfo 비콘 접근 해당 공연정보
	public TcatPerformanceVO getAnd_perfInfo(Map<String,Object> map) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		TcatPerformanceVO rs = dao.getAnd_perfInfo(map);
		return rs;
	}
	//getAnd_ticketingNow 비콘 접근 해당 예매정보
	public ArrayList<TcatTicketingVO> getAnd_ticketingNow(Map<String,Object> map){
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		ArrayList<TcatTicketingVO> rs = dao.getAnd_ticketingNow(map);
		return rs;
	}
	//getPer_id
	public String getPer_id(String hall_id) {
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		String rs = dao.getPer_id(hall_id);
		return rs;
	}

	//현석이형
	@Override
	public ArrayList<TcatTicketingVO> searchTcat01(Map<String,String> map) {
		ArrayList<TcatTicketingVO> dtos=null;
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dtos=dao.searchTcat01(map);
		//System.out.println("ticet_date:"+dtos.get(0).getTicet_date());
		return dtos;

	}
	
	//dk android
	@Override
	public TcatPerformanceVO and_perf(Map<String,Object> map) {
		TcatPerformanceVO dto = null;
		
		JMHGuestDAO dao = Configuration.getMapper(JMHGuestDAO.class);
		dto = dao.and_perf(map);
		
		return dto;
	}


}
