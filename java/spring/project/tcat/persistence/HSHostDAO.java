package spring.project.tcat.persistence;

import java.util.Map;

public interface HSHostDAO {

	//월별 구매횟수 구하기
	public int MonthMusicalCnt(Map<String,Object> map);
	public int MonthConcertCnt(Map<String,Object> map);
	public int MonthTheatricalCnt(Map<String,Object> map);
	public int MonthClassicCnt(Map<String,Object> map);
	public int MonthDancingCnt(Map<String,Object> map);
	public int MonthStoreCnt(Map<String,Object> map);
	
	//일별 구매횟수 구하기
	public int dayMusicalCnt(Map<String,Object> map);
	public int dayConcertCnt(Map<String,Object> map);
	public int dayTheatricalCnt(Map<String,Object> map);
	public int dayClassicCnt(Map<String,Object> map);
	public int dayDancingCnt(Map<String,Object> map);
	public int dayStoreCnt(Map<String,Object> map);
	
	//등급별 구매횟수 구하기
	public int LevelMusicalCnt(String rating);
	public int LevelConcertCnt(String rating);
	public int LevelTheatricalCnt(String rating);
	public int LevelClassicCnt(String rating);
	public int LevelDancingCnt(String rating);
	public int LevelStoreCnt(String rating);
	
	//지역별 구매횟수 구하기
	public int placeMusicalCnt(String place);
	public int placeConcertCnt(String place);
	public int placeTheatricalCnt(String place);
	public int placeClassicCnt(String place);
	public int placeDancingCnt(String place);

}
