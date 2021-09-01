package spring.project.tcat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.project.tcat.service.HSGuestService;
import spring.project.tcat.service.HostService;
import spring.project.tcat.service.JMHGuestService;
@Controller
public class HSGuestController {
	@Autowired
	HSGuestService HSGservice;
	@Autowired
	HostService hService;
	@Autowired
	JMHGuestService mhService;
	
	//게스트 회원가입 폼 페이지
	@RequestMapping("signUp")
	public String SignUp(HttpServletRequest req, Model model) {
		System.out.println("signUp");
		
		return "tcat/signUp/signUp";
	}
	//게스트 id체크
	@RequestMapping("MemberIdCheack")
	public String MemberIdCheack(HttpServletRequest req, Model model) {
		System.out.println("MemberIdCheack");
		
		HSGservice.MemberIdCheack(req, model);
	
		return "tcat/signUp/MemberIdCheack";
	}
	@RequestMapping("GuestEmailCheack")
	public String GuestEmailCheack(HttpServletRequest req, Model model) {
		System.out.println("GuestEmailCheack");
		
		hService.emailCheack(req, model);
		
		return "tcat/signUp/GuestEmailCheack";
	}
	//게스트 회원가입
	@RequestMapping("insertMember")
	public String insertMember(HttpServletRequest req, Model model) {
		System.out.println("insertMember");
		
		HSGservice.insertMember(req,model);
		
		return "tcat/signUp/signUp";
	}

	//예매
	@RequestMapping("Ticketing")
	public String Ticketing(HttpServletRequest req, Model model) {
		System.out.println("Ticketing");
		
		HSGservice.payList(req,model);
		
		return "tcat/Ticketing/Ticketing";
	}

	
	@RequestMapping("chooseDay")
	public String chooseDay(HttpServletRequest req, Model model) {
		System.out.println("chooseDay");
		
		HSGservice.payList(req,model);
		
		return "tcat/Ticketing/chooseDay";
	}
	
	//날짜별 공연일자 가져오기
	@RequestMapping("daySearch")
	public String daySearch(HttpServletRequest req, Model model) {
		System.out.println("daySearch");
		
		HSGservice.daySearch(req,model);
		
		return "tcat/dayList/dayList";
	}
	
	//날짜별 공연일자 가져오기
	@RequestMapping("dayList")
	public String dayList(HttpServletRequest req, Model model) {
		System.out.println("dayList");
		
		HSGservice.daySearch(req,model);
		
		return "tcat/dayList/dayList";
	}
	//날짜별 공연일자 가져오기
		@RequestMapping("dayListMain")
		public String dayListMain(HttpServletRequest req, Model model) {
			System.out.println("dayListMain");
			
			return "tcat/dayList/dayListMain";
		}
	//장소별 공연 가져오기
	@RequestMapping("placeListMain")
	public String placeListMain(HttpServletRequest req, Model model) {
		System.out.println("placeList");
		
		
		return "tcat/placeList/placeListMain";
	}
	
	@RequestMapping("placeList")
	public String placeList(HttpServletRequest req, Model model) {
		System.out.println("placeList");
		
		HSGservice.placeList(req,model);
		
		return "tcat/placeList/placeList";
	}
	//스토어 장바구니 추가
	@RequestMapping("insertCart")
	public String insertCart(HttpServletRequest req, Model model) {
		System.out.println("insertCart");
		
		HSGservice.insertCart(req,model);
		mhService.getContent_store(req, model);
		
		return "tcat/content/contentMain_store";
	}
	//장바구니 리스트 가져오기
	@RequestMapping("cartList")
	public String cart(HttpServletRequest req, Model model) {
		System.out.println("cartList");
		
		HSGservice.cartList(req,model);
		
		return "tcat/purchase/cart";
	}
	

	@RequestMapping("storePay")
	public String storePay(HttpServletRequest req, Model model, @RequestParam (value = "valueArrTest[]") List<String> valueArr) {
		System.out.println("storePay");
		
		HSGservice.storePay(req,model,valueArr);
		
		return "tcat/purchase/storePay";
	}
	

	@RequestMapping("sussessPay")
	public String sussessPay(HttpServletRequest req, Model model) {
		System.out.println("sussessPay");
		
		HSGservice.sussessPay(req,model);
		HSGservice.cartList(req,model);
		
		return "tcat/purchase/cart";
	}

	
	@RequestMapping("RemainingSeats")
	public String RemainingSeats(HttpServletRequest req, Model model) {
		System.out.println("RemainingSeats");
		
		HSGservice.RemainingSeats(req,model);
		
		return "tcat/Ticketing/RemainingSeats";
	}

	@RequestMapping("fake")
	public String fake(HttpServletRequest req, Model model) {
		System.out.println("fake");
		
		return "tcat/Ticketing/fake";
	}
	@RequestMapping("sale")
	public String sale(HttpServletRequest req, Model model) {
		System.out.println("sale");
		
		//할인선택에서 필요한 테이블 : member,sale
		HSGservice.sale(req,model);
		
		return "tcat/Ticketing/sale";
	}
	@RequestMapping("del")
	public String del(HttpServletRequest req, Model model) {
		System.out.println("del");
		
		return "tcat/Ticketing/del";
	}
	@RequestMapping("pay")
	public String pay(HttpServletRequest req, Model model) {
		System.out.println("pay");
		
		return "tcat/Ticketing/pay";
	}
	
	//공연 예매
	@RequestMapping("insertTicket")
	public String insertTicket(HttpServletRequest req, Model model) {
		System.out.println("insertTicket");
		
		HSGservice.insertTicket(req,model);
		
		return "tcat/Ticketing/insertTicket";
	}
	
	//스토어 바로구매
	@RequestMapping("directBuy")
	public String directBuy(HttpServletRequest req, Model model) {
		System.out.println("directBuy");
		
		HSGservice.directBuy(req,model);
		
		return "tcat/purchase/directBuy";
	}
	
	@RequestMapping("directPay")
	public String directPay(HttpServletRequest req, Model model) {
		System.out.println("directPay");
		
		HSGservice.directPay(req,model);
		
		return "tcat/memberMyPage/myPage";
	}
	
	@RequestMapping("changeCount")
	public String changeCount(HttpServletRequest req, Model model) {
		System.out.println("changeCount");
		
		HSGservice.changeCount(req,model);
		HSGservice.cartList(req,model);

		return "tcat/purchase/cart";
	}
	@RequestMapping("deleteCart")
	public String deleteCart(HttpServletRequest req, Model model) {
		System.out.println("deleteCart");
		
		HSGservice.deleteCart(req,model);
		HSGservice.cartList(req,model);
		
		return "tcat/purchase/cart";
	}
	
	@RequestMapping("searchMain")
	public String searchMain(HttpServletRequest req, Model model) {
		System.out.println("searchMain");
		
		String search=req.getParameter("search");
		req.setAttribute("search", search);
		
		return "tcat/searchMain/searchMain";
	}
	@RequestMapping("searchPerList")
	public String searchPerList(HttpServletRequest req, Model model) {
		System.out.println("searchPerList");
		
		HSGservice.searchPerList(req,model);
		
		return "tcat/searchMain/searchPerList";
	}
	
	@RequestMapping("searchStoreList")
	public String searchStoreList(HttpServletRequest req, Model model) {
		System.out.println("searchStoreList");
		
		HSGservice.searchStoreList(req,model);
		
		return "tcat/searchMain/searchStoreList";
	}
}
