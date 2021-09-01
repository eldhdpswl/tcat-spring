package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DKGuestService {
	
	//Q&A글목록불러오기
	public void qnaBoardList(HttpServletRequest req, Model model);
	
	//1:1게시판불러오기
	public void qnaOneToOneList(HttpServletRequest req, Model model);
	
	//상세페이지
	public void qnaContent(HttpServletRequest req, Model model);
	
	//1:1게시판 상세페이지
	//public void oneToOneContent(HttpServletRequest req, Model model);
	
	//댓글리스트 불러오기
	public void commnetList(HttpServletRequest req, Model model);
	
	//댓글삭제
	public void commentDelete(HttpServletRequest req, Model model);
	
	//댓글달기
	public void qnaCommentWrite(HttpServletRequest req, Model model);
	
	//Q&A게시글쓰기
	public void insertWrite(HttpServletRequest req, Model model);
	
	//1:1게시판 게시글 쓰기
	public void insertWrite_one(HttpServletRequest req, Model model);
	
	//공지사항 불러오기
	public void noticeList(HttpServletRequest req, Model model);
	
	//공지사항 상세보기
	public void noticeContetnt(HttpServletRequest req, Model model);
	
	//Q&A글수정 처리페이지
	public void qnaWriteUpdate(HttpServletRequest req, Model model);
	
	//Q&A글삭제 처리페이지
	public void qnaWriteDelete(HttpServletRequest req, Model model);
	
	//1:1글수정 처리페이지
	public void oneWriteUpdate(HttpServletRequest req, Model model);
	
	//글작성 처리페이지
	
	//글삭제 처리페이지
}
