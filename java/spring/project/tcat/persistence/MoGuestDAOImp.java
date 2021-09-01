package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.config.Configuration;

@Repository
public class MoGuestDAOImp implements MoGuestDAO{
	
	//핫리스트 가져오기 
	public ArrayList<TcatPerformanceVO> hotList(String category){
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		dtos=dao.hotList(category);
		return dtos;
	}
	//좌석정보 가져오기	

	@Override
	public ArrayList<TcatPerformanceVO> ticketSeat(int per_id) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		System.out.println("tickeSeatDao--------");
		dtos=dao.ticketSeat(per_id);
		System.out.println("tickeSeatDao--------");
		return dtos;
	}
	
	/* 좌석 예매정보 가져오기 */
	@Override
	public ArrayList<TcatPerformanceVO> ticketPerformanceSeat(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		System.out.println("ticketPerformanceSeat--------");
		dtos=dao.ticketPerformanceSeat(map);
		System.out.println("ticketPerformanceSeat--------");
		return dtos;
	}
	
	
	
	//사진게시판 리스트 숫자 가져오기
	@Override
	public int photoBoarderListCnt(int category) {
		// TODO Auto-generated method stub
		int cnt=0;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		cnt=dao.photoBoarderListCnt(category);
		return cnt;
	}

	

	//사진게시판 리스트 가져오기
	@Override
	public ArrayList<TcatBoardVO> photoBoarderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.photoBoarderList(map);
		 return dtos;
	}

	//사진게시판 답글 올리기
	@Override
	public int photoBoarderCommentWrite(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.photoBoarderCommentWrite(vo);
		return cnt;
	}

	//사진게시판 답글 가져오기
	@Override
	public ArrayList<TcatBoardVO> photoBoarderComment(int categoryComment) {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.photoBoarderComment(categoryComment);
		 return dtos;
	}

	
	//사진 게시판 업로드
	@Override
	public int insertPhotoBoarder(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.insertPhotoBoarder(vo);
		return cnt;
	}


	
	//사진 게시판 삭제
	@Override
	public int photoBorderDelete(int notice_num) {
		// TODO Auto-generated method stub
		int cnt =0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.photoBorderDelete(notice_num);
		return cnt;
	}

	//사진게시판 수정
	@Override
	public int noMoPhotoBoarder(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt =0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.noMoPhotoBoarder(vo);
		return cnt;
	}

	//영상게시판리스트 갯수 가져오기
	@Override
	public int movieBoarderListCnt(int category) {
		// TODO Auto-generated method stub
		int cnt=0;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		cnt=dao.movieBoarderListCnt(category);
		return cnt;
	}
	
	//영상게시판 리스트 가져오기
	@Override
	public ArrayList<TcatBoardVO> movieBoarderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.movieBoarderList(map);
		 return dtos;
	}
	


	//영상게시판 답글 가져오기
	@Override
	public ArrayList<TcatBoardVO> movieBoarderComment(int categoryComment) {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.movieBoarderComment(categoryComment);
		 return dtos;
	}

	//영상게시판 답글 올리기
	@Override
	public int MovieBoarderCommentWrite(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.MovieBoarderCommentWrite(vo);
		return cnt;
	}
	//영상게시판 게시하기
	@Override
	public int insertMovieBoarder(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.insertMovieBoarder(vo);
		return cnt;
	}
	
	//영상게시판 수정
	@Override
	public int noMoMovieBoarder(TcatBoardVO vo) {
		// TODO Auto-generated method stub
		int cnt =0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.noMoMovieBoarder(vo);
		return cnt;
	}
	//메인 화면 후기 게시판
	@Override
	public ArrayList<TcatBoardVO> mainComentBoarderList() {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.mainComentBoarderList();
		return dtos;
	}
	//메인 화면 공지사항 게시판 

	@Override
	public ArrayList<TcatBoardVO> mainServiceBoardList() {
		// TODO Auto-generated method stub
		 ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.mainServiceBoardList();
		return dtos;
	}
	//카테고리별 게시판 사진메뉴
	@Override
	public ArrayList<TcatBoardVO> categoryPhotoList(int category) {
		// TODO Auto-generated method stub
		ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.categoryPhotoList(category);
		return dtos;
	}
	//카테고리별 게시판 영상메뉴	
	@Override
	public ArrayList<TcatBoardVO> categoryMovieList(int category) {
		// TODO Auto-generated method stub
		ArrayList<TcatBoardVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.categoryMovieList(category);
		return dtos;
	}

	@Override
	public int categoryListCnt(int category) {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.categoryListCnt(category);
		return cnt;
	}

	//우선순위별 상품진열 갯수
	@Override
	public int firstGradeListCnt(String category) {
		// TODO Auto-generated method stub
		int cnt=0;
		MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		cnt=dao.firstGradeListCnt(category);
		return cnt;
	}

	//우선순위별 상품 진열리스트
	@Override
	public ArrayList<TcatPerformanceVO> firstGradeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.firstGradeList(map);
		return dtos;
	}

	//상품순위
	@Override
	public ArrayList<TcatPerformanceVO> performanceSaleRating(String category) {
		// TODO Auto-generated method stub
		ArrayList<TcatPerformanceVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.performanceSaleRating(category);
		return dtos;
	}
	//스토어 핫리스트
	@Override
	public ArrayList<TcatDiscBuyVO> storeHotList() {
		// TODO Auto-generated method stub
		ArrayList<TcatDiscBuyVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.storeHotList();
		return dtos;
	}

	//스토어 순위
	@Override
	public ArrayList<TcatDiscBuyVO> storeSaleRating() {
		// TODO Auto-generated method stub
		ArrayList<TcatDiscBuyVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.storeSaleRating();
		return dtos;
	}

	//스토어 우선순위별 상품진열갯수
	@Override
	public int firstGradeStoreListCnt() {
		// TODO Auto-generated method stub
		int cnt=0;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 cnt=dao.firstGradeStoreListCnt();
		return cnt;
	}
	//스토어 우선 순위별 상품 진열

	@Override
	public ArrayList<TcatDiscBuyVO> firstGradeStoreList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		ArrayList<TcatDiscBuyVO> dtos=null;
		 MoGuestDAO dao = Configuration.getMapper(MoGuestDAO.class);
		 dtos=dao.firstGradeStoreList(map);
		return dtos;
	}
	

	
	
	
}
