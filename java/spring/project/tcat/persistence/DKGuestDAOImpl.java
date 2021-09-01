package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.config.Configuration;

@Repository
public class DKGuestDAOImpl implements DKGuestDAO{
	
	//Q&A글갯수구하기
	@Override
	public int getQnaBoardCnt(Map<String, Object> map) {
		int cnt=0;
		System.out.println("qnaBoardList7");
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		System.out.println("qnaBoardList8");
		cnt = dao.getQnaBoardCnt(map);
		System.out.println("qnaBoardList9");
		return cnt;
	}
	
	//Q&A게시글 목록 조회
	@Override
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		System.out.println("qnaBoardList9_1");
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getQnaBoardList(map);
		System.out.println("qnaBoardList10");
		return dtos;
	}
	
	//상세페이지
	@Override
	public TcatBoardVO getQnaContent(int service_num) {
		TcatBoardVO dto = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dto = dao.getQnaContent(service_num);
		
		return dto;
	}
	
	//댓글리스트 불러오기
	@Override
	public ArrayList<TcatBoardVO> commentList(String service_num) {
		ArrayList<TcatBoardVO> dtos = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.commentList(service_num);
		
		return dtos;
	}
	
	//댓글달기
	@Override
	public int qnaCommentWrite(Map<String, Object> map) {
		int cnt = 0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.qnaCommentWrite(map);
		
		return cnt;
	}
	
	//댓글삭제
	@Override
	public int commentDelete(int service_num) {
		int cnt = 0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt= dao.commentDelete(service_num);
		
		return cnt;
	}
		
	
	//1:1게시판 글갯수 구하기
	@Override
	public int getQnaOneToOneCnt(Map<String, Object> map) {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.getQnaOneToOneCnt(map);
		
		return cnt;
	}
	
	//1:1게시판 게시글 목록조회
	@Override
	public ArrayList<TcatBoardVO> getQnaOneToOneList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getQnaOneToOneList(map);
		
		return dtos;
	}
	
	//Q&A게시글 작성
	@Override
	public int insertBoard(Map<String, Object> map) {
		int cnt = 0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.insertBoard(map);
		
		return cnt;
	}
	
	//1:1게시글 작성
	@Override
	public int insertBoard_one(Map<String, Object> map) {
		int cnt = 0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.insertBoard_one(map);
		
		return cnt;
	}
	
	//공지사항 글갯수구하기
	@Override
	public int getNoticeCnt(Map<String, Object> map) {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.getNoticeCnt(map);
		
		return cnt;
	}
	
	//공지사항 글목록불러오기
	@Override
	public ArrayList<TcatBoardVO> getNoticeList(Map<String, Object> map) {
		ArrayList<TcatBoardVO> dtos = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dtos = dao.getNoticeList(map);
		
		return dtos;
	}
	
	//공지사항 상세페이지
	@Override
	public TcatBoardVO getNoticeContent(int notice_num) {
		TcatBoardVO dto = null;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dto = dao.getNoticeContent(notice_num);
		
		return dto;
	}
	
	//댓글달리면 답변상태 update
	@Override
	public void serviceUpdate(int service_num) {
		//int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dao.serviceUpdate(service_num);
		
		//return cnt;
	}

	//조회수 증가
	@Override
	public void qnaReadCnt(int notice_num) {
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		dao.qnaReadCnt(notice_num);
		
	}
	
	//게시글 수정
	@Override
	public int getBoardUpdateList(Map<String, Object> map) {
		int cnt = 0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt=dao.getBoardUpdateList(map);
		
		return cnt;
	}
	
	//게시글 삭제
	@Override
	public int getBoardDeleteList(int service_num) {
		int cnt=0;
		
		DKGuestDAO dao = Configuration.getMapper(DKGuestDAO.class);
		cnt = dao.getBoardDeleteList(service_num);
		
		return cnt;
	}
	
	
	
}
