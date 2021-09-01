package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.CartVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.SaleVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface HSGuestDAO {
	//회원가입 폼에서 id체크부분
	public int MemberIdCheack(String member_id);
	//회원가입 insert부분
	public int insertMember(MemberVO dto);
	//날짜별 검색 리스트 갯수 가져오기
	public int daySearchCnt(String searchDate);
	//날짜별 검색 리스트 캘린더를 클릭시 날짜가 들어왔을때
	public int searchDate(String searchDate);
	//날짜별 검색 리스트 가져오기
	public ArrayList<TcatPerformanceVO> daySearchList(Map<String,Object> map);
	//날짜별 검색 리스트 캘린더를 클릭시 날짜가 들어왔을때
	public ArrayList<TcatPerformanceVO> searchList(Map<String,Object> map);
	//지역별 검색 리스트 갯수 가져오기 place가 null이 들어올때
	public int placeNullCnt();
	//지역별 검색 리스트 갯수 가져오기 place가 null이 아닐때
	public int placeCnt(Map<String,Object> map);
	//지역별 검색 리스트 가져오기 place가 null이 들어올때
	public ArrayList<TcatPerformanceVO> placeNullList(Map<String,Object> map);
	//지역별 검색 리스트 가져오기 place가 null이 아닐때
	public ArrayList<TcatPerformanceVO> placeList(Map<String,Object> map);
	//장바구니에 담기
	public int insertCart(Map<String,Object> map);
	//장바구니 리스트 갯수 가져오기
	public int cartCnt(String member_id);
	//장바구니 리스트 가져오기
	public ArrayList<CartVO> cartList(Map<String,Object> map);
	//구매하는 고객의 장바구니 리스트에 담긴 목록 가져오기
	public ArrayList<CartVO> cartListDtos(Map<String,Object> map);
	//배송정보 추가
	public void insertdelevaryInfo(Map<String,Object> map);
	//배송번호 가져오기
	public int maxdel_num();
	//예매하려고 하는 공연정보 가져오기
	public TcatPerformanceVO payList(int per_id);
	//예매하려고 하는 날짜+공연회차에 좌석이 얼마남았는지 가져오기[vip]
	public int vipCount(Map<String,Object> map);
	//예매하려고 하는 날짜+공연회차에 좌석이 얼마남았는지 가져오기[r]
	public int rCount(Map<String,Object> map);
	//예매하려고 하는 날짜+공연회차에 좌석이 얼마남았는지 가져오기[s]
	public int sCount(Map<String,Object> map);
	//예매하려고 하는 날짜+공연회차에 좌석이 얼마남았는지 가져오기[a]
	public int aCount(Map<String,Object> map);
	//예매하려고 하는 날짜+공연회차에 좌석이 얼마남았는지 가져오기[b]
	public int bCount(Map<String,Object> map);
	//장바구니 구매
	public void insertStorePay(Map<String,Object> map);
	//장바구니 목록 제거
	public void cartDel(Map<String,Object> map);
	//고객정보 가져오기
	public MemberVO getMember(String member_id);
	//할인정보 가져오기
	public ArrayList<SaleVO> getSale();
	//공연배송정보 insert
	public void insertdel(Map<String,Object> map);
	//공연예매
	public void insertTicket(Map<String,Object> map);
	//스토어 제품 정보 가져오기
	public TcatPerDiscVO DiscInfo(int disc_code);
	//고객정보 가져오기
	public MemberVO MemInfo(String member_id);
	//장바구니에 담기전 담아져있는게 있는지 확인
	public int searchCart(Map<String,Object> map);
	//장바구니 목록에 이미 있을때 수량 더해주기
	public int updateCart(Map<String,Object> map);
	//재고목록에서 갯수 감소
	public void updateCount(Map<String,Object> map);
	//장바구니에 담긴 갯수 변경
	public void changeCount(Map<String,Object> map);
	//장바구니에서 체크값 가져오기
	public CartVO cheackCartList(Map<String,Object> map);
	//장바구니 삭제
	public int deleteCart(Map<String,Object> map);
	//고객 포인트 증가
	public void memberPoint(Map<String, Object> map);
	//스토어 재고수량 가져오기
	public int getCount(Map<String, Object> map);
	//공연정보에서 검색한 갯수 가져오기
	public int searchPerCnt(String search);
	//공연정보에서 검색한 리스트 가져오기
	public ArrayList<TcatPerformanceVO> searchPerList(Map<String, Object> map);
	//스토어정보에서 검색한 갯수 가져오기
	public int searchStoreCnt(String search);
	//스토어정보에서 검색한 리스트 가져오기
	public ArrayList<TcatPerDiscVO> searchStoreList(Map<String, Object> map);
}
