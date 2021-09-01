package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface HSHostService {
	//월별/일별 카테고리 구분 구매율
	public void useDateCart(HttpServletRequest req,Model model);
	//등급별 카테고리 구분 구매율
	public void infoLevel(HttpServletRequest req,Model model);
	//지역별 카테고리 구분 구매율
	public void infoLocation(HttpServletRequest req,Model model);
}
