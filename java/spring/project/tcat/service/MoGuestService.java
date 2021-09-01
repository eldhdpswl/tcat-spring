package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MoGuestService {
	
	//핫리스트 출력
	public void hotList(HttpServletRequest req,Model model);
	//좌석정보 가져오기
	public void ticketSeat(HttpServletRequest req,Model model);
	//사진게시판 리스트 가져오기
	public void photoBoarderList(HttpServletRequest req,Model model);
	//사진게시판 답글 달기
	public void photoBoarderCommentWrite(HttpServletRequest req,Model model);
	//사진게시판 게시하기
	public void insertPhotoBoarder(MultipartHttpServletRequest req,Model model);
	//사진게시판 삭제
	public void photoBorderDelete(HttpServletRequest req,Model model);
	// 사진 게시판 수정하기
	public void noMoPhotoBoarder(MultipartHttpServletRequest req,Model model);
	//영상게시판 리스트 가져오기
	public void movieBoarderList(HttpServletRequest req,Model model);
	//영상게시판 답글 달기
	public void MovieBoarderCommentWrite(HttpServletRequest req,Model model);
	//영상게시판 게시하기
	public void insertMovieBoarder(HttpServletRequest req,Model model);
	
	//영상게시판 삭제
	public void movieBorderDelete(HttpServletRequest req,Model model);
	//영상게시판 수정
	public void noMoMovieBoarder(HttpServletRequest req,Model model);
	//메인화면 출력데이터 
	public void guestMainList(HttpServletRequest req,Model model);
	
	// 메인리스트
	public void categoryMainList(HttpServletRequest req,Model model);
	//스토어메인리스트
	public void storeCategoryMainList(HttpServletRequest req,Model model);
	

	
}
