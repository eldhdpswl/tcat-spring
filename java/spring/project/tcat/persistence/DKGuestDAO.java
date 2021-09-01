package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.TcatBoardVO;

public interface DKGuestDAO {
	
	//Q&A글갯수구하기
	public int getQnaBoardCnt(Map<String, Object> map); 
	
	//Q&A게시글 목록 조회
	public ArrayList<TcatBoardVO> getQnaBoardList(Map<String, Object> map);
	
	//공지사항 글갯수구하기
	public int getNoticeCnt(Map<String, Object> map);
	
	//공지사항 글목록불러오기
	public ArrayList<TcatBoardVO> getNoticeList(Map<String, Object> map);
	
	//상세페이지
	public TcatBoardVO getQnaContent(int service_num);
	
	//댓글리스트 불러오기
	public ArrayList<TcatBoardVO> commentList(String service_num);
	
	//댓글달기
	public int qnaCommentWrite(Map<String, Object> map);
	
	//댓글삭제
	public int commentDelete(int service_num);
	
	//1:1게시판 글갯수 구하기
	public int getQnaOneToOneCnt(Map<String, Object> map); 
	
	//1:1게시판 게시글 목록조회
	public ArrayList<TcatBoardVO> getQnaOneToOneList(Map<String, Object> map);
	
	//Q&A게시글 작성
	public int insertBoard(Map<String, Object> map);
	
	//1:1게시글 작성
	public int insertBoard_one(Map<String, Object> map);
	
	//공지사항 상세페이지
	public TcatBoardVO getNoticeContent(int notice_num);
	
	//댓글달리면 답변상태 update
	public void serviceUpdate(int service_num);
	
	//조회수 증가
	public void qnaReadCnt(int notice_num);
	
	//Q&A게시글 수정
	public int getBoardUpdateList(Map<String, Object> map);
	
	//Q&A게시글 삭제
	public int getBoardDeleteList(int service_num);
	
	/*//1:1게시글 수정
	public int getBoardUpdateList(Map<String, Object> map);
	
	//1:1게시글 삭제
	public int getBoardDeleteList(int service_num);*/
}
