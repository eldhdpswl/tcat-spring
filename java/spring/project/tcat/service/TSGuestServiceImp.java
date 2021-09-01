package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HostDAO;
import spring.project.tcat.persistence.HostDAOImp;
import spring.project.tcat.persistence.TSGuestDAOImp;

@Service
public class TSGuestServiceImp implements TSGuestService{
	@Autowired
	TSGuestDAOImp tsGDAO;
	
	//회원정보 수정 비밀번호 체크
	@Override
	public void pwdCheck(HttpServletRequest req, Model model) {
		String strId = (String) req.getSession().getAttribute("login_id");
		String strPwd = req.getParameter("member_pwd");	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int pwdCheck = tsGDAO.pwdCheck(map);
		/*
		if(pwdCheck == 1 ) {
			MemberVO vo = tsGDAO.myModify(strId);
			model.addAttribute("vo", vo);
		}
		System.out.println("서비스단 pwdCheck --->:"+pwdCheck);*/
		model.addAttribute("pwdCheck", pwdCheck);
		
	}
	//회원정보 상세 페이지
		@Override
		public void myModifyPro(HttpServletRequest req, Model model) {
		MemberVO vo = new MemberVO();
		
		String id = (String) req.getSession().getAttribute("login_id");
		vo=tsGDAO.memberSelect(id);
		
		req.setAttribute("vo", vo);
	
		}
		// 회원정보 수정
		@Override
		public void myModifyUpdate(HttpServletRequest req, Model model) {
			String id = (String) req.getSession().getAttribute("login_id");
			String member_name = req.getParameter("member_name");
			
			String member_hp = req.getParameter("member_hp");
			
			String postNum=req.getParameter("postNum");
			String detailAddr=req.getParameter("detailAddr");    
			String addr=req.getParameter("addr");//주소-daum주소검색
			
			String member_addr="["+postNum+"]"+addr+" "+detailAddr;
			
			String member_email=req.getParameter("member_email");//이메일
			
			MemberVO vo = new MemberVO();
			vo.setMember_id(id);
			vo.setMember_pwd(req.getParameter("member_pwd"));
			/*vo.setMember_name(req.getParameter("member_name"));*/
			
			/*String hp1 = req.getParameter("hp1");
			String hp2 = req.getParameter("hp2");
			String hp3 = req.getParameter("hp3");
			if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
				member_hp = hp1 + "-" + hp2 + "-" + hp3;
			}*/
			vo.setMember_hp(member_hp);
			vo.setMember_addr(member_addr);
			System.out.println("주소나와라~~~ 서비스다 여기!!! ---> :"+member_addr);
			vo.setMember_email(member_email);
			/*String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			member_email = email1 + "@" + email2;*/
			
			
			
			/*vo.setMember_gender(req.getParameter("member_gender"));
			vo.setMember_birth(req.getParameter("member_birth"));*/
		
			System.out.println(
						"member_pwd--->"+vo.getMember_pwd()+"\n"+
						/*"member_name"+vo.getMember_name()+"\n"+*/
						"member_hp--->"+vo.getMember_hp()+"\n"+
						/*"member_addr"+vo.getMember_addr()+"\n"+*/
						"member_email--->"+vo.getMember_email()+"\n"
			);
			int cnt = tsGDAO.updateMember(vo);
			model.addAttribute("cnt",cnt);
			
		}
		//전체 관람후기 목록
		@Override
		public void CommentList(HttpServletRequest req, Model model) {
			
			int pageSize = 10; // 한 페이지당 출력할 글 개수
			int pageBlock = 3; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			int Hcnt = 0;
			String sDev = "";
			String keyword = "";
			
			// 검색추가(01/16)-------------------

			sDev = req.getParameter("sDev");
			System.out.println("sDev -----> :" + sDev);

			keyword = req.getParameter("keyword");
			System.out.println("keyword -----> :" + keyword);

			String commentCategory = "";

			if (sDev == null) {
				sDev = "0";
			}

			if (keyword == null) {
				keyword = "";
			}
			try {
				commentCategory = req.getParameter("commentCategory");
			} catch (Exception e) {

			}
			if (commentCategory == null) {
				commentCategory = "공연";
			}
			System.out.println("게스트 모든 후기 서비스 첫번째 출입니다. ");
			if (commentCategory.equals("공연")) {
				Hcnt = 1;
			} else if (commentCategory.equals("스토어")) {
				Hcnt = 4;
			}
			
			System.out.println("TSGuset 관람후기 목록 서비스 첫번째 출입니다. ");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("Hcnt", commentCategory); // category에서 보낸 cnt값
			map.put("keyword", keyword);
			map.put("sDev", sDev);
			System.out.println("keyword" + map.get("keyword") + "\n" + "sDev" + sDev);
			
			if (commentCategory.equals("스토어")) {
				cnt = tsGDAO.commentS(map);
			} else {
				cnt = tsGDAO.comment(map);
			}
			/*cnt = hDao.getStore(map);*/
			

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum+Host service --> categoryList-->: " + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
				end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				/* Map<String, Object> map = new HashMap<String, Object>(); */
				map.put("start", start);
				map.put("end", end);
				System.out.println("end !!!!!!!!!----->:" + end);
				/*
				 * map.put("Hcnt", category); // category에서 보낸 cnt값 map.put("mdev", mDev);
				 * map.put("keyword", keyword);
				 */

				// 표 목록 조회
				System.out.println("map" + map.get("start"));
				ArrayList<TcatBoardVO> dtos = tsGDAO.commentBoard(map);
				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;

			System.out.println("commentCategory=" + commentCategory);

			model.addAttribute("sDev", sDev);
			model.addAttribute("keyword", keyword);
			model.addAttribute("commentCategory", commentCategory); // cnt == 글 개수
			model.addAttribute("Hcnt", Hcnt); // cnt == 글 개수
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
				model.addAttribute("startPage", startPage); // startPage 시작페이지
				model.addAttribute("endPage", endPage); // 마지막 페이지
				model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
				model.addAttribute("pageCount", pageCount); // 페이지 개수
				model.addAttribute("currentPage", currentPage); // 현재 페이지

			}
		}
		
		//관람후기 (해당 공연 목록)
		@Override
		public void selectComment(HttpServletRequest req, Model model) {
			int per_id = Integer.parseInt(req.getParameter("per_id"));
			System.out.println("per_idper_idper_idper_idper_idper_id:"+per_id);
			int pageSize = 5; // 한 페이지당 출력할 글 개수
			int pageBlock = 3; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			String perf_title=tsGDAO.getperfTitlePlz(per_id);

			System.out.println("perf_title--------서비스 단입니다-----> :"+perf_title);
			
		
			System.out.println("TSGuset 관람후기(공연별) 목록 서비스 첫번째 출입니다. ");
			Map<String, Object> map = new HashMap<String, Object>();

		
			map.put("perf_title", perf_title);
			
			cnt = tsGDAO.selectComment(map);
		

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum+Host service --> categoryList-->: " + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
				end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				map.put("start", start);
				map.put("end", end);
				System.out.println("end !!!!!!!!!----->:" + end);

				// 표 목록 조회
				System.out.println("map" + map.get("start"));
				ArrayList<TcatBoardVO> dtos = tsGDAO.selectCommentBoard(map);
				
				for(int i =0; i<dtos.size(); i++) {
	                  int o=dtos.get(i).getNotice_num();
	                  System.out.println("perf_title==="+o);
	               }
				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;

			model.addAttribute("perf_title", perf_title);
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
			model.addAttribute("perf_title", perf_title);
			model.addAttribute("startPage", startPage); // startPage 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
			}	
			model.addAttribute("per_id",per_id);
		}
		
		//고객단 후기 한줄평 쓰기
				@Override
				public void commentWrite(HttpServletRequest req, Model model) {
					int cnt = 0;
					
					int per_id = Integer.parseInt(req.getParameter("per_id"));
					System.out.println("---서비스단-----per_id-------> :"+per_id);
					
					String perf_title = req.getParameter("perf_title");         
					System.out.println("---서비스단-----perf_title-------> :"+perf_title);
					
					String contents = req.getParameter("contents");
					System.out.println("---서비스단-----contents-------> :"+contents);
					
					String member_id = (String) req.getSession().getAttribute("login_id");
					System.out.println("---서비스단-----member_id-------> :"+member_id);
					
					TcatBoardVO vo = new TcatBoardVO();
					vo.setPer_id(per_id);
					vo.setNotice_title(perf_title);
					vo.setContents(contents);
					vo.setMember_id(member_id);
					
					cnt =tsGDAO.commentWrite(vo);
					
				}
				
		//고객단 스토어 후기 한줄평 목록	
		@Override
		public void selectCommentS(HttpServletRequest req, Model model) {
			
			int disc_code = Integer.parseInt(req.getParameter("disc_code"));
			/*System.out.println("disc_code 서비스~~~~~~~~~~~~~~~~~~~~:"+disc_code);*/
			int pageSize = 5; // 한 페이지당 출력할 글 개수
			int pageBlock = 3; // 한 블럭당 페이지 개수

			int cnt = 0; // 글 개수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글 번호
			String pageNum = null; // 페이지 번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 개수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			
			String disc_title =tsGDAO.getListdisc_title(disc_code);
			System.out.println("disc_title--------서비스 단입니다-----> :"+disc_title);
			// 검색추가(01/16)-------------------

			
		
			System.out.println("TSGuset 관람후기(스토어별) 목록 서비스 첫번째 출입니다. ");
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("disc_title", disc_title);
			
			cnt = tsGDAO.selectCommentS(map);
		

			System.out.println("cnt :" + cnt);
			pageNum = req.getParameter("pageNum");
			System.out.println("pageNum" + pageNum);

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}
			System.out.println("pageNum+Host service --> categoryList-->: " + pageNum);
			currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

			// pageCnt = 12 / 5 + 1 // 나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 개수 + 나머지

			// 1 = (1-1) * 5 + 1
			// 6 = (2-1) * 5 + 1
			// 11 = (3-1) * 5 + 1
			// 21 = (5-1) * 5 + 1
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호

			// 5 = 1 + 5 - 1;
			// 10 = 6 + 5 - 1;
			// 21 = 17 + 5 - 1;
			end = start + pageSize - 1; // 현재페이지 끝번호

			System.out.println("start : " + start);
			System.out.println("end : " + end);

			if (end > cnt)
				end = cnt;

			// 1 = 25 - (5-1) * 5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호..최신글(큰페이지)가 1p

			System.out.println("number : " + number);
			System.out.println("cnt : " + cnt);
			System.out.println("currentPage : " + currentPage);
			System.out.println("pageSize : " + currentPage);

			if (cnt > 0) {
				map.put("start", start);
				map.put("end", end);
				System.out.println("end !!!!!!!!!----->:" + end);

				// 표 목록 조회
				System.out.println("map" + map.get("start"));
				ArrayList<TcatBoardVO> dtos = tsGDAO.selectCommentBoardS(map);
				req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (5%3) == 0

			endPage = startPage + pageBlock - 1;// 4+3-1=6
			if (endPage > pageCount)
				endPage = pageCount;

			model.addAttribute("disc_title", disc_title);
			model.addAttribute("cnt", cnt); // cnt == 글 개수
			model.addAttribute("number", number); // number == 글번호
			model.addAttribute("pageNum", pageNum); // pageNum 페이지 번호

			if (cnt > 0) {
			model.addAttribute("disc_title", disc_title);
			model.addAttribute("startPage", startPage); // startPage 시작페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
			}	
			model.addAttribute("disc_code",disc_code);
			
		}
		//고객단 스토어 후기 한줄평 쓰기
		@Override
		public void commentWriteS(HttpServletRequest req, Model model) {
			int cnt = 0;
			
			int disc_code = Integer.parseInt(req.getParameter("disc_code"));
			System.out.println("---서비스단-----disc_code-------> :"+disc_code);
			
			String disc_title = req.getParameter("disc_title");         
			System.out.println("---서비스단-----disc_title-------> :"+disc_title);
			
			String contents = req.getParameter("contents");
			System.out.println("---서비스단-----contents-------> :"+contents);
			
			String member_id = (String) req.getSession().getAttribute("login_id");
			System.out.println("---서비스단-----member_id-------> :"+member_id);
			
			TcatBoardVO vo = new TcatBoardVO();
			vo.setDisc_code(disc_code);
			vo.setDisc_title(disc_title);
			vo.setContents(contents);
			vo.setMember_id(member_id);
			
			cnt =tsGDAO.commentWriteS(vo);
		}
		
		// 고객이 본인 후기 쓴거 수정하기 - 공연용
		@Override
		public void commentModify(HttpServletRequest req, Model model) {
		int cnt = 0;
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		String contents = req.getParameter("contents");	
		System.out.println("notice_num==="+notice_num);
		System.out.println("contents==="+contents);
		
		TcatBoardVO vo = new TcatBoardVO();
		vo.setNotice_num(notice_num);
		vo.setContents(contents);
		cnt = tsGDAO.commentsModify(vo);
		model.addAttribute("cnt",cnt);
		
		}
		// 고객이 쓴 후기 삭제 - 공연용
		@Override
		public void commentDel(HttpServletRequest req, Model model) {
			int commentDel = 0;
			
			int notice_num = Integer.parseInt(req.getParameter("notice_num"));
			commentDel = tsGDAO.commentDeldao(notice_num);
			
			model.addAttribute("commentDel", commentDel);
			
		}
		// 고객이 본인 후기 쓴거 수정하기 - 스토어용
		@Override
		public void commentModifyS(HttpServletRequest req, Model model) {
			int cnt = 0;
			int notice_num = Integer.parseInt(req.getParameter("notice_num"));
			String contents = req.getParameter("contents");	
			System.out.println("notice_num==="+notice_num);
			System.out.println("contents==="+contents);
			
			TcatBoardVO vo = new TcatBoardVO();
			vo.setNotice_num(notice_num);
			vo.setContents(contents);
			cnt = tsGDAO.commentsModifyS(vo);
			model.addAttribute("cnt",cnt);
			
		}
		// 고객이 쓴 후기 삭제 - 스토어용
		@Override
		public void commentDelS(HttpServletRequest req, Model model) {
			int commentDelS = 0;
			
			int notice_num = Integer.parseInt(req.getParameter("notice_num"));
			commentDelS = tsGDAO.commentDeldaoS(notice_num);
			
			model.addAttribute("commentDel", commentDelS);
			
		}
			
		
}