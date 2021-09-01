package spring.project.tcat.service;



import java.io.File;


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.persistence.YMGuestDAOImpl;
@Service
public class YMGuestServiceImp implements YMGuestService {

	@Autowired
	YMGuestDAOImpl YMDao;
	
	//회원등급관리
	@Override
	public void memberRating(HttpServletRequest req, Model model) {
		int cnt=0; //구매 갯수
		int upCnt=0; //등급업데이트
		int max=0;//등급값
		int p=0; //%
		int sRank=0; //a랭크1년 구매
		int vRank=0; //s랭크1년 구매
		String Rating="";//등급
		String nextRating="";//다음등급
		String strId = (String) req.getSession().getAttribute("login_id");
		System.out.println("Id:"+strId);
		//////////////////////////////////////////////////////////////////
	
		 Map<String,Object> map=new HashMap<String,Object>();
		 
		 ///////////////////////////////////////////////////////////////////
		//멤버아이디의 구매 갯수 출력
		cnt=YMDao.mRating(strId);
		
		//가입회원
		if(cnt==0) {
			System.out.println("upCnt:-----"+upCnt);
			System.out.println("cnt"+cnt);
			Rating="D";
			nextRating="C";
			model.addAttribute("Rating", Rating);
			model.addAttribute("nextRating", nextRating);
			model.addAttribute("cnt", cnt);
		//C등급
		}else if(cnt<10) {
			
			map.put("compare", 1);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt1:-----"+upCnt);
			System.out.println("cnt1"+cnt);
			Rating="C";
			nextRating="B";
			max=10;
			p=cnt*max;
			model.addAttribute("Rating", Rating);
			model.addAttribute("nextRating", nextRating);
			model.addAttribute("cnt", cnt);
			model.addAttribute("p", p);
		//B등급
		}else if(cnt<50) {
			map.put("compare", 2);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt2:-----"+upCnt);
			System.out.println("cnt2"+cnt);
			Rating="B";
			nextRating="A";
			max=2;
			p=cnt*max;
			model.addAttribute("Rating", Rating);
			model.addAttribute("nextRating", nextRating);
			model.addAttribute("cnt", cnt);
			model.addAttribute("p", p);
			
		//A등급
		}else if(cnt>=50) {
			System.out.println("11111");
			map.put("compare", 3);
			map.put("strId", strId);
			upCnt=YMDao.mRatingUpdate(map);
			System.out.println("upCnt3:-----"+upCnt);
			
			
			SimpleDateFormat date=new SimpleDateFormat("yy/MM/dd");
			Date today=new Date();
			Date yesterDay=new Date();
			 today.setTime(today.getTime()+((long) 1000*60*60*24)); //365 년
			 yesterDay.setTime(today.getTime()-((long) 1000*60*60*24*365)); //작년 365
			 
			 String todayStr=date.format(today); //date.format 궁굼
			 String yesterDayStr=date.format(yesterDay);
			 
			 
			
			 
			
			 map.put("today", todayStr);
			 map.put("yesterday", yesterDayStr);
			 sRank=YMDao.dayCnt(map);
			 	Rating="A";
				nextRating="S";
				max=10;
				p=sRank*max;
				model.addAttribute("Rating", Rating);
				model.addAttribute("nextRating", nextRating);
				model.addAttribute("sRank", sRank);
				model.addAttribute("p", p);
				model.addAttribute("cnt", cnt);
				model.addAttribute("todayStr", todayStr);
				model.addAttribute("yesterDayStr", yesterDayStr);
			 System.out.println("1");
			 
			 	String sDate[] = todayStr.split("/");
				todayStr = sDate[2] + "/" + sDate[0] + "/" + sDate[1];
				String eDate[] = yesterDayStr.split("/");
				yesterDayStr = eDate[2] + "/" + eDate[0] + "/" + eDate[1];
			
				
			if(sRank>=10) {
				System.out.println("3");
				map.put("compare", 4);
				map.put("strId", strId);
				upCnt=YMDao.mRatingUpdate(map);
				Rating="S";
				nextRating="VIP";
				max=5;
				p=sRank*max;
				model.addAttribute("Rating", Rating);
				model.addAttribute("nextRating", nextRating);
				model.addAttribute("cnt", cnt);
				model.addAttribute("sRank", sRank);
				model.addAttribute("todayStr", todayStr);
				model.addAttribute("yesterDayStr", yesterDayStr);
				model.addAttribute("p", p);
				vRank=YMDao.dayCnt1(map);
				if(vRank>=20) {
					System.out.println("4");
					map.put("compare", 5);
					map.put("strId", strId);
					upCnt=YMDao.mRatingUpdate(map);
					Rating="VIP";
					 max=10;
					 p=sRank*max;
					model.addAttribute("Rating", Rating);
					model.addAttribute("cnt", cnt);
					model.addAttribute("vRank", vRank);
					model.addAttribute("p", p);
				}
			}
		
		}
		
	}
	//이벤트
	@Override
	public void eventGuest(HttpServletRequest req, Model model) {
		int cnt=0; //글갯수
		int pageSize=3; //한 페이지당 출력할 글 갯수
		int pageBlock= 2; //한 블럭당 페이지 갯수
		
		int start=0; //현재 페이지 글시작번호
		int end=0; //현재 페이지 글 마지막번호
		String pageNum=null; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0; //페이지 갯수
		int startPage= 0;	//시작 페이지
		int endPage=0;	//마지막 페이지
		Map<String,Object> map=new HashMap<String, Object>();
		cnt=YMDao.eventCnt();
		pageNum=req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum ="1";
		}
		currentPage=(Integer.parseInt(pageNum));
		pageCount = (cnt/ pageSize)+(cnt% pageSize > 0 ? 1: 0);  //페이지 갯수 + 나머지
 		start=(currentPage -1)* pageSize+1;
 		end= start + pageSize -1;
 		if(end > cnt) end=cnt;
		System.out.println("cnt===="+cnt);
		
		if(cnt>0) {
			map.put("start", start);
 			map.put("end", end);
		
			ArrayList<TcatBoardVO> dtos =YMDao.eventGuestList(map);
			
			System.out.println("dtos:"+dtos.size());
			model.addAttribute("dtos", dtos);
		}
	
		startPage=(currentPage/pageBlock)* pageBlock +1; // (5/3)* 3+ 1= 4
		if(currentPage % pageBlock ==0) startPage -= pageBlock; // (5%3)==0
		endPage = startPage + pageBlock -1; // 4+3 -1 =6
		if(endPage> pageCount) endPage = pageCount;
		
		model.addAttribute("cnt",cnt);
 		model.addAttribute("pageNum",pageNum);
 		
 		if(cnt>0) {
 			model.addAttribute("startPage",startPage);
 			model.addAttribute("endPage",endPage);
 			model.addAttribute("pageBlock",pageBlock);
 			model.addAttribute("pageCount",pageCount);
 			model.addAttribute("currentPage",currentPage);
 		}
	}
	//이벤트상세
	@Override
	public void eventForm(HttpServletRequest req, Model model) {
		int num=Integer.parseInt(req.getParameter("notice_num"));
		System.out.println("num======"+num);
		ArrayList<TcatBoardVO> dto=YMDao.eventGuestForm(num);
		System.out.println("dto:"+dto.size());
		model.addAttribute("dto", dto);
		
	}
	//이벤트삭제
	@Override
	public void eventDelete(HttpServletRequest req, Model model) {
		int deleteCnt=0;
		int num=Integer.parseInt(req.getParameter("notice_num"));
		System.out.println("num======"+num);
		deleteCnt=YMDao.eventDeleteCnt(num);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	//이벤트수정
	@Override
	public void eventUpdateList(MultipartHttpServletRequest req, Model model) {
	
		MultipartFile file = req.getFile("notice_image");
		String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\eventList\\";
		String saveDir = req.getRealPath("/resources/image/eventList/");
		
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
			
			int updateCnt=0;
			int num=Integer.parseInt(req.getParameter("notice_num"));
			String title= req.getParameter("notice_title");
			String content= req.getParameter("contents");
			String notice_image= file.getOriginalFilename();
			String notice_addfile =req.getParameter("notice_addfile");
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("num", num);
			map.put("title", title);
			map.put("content", content);
			map.put("notice_image", notice_image);
			map.put("notice_addfile", notice_addfile);
			System.out.println("map111:"+map);
			updateCnt=YMDao.eventUpdateCnt(map);
			System.out.println("map222:"+map);
			model.addAttribute("updateCnt", updateCnt);
		} catch(IOException e) {
            e.printStackTrace();
		}
	}
	//이벤트등록
	@Override
	public void eventAdd(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("notice_image");
		String realDir = "C:\\Dev\\TCATworkspace\\git\\SPRING_Project_TCAT\\src\\main\\webapp\\resources\\image\\eventList\\";
		String saveDir = req.getRealPath("/resources/image/eventList/");
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
			int addCnt=0;
			String notice_title= req.getParameter("notice_title");
			String notice_image= file.getOriginalFilename();
			String contents= req.getParameter("contents");
			String writeDate= req.getParameter("writeDate");
			String member_id= req.getParameter("member_id");
			String notice_addfile =req.getParameter("notice_addfile");
			
			String sDate[] = writeDate.split("/");
			writeDate = sDate[2] + "/" + sDate[0] + "/" + sDate[1];
			
			System.out.println("notice_title======="+notice_title);
			System.out.println("notice_image======="+notice_image);
			System.out.println("contents======="+contents);
			System.out.println("writeDate======="+writeDate);
			System.out.println("member_id======="+member_id);
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("notice_title", notice_title);
			map.put("notice_image", notice_image);
			map.put("writeDate", writeDate);
			map.put("contents", contents);
			map.put("member_id", member_id);
			map.put("notice_addfile", notice_addfile);
			addCnt=YMDao.eventAddCnt(map);
			
			model.addAttribute("addCnt", addCnt);
		} catch(IOException e) {
            e.printStackTrace();
		}
		
	}
	
	
}