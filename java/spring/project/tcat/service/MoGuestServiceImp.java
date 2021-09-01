package spring.project.tcat.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.MoGuestDAOImp;

@Service
public class MoGuestServiceImp implements MoGuestService {

	@Autowired
	MoGuestDAOImp MGDao;
	//핫리스트 가져오기
	@Override
	public void hotList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String category=null;
		category=req.getParameter("category");
		if(category==null) {
			category="뮤지컬";
		}
		ArrayList<TcatPerformanceVO> dtos=null;
		dtos=MGDao.hotList(category);
		model.addAttribute("dtos", dtos);
	}
	//좌석정보 가져오기
	@Override
	public void ticketSeat(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int per_id=Integer.parseInt(req.getParameter("per_id"));
		System.out.println(per_id);
		String srtRound=req.getParameter("round");
		System.out.println(srtRound);
		String ticet_date=req.getParameter("ticet_date");
		System.out.println(ticet_date);
		System.out.println("============");
		String[] roundArr=srtRound.split("회차/");
		int round=Integer.parseInt(roundArr[0]);
		System.out.println(round);
		Map<String,Object> map=new HashMap<String,Object>();
		ArrayList<TcatPerformanceVO> dtos=null;
		ArrayList<TcatPerformanceVO> dtos2=null;
		map.put("per_id", per_id);
		map.put("round", round);
		map.put("ticet_date", ticet_date);
		dtos=MGDao.ticketSeat(per_id);
		dtos2=MGDao.ticketPerformanceSeat(map);
		model.addAttribute("dtos", dtos);

		model.addAttribute("dtos2", dtos2);

	}
	//사진게시판 리스트 가져오기
	@Override
	public void photoBoarderList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int pageSize = 5; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 글시작번호
		int end = 0; // 현재 페이지 글마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int cnt=0;
		String strCategory=(String)req.getAttribute("category");
		System.out.println(strCategory);
		int category=Integer.parseInt(strCategory);
		cnt=MGDao.photoBoarderListCnt(category);
		model.addAttribute("categoryNum",category);
		pageNum = req.getParameter("pageNum");
		
		if (pageNum == null) {
		pageNum = "1"; // 첫페이지 1페이지로 설정
		}
		currentPage = (Integer.parseInt(pageNum)); // 현재페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
		end = start + pageSize - 1; // 현재페이지 끝번호
		if (end > cnt) {
		end = cnt;
		}
		number = cnt - (currentPage - 1) * pageSize;
		if (cnt > 0) {
		// 게시글 목록 조회
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("category", category);
			ArrayList<TcatBoardVO> dtos=MGDao.photoBoarderList(map);
			model.addAttribute("dtos", dtos);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
		if (currentPage % pageBlock == 0) {
		startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
		if (endPage > pageCount) {
		endPage = pageCount;
		}
		int categoryComment=0;
		if(category==31) {
			categoryComment=311;
		}else if(category==32) {
			categoryComment=321;
		}else if(category==33) {
			categoryComment=331;
		}else if(category==34) {
			categoryComment=341;
		}else if(category==35) {
			categoryComment=351;
		}else if(category==36) {
			categoryComment=361;
		}
		
		
		//사진게시판 답글 가져오기
		ArrayList<TcatBoardVO> dtos2=MGDao.photoBoarderComment(categoryComment);
		model.addAttribute("dtos2",dtos2);
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		}
	}//메소드 끝
	
	//사진게시판 답글 달기
	@Override
	public void photoBoarderCommentWrite(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String member_id=req.getParameter("member_id");
		int notice_num=Integer.parseInt(req.getParameter("notice_num"));
		String contents=req.getParameter("contents");
		String strcategory=(String)req.getAttribute("category");
		System.out.println(strcategory);
		int category=Integer.parseInt(strcategory);
		
		int categoryComment=0;
		if(category==31) {
			categoryComment=311;
		}else if(category==32) {
			categoryComment=321;
		}else if(category==33) {
			categoryComment=331;
		}else if(category==34) {
			categoryComment=341;
		}else if(category==35) {
			categoryComment=351;
		}else if(category==36) {
			categoryComment=361;
		}
		TcatBoardVO vo=new TcatBoardVO();
		vo.setCategoryComment(categoryComment);
		vo.setMember_id(member_id);
		vo.setNotice_num(notice_num);
		vo.setContents(contents);
		int cnt=0;
		cnt=MGDao.photoBoarderCommentWrite(vo);
		if(cnt!=0) {
			System.out.println("답글 업로드 완료");
		}
	}

	
	//사진게시판 게시하기
	@Override
	public void insertPhotoBoarder(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		MultipartFile file = req.getFile("board_Image");
		
		
		String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\Boarder\\";
		String saveDir = req.getRealPath("/resources/image/Boarder/");
		try {

			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			TcatBoardVO vo=new TcatBoardVO();
			String notice_title=req.getParameter("no_title");
			System.out.println(notice_title);
			String member_id=req.getParameter("mem_id");
			System.out.println(member_id);
			String contents=req.getParameter("no_content");
			String notice_image=file.getOriginalFilename();
			System.out.println(notice_image);
			int category=Integer.parseInt(req.getParameter("category"));
			vo.setCategory(category);
			vo.setNotice_title(notice_title);
			vo.setMember_id(member_id);
			vo.setContents(contents);
			vo.setNotice_image(notice_image);
			int cnt=0;
			cnt=MGDao.insertPhotoBoarder(vo);
			if(cnt!=0) {
				System.out.println("입력에 성공하셨습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			int error=1;
			req.setAttribute("error2", error);
		}
		
		
	}

	//사진게시판 삭제 
	@Override
	public void photoBorderDelete(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		int notice_num=Integer.parseInt(req.getParameter("notice_num"));
		int cnt=0;
		cnt=MGDao.photoBorderDelete(notice_num);
		if(cnt!=0) {
			System.out.println("삭제성공");
		}
	}
	
	//사진게시판 수정
		@Override
		public void noMoPhotoBoarder(MultipartHttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			MultipartFile file = null;
			file = req.getFile("noMoboard_Image");
			
			if(file!=null) {
			String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\Boarder\\";
			String saveDir = req.getRealPath("/resources/image/Boarder/");
			try {

				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
				TcatBoardVO vo=new TcatBoardVO();
				String notice_title=req.getParameter("noMo_title");
				int notice_num=Integer.parseInt(req.getParameter("monotice_num"));
				String contents=req.getParameter("noMo_content");
				String notice_image=file.getOriginalFilename();
				System.out.println(notice_image);
				
				vo.setNotice_num(notice_num);
				vo.setNotice_title(notice_title);
				vo.setContents(contents);
				vo.setNotice_image(notice_image);
				int cnt=0;
				cnt=MGDao.noMoPhotoBoarder(vo);
				if(cnt!=0) {
					System.out.println("입력에 성공하셨습니다.");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				int error=1;
				req.setAttribute("error2", error);
			}
			
			
		}else{
			TcatBoardVO vo=new TcatBoardVO();
			String notice_title=req.getParameter("noMo_title");
			String contents=req.getParameter("noMo_content");	
			int notice_num=Integer.parseInt(req.getParameter("monotice_num"));
			vo.setNotice_title(notice_title);
			vo.setContents(contents);
			vo.setNotice_num(notice_num);
			int cnt=0;
			cnt=MGDao.noMoPhotoBoarder(vo);
			if(cnt!=0) {
				System.out.println("입력에 성공하셨습니다.");
			}
		}
		
		}
	
		
		//영상게시판 리스트 가져오기
		@Override
		public void movieBoarderList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			int pageSize = 5; // 한 페이지당 출력할 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재페이지
			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작페이지
			int endPage = 0; // 마지막 페이지
			int cnt=0;
			String categoryStr=(String)req.getAttribute("category");
			int category=Integer.parseInt(categoryStr);
			cnt=MGDao.movieBoarderListCnt(category);
			model.addAttribute("categoryNum",category);
			pageNum = req.getParameter("pageNum");
			
			if (pageNum == null) {
			pageNum = "1"; // 첫페이지 1페이지로 설정
			}
			currentPage = (Integer.parseInt(pageNum)); // 현재페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
			end = start + pageSize - 1; // 현재페이지 끝번호
			if (end > cnt) {
			end = cnt;
			}
			number = cnt - (currentPage - 1) * pageSize;
			if (cnt > 0) {
			// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("category", category);
				ArrayList<TcatBoardVO> dtos=MGDao.movieBoarderList(map);
				model.addAttribute("dtos", dtos);
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
			}
			endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
			if (endPage > pageCount) {
			endPage = pageCount;
			}
			int categoryComment=0;
			if(category==21) {
				categoryComment=211;
			}else if(category==22) {
				categoryComment=221;
			}else if(category==23) {
				categoryComment=231;
			}else if(category==24) {
				categoryComment=241;
			}else if(category==25) {
				categoryComment=251;
			}else if(category==26) {
				categoryComment=261;
			}
			//사진게시판 답글 가져오기
			ArrayList<TcatBoardVO> dtos2=MGDao.movieBoarderComment(categoryComment);
			model.addAttribute("dtos2",dtos2);
			model.addAttribute("cnt", cnt);
			model.addAttribute("number", number);
			model.addAttribute("pageNum", pageNum);
			
			if (cnt > 0) {

			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			}
		}//메소드 끝
	
		//영상게시판 답글 달기
		@Override
		public void MovieBoarderCommentWrite(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			String member_id=req.getParameter("member_id");
			int notice_num=Integer.parseInt(req.getParameter("notice_num"));
			String contents=req.getParameter("contents");
			
			int category=Integer.parseInt(req.getParameter("category"));
			int categoryComment=0;
			if(category==21) {
				categoryComment=211;
			}else if(category==22) {
				categoryComment=221;
			}else if(category==23) {
				categoryComment=231;
			}else if(category==24) {
				categoryComment=241;
			}else if(category==25) {
				categoryComment=251;
			}else if(category==26) {
				categoryComment=261;
			}
			
			TcatBoardVO vo=new TcatBoardVO();
			vo.setCategoryComment(categoryComment);
			vo.setMember_id(member_id);
			vo.setNotice_num(notice_num);
			vo.setContents(contents);
			int cnt=0;
			cnt=MGDao.MovieBoarderCommentWrite(vo);
			if(cnt!=0) {
				System.out.println("답글 업로드 완료");
			}
		}

		//영상게시판 게시하기
		@Override
		public void insertMovieBoarder(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			
				TcatBoardVO vo=new TcatBoardVO();
				String notice_title=req.getParameter("no_title");
				System.out.println(notice_title);
				String member_id=req.getParameter("mem_id");
				System.out.println(member_id);
				String contents=req.getParameter("no_content");
				String notice_addfile=req.getParameter("board_videoSrc");
				System.out.println(notice_addfile);
				int category=Integer.parseInt(req.getParameter("category"));
				vo.setCategory(category);
				vo.setNotice_title(notice_title);
				vo.setMember_id(member_id);
				vo.setContents(contents);
				vo.setNotice_addfile(notice_addfile);
				int cnt=0;
				cnt=MGDao.insertMovieBoarder(vo);
				if(cnt!=0) {
					System.out.println("입력에 성공하셨습니다.");
				}
			
			}
		
	
		//영상게시판 삭제 
		@Override
		public void movieBorderDelete(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			int notice_num=Integer.parseInt(req.getParameter("notice_num"));
			int cnt=0;
			cnt=MGDao.photoBorderDelete(notice_num);
			if(cnt!=0) {
				System.out.println("삭제성공");
			}
		}
		
		
		//영상게시판 수정
		@Override
		public void noMoMovieBoarder(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
		
				TcatBoardVO vo=new TcatBoardVO();
				String notice_title=req.getParameter("noMo_title");
				int notice_num=Integer.parseInt(req.getParameter("monotice_num"));
				String contents=req.getParameter("noMo_content");
				String notice_addfile=req.getParameter("noMoboard_videoSrc");
				
				vo.setNotice_num(notice_num);
				vo.setNotice_title(notice_title);
				vo.setContents(contents);
				vo.setNotice_addfile(notice_addfile);
				int cnt=0;
				cnt=MGDao.noMoMovieBoarder(vo);
				if(cnt!=0) {
					System.out.println("입력에 성공하셨습니다.");
				}
		
		}

		
		//메인화면 출력데이터 
		@Override
		public void guestMainList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			ArrayList<TcatBoardVO> dtos=null;
			dtos=MGDao.mainComentBoarderList();
			model.addAttribute("borderDtos",dtos);
			ArrayList<TcatBoardVO> dtos2=null;
			dtos2=MGDao.mainServiceBoardList();
			model.addAttribute("borderDtos2",dtos2);
			
		}

		//메인리스트
		@Override
		public void categoryMainList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			ArrayList<TcatBoardVO> dtosPhoto=null;
			ArrayList<TcatBoardVO> dtosMovie=null;
			String photoCategory=null;
			String movieCategory=null;
			photoCategory=(String)req.getAttribute("photocategory");
			movieCategory=(String)req.getAttribute("moviecategory");
			int photoCnt=0;
			int movieCnt=0;
			photoCnt=MGDao.categoryListCnt(Integer.parseInt(photoCategory));
			movieCnt=MGDao.categoryListCnt(Integer.parseInt(movieCategory));
			dtosPhoto=MGDao.categoryPhotoList(Integer.parseInt(photoCategory));
			dtosMovie=MGDao.categoryMovieList(Integer.parseInt(movieCategory));
			String category=(String)req.getAttribute("category");
			ArrayList<TcatPerformanceVO> dtos=null;
			dtos=MGDao.hotList(category);
			model.addAttribute("dtos", dtos);
			
			model.addAttribute("dtosPhoto",dtosPhoto);
			model.addAttribute("dtosMovie",dtosMovie);
			model.addAttribute("photoCnt",photoCnt);
			model.addAttribute("movieCnt",movieCnt);
			//순위
			System.out.println("순위가지전에 __________"+ category);
			ArrayList<TcatPerformanceVO> ratingDtos=null;
			ratingDtos=MGDao.performanceSaleRating(category);
			model.addAttribute("ratingDtos", ratingDtos);
			System.out.println("순위가지후에 __________"+ratingDtos.get(0).getPerf_title());
			int pageSize = 24; // 한 페이지당 출력할 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재페이지
			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작페이지
			int endPage = 0; // 마지막 페이지
			int cnt=0;
			cnt=MGDao.firstGradeListCnt(category);
			pageNum = req.getParameter("pageNum");
			
			if (pageNum == null) {
			pageNum = "1"; // 첫페이지 1페이지로 설정
			}
			currentPage = (Integer.parseInt(pageNum)); // 현재페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
			end = start + pageSize - 1; // 현재페이지 끝번호
			if (end > cnt) {
			end = cnt;
			}
			number = cnt - (currentPage - 1) * pageSize;
			if (cnt > 0) {
			// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("category", category);
				System.out.println("=============="+category);
				ArrayList<TcatPerformanceVO> listdtos=MGDao.firstGradeList(map);
				model.addAttribute("listdtos", listdtos);
				System.out.println("---------------------------------"+listdtos);
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
			}
			endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
			if (endPage > pageCount) {
			endPage = pageCount;
			}
			model.addAttribute("cnt", cnt);
			model.addAttribute("number", number);
			model.addAttribute("pageNum", pageNum);
			
			if (cnt > 0) {

			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			}
			
		}
		
		//스토어메인리스트
		@Override
		public void storeCategoryMainList(HttpServletRequest req, Model model) {
			// TODO Auto-generated method stub
			ArrayList<TcatBoardVO> dtosPhoto=null;
			ArrayList<TcatBoardVO> dtosMovie=null;
			String photoCategory=null;
			String movieCategory=null;
			photoCategory=(String)req.getAttribute("photocategory");
			movieCategory=(String)req.getAttribute("moviecategory");
			int photoCnt=0;
			int movieCnt=0;
			photoCnt=MGDao.categoryListCnt(Integer.parseInt(photoCategory));
			movieCnt=MGDao.categoryListCnt(Integer.parseInt(movieCategory));
			dtosPhoto=MGDao.categoryPhotoList(Integer.parseInt(photoCategory));
			dtosMovie=MGDao.categoryMovieList(Integer.parseInt(movieCategory));
			ArrayList<TcatDiscBuyVO> dtos=null;
			dtos=MGDao.storeHotList();
			model.addAttribute("dtos", dtos);
			model.addAttribute("dtosPhoto",dtosPhoto);
			model.addAttribute("dtosMovie",dtosMovie);
			model.addAttribute("photoCnt",photoCnt);
			model.addAttribute("movieCnt",movieCnt);
			
			System.out.println("==========================================핫");
			//순위
			ArrayList<TcatDiscBuyVO> ratingDtos=null;
			ratingDtos=MGDao.storeSaleRating();
			model.addAttribute("ratingDtos", ratingDtos);
			int pageSize = 24; // 한 페이지당 출력할 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수
			int start = 0; // 현재 페이지 글시작번호
			int end = 0; // 현재 페이지 글마지막번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재페이지
			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작페이지
			int endPage = 0; // 마지막 페이지
			int cnt=0;
			cnt=MGDao.firstGradeStoreListCnt();
			pageNum = req.getParameter("pageNum");
			
			if (pageNum == null) {
			pageNum = "1"; // 첫페이지 1페이지로 설정
			}
			currentPage = (Integer.parseInt(pageNum)); // 현재페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage - 1) * pageSize + 1; // 현재페이지 시작번호
			end = start + pageSize - 1; // 현재페이지 끝번호
			if (end > cnt) {
			end = cnt;
			}
			number = cnt - (currentPage - 1) * pageSize;
			if (cnt > 0) {
			// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				ArrayList<TcatDiscBuyVO> listdtos=null;
				listdtos=MGDao.firstGradeStoreList(map);
				model.addAttribute("listdtos", listdtos);
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5/3) * 3 + 1 = 4
			if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
			}
			endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
			if (endPage > pageCount) {
			endPage = pageCount;
			}
			model.addAttribute("cnt", cnt);
			model.addAttribute("number", number);
			model.addAttribute("pageNum", pageNum);
			
			if (cnt > 0) {

			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			}
			
			
		}

		
		
		
		
		
		
}//클래스 끝
