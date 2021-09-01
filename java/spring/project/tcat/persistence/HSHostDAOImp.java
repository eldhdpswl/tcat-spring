package spring.project.tcat.persistence;

import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.project.tcat.config.Configuration;

@Repository
public class HSHostDAOImp implements HSHostDAO{

	@Override
	public int MonthMusicalCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthMusicalCnt(map);
		return cnt;
	}

	@Override
	public int MonthConcertCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthConcertCnt(map);
		return cnt;
	}
	@Override
	public int MonthTheatricalCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthTheatricalCnt(map);
		return cnt;
	}
	@Override
	public int MonthClassicCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthClassicCnt(map);
		return cnt;
	}
	@Override
	public int MonthDancingCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthDancingCnt(map);
		return cnt;
	}
	@Override
	public int MonthStoreCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.MonthStoreCnt(map);
		return cnt;
	}

	@Override
	public int dayMusicalCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayMusicalCnt(map);
		return cnt;
	}

	@Override
	public int dayConcertCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayConcertCnt(map);
		return cnt;
	}

	@Override
	public int dayTheatricalCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayTheatricalCnt(map);
		return cnt;
	}

	@Override
	public int dayClassicCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayClassicCnt(map);
		return cnt;
	}

	@Override
	public int dayDancingCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayDancingCnt(map);
		return cnt;
	}

	@Override
	public int dayStoreCnt(Map<String, Object> map) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.dayStoreCnt(map);
		return cnt;
	}

	@Override
	public int LevelMusicalCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelMusicalCnt(rating);
		return cnt;
	}

	@Override
	public int LevelConcertCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelConcertCnt(rating);
		return cnt;
	}

	@Override
	public int LevelTheatricalCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelTheatricalCnt(rating);
		return cnt;
	}

	@Override
	public int LevelClassicCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelClassicCnt(rating);
		return cnt;
	}

	@Override
	public int LevelDancingCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelDancingCnt(rating);
		return cnt;
	}

	@Override
	public int LevelStoreCnt(String rating) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.LevelStoreCnt(rating);
		return cnt;
	}

	@Override
	public int placeMusicalCnt(String place) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.placeMusicalCnt(place);
		return cnt;
	}

	@Override
	public int placeConcertCnt(String place) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.placeConcertCnt(place);
		return cnt;
	}

	@Override
	public int placeTheatricalCnt(String place) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.placeTheatricalCnt(place);
		return cnt;
	}

	@Override
	public int placeClassicCnt(String place) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.placeClassicCnt(place);
		return cnt;
	}

	@Override
	public int placeDancingCnt(String place) {
		int cnt=0;
		HSHostDAO dao=Configuration.getMapper(HSHostDAO.class);
		cnt=dao.placeDancingCnt(place);
		return cnt;
	}



}
