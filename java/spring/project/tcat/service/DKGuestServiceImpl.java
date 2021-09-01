package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.persistence.DKGuestDAO;
@Service
public class DKGuestServiceImpl implements DKGuestService{
	
	@Autowired
	DKGuestDAO dao;
	
	//글목록불러오기
	@Override
	public void qnaBoardList(HttpServletRequest req, Model model) {
		System.out.println("qnaBoardList()");
		
		String service_div = null;
		
		String url = (String) req.getAttribute("url");
		String cDev = req.getParameter("cDev");
		System.out.println(cDev);
		String keyword = req.getParameter("keyword");
		String login_id = (String)req.getSession().getAttribute("login_id");
		System.out.println("url: "+url);
		if(cDev==null) {
			cDev="0";
		}else if(keyword==null) {
			keyword="";
		}
		
		System.out.println(keyword);
		
		if(url.equals("qnaOneToOneboard")) {
			service_div = "1:1게시판";
			System.out.println("service_div : "+service_div);
		}
		/*else if(url.equals("stockDelete_concert")) {
			mDev= "콘서트";
			System.out.println("mDev:"+mDev);
		}else if(url.equals("stockDelete_classic")) {
			mDev= "클래식";
			System.out.println("mDev:"+mDev);
		}else if(url.equals("stockDelete_drama")) {
			mDev= "연극";
			System.out.println("mDev:"+mDev);
		}*/
		
		int pageSize = 9;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
		
		int OneToOneCnt=0;
		
		System.out.println("qnaBoardList9_2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("service_div", service_div);
		map.put("cDev", cDev);
		map.put("keyword", keyword);
		map.put("login_id", login_id);
		
		//글갯수 구하기
		//cnt = 0;
		
		
		cnt = dao.getQnaBoardCnt(map);
		
		/*if(url.equals("qnaOneToOneboard")) {
			OneToOneCnt = dao.getQnaOneToOneCnt(map);
			model.addAttribute("OneToOneCnt", OneToOneCnt);
			System.out.println("OneToOneCnt : " + OneToOneCnt);
		}*/
		
		System.out.println("qnaBoardList9_3");
		//req.setAttribute("cnt", cnt);
		model.addAttribute("cnt", cnt);
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";  //첫페이지 1페이지로 설정
		}
		
		//현재페이지
		currentPage = (Integer.parseInt(pageNum));  
		
		//페이지 갯수
		//페이지갯수+나머지  //나머지 갯수가 있으면 한페이지를 더 줘야된다.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		//현재페이지에서 -1을 하는 이유는 0부터시작하기때문
		start = (currentPage -1) * pageSize +1;
		
		//현재페이지 끝번호
		end = start + pageSize -1;
		
		if(end > cnt) end=cnt;
		
		number = cnt - (currentPage - 1) * pageSize; //출력할 글번호... 최신글(큰 페이지)가 1page 
		
		System.out.println("qnaBoardList9_4");
		
		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getQnaBoardList(map);
			
			model.addAttribute("dtos", dtos);
			
		}
		
		/*if(OneToOneCnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getQnaOneToOneList(map);
			
			model.addAttribute("dtos", dtos);
			
		}*/
		
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock -1; 
		if(endPage > pageCount) endPage = pageCount;
		
		//req.setAttribute("cnt", cnt); //글갯수
		//req.setAttribute("number", number); //글번호
		//req.setAttribute("pageNum", pageNum); //페이지번호
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt--------"+cnt);
		
		if(cnt > 0) {
			//req.setAttribute("startPage", startPage);  //시작페이지
			//req.setAttribute("endPage", endPage);//마지막페이지
			//req.setAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			//req.setAttribute("pageCount", pageCount);//페이지 갯수
			//req.setAttribute("currentPage", currentPage);//현재 페이지
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		
		}
		
	}
	
	//상세페이지
	@Override
	public void qnaContent(HttpServletRequest req, Model model) {
		System.out.println("service_num");
		//상세페이지부분(시작)
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		System.out.println("service_num"+ service_num);
		TcatBoardVO dto = dao.getQnaContent(service_num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("service_num", service_num);
		//상세페이지부분(끝)
		
		//댓글부분(시작)
		/*int pageSize = 9;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
		*/
	}
	
	//댓글리스트 불러오기
	@Override
	public void commnetList(HttpServletRequest req, Model model) {
		//댓글부분(시작)
		/*int pageSize = 9;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
*/		
		String service_num = req.getParameter("service_num");
		
		ArrayList<TcatBoardVO> dtos2 = dao.commentList(service_num);
		System.out.println("dtos2" +dtos2.size());
		model.addAttribute("dtos2", dtos2);
	}
	
	
	//댓글달기
	@Override
	public void qnaCommentWrite(HttpServletRequest req, Model model) {
		System.out.println("qnaCommentWrite()");
		//String login_id = (String)req.getSession().getAttribute("login_id");
		
		//<input type="hidden" value="${dto.service_num}" name="service_num">
		//<input type="hidden" value="${dto.service_div}" name="service_div">
		//<input type="hidden" value="${dto.member_id}" name="login_id">
		//<input type="hidden" value="${dto.service_title}" name="service_title">
		//<input type="hidden" value="${dto.getQuestionCon()}" name="QuestionCon">
		int cnt=0;
		
		String login_id = (String)req.getSession().getAttribute("login_id");
		
		String service_div = req.getParameter("service_div");
		String service_title = req.getParameter("service_title");
		String QuestionCon = req.getParameter("QuestionCon");
		
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		String AnsersCon = req.getParameter("AnsersCon");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("login_id", login_id);
		map.put("service_div", service_div);
		map.put("service_title", service_title);
		map.put("QuestionCon", QuestionCon);
		
		map.put("service_num", service_num);
		map.put("AnsersCon", AnsersCon);
		
		cnt= dao.qnaCommentWrite(map);
		System.out.println("service_num: "+ service_num);
		dao.serviceUpdate(service_num);
		
		if(cnt!=0) {
			System.out.println("댓글달기성공!");
			
		}
		
	}
	
	//댓글삭제
	@Override
	public void commentDelete(HttpServletRequest req, Model model) {
		System.out.println("commentDelete()");
		int cnt=0;
		int service_num = Integer.parseInt(req.getParameter("delService_num"));
		cnt = dao.commentDelete(service_num);
		if(cnt!=0) {
			System.out.println("댓글삭제성공!");
		}
	}
	
	//1:1게시판불러오기
	@Override
	public void qnaOneToOneList(HttpServletRequest req, Model model) {
		System.out.println("qnaOneToOneList()");
		
		String service_div = null;
		
		String url = (String) req.getAttribute("url");
		String cDev = req.getParameter("cDev");
		String keyword = req.getParameter("keyword");
		String login_id = (String)req.getSession().getAttribute("login_id");
		
		if(cDev==null) {
			cDev="0";
		}else if(keyword==null) {
			keyword="";
		}
				
		if(url.equals("qnaOneToOneboard")) {
			service_div = "1:1게시판";
			System.out.println("service_div : "+service_div);
		}
		
		
		int pageSize = 9;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("service_div", service_div);
		map.put("cDev", cDev);
		map.put("keyword", keyword);
		map.put("login_id", login_id);
		
		//글갯수 구하기
		//cnt = 0;
		
		
		cnt = dao.getQnaOneToOneCnt(map);
		//req.setAttribute("cnt", cnt);
		model.addAttribute("cnt", cnt);
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";  //첫페이지 1페이지로 설정
		}
		
		//현재페이지
		currentPage = (Integer.parseInt(pageNum));  
		
		//페이지 갯수
		//페이지갯수+나머지  //나머지 갯수가 있으면 한페이지를 더 줘야된다.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		//현재페이지에서 -1을 하는 이유는 0부터시작하기때문
		start = (currentPage -1) * pageSize +1;
		
		//현재페이지 끝번호
		end = start + pageSize -1;
		
		if(end > cnt) end=cnt;
		
		number = cnt - (currentPage - 1) * pageSize; //출력할 글번호... 최신글(큰 페이지)가 1page 
		
		
		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getQnaOneToOneList(map);
			
			model.addAttribute("dtos", dtos);
			
		}
		
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock -1; 
		if(endPage > pageCount) endPage = pageCount;
		
		//req.setAttribute("cnt", cnt); //글갯수
		//req.setAttribute("number", number); //글번호
		//req.setAttribute("pageNum", pageNum); //페이지번호
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt--------"+cnt);
		
		if(cnt > 0) {
			//req.setAttribute("startPage", startPage);  //시작페이지
			//req.setAttribute("endPage", endPage);//마지막페이지
			//req.setAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			//req.setAttribute("pageCount", pageCount);//페이지 갯수
			//req.setAttribute("currentPage", currentPage);//현재 페이지
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		
		}
		
	}
	
	//게시글쓰기
	@Override
	public void insertWrite(HttpServletRequest req, Model model) {
		String login_id = (String)req.getSession().getAttribute("login_id");
		String wDev = req.getParameter("wDev");
		//String oneToOneBoard = req.getParameter("oneToOneBoard");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", login_id);
		map.put("wDev", wDev);
		//map.put("oneToOneBoard", oneToOneBoard);
		map.put("service_title", title);
		map.put("QuestionCon", content);
		
		int cnt = dao.insertBoard(map);
		
		model.addAttribute("cnt", cnt);
		
	}
	
	//1:1게시판 게시글 쓰기
	@Override
	public void insertWrite_one(HttpServletRequest req, Model model) {
		String login_id = (String)req.getSession().getAttribute("login_id");
		//String wDev = req.getParameter("wDev");
		String oneToOneBoard = req.getParameter("oneToOneBoard");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", login_id);
		//map.put("wDev", wDev);
		map.put("oneToOneBoard", oneToOneBoard);
		map.put("service_title", title);
		map.put("QuestionCon", content);
		
		int cnt = dao.insertBoard_one(map);
		
		model.addAttribute("cnt", cnt);
	}
	
	//공지사항 불러오기
	@Override
	public void noticeList(HttpServletRequest req, Model model) {
		System.out.println("noticeList()");
		
		//String service_div = null;
		
		String url = (String) req.getAttribute("url");
		String cDev = req.getParameter("cDev");
		System.out.println(cDev);
		String keyword = req.getParameter("keyword");
		//String login_id = (String)req.getSession().getAttribute("login_id");
		System.out.println("url: "+url);
		if(cDev==null) {
			cDev="0";
		}else if(keyword==null) {
			keyword="";
		}
		
		System.out.println(keyword);
		
		
		int pageSize = 9;    //한 페이지당 출력할 글 갯수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt=0;			 //글 갯수
		int start=0;		 //현재 페이지 글시작번호
		int end=0;			 //현재 페이지 글마지막번호
		int number=0;		 //출력할 글번호
		String pageNum = null;  //페이지번호
		int currentPage = 0;    //현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage = 0; 		//시작페이지
		int endPage=0;  		//마지막 페이지	
		
		//System.out.println("qnaBoardList9_2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("service_div", service_div);
		map.put("cDev", cDev);
		map.put("keyword", keyword);
		//map.put("login_id", login_id);
		
		//글갯수 구하기
		//cnt = 0;
		
		
		cnt = dao.getNoticeCnt(map);
		
		/*if(url.equals("qnaOneToOneboard")) {
			OneToOneCnt = dao.getQnaOneToOneCnt(map);
			model.addAttribute("OneToOneCnt", OneToOneCnt);
			System.out.println("OneToOneCnt : " + OneToOneCnt);
		}*/
		
		System.out.println("qnaBoardList9_3");
		//req.setAttribute("cnt", cnt);
		model.addAttribute("cnt", cnt);
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";  //첫페이지 1페이지로 설정
		}
		
		//현재페이지
		currentPage = (Integer.parseInt(pageNum));  
		
		//페이지 갯수
		//페이지갯수+나머지  //나머지 갯수가 있으면 한페이지를 더 줘야된다.
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		//현재페이지에서 -1을 하는 이유는 0부터시작하기때문
		start = (currentPage -1) * pageSize +1;
		
		//현재페이지 끝번호
		end = start + pageSize -1;
		
		if(end > cnt) end=cnt;
		
		number = cnt - (currentPage - 1) * pageSize; //출력할 글번호... 최신글(큰 페이지)가 1page 
		
		System.out.println("qnaBoardList9_4");
		
		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getNoticeList(map);
			
			model.addAttribute("dtos", dtos);
			
		}
		
		/*if(OneToOneCnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<TcatBoardVO> dtos = dao.getQnaOneToOneList(map);
			
			model.addAttribute("dtos", dtos);
			
		}*/
		
		startPage = (currentPage/pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock -1; 
		if(endPage > pageCount) endPage = pageCount;
		
		//req.setAttribute("cnt", cnt); //글갯수
		//req.setAttribute("number", number); //글번호
		//req.setAttribute("pageNum", pageNum); //페이지번호
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt--------"+cnt);
		
		if(cnt > 0) {
			//req.setAttribute("startPage", startPage);  //시작페이지
			//req.setAttribute("endPage", endPage);//마지막페이지
			//req.setAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			//req.setAttribute("pageCount", pageCount);//페이지 갯수
			//req.setAttribute("currentPage", currentPage);//현재 페이지
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		
		}
	}
	
	//공지사항 상세보기
	@Override
	public void noticeContetnt(HttpServletRequest req, Model model) {
		System.out.println("noticeContetnt()");
		//상세페이지부분(시작)
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		System.out.println("notice_num : "+ notice_num);
		
		TcatBoardVO dto = dao.getNoticeContent(notice_num);
		dao.qnaReadCnt(notice_num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("notice_num", notice_num);
		
	}
	
	//Q&A글수정 상세페이지
	@Override
	public void qnaWriteUpdate(HttpServletRequest req, Model model) {
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		
		//String login_id = (String)req.getSession().getAttribute("login_id");
		String wDev = req.getParameter("wDev");
		//String oneToOneBoard = req.getParameter("oneToOneBoard");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("member_id", login_id);
		map.put("service_div", wDev);
		//map.put("oneToOneBoard", oneToOneBoard);
		map.put("service_title", title);
		map.put("QuestionCon", content);
		map.put("service_num", service_num);
		
		//int cnt = dao.insertBoard(map);
		
		int cnt = dao.getBoardUpdateList(map);
		model.addAttribute("cnt", cnt);
	}
	
	//Q&A글삭제 처리페이지
	@Override
	public void qnaWriteDelete(HttpServletRequest req, Model model) {
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		
		//String login_id = (String)req.getSession().getAttribute("login_id");
		//String wDev = req.getParameter("wDev");
		//String oneToOneBoard = req.getParameter("oneToOneBoard");
		//String title = req.getParameter("title");
		//String content = req.getParameter("content");
		
		
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("member_id", login_id);
		//map.put("service_div", wDev);
		//map.put("oneToOneBoard", oneToOneBoard);
		//map.put("service_title", title);
		//map.put("QuestionCon", content);
		//map.put("service_num", service_num);
		
		//int cnt = dao.insertBoard(map);
		
		//int cnt = dao.getBoardUpdateList(map);
		int cnt = dao.getBoardDeleteList(service_num);
		
		model.addAttribute("cnt", cnt);
	}
	
	//1:1글수정 처리페이지
	@Override
	public void oneWriteUpdate(HttpServletRequest req, Model model) {
		int service_num = Integer.parseInt(req.getParameter("service_num"));
		
		//String login_id = (String)req.getSession().getAttribute("login_id");
		String oneToOneBoard = req.getParameter("oneToOneBoard");
		//String oneToOneBoard = req.getParameter("oneToOneBoard");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("member_id", login_id);
		map.put("service_div", oneToOneBoard);
		//map.put("oneToOneBoard", oneToOneBoard);
		map.put("service_title", title);
		map.put("QuestionCon", content);
		map.put("service_num", service_num);
		
		//int cnt = dao.insertBoard(map);
		
		int cnt = dao.getBoardUpdateList(map);
		model.addAttribute("cnt", cnt);
		
	}
	
	//1:1게시판 상세페이지
	/*@Override
	public void oneToOneContent(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}*/
	
	

	

	

}
