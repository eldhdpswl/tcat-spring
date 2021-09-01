package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.project.tcat.service.HSHostService;

@Controller
public class HSHostController {
	
	@Autowired
	HSHostService HSService;
	
	@RequestMapping("useDateMain")
	public String useDateMain(HttpServletRequest req, Model model) {
		System.out.println("useDateMain");

		return "tcat/dateAnalysis/useDateMain";
	}

	@RequestMapping("useDate")
	public String useDate(HttpServletRequest req, Model model) {
		System.out.println("useDate");
		
		HSService.useDateCart(req,model);
		
		return "tcat/dateAnalysis/useDate";
	}

	@RequestMapping("infoLevelMain")
	public String infoLevelMain(HttpServletRequest req, Model model) {
		System.out.println("infoLevelMain");
		
		
		return "tcat/memberAnalysis/infoLevelMain";
	}
	
	@RequestMapping("infoLevel")
	public String infoLevel(HttpServletRequest req, Model model) {
		System.out.println("infoLevel");
		
		HSService.infoLevel(req,model);
		
		return "tcat/memberAnalysis/infoLevel";
	}
	
	@RequestMapping("infoLocationMain")
	public String infoLocationMain(HttpServletRequest req, Model model) {
		System.out.println("infoLocationMain");
		
		return "tcat/memberAnalysis/infoLocationMain";
	}
	
	@RequestMapping("infoLocation")
	public String infoLocation(HttpServletRequest req, Model model) {
		System.out.println("infoLocation");
		
		HSService.infoLocation(req,model);
		
		return "tcat/memberAnalysis/infoLocation";
	}
	
	@RequestMapping("infoLocationMain_side")
	public String infoLocationMain_side(HttpServletRequest req, Model model) {
		System.out.println("infoLocationMain_side");
		
		return "tcat/memberAnalysis/infoLocationMain_side";
	}
	
	@RequestMapping("useDateMain_side")
	public String useDateMain_side(HttpServletRequest req, Model model) {
		System.out.println("useDateMain_side");
		
		return "tcat/dateAnalysis/useDateMain_side";
	}
	
}
