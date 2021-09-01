package spring.project.tcat.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

public interface HSGuestService {
	//아이디 있는지 체크
	public void MemberIdCheack(HttpServletRequest req,Model model);
	//게스트 가입
	public void insertMember(HttpServletRequest req,Model model);
	//날짜별 리스트 가져오기
	public void daySearch(HttpServletRequest req,Model model);
	//지역별 리스트 가져오기
	public void placeList(HttpServletRequest req,Model model);
	//장바구니에 담기
	public void insertCart(HttpServletRequest req,Model model);
	//장바구니 리스트 가져오기
	public void cartList(HttpServletRequest req,Model model);
	//예매할 상세정보 가져오기
	public void payList(HttpServletRequest req,Model model);
	//스토어 구매
	public void sussessPay(HttpServletRequest req,Model model);
	//회차 클릭했을때 그회차의 남은좌석 가져오기
	public void RemainingSeats(HttpServletRequest req,Model model);
	//공연구매 할인탭 할인조건,고객정보 가져오기
	public void sale(HttpServletRequest req,Model model);
	//공연예매
	public void insertTicket(HttpServletRequest req,Model model);
	//스토어 바로구매 페이지
	public void directBuy(HttpServletRequest req,Model model);
	//바로구매 결제
	public void directPay(HttpServletRequest req,Model model);
	//장바구니에 담긴 물품의 갯수 변경하기
	public void changeCount(HttpServletRequest req,Model model);
	//스토어 장바구니 구매 [체크값]
	public void storePay(HttpServletRequest req,Model model,@RequestParam (value = "valueArrTest[]") List<String> valueArr);
	//스토어 장바구니 삭제
	public void deleteCart(HttpServletRequest req,Model model);
	//메인 검색 공연리스트
	public void searchPerList(HttpServletRequest req,Model model);
	//메인 검색 스토어리스트
	public void searchStoreList(HttpServletRequest req,Model model);
}
