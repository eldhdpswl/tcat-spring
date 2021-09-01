package spring.project.tcat.persistence;

import java.util.ArrayList;

import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;

public interface YMGuestDAO {
	
	//고객 구매횟수 
	public int mRating(String strId);
	//등급 업데이트
	public int mRatingUpdate(Map<String,Object> map);
	//A등급
	public int dayCnt(Map<String,Object> map);
	//S등급
	public int dayCnt1(Map<String,Object> map);
	
	//이벤트 갯수
	public int eventCnt();
	//이벤트
	public ArrayList<TcatBoardVO> eventGuestList(Map<String,Object> map);
	
	//이벤트 상세
	public ArrayList<TcatBoardVO> eventGuestForm(int num);
	
	//이벤트 삭제
	public int eventDeleteCnt(int num);
	//이벤트 수정
	public int eventUpdateCnt(Map<String,Object> map);
	//이벤트 등록
	public int eventAddCnt(Map<String,Object> map);
}
