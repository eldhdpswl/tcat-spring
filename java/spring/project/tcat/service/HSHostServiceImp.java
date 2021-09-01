package spring.project.tcat.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.persistence.HSHostDAO;

@Service
public class HSHostServiceImp implements HSHostService{
	@Autowired
	HSHostDAO HSDao;

	@Override
	public void useDateCart(HttpServletRequest req, Model model) {

		//카테고리별 사용시간 구하기
		//월별 ,일별 ,시간별
		//1. 검색월의 [뮤지컬,콘서트,연극,클래식,무용/발레,스토어]의 구매갯수
		//2. 검색일의 [뮤지컬,콘서트,연극,클래식,무용/발레,스토어]의 구매갯수
		//3. 검색일의 시간별 [뮤지컬,콘서트,연극,클래식,무용/발레,스토어]의 구매갯수
		
		//검색한 날짜를 받는다.
		String date=req.getParameter("date");//형식 yyyy-mm-dd
		System.out.println("date:"+date);
		String month[]=date.split("-");
		String monS=month[0]+"-"+month[1]+"-01";
		String monE=month[0]+"-0"+(Integer.parseInt(month[1])+1)+"-01";
		
		String dayS=date+" 00:00:00";
		String dayE=date+" 23:59:59";
		//월별
		System.out.println("monS:"+monS);
		System.out.println("monE:"+monE);
		//일별
		System.out.println("dayS:"+dayS);
		System.out.println("dayE:"+dayE);
		//시간별
		
		
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("monS", monS);
		map.put("monE", monE);
		map.put("dayS", dayS);
		map.put("dayE", dayE);
		map.put("date", date);
		req.setAttribute("monS", monS);
		req.setAttribute("monE", monE);
		req.setAttribute("date", date);
		
		//시작일~종료일 사이의 뮤지컬 예매갯수 구하기
		int MonthMusicalCnt=HSDao.MonthMusicalCnt(map);
		int MonthConcertCnt=HSDao.MonthConcertCnt(map);
		int MonthTheatricalCnt=HSDao.MonthTheatricalCnt(map);
		int MonthClassicCnt=HSDao.MonthClassicCnt(map);
		int MonthDancingCnt=HSDao.MonthDancingCnt(map);
		int MonthStoreCnt=HSDao.MonthStoreCnt(map);
		req.setAttribute("MonthMusicalCnt", MonthMusicalCnt);
		req.setAttribute("MonthConcertCnt", MonthConcertCnt);
		req.setAttribute("MonthTheatricalCnt", MonthTheatricalCnt);
		req.setAttribute("MonthClassicCnt", MonthClassicCnt);
		req.setAttribute("MonthDancingCnt", MonthDancingCnt);
		req.setAttribute("MonthStoreCnt", MonthStoreCnt);
		System.out.println("11");
		//일별 예매횟수 구하기
		
		int dayMusicalCnt=0;
		int dayConcertCnt=0;
		int dayTheatricalCnt=0;
		int dayClassicCnt=0;
		int dayDancingCnt=0;
		int dayStoreCnt=0;
		
		
		
		dayMusicalCnt=HSDao.dayMusicalCnt(map);
		dayConcertCnt=HSDao.dayConcertCnt(map);
		dayTheatricalCnt=HSDao.dayTheatricalCnt(map);
		dayClassicCnt=HSDao.dayClassicCnt(map);
		dayDancingCnt=HSDao.dayDancingCnt(map);
		dayStoreCnt=HSDao.dayStoreCnt(map);
		req.setAttribute("dayMusicalCnt", dayMusicalCnt);
		req.setAttribute("dayConcertCnt", dayConcertCnt);
		req.setAttribute("dayTheatricalCnt", dayTheatricalCnt);
		req.setAttribute("dayClassicCnt", dayClassicCnt);
		req.setAttribute("dayDancingCnt", dayDancingCnt);
		req.setAttribute("dayStoreCnt", dayStoreCnt);
		
		
	}

	@Override
	public void infoLevel(HttpServletRequest req, Model model) {
		String rating=req.getParameter("rating");
		
		int LevelMusicalCnt=0;
		int LevelConcertCnt=0;
		int LevelTheatricalCnt=0;
		int LevelClassicCnt=0;
		int LevelDancingCnt=0;
		int LevelStoreCnt=0;
		
		LevelMusicalCnt=HSDao.LevelMusicalCnt(rating);
		LevelConcertCnt=HSDao.LevelConcertCnt(rating);
		LevelTheatricalCnt=HSDao.LevelTheatricalCnt(rating);
		LevelClassicCnt=HSDao.LevelClassicCnt(rating);
		LevelDancingCnt=HSDao.LevelDancingCnt(rating);
		LevelStoreCnt=HSDao.LevelStoreCnt(rating);
		
		req.setAttribute("LevelMusicalCnt", LevelMusicalCnt);
		req.setAttribute("LevelConcertCnt", LevelConcertCnt);
		req.setAttribute("LevelTheatricalCnt", LevelTheatricalCnt);
		req.setAttribute("LevelClassicCnt", LevelClassicCnt);
		req.setAttribute("LevelDancingCnt", LevelDancingCnt);
		req.setAttribute("LevelStoreCnt", LevelStoreCnt);
		
		req.setAttribute("rating", rating);
	}

	@Override
	public void infoLocation(HttpServletRequest req, Model model) {
		String place=req.getParameter("place");
		
		int placeMusicalCnt=0;
		int placeConcertCnt=0;
		int placeTheatricalCnt=0;
		int placeClassicCnt=0;
		int placeDancingCnt=0;

		placeMusicalCnt=HSDao.placeMusicalCnt(place);
		placeConcertCnt=HSDao.placeConcertCnt(place);
		placeTheatricalCnt=HSDao.placeTheatricalCnt(place);
		placeClassicCnt=HSDao.placeClassicCnt(place);
		placeDancingCnt=HSDao.placeDancingCnt(place);

		req.setAttribute("placeMusicalCnt", placeMusicalCnt);
		req.setAttribute("placeConcertCnt", placeConcertCnt);
		req.setAttribute("placeTheatricalCnt", placeTheatricalCnt);
		req.setAttribute("placeClassicCnt", placeClassicCnt);
		req.setAttribute("placeDancingCnt", placeDancingCnt);
		
		req.setAttribute("place", place);
	}
}
