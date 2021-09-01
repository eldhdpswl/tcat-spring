package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerformanceVO;

public interface MoGuestDAO {

	//핫리스트 가져오기 
		public ArrayList<TcatPerformanceVO> hotList(String category);
	//좌석정보 가져오기	
		public ArrayList<TcatPerformanceVO> ticketSeat(int per_id);
	//좌석예매정보 가져오기
		public ArrayList<TcatPerformanceVO> ticketPerformanceSeat(Map<String,Object> map);	
	//사진게시판 리스트 숫자 가져오기
		public int photoBoarderListCnt(int category);
	//사진게시판 리스트 가져오기
		public ArrayList<TcatBoardVO> photoBoarderList(Map<String,Object> map);
	//사진게시판 답글 달기
		public int photoBoarderCommentWrite(TcatBoardVO vo);
	//사진게시판 답글 가져오기
		public ArrayList<TcatBoardVO> photoBoarderComment(int categoryComment);
	//사진게시판 업로드
		public int insertPhotoBoarder(TcatBoardVO vo);
	//사진게시판 삭제
		public int photoBorderDelete(int notice_num);
	//사진게시판 수정
		public int noMoPhotoBoarder(TcatBoardVO vo);
	//영상게시판 리스트 숫자가져오기
		public int movieBoarderListCnt(int category);
	//영상게시판 리스트 가져오기
		public ArrayList<TcatBoardVO> movieBoarderList(Map<String,Object> map);
	//영상게시판 답글 가져오기
		public ArrayList<TcatBoardVO> movieBoarderComment(int categoryComment);
	//영상게시판 답글 달기
		public int MovieBoarderCommentWrite(TcatBoardVO vo);	
	//영상게시판 업로드
		public int insertMovieBoarder(TcatBoardVO vo);
	//영상게시판 수정
		public int noMoMovieBoarder(TcatBoardVO vo);
	//메인 화면 후기 게시판
		public ArrayList<TcatBoardVO> mainComentBoarderList();
	//메인화면 공지사항 게시판
		public ArrayList<TcatBoardVO> mainServiceBoardList();
	//카테고리별 게시판 사진메뉴	
		public ArrayList<TcatBoardVO> categoryPhotoList(int category);	
	//카테고리별 게시판 영상메뉴	
		public ArrayList<TcatBoardVO> categoryMovieList(int category);
		public int categoryListCnt(int category);
	//우선순위별 상품진열 갯수
		public int firstGradeListCnt(String category);
	//우선순위별 상품 진열리스트
		public ArrayList<TcatPerformanceVO> firstGradeList(Map<String,Object> map);
	//상품순위
		public ArrayList<TcatPerformanceVO> performanceSaleRating(String category);
	//스토어 핫리스트
		public ArrayList<TcatDiscBuyVO> storeHotList();
	//스토어 순위
		public ArrayList<TcatDiscBuyVO> storeSaleRating();
	//스토어 우선순위별 상품진열갯수
		public int firstGradeStoreListCnt();
	//스토어 우선 순위별 상품 진열
		public ArrayList<TcatDiscBuyVO> firstGradeStoreList(Map<String,Object> map);
		

}
