package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.CartVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.SaleVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class HSGuestDAOImpl implements HSGuestDAO{

	@Override
	public int MemberIdCheack(String member_id) {
		int IdCheack=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		IdCheack=dao.MemberIdCheack(member_id);
		return IdCheack;
	}

	@Override
	public int insertMember(MemberVO dto) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		
		cnt=dao.insertMember(dto);
		return cnt;
	}
	@Override
	public int searchDate(String searchDate) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		
		cnt=dao.searchDate(searchDate);
		return cnt;
	}
	@Override
	public int daySearchCnt(String searchDate) {
		int cnt=0;

		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(searchDate==null) {
			cnt=dao.daySearchCnt(searchDate);
		}else {
			cnt=dao.searchDate(searchDate);
		}
		System.out.println("cnt="+cnt);
		return cnt;
	}
	@Override
	public ArrayList<TcatPerformanceVO> searchList(Map<String,Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.searchList(map);
		return dtos;
	}
	@Override
	public ArrayList<TcatPerformanceVO> daySearchList(Map<String,Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("searchDate")==null) {
			dtos=dao.daySearchList(map);
		}else {
			dtos=dao.searchList(map);
		}
		
		return dtos;
	}
	//지역별 검색 리스트 갯수 가져오기 place가 null이 들어올때
	@Override
	public int placeNullCnt() {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.placeNullCnt();
		return cnt;
	}
	//지역별 검색 리스트 갯수 가져오기 place가 null이 아닐때
	@Override
	public int placeCnt(Map<String,Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("place")==null) {
			cnt=dao.placeNullCnt();
		}else {
			cnt=dao.placeCnt(map);
		}
		return cnt;
	}

	@Override
	public ArrayList<TcatPerformanceVO> placeNullList(Map<String, Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.placeNullList(map);
		return dtos;
	}

	@Override
	public ArrayList<TcatPerformanceVO> placeList(Map<String, Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		if(map.get("place")==null) {
			dtos=dao.placeNullList(map);
		}else {
			dtos=dao.placeList(map);
		}
		return dtos;
	}

	@Override
	public int insertCart(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.insertCart(map);
		return cnt;
	}

	@Override
	public int cartCnt(String member_id) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt =dao.cartCnt(member_id);
		return cnt;
	}

	@Override
	public ArrayList<CartVO> cartList(Map<String, Object> map) {
		ArrayList<CartVO> dtos=null;
		System.out.println("111");
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		System.out.println("222");
		dtos=dao.cartList(map);
		return dtos;
	}

	@Override
	public ArrayList<CartVO> cartListDtos(Map<String,Object> map) {
		ArrayList<CartVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.cartListDtos(map);
		return dtos;
	}

	@Override
	public void insertdelevaryInfo(Map<String, Object> map) {

		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertdelevaryInfo(map);

	}

	@Override
	public int maxdel_num() {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.maxdel_num();
		return cnt;
	}
	
	@Override
	public TcatPerformanceVO payList(int per_id) {
		TcatPerformanceVO vo=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		vo=dao.payList(per_id);
		return vo;
	}

	@Override
	public int vipCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.vipCount(map);
		return cnt;
	}

	@Override
	public int rCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.rCount(map);
		return cnt;
	}

	@Override
	public int sCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.sCount(map);
		return cnt;
	}

	@Override
	public int aCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.aCount(map);
		return cnt;
	}

	@Override
	public int bCount(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.bCount(map);
		return cnt;
	}

	@Override
	public void insertStorePay(Map<String, Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertStorePay(map);
	}

	@Override
	public void cartDel(Map<String,Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.cartDel(map);
	}

	@Override
	public MemberVO getMember(String member_id) {
		MemberVO dto=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dto=dao.getMember(member_id);
		return dto;
	}

	@Override
	public ArrayList<SaleVO> getSale() {
		ArrayList<SaleVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.getSale();
		return dtos;
	}

	@Override
	public void insertdel(Map<String, Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertdel(map);
	}

	@Override
	public void insertTicket(Map<String, Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.insertTicket(map);
	}

	@Override
	public TcatPerDiscVO DiscInfo(int disc_code) {
		TcatPerDiscVO dto=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dto=dao.DiscInfo(disc_code);
		return dto;
	}

	@Override
	public MemberVO MemInfo(String member_id) {
		MemberVO dto=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dto=dao.MemInfo(member_id);
		return dto;
	}

	@Override
	public int searchCart(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.searchCart(map);
		return cnt;
	}

	@Override
	public int updateCart(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.updateCart(map);
		return cnt;
	}

	@Override
	public void updateCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.updateCount(map);
	}

	@Override
	public void changeCount(Map<String, Object> map) {
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.changeCount(map);
	}

	@Override
	public CartVO cheackCartList(Map<String, Object> map) {
		CartVO dto=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dto=dao.cheackCartList(map);
		return dto;
	}

	@Override
	public int deleteCart(Map<String, Object> map) {
		int cnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		cnt=dao.deleteCart(map);
		return cnt;
	}

	@Override
	public void memberPoint(Map<String, Object> map){
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dao.memberPoint(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		int count=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		count=dao.getCount(map);
		return count;		
	}

	@Override
	public int searchPerCnt(String search) {
		int searchCnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		searchCnt=dao.searchPerCnt(search);
		return searchCnt;
	}

	@Override
	public ArrayList<TcatPerformanceVO> searchPerList(Map<String, Object> map) {
		ArrayList<TcatPerformanceVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.searchPerList(map);
		return dtos;
	}

	@Override
	public int searchStoreCnt(String search) {
		int searchCnt=0;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		searchCnt=dao.searchStoreCnt(search);
		return searchCnt;
	}

	@Override
	public ArrayList<TcatPerDiscVO> searchStoreList(Map<String, Object> map) {
		ArrayList<TcatPerDiscVO> dtos=null;
		HSGuestDAO dao=Configuration.getMapper(HSGuestDAO.class);
		dtos=dao.searchStoreList(map);
		return dtos;
	}

}
