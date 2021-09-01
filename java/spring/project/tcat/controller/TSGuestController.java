package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HostService;
import spring.project.tcat.service.JMHGuestService;
import spring.project.tcat.service.TSGuestService;

@Controller
public class TSGuestController {
	@Autowired
	TSGuestService TSGService;
	@Autowired
	HostService hService;

	// 게스트 정보수정 페이지(비밀번호 확인)
	@RequestMapping("myModifyForm")
	public String myModifyForm(HttpServletRequest req, Model model) {
		System.out.println("myModifyForm");
		return "tcat/memberMyPage/myModifyForm";
	}

	// 게스트 비밀번호 체크
	@RequestMapping("pwdCheck")
	public String pwdCheck(HttpServletRequest req, Model model) {
		System.out.println("pwdCheck");

		System.out.println("ssssssssssssssssss" + req.getParameter("member_pwd"));
		TSGService.pwdCheck(req, model);

		return "tcat/memberMyPage/myModifyForm";
	}

	// 게스트 정보가져오기
	@RequestMapping("myModifyPro")
	public String myModifyPro(HttpServletRequest req, Model model) {
		System.out.println("myModify");

		TSGService.myModifyPro(req, model);

		return "tcat/memberMyPage/myModify";
	}

	// 게스트 정보수정
	@RequestMapping("myModifyUpdate")
	public String myModifyUpdate(HttpServletRequest req, Model model) {
		System.out.println("myModifyUpdate");

		TSGService.myModifyUpdate(req, model);

		return "tcat/memberMyPage/myModifyForm";
	}

	// 회사 소개
	@RequestMapping("intro")
	public String intro(HttpServletRequest req, Model model) {
		System.out.println("intro");
		return "tcat/introCompany/intro";
	}

	// 회사 소개
	@RequestMapping("introCompany")
	public String introCompany(HttpServletRequest req, Model model) {
		System.out.println("introCompany");
		return "tcat/introCompany/introCompany";
	}

	// 회사 오시는 길
	@RequestMapping("introPath")
	public String introPath(HttpServletRequest req, Model model) {
		System.out.println("introPath");
		return "tcat/introCompany/introPath";
	}

	// 이메일 인증
	@RequestMapping("GuestEmailCheck")
	public String GuestEmailCheck(HttpServletRequest req, Model model) {
		System.out.println("GuestEmailCheck");

		hService.emailCheack(req, model);

		return "tcat/memberMyPage/GuestEmailCheck";
	}

	// 후기 게시판
	@RequestMapping("commentBoard")
	public String commentBoard(HttpServletRequest req, Model model) {
		System.out.println("commentBoard");
		TSGService.CommentList(req, model);

		return "tcat/commentBoard/commentBoard";
	}

	// 게스트 관람/후기 목록
	@RequestMapping("watchLatter")
	public String watchLatter(HttpServletRequest req, Model model) {
		System.out.println("watchLatter");

		TSGService.selectComment(req, model);

		return "tcat/content/watchLatter";
	}

	// 게스트 관람/후기 한줄평 쓰기
	@RequestMapping("commentWrite")
	public String commentWrite(HttpServletRequest req, Model model) {
		System.out.println("!!!!!!!!!____________________<<<<>>>>:" + req.getParameter("per_id"));
		System.out.println("commentWrite");

		TSGService.commentWrite(req, model);

		return "tcat/content/watchLatter";
	}

	// 게스트 스토어 상품/후기 목록
	@RequestMapping("watchLatterS")
	public String watchLatterS(HttpServletRequest req, Model model) {
		System.out.println("watchLatterS");

		TSGService.selectCommentS(req, model);

		return "tcat/content/watchLatterS";
	}

	// 게스트 관람/후기 한줄평 쓰기
	@RequestMapping("commentWriteS")
	public String commentWriteS(HttpServletRequest req, Model model) {

		System.out.println("commentWriteS");
		TSGService.commentWriteS(req, model);

		return "tcat/content/watchLatterS";
	}

	////////////////////// 태성 1/25 start////////////////////////////
	// 고객이 한줄평 본인꺼 수정하기 - 공연용
	@RequestMapping("commentModify")
	public String commentModify(HttpServletRequest req, Model model) {
		System.out.println("commentModify");

		TSGService.commentModify(req, model);
		TSGService.selectComment(req, model);

		return "tcat/content/watchLatter";
	}

	@Autowired
	JMHGuestService mhService;

	// 고객이 한줄평 본인꺼 삭제하기 - 공연용
	@RequestMapping("commentDel")
	public String commentDel(HttpServletRequest req, Model model) {
		System.out.println("commentDel");

		TSGService.commentDel(req, model);

		mhService.getWishListIn(req, model);
		// 상품정보 가져오기
		mhService.getContent(req, model);

		TSGService.selectComment(req, model);

		return "tcat/content/contentMain";
	}

	// 고객이 한줄평 본인꺼 수정하기 - 스토어용
	@RequestMapping("commentModifyS")
	public String commentModifyS(HttpServletRequest req, Model model) {
		System.out.println("commentModifyS");

		TSGService.commentModifyS(req, model);
		TSGService.selectCommentS(req, model);

		return "tcat/content/watchLatterS";
	}

	// 고객이 한줄평 본인꺼 삭제하기 - 스토어용
	@RequestMapping("commentDelS")
	public String commentDelS(HttpServletRequest req, Model model) {
		System.out.println("commentDelS");

		TSGService.commentDelS(req, model);

		mhService.getWishListIn(req, model);
		// 상품정보 가져오기
		mhService.getContent_store(req, model);

		TSGService.selectCommentS(req, model);

		return "tcat/content/contentMain_store";
	}
	////////////////////// 태성 1/25 end////////////////////////////
}
