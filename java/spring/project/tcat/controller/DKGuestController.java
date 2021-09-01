package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.DKGuestService;

@Controller
public class DKGuestController {
	
	@Autowired
	DKGuestService dkService;
	
	//고객센터메인화면
	@RequestMapping("qnaBoardMain")
	public String qnaBoardMain(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardMain");
		req.getSession().setAttribute("page", "qnaBoardMain");
		return "tcat/serviceCenter/qnaBoardMain";
	}
	
	//게시판글 불러오기
	@RequestMapping("qnaBoardList")
	public String qnaBoardList(HttpServletRequest req,Model model) {
		System.out.println("qnaBoardList");
		req.setAttribute("url", "qnaBoardList");
		dkService.qnaBoardList(req, model);
		req.getSession().setAttribute("page", "qnaBoardList");
		return "tcat/serviceCenter/qnaBoardList";
	}
	
	//1:1게시판불러오기
	@RequestMapping("qnaOneToOneboard")
	public String qnaOneToOneboard(HttpServletRequest req,Model model) {
		System.out.println("qnaOneToOneboard");
		req.setAttribute("url", "qnaOneToOneboard");
		dkService.qnaOneToOneList(req, model);
		req.getSession().setAttribute("page", "qnaOneToOneboard");
		return "tcat/serviceCenter/qnaOneToOneboard";
		
	}
	
	//공지사항
	@RequestMapping("noticeBoard")
	public String noticeBoard(HttpServletRequest req,Model model) {
		System.out.println("noticeBoard");
		req.setAttribute("url", "noticeBoard");
		dkService.noticeList(req, model);
		
		return "tcat/serviceCenter/noticeBoard";
	}
	
	//공지사항 상세보기
	@RequestMapping("noticeContent")
	public String noticeContent(HttpServletRequest req,Model model) {
		System.out.println("noticeBoard");
		
		dkService.noticeContetnt(req, model);
		
		return "tcat/serviceCenter/noticeContent";
	}
		
	
	//상세글보기
	@RequestMapping("qnaContent")
	public String qnaContent(HttpServletRequest req,Model model) {
		System.out.println("qnaContent");
		//상세글보기
		dkService.qnaContent(req, model);
		//댓글리스트불러오기
		dkService.commnetList(req,model);
		//req.getSession().setAttribute("page", "qnaContent");
		return "tcat/serviceCenter/qnaContent";
	}
	
	//1:1게시판 상세보기
	@RequestMapping("oneToOneContent")
	public String oneToOneContent(HttpServletRequest req,Model model) {
		System.out.println("oneToOneContent");
		
		//상세글보기
		dkService.qnaContent(req, model);
		
		//댓글리스트불러오기
		dkService.commnetList(req,model);
		
		return "tcat/serviceCenter/oneToOneContent";
	}
	
	//댓글달기
	@RequestMapping("qnaCommentWrite")
	public String qnaCommentWrite(HttpServletRequest req,Model model) {
		System.out.println("qnaCommentWrite");
		
		dkService.qnaCommentWrite(req, model);
		
		//상세글보기 service
		dkService.qnaContent(req, model);
		//댓글리스트
		dkService.commnetList(req,model);
		
		return "tcat/serviceCenter/qnaContent";
	}
	
	//댓글삭제
	@RequestMapping("deleteComment")
	public String deleteComment(HttpServletRequest req,Model model) {
		System.out.println("deleteComment");
		//댓글삭제
		dkService.commentDelete(req, model);
		//상세글불러오기
		dkService.qnaContent(req, model);
		//댓글리스트
		dkService.commnetList(req,model);
		
		return "tcat/serviceCenter/qnaContent";
	}
	
	//Q&A 게시글 작성
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm(HttpServletRequest req,Model model) {
		System.out.println("qnaWriteForm");
		
		
		return "tcat/serviceCenter/qnaWriteForm";
	}
	
	//게시글작성처리페이지
	@RequestMapping("qnaWritePro")
	public String qnaWritePro(HttpServletRequest req,Model model) {
		System.out.println("qnaWritePro");
		
		dkService.insertWrite(req, model);
		
		return "tcat/serviceCenter/qnaWritePro";
	}
	
	//Q&A 게시글 작성
	@RequestMapping("oneToOneWriteForm")
	public String oneToOneWriteForm(HttpServletRequest req,Model model) {
		System.out.println("oneToOneWriteForm");
		
		
		return "tcat/serviceCenter/oneToOneWriteForm";
	}
	
	//게시글작성처리페이지
	@RequestMapping("oneToOneWritePro")
	public String oneToOneWritePro(HttpServletRequest req,Model model) {
		System.out.println("oneToOneWritePro");
		
		dkService.insertWrite_one(req, model);
		
		return "tcat/serviceCenter/oneToOneWritePro";
	}
	
	//Q&A글수정페이지
	@RequestMapping("qnaWriteUpdate")
	public String qnaWriteUpdate(HttpServletRequest req,Model model) {
		System.out.println("qnaWriteUpdate");
		
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		model.addAttribute("service_num", service_num);
		
		return "tcat/serviceCenter/qnaWriteUpdateForm";
	}
	//Q&A글수정처리
	@RequestMapping("qnaWriteUpdatePro")
	public String qnaWriteUpdatePro(HttpServletRequest req,Model model) {
		System.out.println("qnaWriteUpdatePro");
		
		/*int service_num = Integer.parseInt(req.getParameter("service_num"));
		model.addAttribute("service_num", service_num);*/
		dkService.qnaWriteUpdate(req, model);
		
		return "tcat/serviceCenter/qnaWriteUpdatePro";
	}
	
	//Q&A글삭제페이지 qnaWriteDelete
	@RequestMapping("qnaWriteDelete")
	public String qnaWriteDelete(HttpServletRequest req,Model model) {
		System.out.println("qnaWriteDelete");
		
		dkService.qnaWriteDelete(req, model);
		
		return "tcat/serviceCenter/qnaWriteDeletePro";
	}
	
	//1:1글수정페이지
	@RequestMapping("oneWriteUpdate")
	public String oneWriteUpdate(HttpServletRequest req,Model model) {
		System.out.println("oneWriteUpdate");
		
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		model.addAttribute("service_num", service_num);
		
		return "tcat/serviceCenter/oneWriteUpdateForm";
	}
	
	//1:1글수정처리     /*oneWriteUpdatePro*/
	@RequestMapping("oneWriteUpdatePro")
	public String oneWriteUpdatePro(HttpServletRequest req,Model model) {
		System.out.println("oneWriteUpdatePro");
		
		/*int service_num = Integer.parseInt(req.getParameter("service_num"));
		model.addAttribute("service_num", service_num);*/
		dkService.oneWriteUpdate(req, model);
		
		return "tcat/serviceCenter/oneWriteUpdatePro";
	}
	
	//1:1글삭제페이지 qnaWriteDelete
	@RequestMapping("oneWriteDelete")
	public String oneWriteDelete(HttpServletRequest req,Model model) {
		System.out.println("oneWriteDelete");
		
		dkService.qnaWriteDelete(req, model);
		
		return "tcat/serviceCenter/oneWriteDeletePro";
	}
	
	//////////////////////////////////////////////////////////////////
	
	
	
}
