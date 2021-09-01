package spring.project.tcat.persistence;



import java.util.ArrayList;


import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.config.Configuration;

@Repository
public class YMGuestDAOImpl implements YMGuestDAO{
	
	//고객 구매횟수
	@Override
	public int mRating(String strId) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.mRating(strId);
		return cnt;
	}
	//등급 업데이트
	@Override
	public int mRatingUpdate(Map<String,Object> map) {
		int upCnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		upCnt=dao.mRatingUpdate(map);
		return upCnt;
	}
	//A등급 1년 구매
	@Override
	public int dayCnt(Map<String, Object> map) {
		int sRank=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		sRank=dao.dayCnt(map);
		return sRank;
	}
	//S등급 1년 구매
	@Override
	public int dayCnt1(Map<String, Object> map) {
		int vRank=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		vRank=dao.dayCnt1(map);
		return vRank;
	}
	//이벤트갯수
	@Override
	public int eventCnt() {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.eventCnt();
		return cnt;
	}
	//이벤트
	@Override
	public ArrayList<TcatBoardVO> eventGuestList(Map<String,Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		dtos=dao.eventGuestList(map);
		return dtos;
	}
	//이벤트상세
	@Override
	public ArrayList<TcatBoardVO> eventGuestForm(int num) {
		ArrayList<TcatBoardVO> dto = null;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		dto=dao.eventGuestForm(num);
		return dto;
	}
	//이벤트삭제
	@Override
	public int eventDeleteCnt(int num) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.eventDeleteCnt(num);
		return cnt;
	}
	//이벤트수정
	@Override
	public int eventUpdateCnt(Map<String, Object> map) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		System.out.println("mapfdsf"+map);
		cnt=dao.eventUpdateCnt(map);
		return cnt;
	}
	//이벤트등록 eventAddCnt
	@Override
	public int eventAddCnt(Map<String, Object> map) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		
		cnt=dao.eventAddCnt(map);
		return cnt;
	}	
}
