package spring.project.tcat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.service.JMHGuestService;

@Controller
public class JMHGuestController {
	@Autowired
	JMHGuestService mhService;
	
	//////// 보류단계
	// memberFind
	@RequestMapping("memberFind")
	public String memberFind(HttpServletRequest req, Model model) {
		System.out.println("memberFind");
		return "tcat/memberFind/memberFind";
	}

	// 아이디 비밀번호 찾지 이메일인증 코드 보내기
	@RequestMapping("findId")
	public String findIdPwd(HttpServletRequest req, Model model) {
		System.out.println("findId");
		mhService.findIdPwd(req, model);
		return "tcat/memberFind/findId";
	}

	// 인증번호 체크
	@RequestMapping("findResult")
	public String findResult(HttpServletRequest req, Model model) {
		System.out.println("findResult");
		// 결과에 따라 주소값결정
		mhService.findResult(req, model);
		return "tcat/memberFind/findId";
	}

	@RequestMapping("findResultPage")
	public String findResultPage(HttpServletRequest req, Model model) {
		System.out.println("findResultPage");
		System.out.println(req.getParameter("member_id") + "/" + req.getParameter("member_pwd"));
		model.addAttribute("member_id", req.getParameter("member_id"));
		model.addAttribute("member_pwd", req.getParameter("member_pwd"));
		return "tcat/memberFind/findResultPage";
	}

	/////////////////////////////////////////////////////////////
	// 서브메뉴 및 ajax div
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req, Model model) {
		System.out.println("myPage");
		return "tcat/memberMyPage/myPage";
	}

	// 마이페이지 메인
	@RequestMapping("myPageMain")
	public String myPageMain(HttpServletRequest req, Model model) {
		System.out.println("myPageMain");
		// 해당 아이디 정보 가져오기
		mhService.myPageInfo(req, model);
		return "tcat/memberMyPage/myPageMain";
	}

	//////////////////////////////////////////////////////////////
	// memberLogin 모달 로그인 창
	@RequestMapping("memberLogin")
	public String memberLogin(HttpServletRequest req, Model model) {
		System.out.println("memberLogin");
		return "tcat/memberLogin/memberLogin";
	}

	// 로그인 처리 loginPro
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("loginPro");
		mhService.loginPro(req, model);
		return "tcat/memberLogin/loginPro";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("logout");
		req.getSession().removeAttribute("login_id");
		return "tcat/guestMain/guestPage";
	}

	////////////////////////////////////////////////////////////////////
	// musicalList 뮤지컬 리스트
	@RequestMapping("musicalList")
	public String musicalList(HttpServletRequest req, Model model) {
		System.out.println("musicalList");
		mhService.getPerfList(req, model);
		return "tcat/musical/musicalList";
	}

	// classicList 클래식 리스트
	@RequestMapping("classicList")
	public String classicList(HttpServletRequest req, Model model) {
		System.out.println("classicList");
		mhService.getPerfList(req, model);
		return "tcat/classic/classicList";
	}

	// 콘서트 리스트
	@RequestMapping("concertList")
	public String concertList(HttpServletRequest req, Model model) {
		System.out.println("concertList");
		mhService.getPerfList(req, model);
		return "tcat/concert/concertList";
	}

	// 연극 리스트
	@RequestMapping("dramaList")
	public String dramaList(HttpServletRequest req, Model model) {
		System.out.println("dramaList");
		mhService.getPerfList(req, model);
		return "tcat/drama/dramaList";
	}

	// 무용 발레 리스트
	@RequestMapping("danceList")
	public String danceList(HttpServletRequest req, Model model) {
		System.out.println("danceList");
		mhService.getPerfList(req, model);
		return "tcat/dance/danceList";
	}

	// 스토어 리스트
	@RequestMapping("storeList")
	public String storeList(HttpServletRequest req, Model model) {
		System.out.println("storeList");
		mhService.getStoreList(req, model);
		return "tcat/store/storeList";
	}
	
	//상세페이지
	@RequestMapping("contentMain")
	public String contentMain(HttpServletRequest req, Model model) {
		System.out.println("contentMain");
		//해당 공연 위시리스트 여부 가져오기
		mhService.getWishListIn(req, model);
		//상품정보 가져오기
		mhService.getContent(req, model);
		//연령별, 성별별 선호도 가져오기
		mhService.getFavorite(req,model);
		
		return "tcat/content/contentMain";
	}
	@RequestMapping("contentMain_store")
	public String contentMain_store(HttpServletRequest req, Model model) {
		System.out.println("contentMain_store");
		//해당 상품 위시리스트 여부 가져오기
		mhService.getWishListIn(req, model);
		//상품정보 가져오기
		mhService.getContent_store(req, model);
		//연령별, 성별별 선호도 가져오기
		mhService.getFavorite_store(req,model);
		return "tcat/content/contentMain_store";
	}
	
	//위시리스트 추가 addWishList
	@RequestMapping("addWishList")
	public String addWishList(HttpServletRequest req, Model model) {
		System.out.println("addWishList");
		mhService.addWishList(req, model);
		return "tcat/content/contentMain";
	}
	//delWishList 위시리스트 삭제
	@RequestMapping("delWishList")
	public String delWishList(HttpServletRequest req, Model model) {
		System.out.println("delWishList");
		mhService.delWishList(req, model);
		return "tcat/content/contentMain";
	}
	//wishList 위시리스트 목록
	@RequestMapping("wishList")
	public String wishList(HttpServletRequest req, Model model) {
		System.out.println("wishList");
		mhService.getWishList(req, model);
		return "tcat/wishList/wishList";
	}
	//wishList 스토어 위시리스트 목록
	@RequestMapping("wishList_store")
	public String wishList_store(HttpServletRequest req, Model model) {
		System.out.println("wishList_store");
		mhService.getWishList(req, model);
		return "tcat/wishList/wishList_store";
	}
	
	//결제취소 buyCancel
	@RequestMapping("buyCancel")
	public String buyCancel(HttpServletRequest req, Model model) {
		System.out.println("buyCancel");
		mhService.buyCancel(req, model);
		return "tcat/memberMyPage/buyCancelPro";
	}
	
	//perfRefund 환불요청
	@RequestMapping("perfRefund")
	public String perfRefund(HttpServletRequest req, Model model) {
		System.out.println("perfRefund");
		mhService.perfRefund(req, model);
		return "tcat/memberMyPage/perfRefundPro";
	}
	//perfChange 교환 요청
	@RequestMapping("perfChange")
	public String perfChange(HttpServletRequest req, Model model) {
		System.out.println("perfChange");
		mhService.perfChange(req, model);
		return "tcat/memberMyPage/perfChangePro";
	}
	
	//host 로그인
	@RequestMapping("host_login")
	public String host_login(HttpServletRequest req, Model model) {
		System.out.println("host_login");
		return "tcat/hostMain/host_login";
	}
	//host 로그인 처리 host_loginPro
	@RequestMapping("host_loginPro")
	public String host_loginPro(HttpServletRequest req, Model model) {
		System.out.println("host_loginPro");
		mhService.host_loginPro(req, model);
		return "tcat/hostMain/host_loginPro";
	}
	//ticketCheck 예매확인 취소
	@RequestMapping("ticketCheck")
	public String ticketCheck(HttpServletRequest req, Model model) {
		System.out.println("ticketCheck");
		//예매정보 가져오기
		mhService.getTicketInfo(req, model);
		return "tcat/ticketCheck/ticketCheck";
	}
	
	
	//예매 취소ticCancel
	@RequestMapping("ticStepUpdate")
	public String ticStepUpdate(HttpServletRequest req, Model model) {
		System.out.println("ticStepUpdate");
		//예매정보 가져오기
		mhService.ticStepUpdate(req, model);
		return "tcat/ticketCheck/ticStepUpdatePro";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	//HOST 추가
	//연령 성별 분석
	@RequestMapping("ageAnalysis")
	public String ageGenderAnalysis(HttpServletRequest req, Model model) {
		System.out.println("ageAnalysis");
		//데이터 가져오기
		mhService.getAgeAnalysis(req,model);
		return "tcat/guestAnalysis/ageAnalysis";
	}
	//분석 사이드
	@RequestMapping("ageAnalysis_side")
	public String ageGenderAnalysis_side(HttpServletRequest req, Model model) {
		System.out.println("ageAnalysis_side");
		return "tcat/guestAnalysis/ageAnalysis_side";
	}
	
	//ageAnalysis_store 연령 분석 스토어
	@RequestMapping("ageAnalysis_store")
	public String ageAnalysis_store(HttpServletRequest req, Model model) {
		System.out.println("ageAnalysis_store");
		//데이터 가져오기
		mhService.getAgeAnalysis_store(req,model);
		return "tcat/guestAnalysis/ageAnalysis_store";
	}
	
	//genderAnalysis 성별 예약 분석
	@RequestMapping("genderAnalysis")
	public String genderAnalysis(HttpServletRequest req, Model model) {
		System.out.println("genderAnalysis");
		//데이터 가져오기
		mhService.getGenderAnalysis(req,model);
		return "tcat/guestAnalysis/genderAnalysis";
	}
	
	//genderAnalysis_store
	@RequestMapping("genderAnalysis_store")
	public String genderAnalysis_store(HttpServletRequest req, Model model) {
		System.out.println("genderAnalysis_store");
		//데이터 가져오기
		mhService.getGenderAnalysis_store(req,model);
		return "tcat/guestAnalysis/genderAnalysis_store";
	}
	
	// 호스트 로그아웃
	@RequestMapping("host_logout")
	public String host_logout(HttpServletRequest req, Model model) {
		System.out.println("host_logout");
		req.getSession().removeAttribute("host_id");
		//게스트 페이지로 이동
		MoGuestContoroller moc = new MoGuestContoroller();
		return moc.guestPage(req, model);
	}
	
	//////////////////////////////////////////////////////
	// 안드로이드 통신
	/* 안드로이드 통신관련 */
	@RequestMapping("and_login")
	@ResponseBody
	public Map<String, Object> androidTestWithRequestAndResponse(HttpServletRequest req, Model model){
		System.out.println("접속"+ req.getParameter("id"));
		return mhService.and_login(req, model);
	}
	
	//공연정보 및 예매 정보 가져오기
	@RequestMapping("beacon_react")
	@ResponseBody
	public Map<String, Object> beacon_react(HttpServletRequest req, Model model){
		System.out.println("접속"+ req.getParameter("id")+"/공연장 정보: "+req.getParameter("hall_id"));
		return mhService.beacon_react(req, model);
	}
	
	//현석이형꺼
	@RequestMapping("Tcat_android")
    @ResponseBody
    public Map<String, String> Tcat_android(HttpServletRequest req) {
    	System.out.println("Tcat_android");
    	Map<String, String> result = new HashMap<String, String>();
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    	String ticet_date="";
    	String seat_type="";
    	String seat_num="";
    	String perf_title="";
    	String perf_image="";
    	String round="";
    	String possible_age="";
    	String hall_name="";
    	String price="";
    	String per_id="";
    	String cnt;
    	
    	mhService.Tcat_android01(req);
    	
    	ArrayList<TcatTicketingVO> dtos=(ArrayList<TcatTicketingVO>)req.getAttribute("dtos");
    	cnt= String.valueOf(dtos.size());    	
    	System.out.println("cnt: "+cnt);
    	for(int i=0;i<dtos.size();i++) {
    		String remain_round=dtos.get(i).getRemain_round();
			String remR[]=remain_round.split(",");
    		
			ticet_date+=","+formatter.format(dtos.get(i).getTicet_date());
			seat_type+=","+dtos.get(i).getSeat_type();
			seat_num+=","+dtos.get(i).getSeat_num();
			perf_title+=","+dtos.get(i).getPerf_title();
			perf_image+=","+dtos.get(i).getPerf_Image();
			switch(dtos.get(i).getRound()) {
			case 1:
				round+=","+remR[0];
				break;
			case 2:
				round+=","+remR[1];
				break;
			case 3:
				round+=","+remR[2];
				break;
			case 4:
				round+=","+remR[3];
				break;
			case 5:
				round+=","+remR[4];
				break;
			case 6:
				round+=","+remR[5];
				break;
			}
			possible_age+=","+dtos.get(i).getPossible_age();
			hall_name+=","+dtos.get(i).getHall_name();
			if(dtos.get(i).getSeat_type().equals("VIP")) {
				price+=","+dtos.get(i).getVIP_seatPrice();
			}else if(dtos.get(i).getSeat_type().equals("R")) {
				price+=","+dtos.get(i).getR_seatPrice();
			}else if(dtos.get(i).getSeat_type().equals("S")) {
				price+=","+dtos.get(i).getS_seatPrice();
			}else if(dtos.get(i).getSeat_type().equals("A")) {
				price+=","+dtos.get(i).getA_seatPrice();
			}else if(dtos.get(i).getSeat_type().equals("B")) {
				price+=","+dtos.get(i).getB_seatPrice();
			}
			int pi=dtos.get(i).getPer_id();
			per_id+=","+pi;
    			
    	}
    	//perf_type
    	String hall_id = req.getParameter("hall_id");
    	String per_id_origin="";
    	if(hall_id!=null) {
    		per_id_origin = mhService.getPer_id(req);
    	}
    	
    	
    	result.put("per_id_origin", per_id_origin);
    	result.put("ticet_date", ticet_date);
    	result.put("seat_type", seat_type);
		result.put("seat_num", seat_num);
		result.put("perf_title", perf_title);
		result.put("perf_image", perf_image);
		result.put("round", round);
		result.put("possible_age", possible_age);
		result.put("hall_name", hall_name);
		result.put("price", price);
		result.put("per_id", per_id);
		result.put("cnt", cnt);
		System.out.println(
				"ticet_date : "+ticet_date+"\n"+
				"seat_type : "+seat_type+"\n"+
				"seat_num : "+seat_num+"\n"+
				"perf_title : "+perf_title+"\n"+
				"perf_image : "+perf_image+"\n"+
				"round : "+round+"\n"+
				"possible_age : "+possible_age+"\n"+
				"hall_name : "+hall_name+"\n"+
				"price : "+price+"\n"+
				"per_id:"+per_id
		);
        return result;
    }
	
	
	@RequestMapping("and_content")
	@ResponseBody
	public  Map<String, String> androidTestContent(HttpServletRequest req, Model model){
		System.out.println("and_content");
		String perf_title="";
		String perf_Image="";
		String startDate="";
		String endDate="";
		String remain_round="";
		String possible_age="";
		String VIP_seatPrice="";
		String R_seatPrice="";
		String S_seatPrice="";
		String A_seatPrice="";
		String B_seatPrice="";
		String hall_name="";
		String province="";
		String city="";
		String postNum="";
		String address="";
		String per_ex="";
		String Detail_Image="";
		TcatPerformanceVO vo =mhService.and_content(req, model);
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		perf_title=vo.getPerf_title();
		perf_Image=vo.getPerf_Image();
		startDate=formatter.format(vo.getStartDate());
		endDate=formatter.format(vo.getEndDate());
		remain_round=vo.getRemain_round();
		possible_age=""+vo.getPossible_age();
		VIP_seatPrice=""+vo.getVIP_seatPrice();
		R_seatPrice=""+vo.getR_seatPrice();
		S_seatPrice=""+vo.getS_seatPrice();
		A_seatPrice=""+vo.getA_seatPrice();
		B_seatPrice=""+vo.getA_seatPrice();
		hall_name=vo.getHall_name();
		province=vo.getProvince();
		city=vo.getCity();
		postNum=vo.getPostNum();
		address=vo.getAddress();
		per_ex=vo.getPer_ex();
		Detail_Image=vo.getDetail_Image();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("perf_title", perf_title);
		map.put("perf_Image", perf_Image);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("remain_round", remain_round);
		map.put("possible_age", possible_age);
		map.put("VIP_seatPrice", VIP_seatPrice);
		map.put("R_seatPrice", R_seatPrice);
		map.put("S_seatPrice", S_seatPrice);
		map.put("S_seatPrice", S_seatPrice);
		map.put("S_seatPrice", S_seatPrice);
		map.put("A_seatPrice", A_seatPrice);
		map.put("B_seatPrice", B_seatPrice);
		map.put("hall_name", hall_name);
		map.put("province", province);
		map.put("city", city);
		map.put("postNum", postNum);
		map.put("address", address);
		map.put("per_ex", per_ex);
		map.put("Detail_Image", Detail_Image);
		
		System.out.println("-----------0"+perf_Image);
		return map;
	}
	
	
	
	
	
}
