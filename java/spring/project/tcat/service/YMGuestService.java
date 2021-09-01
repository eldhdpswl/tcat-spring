package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface YMGuestService {
	//등급관리
	public void memberRating(HttpServletRequest req,Model model);
	
	//이벤트
	public void eventGuest(HttpServletRequest req,Model model);
	
	//이벤트상세
	public void eventForm(HttpServletRequest req,Model model);
	
	//이벤트삭제
	public void eventDelete(HttpServletRequest req,Model model);
	//이벤트수정
	public void eventUpdateList(MultipartHttpServletRequest req,Model model);
	//이벤트등록
	public void eventAdd(MultipartHttpServletRequest req,Model model);
}
