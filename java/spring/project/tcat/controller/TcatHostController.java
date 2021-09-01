package spring.project.tcat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.project.tcat.service.HostService;
import spring.project.tcat.service.YMGuestService;

@Controller
public class TcatHostController {

	@Autowired
	HostService hService;

	// 호스트 메인화면 호출
	@RequestMapping("hostPage")
	public String hostPage(HttpServletRequest req, Model model) {
		System.out.println("hostPage");

		return "tcat/hostMain/hostPage";
	}

	// 호스트 메인화면 호출
	@RequestMapping("hostMain_side")
	public String hostMain_side(HttpServletRequest req, Model model) {
		System.out.println("hostMain_side");
		return "tcat/hostMain/hostMain_side";
	}

	// 호스트 메인화면
	@RequestMapping("hostMain")
	public String hostMain(HttpServletRequest req, Model model) {
		System.out.println("hostMain");
		hService.hostMainInfo(req, model);
		hService.dayslse(req, model);
		hService.provalHost(req, model);
		hService.join_retireMember(req, model);
		return "tcat/hostMain/hostMain";
	}

	// 회원 가입탈퇴 관리 사이드
	@RequestMapping("join_retireMember_side")
	public String join_retireMember_side(HttpServletRequest req, Model model) {
		System.out.println("join_retireMember_side");
		return "tcat/memberManage/join_retireMember_side";
	}

	// 회원탈퇴 복구
	@RequestMapping("retireMemberRecuvery")
	public String retireMemberRecuvery(HttpServletRequest req, Model model) {
		System.out.println("retireMemberRecuvery");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.sleepMember(req, model);
		} else {
			hService.memberManagerSerchList(req, model);
		}
		return "tcat/memberManage/retireMemberRecuvery";
	}

	// 최근 가입회원 화면
	@RequestMapping("join_retireMember")
	public String join_retireMember(HttpServletRequest req, Model model) {
		System.out.println("join_retireMember");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.join_retireMember(req, model);
		} else {
			hService.memberManagerSerchList(req, model);
		}
		return "tcat/memberManage/join_retireMember";
	}

	// 휴면회원 관리
	@RequestMapping("sleepMember")
	public String sleepMember(HttpServletRequest req, Model model) {
		System.out.println("sleepMember");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.sleepMember(req, model);
		} else {
			hService.memberManagerSerchList(req, model);
		}
		return "tcat/memberManage/sleepMember";
	}

	// 휴면회원 사이드
	@RequestMapping("sleepMember_side")
	public String sleepMember_side(HttpServletRequest req, Model model) {
		System.out.println("sleepMember_side");
		return "tcat/memberManage/sleepMember_side";
	}

	// 휴면회원 취소
	@RequestMapping("sleepMemberCancer")
	public String sleepMemberCancer(HttpServletRequest req, Model model) {
		System.out.println("sleepMemberCancer");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.sleepMember(req, model);
		} else {
			hService.memberManagerSerchList(req, model);
		}
		return "tcat/memberManage/sleepMemberCancer";
	}

	// 휴면회원 탈퇴
	@RequestMapping("sleepMemberRetired")
	public String sleepMemberRetired(HttpServletRequest req, Model model) {
		System.out.println("sleepMemberRetired");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.sleepMember(req, model);
		} else {
			hService.memberManagerSerchList(req, model);
		}
		return "tcat/memberManage/sleepMemberRetired";
	}

	// 휴면회원 처리
	@RequestMapping("sleepMemberPro")
	public String sleepMemberPro(HttpServletRequest req, Model model) {
		System.out.println("sleepMemberPro");
		String reUrl = req.getParameter("reUrl");
		hService.sleepMemberPro(req, model);

		if (reUrl.equals("sleepMember")) {
			sleepMember(req, model);
		} else if (reUrl.equals("sleepMemberCancer")) {
			sleepMemberCancer(req, model);
		} else if (reUrl.equals("sleepMemberRetired")) {
			sleepMemberRetired(req, model);
		} else if (reUrl.equals("retireMemberRecuvery")) {
			retireMemberRecuvery(req, model);
		}
		return "tcat/memberManage/" + reUrl;
	}

	// 공연장등록
	@RequestMapping("hallAdd")
	public String hallAdd(HttpServletRequest req, Model model) {
		System.out.println("hallAdd");
		return "tcat/locationManager/hallAdd";
	}

	// 공연장등록
	@RequestMapping("hallSeatMake")
	public String hallSeatMake(HttpServletRequest req, Model model) {
		System.out.println("hallSeatMake");
		return "tcat/locationManager/hallSeatMake";
	}

	// 공연장 인서트
	@RequestMapping("insertHall")
	public String insertHall(HttpServletRequest req, Model model) {
		System.out.println("insertHall");
		hService.insertHall(req, model);
		return "tcat/locationManager/hallAdd";
	}

	// 공연장등록사이드
	@RequestMapping("hallList_side")
	public String hallList_side(HttpServletRequest req, Model model) {
		System.out.println("hallList_side");
		return "tcat/locationManager/hallList_side";
	}

	// 공연장 수정
	@RequestMapping("hallModify")
	public String hallModify(HttpServletRequest req, Model model) {
		System.out.println("hallModify");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.hallDelete(req, model);
		} else {
			hService.hallSerchList(req, model);
		}

		return "tcat/locationManager/hallModify";
	}
	// 공연장 리스트
	@RequestMapping("hallList")
	public String hallList(HttpServletRequest req, Model model) {
		System.out.println("hallList");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.hallList(req, model);
		} else {
			hService.hallSerchList(req, model);
		}
		
		return "tcat/locationManager/hallList";
	}

	// 공연장 삭제
	@RequestMapping("hallDelete")
	public String hallDelete(HttpServletRequest req, Model model) {
		System.out.println("hallDelete");
		String s = null;
		s = req.getParameter("search");
		if (s == null) {
			s = "a";
		}
		if (s.equals("a")) {
			hService.hallDelete(req, model);
		} else {
			hService.hallSerchList(req, model);
		}

		return "tcat/locationManager/hallDelete";
	}

	// 공연장 삭제 연산
	@RequestMapping("hallDeletePro")
	public String hallDeletePro(HttpServletRequest req, Model model) {
		System.out.println("hallDeletePro");
		hService.hallDeletePro(req, model);
		hallDelete(req, model);
		return "tcat/locationManager/hallDelete";
	}

	// 공연장 수정 데이터 가져오기
	@RequestMapping("hallModifyDB")
	public String hallModifyDB(HttpServletRequest req, Model model) {
		System.out.println("hallModifyDB");
		hService.hallModifyDB(req, model);
		return "tcat/locationManager/hallModifyDB";
	}
	// 공연장 수정 데이터 가져오기
	@RequestMapping("hallLIstDB")
	public String hallLIstDB(HttpServletRequest req, Model model) {
		System.out.println("hallLIstDB");
		hService.hallLIstDB(req, model);
		return "tcat/locationManager/hallLIstDB";
	}

	// 공연장 수정 데이터 가져오기
	@RequestMapping("seat_result")
	public String seat_result(HttpServletRequest req, Model model) {
		return "tcat/locationManager/seat_result";
	}

	// 공연장 수정 데이터 update
	@RequestMapping("hallModifyUpdate")
	public String hallModifyUpdate(HttpServletRequest req, Model model) {
		hService.hallModifyUpdate(req, model);
		return "tcat/locationManager/hallModifyDB";
	}
	
	//매출집계
	@RequestMapping("salseGraph")
	public String salseGraph(HttpServletRequest req, Model model) {
		System.out.println("salseGraph");
		hService.monthSalse(req, model);
		hService.weekendSalse(req, model);
		hService.dayslse(req, model);
		return "tcat/salse/salseGraph";
	}
	//매출집계 사이드
	@RequestMapping("salseGraph_side")
	public String salseGraph_side(HttpServletRequest req, Model model) {
		System.out.println("salseGraph_side");
		return "tcat/salse/salseGraph_side";
	}
	//일별결산
	@RequestMapping("daySalse")
	public String daySalse(HttpServletRequest req, Model model) {
		System.out.println("daySalse");
		hService.dayslse(req, model);
		return "tcat/salse/daySalse";
	}
	//주별결산
	@RequestMapping("weekendSalse")
	public String weekendSalse(HttpServletRequest req, Model model) {
		System.out.println("weekendSalse");
		hService.weekendSalse(req, model);
		return "tcat/salse/weekendSalse";
	}
	//월별결산
	@RequestMapping("monthSalse")
	public String monthSalse(HttpServletRequest req, Model model) {
		System.out.println("monthSalse");
		hService.monthSalse(req, model);
		return "tcat/salse/monthSalse";
	}
	
	
	//////////////////////////// 18.01.16 명훈
	//////////////////////////// 시작////////////////////////////////////////////
	// 스토어 구매승인 orderCon
	@RequestMapping("orderCon")
	public String orderCon(HttpServletRequest req, Model model) {
		System.out.println("orderCon");
		// 상품목록 나열
		hService.orderCon(req, model);
		// 목록가져오기
		hService.orderList_store(req, model);
		return "tcat/orderList/orderList_store";
	}

	// 연극상품 나열
	@RequestMapping("productList")
	public String productList_perf(HttpServletRequest req, Model model) {
		System.out.println("productList");
		// 상품목록 나열
		hService.productList(req, model);
		return "tcat/productList/productList";
	}

	// 스토어 상품 나열
	@RequestMapping("productList_store")
	public String productList_store(HttpServletRequest req, Model model) {
		System.out.println("productList_store");
		// 상품목록 나열
		hService.productList(req, model);
		return "tcat/productList/productList_store";
	}

	// productList 사이드바
	@RequestMapping("productList_side")
	public String productList_side(HttpServletRequest req, Model model) {
		System.out.println("productList_side");
		return "tcat/productList/productList_side";
	}

	// orderList 상품 주문 목록
	@RequestMapping("orderList")
	public String orderList(HttpServletRequest req, Model model) {
		System.out.println("orderList");
		// 목록가져오기
		hService.orderList(req, model);
		return "tcat/orderList/orderList";
	}

	// orderList_store 스토어 상품 주문 리스트
	@RequestMapping("orderList_store")
	public String orderList_store(HttpServletRequest req, Model model) {
		System.out.println("orderList_store");
		// 목록가져오기
		hService.orderList_store(req, model);
		return "tcat/orderList/orderList_store";
	}

	// orderList 상품 주문 목록 사이드바
	@RequestMapping("orderList_side")
	public String orderList_side(HttpServletRequest req, Model model) {
		System.out.println("orderList_side");
		return "tcat/orderList/orderList_side";
	}

	////////////////////////////////////////////// 1/25 명훈
	////////////////////////////////////////////// 추가////////////////////////////////////////////////////
	// orderManagement 배송관리
	@RequestMapping("orderManagement")
	public String orderManagement(HttpServletRequest req, Model model) {
		System.out.println("orderManagement");
		// 목록가져오기
		hService.orderManagement(req, model);
		return "tcat/orderManagement/orderManagement";
	}

	// orderManagement_store 배송관리
	@RequestMapping("orderManagement_store")
	public String orderManagement_store(HttpServletRequest req, Model model) {
		System.out.println("orderManagement_store");
		// 목록가져오기
		hService.orderManagement_store(req, model);
		return "tcat/orderManagement/orderManagement_store";
	}

	// orderManagement_side 배송관리사이드바
	@RequestMapping("orderManagement_side")
	public String orderManagement_side(HttpServletRequest req, Model model) {
		System.out.println("orderManagement_side");
		return "tcat/orderManagement/orderManagement_side";
	}

	// orderMangement_Change 변경
	@RequestMapping("orderMangement_Change")
	public String orderMangement_Change(HttpServletRequest req, Model model) {
		System.out.println("orderMangement_Change");
		// orderMangement_storeChange
		hService.orderMangement_Change(req, model);
		// 목록가져오기
		hService.orderManagement(req, model);
		return "tcat/orderManagement/orderManagement";
	}

	// orderMangement_storeChange 변경
	@RequestMapping("orderMangement_storeChange")
	public String orderMangement_storeChange(HttpServletRequest req, Model model) {
		System.out.println("orderMangement_storeChange");
		// orderMangement_storeChange
		hService.orderMangement_storeChange(req, model);
		// 목록가져오기
		hService.orderManagement_store(req, model);
		return "tcat/orderManagement/orderManagement_store";
	}

	////////////////////////////////////////////// 1/25 명훈 추가
	////////////////////////////////////////////// 끝////////////////////////////////////////////////////
	// productDetail 공연상품 상세페이지
	@RequestMapping("productDetail_perf")
	public String productDetail_perf(HttpServletRequest req, Model model) {
		System.out.println("productDetail_perf");
		// 해당되는 per_id에 데이터 가져온다.
		hService.productDetail_perf(req, model);
		return "tcat/productList/productDetail_perf";
	}

	// productDetail_store 스토어 상품 상세페이지
	@RequestMapping("productDetail_store")
	public String productDetail_store(HttpServletRequest req, Model model) {
		System.out.println("productDetail_store");
		// 해당되는 per_id에 데이터 가져온다.
		hService.productDetail_store(req, model);
		return "tcat/productList/productDetail_store";
	}

	//////////////////////////// 18.01.16 명훈
	//////////////////////////// 끝////////////////////////////////////////////
	//////////////////////////// 18.01. 명훈
	//////////////////////////// 시작////////////////////////////////////////////
	// 판매분석 side
	@RequestMapping("productRank_side")
	public String productRank_side(HttpServletRequest req, Model model) {
		System.out.println("productRank_side");
		return "tcat/productAnalysis/productRank_side";
	}

	// 판매상품 순위
	@RequestMapping("productRank")
	public String productRank(HttpServletRequest req, Model model) {
		System.out.println("productRank");
		return "tcat/productAnalysis/productRank";
	}

	// productRank_perf 공연 출력
	@RequestMapping("productRank_perf")
	public String productRank_perf(HttpServletRequest req, Model model) {
		System.out.println("productRank_perf");
		// 공연 상품 판매량 정렬 가져오기
		hService.productRank_perf(req, model);
		return "tcat/productAnalysis/productRank_perf";
	}

	// productRank_store 공연 출력
	@RequestMapping("productRank_store")
	public String productRank_store(HttpServletRequest req, Model model) {
		System.out.println("productRank_store");
		// 공연 상품 판매량 정렬 가져오기
		hService.productRank_store(req, model);
		return "tcat/productAnalysis/productRank_store";
	}

	// 카테고리 분석 출력
	@RequestMapping("categoryRank_perf")
	public String categoryRank_perf(HttpServletRequest req, Model model) {
		System.out.println("categoryRank_perf");
		// 공연 상품 판매량 정렬 가져오기
		hService.categoryRank_perf(req, model);
		return "tcat/productAnalysis/categoryRank_perf";
	}

	// 카테고리 분석 스토어
	@RequestMapping("categoryRank_store")
	public String categoryRank_store(HttpServletRequest req, Model model) {
		System.out.println("categoryRank_store");
		// 공연 상품 판매량 정렬 가져오기
		hService.categoryRank_store(req, model);
		return "tcat/productAnalysis/categoryRank_store";
	}

	// 카테고리 분석 출력
	@RequestMapping("returnRank_perf")
	public String returnRank_perf(HttpServletRequest req, Model model) {
		System.out.println("returnRank_perf");
		// 공연 상품 판매량 정렬 가져오기
		hService.returnRank_perf(req, model);
		return "tcat/productAnalysis/returnRank_perf";
	}

	// 카테고리 분석 스토어
	@RequestMapping("returnRank_store")
	public String returnRank_store(HttpServletRequest req, Model model) {
		System.out.println("returnRank_store");
		// 공연 상품 판매량 정렬 가져오기
		hService.returnRank_store(req, model);
		return "tcat/productAnalysis/returnRank_store";
	}

	// 장바구니 분석
	@RequestMapping("cartRank")
	public String cartRank(HttpServletRequest req, Model model) {
		System.out.println("cartRank");
		// 장바구니
		hService.cartRank(req, model);
		return "tcat/productAnalysis/cartRank";
	}

	// cartRank_table
	@RequestMapping("cartRank_table")
	public String cartRank_table(HttpServletRequest req, Model model) {
		System.out.println("cartRank_table");
		// 장바구니
		hService.cartRank(req, model);
		return "tcat/productAnalysis/cartRank_table";
	}

	// 위시리스트
	@RequestMapping("wishListRank_perf")
	public String wishListRank_perf(HttpServletRequest req, Model model) {
		System.out.println("wishListRank_perf");
		// 장바구니
		hService.wishListRank_perf(req, model);
		return "tcat/productAnalysis/wishListRank_perf";
	}

	// wishListRank_store
	@RequestMapping("wishListRank_store")
	public String wishListRank_store(HttpServletRequest req, Model model) {
		System.out.println("wishListRank_store");
		// 장바구니
		hService.wishListRank_store(req, model);
		return "tcat/productAnalysis/wishListRank_store";
	}

	//////////////////////////// 18.01. 명훈
	//////////////////////////// 끝////////////////////////////////////////////

	/////////////////////////////////// 태성 1/9
	/////////////////////////////////// start///////////////////////////////////
	// HOST//상품관리//카테고리별 상품진열관리 -- 카테고리별 상품진열 관리 (우선순위를 정해서 카테고리별로 상품진열하기)

	@RequestMapping("categoryList_side")
	public String categoryList_side(HttpServletRequest req, Model model) {

		System.out.println("categoryList_side");
		return "tcat/productList/categoryList_side";
	}

	@RequestMapping("categoryList")
	public String categoryList(HttpServletRequest req, Model model) {

		System.out.println("categoryList");
		hService.categoryList(req, model);

		return "tcat/productList/categoryList";
	}
	//////////////////////////////////// 태성 1/9 end/
	//////////////////////////////////// /////////////////////////////////////////

	//////////////////////////////////// 태성 1/10 start/
	//////////////////////////////////// /////////////////////////////////////////
	// HOST//상품관리/카테코리별 상품진열관리 -- 우선순위 변경
	@RequestMapping("Cfirst_grade")
	public String Cfirst_grade(HttpServletRequest req, Model model) {

		System.out.println("Cfirst_grade");
		hService.updateGrade(req, model);
		hService.categoryList(req, model);

		return "tcat/productList/categoryList";
	}

	@RequestMapping("Sfirst_grade")
	public String Sfirst_grade(HttpServletRequest req, Model model) {

		System.out.println("Sfirst_grade");
		hService.updateGrade(req, model);
		hService.categoryList(req, model);

		return "tcat/productList/categoryList";
	}

	//////////////////////////////////// 태성 1/10
	//////////////////////////////////// end/////////////////////////////////////

	/////////////////////// HOST/상품관리/상품재고관리 시작 태성 1/12 start///////////////////////
	@RequestMapping("stockManagement_side")
	public String stockManagement_side(HttpServletRequest req, Model model) {

		System.out.println("stockManagement_side");

		return "tcat/productList/stockManagement_side";
	}

	// 상품재고 관리 재고수량 확인
	@SuppressWarnings("null")
	@RequestMapping("stockManagement")
	public String stockManagement(HttpServletRequest req, Model model) {

		System.out.println("stockManagement");
		hService.stockManagementList(req, model);

		return "tcat/productList/stockManagement";
	}

	// 상품재고 관리 재고수량 변경 전 윈도우 팝업창
	@RequestMapping("stockManagement_modify")
	public String stockManagement_modify(HttpServletRequest req, Model model) {

		System.out.println("stockManagement_modify");
		hService.stockManagementClickList(req, model);

		return "tcat/productList/stockManagement_modify";
	}

	// 상품재고 관리 재고수량 수정
	@RequestMapping("stockManagement_stock")
	public String stockManagement_stock(HttpServletRequest req, Model model) {

		System.out.println("stockManagement_modify");

		hService.updateStock(req, model);
		hService.stockManagementClickList(req, model);

		return "tcat/productList/stockManagement_modify";
	}

	/////////////////////// HOST/상품관리/상품재고관리 시작 태성 1/12 end ////////////////////////

	////////////// HOST/상품진열관리/스텝변경 태성 1/17 start/////////////////
	// 스토어 스텝 변경
	@RequestMapping("Sstep")
	public String Sstep(HttpServletRequest req, Model model) {
		System.out.println("Sstep");

		hService.changeStep(req, model);
		hService.categoryList(req, model);

		return "tcat/productList/categoryList";
	}

	// 공연 스텝 변경
	@RequestMapping("Cstep")
	public String Cstep(HttpServletRequest req, Model model) {
		System.out.println("Cstep");

		hService.changeStep(req, model);
		hService.categoryList(req, model);

		return "tcat/productList/categoryList";
	}
	////////////// HOST/상품진열관리/스텝변경 태성 1/17 end/////////////////

	//////////////////////////////////// 현석 1/11 /
	//////////////////////////////////// /////////////////////////////////////////

	@RequestMapping("registItem")
	public String registItem(HttpServletRequest req, Model model) {
		System.out.println("registItem");

		// 공연정보 목록 가져오기
		hService.performanceList(req, model);

		return "tcat/registItem/registItem";
	}

	@RequestMapping("registItem_side")
	public String registItem_side(HttpServletRequest req, Model model) {
		System.out.println("registItem_side");

		return "tcat/registItem/registItem_side";
	}

	@RequestMapping("seatPrice")
	public String seatPrice(HttpServletRequest req, Model model) {
		System.out.println("seatPrice");

		String title = req.getParameter("title");
		String hall_name = req.getParameter("hall_name");
		int vip = Integer.parseInt(req.getParameter("vip"));
		int r = Integer.parseInt(req.getParameter("r"));
		int s = Integer.parseInt(req.getParameter("s"));
		int a = Integer.parseInt(req.getParameter("a"));
		int b = Integer.parseInt(req.getParameter("b"));

		req.setAttribute("title", title);
		req.setAttribute("hall_name", hall_name);
		req.setAttribute("vip", vip);
		req.setAttribute("r", r);
		req.setAttribute("s", s);
		req.setAttribute("a", a);
		req.setAttribute("b", b);

		return "tcat/registItem/seatPrice";
	}

	@RequestMapping("cheackSeatPrice")
	public String cheackSeatPrice(HttpServletRequest req, Model model) {
		System.out.println("cheackSeatPrice");

		return "tcat/registItem/cheackSeatPrice";
	}

	// 공연정보 추가
	@RequestMapping("insertPerformance")
	public String insertPerformance(MultipartHttpServletRequest req, Model model) {
		System.out.println("insertPerformance");

		hService.performanceInsert(req, model);
		// 공연정보 목록 가져오기
		hService.performanceList(req, model);

		return "tcat/registItem/registItem";
	}

	@RequestMapping("remain_round")
	public String remain_round(HttpServletRequest req, Model model) {
		System.out.println("remain_round");

		return "tcat/registItem/remain_round";
	}

	@RequestMapping("storeItem")
	public String storeItem(HttpServletRequest req, Model model) {
		System.out.println("storeItem");

		req.setAttribute("item", 1);
		hService.storeList(req, model);

		return "tcat/registItem/registItem";
	}

	@RequestMapping("insertStore")
	public String insertStore(MultipartHttpServletRequest req, Model model) {
		System.out.println("insertStore");

		req.setAttribute("item", 1);
		hService.insertStore(req, model);
		hService.storeList(req, model);

		return "tcat/registItem/registItem";
	}

	// 2018-01-15----------------------------------------------------------------------
	// 회원정보 조회 수정 페이지 [지금은 리스트 가져오기]
	@RequestMapping("memberModified")
	public String memberModified(HttpServletRequest req, Model model) {
		System.out.println("memberModified");

		hService.member_list(req, model);

		return "tcat/memberManage/memberModified";
	}

	// 회원정보 조회 수정 페이지[사이드]
	@RequestMapping("memberModified_side")
	public String memberModified_side(HttpServletRequest req, Model model) {
		System.out.println("memberModified_side");

		return "tcat/memberManage/memberModified_side";
	}

	// 회원정보 상세페이지 [수정페이지]
	@RequestMapping("detailMember")
	public String detailMember(HttpServletRequest req, Model model) {
		System.out.println("detailMember");
		hService.detailMember(req, model);
		return "tcat/memberManage/detailMember";
	}

	// 회원정보 상세페이지 [수정페이지]
	@RequestMapping("detailMember_update")
	   public String detailMember_update(HttpServletRequest req, Model model) {
	      System.out.println("detailMember_update");
	      System.out.println("id:" + req.getParameter("member_id"));
	      System.out.println("pwd:"+req.getParameter("member_pwd"));
	      hService.detailMember_update(req, model);
	      hService.member_list(req, model);

	      return "tcat/memberManage/detailMember";
	   }

	// host이메일 체크
	@RequestMapping("emailCheack")
	public String emailCheack(HttpServletRequest req, Model model) {
		System.out.println("emailCheack");

		hService.emailCheack(req, model);

		return "tcat/memberManage/emailCheack";
	}
	// 2018-01-16------------------------------------------------------------

	// host가입
	@RequestMapping("HostPlus")
	public String HostPlus(HttpServletRequest req, Model model) {
		System.out.println("HostPlus");
		try {
			hService.HostPlus(req, model);
		} catch (Exception e) {

		}

		return "tcat/hostMain/hostPage";
	}

	// host id가 있는지 체크
	@RequestMapping("HostIdCheack")
	public String HostIdCheack(HttpServletRequest req, Model model) {
		System.out.println("HostIdCheack");

		hService.HostIdCheack(req, model);

		return "tcat/memberManage/HostIdCheack";
	}

	// 호스트 멤버 탈퇴 관리 페이지
	@RequestMapping("hostMemberRetire")
	public String hostMemberRetire(HttpServletRequest req, Model model) {
		System.out.println("hostMemberRetire");

		hService.HostMemberList(req, model);

		return "tcat/memberManage/hostMemberRetire";
	}

	// 2018-01-16----------------------------------------------------------
	// 호스트 멤버 탈퇴
	@RequestMapping("deleteHost")
	public String deleteHost(HttpServletRequest req, Model model) {
		System.out.println("deleteHost");

		hService.deleteHost(req, model);
		hService.HostMemberList(req, model);

		return "tcat/memberManage/hostMemberRetire";
	}

	// 호스트 멤버 가입
	@RequestMapping("hostMemberJoin")
	public String hostMemberJoin(HttpServletRequest req, Model model) {
		System.out.println("hostMemberJoin");
		return "tcat/memberManage/hostMemberJoin";
	}

	// 공연상세 수정 페이지
	@RequestMapping("detailPer")
	public String detailPer(HttpServletRequest req, Model model) {
		System.out.println("detailPer");

		hService.detaillist(req, model);

		return "tcat/registItem/detailPer";
	}

	// 스토어 상세 수정 페이지
	@RequestMapping("detailStore")
	public String detailStore(HttpServletRequest req, Model model) {
		System.out.println("detailStore");

		hService.detaillist(req, model);

		return "tcat/registItem/detailStore";
	}

	// 공연상세페이지 수정
	@RequestMapping("updateDetailPer")
	public String updateDetailPer(MultipartHttpServletRequest req, Model model) {
		System.out.println("updateDetailPer");

		hService.updateDetailPer(req, model);
		hService.detaillist(req, model);
		return "tcat/registItem/detailPer";
	}

	// 스토어 상세 수정 페이지
	@RequestMapping("updateDetailStore")
	public String updateDetailStore(MultipartHttpServletRequest req, Model model) {
		System.out.println("updateDetailStore");

		hService.updateDetailStore(req, model);
		hService.detaillist(req, model);
		return "tcat/registItem/detailStore";
	}
	//////////////////////////////////// 현석 1/11 end/
	//////////////////////////////////// /////////////////////////////////////////

/////////////////// HOST/상품관리/이벤트 상품 등록 수정-2018-01-22 성영민
/////////////////// //////////////////////////////
@RequestMapping("hotMusical_side")
public String hotMusical_side(HttpServletRequest req, Model model) {
System.out.println("hotMusical_side");
return "tcat/productList/hotMusical_side";
}

// 뮤지컬 핫카테고리 5개 출력 전체 출력
@RequestMapping("hotMusical")
public String hotMusical(HttpServletRequest req, Model model) {
req.setAttribute("url", "hotMusical");
hService.hotMenu(req, model);
System.out.println("2");
return "tcat/productList/hotMusical";
}

// 핫리스트 제거
@RequestMapping("hotMenuDelete")
public String hotDelete(HttpServletRequest req, Model model) {
System.out.println("hotMenuDelete");
String url = "";
url = req.getParameter("url");

System.out.println("222url" + url);
req.setAttribute("url", url);
hService.hotMenuDelete(req, model);
hService.hotMenu(req, model);

System.out.println("url" + url);

return "tcat/productList/" + url;
}

// 핫리스트 추가
@RequestMapping("hotMenuUpdate")
public String hotUpdate(HttpServletRequest req, Model model) {
System.out.println("hotMenuUpdate");
String url = "";
url = req.getParameter("url");
System.out.println("1111url" + url);

req.setAttribute("url", url);

hService.hotMenuUpdate(req, model);
hService.hotMenu(req, model);
System.out.println("url" + url);
return "tcat/productList/" + url;
}

@RequestMapping("hotConcert")
public String hotConcert(HttpServletRequest req, Model model) {
System.out.println("hotConcert");
req.setAttribute("url", "hotConcert");
hService.hotMenu(req, model);

return "tcat/productList/hotConcert";
}

@RequestMapping("hotDrama")
public String hotDrama(HttpServletRequest req, Model model) {
System.out.println("hotDrama");
req.setAttribute("url", "hotDrama");
hService.hotMenu(req, model);
return "tcat/productList/hotDrama";
}

@RequestMapping("hotClassic")
public String hotClassic(HttpServletRequest req, Model model) {
System.out.println("hotClassic");
req.setAttribute("url", "hotClassic");
hService.hotMenu(req, model);
return "tcat/productList/hotClassic";
}
@RequestMapping("hotDance")
public String hotDance(HttpServletRequest req, Model model) {
System.out.println("hotDance");
req.setAttribute("url", "hotDance");
hService.hotMenu(req, model);
return "tcat/productList/hotDance";
}
//핫스토어
@RequestMapping("hotStore")
public String hotStore(HttpServletRequest req, Model model) {
System.out.println("hotStore");
req.setAttribute("url", "hotStore");
hService.hotStore(req, model);
return "tcat/productList/hotStore";
}
// 핫스토어 제거
@RequestMapping("hotStoreMenuDelete")
public String hotStoreDelete(HttpServletRequest req, Model model) {
System.out.println("hotStoreMenuDelete");
String url = "";
url = req.getParameter("url");

System.out.println("222url" + url);
req.setAttribute("url", url);
hService.hotStoreMenuDelete(req, model);
hService.hotStore(req, model);

System.out.println("url" + url);

return "tcat/productList/" + url;
}

// 핫스토어 추가
@RequestMapping("hotStoreMenuUpdate")
public String hotStoreUpdate(HttpServletRequest req, Model model) {
System.out.println("hotStoreMenuUpdate");
String url = "";
url = req.getParameter("url");
System.out.println("1111url" + url);

req.setAttribute("url", url);

hService.hotStoreMenuUpdate(req, model);
hService.hotStore(req, model);;
System.out.println("url" + url);
return "tcat/productList/" + url;
}
@Autowired
YMGuestService YMService;

// 이벤트 사이트
@RequestMapping("eventHost_side")
public String eventHost_side(HttpServletRequest req, Model model) {
System.out.println("eventHost_side");
return "tcat/borderManager/eventHost_side";
}

// 이벤트 호스트
@RequestMapping("eventHost")
public String eventHost(HttpServletRequest req, Model model) {
System.out.println("eventHost");
YMService.eventGuest(req, model);
return "tcat/borderManager/eventHost";
}

/////////////////// HOST/상품관리/공연정보 수정-2018-01-25 성영민  //////////////////////////////
// 이벤트수정
@RequestMapping("eventUpdate")
public String eventUpdate(HttpServletRequest req, Model model) {
System.out.println("eventUpdate");
YMService.eventForm(req, model);
return "tcat/borderManager/eventUpdate";
}

// 이벤트등록
@RequestMapping("eventAdd")
public String eventAdd(MultipartHttpServletRequest req, Model model) {
System.out.println("eventAdd");
YMService.eventAdd(req, model);
YMService.eventGuest(req, model);
return "tcat/borderManager/eventHost";
}

// 구매승인사이트바
@RequestMapping("provalMain_side")
public String provalMain_side(HttpServletRequest req, Model model) {
System.out.println("provalMain_side");
return "tcat/proval/provalMain_side";
}

// 구매승인
@RequestMapping("provalMain")
public String provalMain(HttpServletRequest req, Model model) {
System.out.println("provalMain");
hService.provalHost(req, model);
return "tcat/proval/provalMain";
}

// 구매승인
@RequestMapping("provalUpdate")
public String provalUpdate(HttpServletRequest req, Model model) {
System.out.println("provalUpdate");
hService.provalUpdate(req, model);
hService.provalHost(req, model);
return "tcat/proval/provalMain";
}

// 회원혜택관리
@RequestMapping("levelMember_side")
public String levelMember_side(HttpServletRequest req, Model model) {
System.out.println("levelMember_side");
return "tcat/memberManage/levelMember_side";
}

// 회원혜택관리
@RequestMapping("levelMember")
public String levelMember(HttpServletRequest req, Model model) {
System.out.println("levelMember");
hService.levelMember(req, model);
return "tcat/memberManage/levelMember";
}

// 혜택삭제
@RequestMapping("levelDelete")
public String levelDelete(HttpServletRequest req, Model model) {
System.out.println("levelDelete");
hService.levelDelete(req, model);
hService.levelMember(req, model);
return "tcat/memberManage/levelMember";
}

// 혜택수정
@RequestMapping("levelMemberForm")
public String levelMemberForm(HttpServletRequest req, Model model) {
System.out.println("levelMemberForm");
hService.levelMemberForm(req, model);
return "tcat/memberManage/levelMemberForm";
}

// 혜택업데이트
@RequestMapping("levelMemberUpdate")
public String levelMemberUpdate(HttpServletRequest req, Model model) {
System.out.println("levelMemberUpdate");
hService.levelMemberUpdate(req, model);
hService.levelMember(req, model);
return "tcat/memberManage/levelMember";
}

// 혜택등록
@RequestMapping("levelAdd")
public String levelAdd(MultipartHttpServletRequest req, Model model) {
System.out.println("levelAdd");
hService.levelAdd(req, model);
hService.levelMember(req, model);
return "tcat/borderManager/levelMember";
}

// 등급분석사이드
@RequestMapping("infoLevelMain_side")
public String infoLevelMain_side(HttpServletRequest req, Model model) {
System.out.println("infoLevel_side");
return "tcat/memberAnalysis/infoLevelMain_side";
}



/////////////////// HOST/상품관리/이벤트 상품 등록 수정-2018-01-22 성영민
/////////////////// //////////////////////////////
/////////////////// HOST/상품관리/공연정보 수정-2018-01-25 성영민
/////////////////// //////////////////////////////
// 공연정보 수정 사이드
@RequestMapping("hostProModify_side")
public String hostProModify_side(HttpServletRequest req, Model model) {
System.out.println("hostProModify_side");
return "tcat/productList/hostProModify_side";
}



// 공연정보 수정
@RequestMapping("hostProModify")
public String hostProModify(HttpServletRequest req, Model model) {
System.out.println("hostProModify");
// 공연정보 목록 가져오기
hService.performanceList(req, model);
return "tcat/productList/hostProModify";
}

// 상품수정 폼
@RequestMapping("hostProForm")
public String hostProForm(HttpServletRequest req, Model model) {
System.out.println("hostProForm");
hService.hostProForm(req, model);
return "tcat/productList/hostProForm";
}

// 상품수정
@RequestMapping("hostProUpdate")
public String hostProUpdate(MultipartHttpServletRequest req, Model model) {
System.out.println("hostProUpdate");
hService.hostProUpdate(req, model);
hService.performanceList(req, model);
return "tcat/productList/hostProModify";
}
//////////////////////////////////////////////////////////////////////////////
// 스토어 수정
@RequestMapping("hostProStore")
public String hostProStore(HttpServletRequest req, Model model) {
System.out.println("hostProStore");
// 공연정보 목록 가져오기
hService.storeList(req, model);
return "tcat/productList/hostProStore";
}
// 스토어수정 폼
@RequestMapping("hostProStoreForm")
public String hostProStoreForm(HttpServletRequest req, Model model) {
System.out.println("hostProForm");
hService.hostProStoreForm(req, model);
return "tcat/productList/hostProStoreForm";
}
// 스토어수정 
	@RequestMapping("hostProStoreUpdate")
	public String hostProStoreUpdate(MultipartHttpServletRequest req, Model model) {
		System.out.println("hostProStoreUpdate");
		hService.hostProStoreUpdate(req, model);
		hService.storeList(req, model);
		return "tcat/productList/hostProStore";
	}
/////////////////// HOST/상품관리/공연정보 수정-2018-01-25 성영민
/////////////////// //////////////////////////////

// 이벤트삭제
@RequestMapping("eventDelete")
public String eventDelete(HttpServletRequest req, Model model) {
System.out.println("eventDelete");
YMService.eventDelete(req, model);
YMService.eventGuest(req, model);
return "tcat/borderManager/eventHost";
}

// 이벤트수정
@RequestMapping("eventUpdateList")
public String eventUpdateList(MultipartHttpServletRequest req, Model model) {
System.out.println("eventUpdateList");
YMService.eventUpdateList(req, model);
YMService.eventGuest(req, model);
return "tcat/borderManager/eventHost";
}

/////////////////// HOST/상품관리/이벤트 상품 등록 수정-2018-01-22 성영민
/////////////////////// 동금 1/9 start ////////////////////////
// HOST/상품관리/상품삭제
@RequestMapping("stockDelete_musical_side")
public String stockDelete_musical_side(HttpServletRequest req, Model model) {
System.out.println("stockDelete_musical_side");

return "tcat/productList/stockDelete_musical_side";
}

// @SuppressWarnings("null")
// 뮤지컬상품삭제
@RequestMapping("stockDelete_musical")
public String stockDelete_musical(HttpServletRequest req, Model model) {
System.out.println("stockDelete_musical");
req.setAttribute("url", "stockDelete_musical");// mDev 결정 -> service
hService.stockDelete(req, model);
return "tcat/productList/stockDelete_musical";
}

// 콘서트상품삭제
@RequestMapping("stockDelete_concert")
public String stockDelete_concert(HttpServletRequest req, Model model) {
System.out.println("stockDelete_concert");
req.setAttribute("url", "stockDelete_concert");
hService.stockDelete(req, model);
return "tcat/productList/stockDelete_concert";
}

// 연극상품삭제
@RequestMapping("stockDelete_drama")
public String stockDelete_drama(HttpServletRequest req, Model model) {
System.out.println("stockDelete_drama");
req.setAttribute("url", "stockDelete_drama");
hService.stockDelete(req, model);
return "tcat/productList/stockDelete_drama";
}

// 클래식상품삭제
@RequestMapping("stockDelete_classic")
public String stockDelete_classic(HttpServletRequest req, Model model) {
System.out.println("stockDelete_classic");
req.setAttribute("url", "stockDelete_classic");
hService.stockDelete(req, model);
return "tcat/productList/stockDelete_classic";
}

// 스토어상품삭제
@RequestMapping("stockDelete_store")
public String stockDelete_store(HttpServletRequest req, Model model) {
System.out.println("stockDelete_store");
req.setAttribute("url", "stockDelete_store");
hService.storeDelete(req, model);
return "tcat/productList/stockDelete_store";
}

// 상품삭제alert
@RequestMapping("stockDelete_Pro")
public String stockDelete_Pro(HttpServletRequest req, Model model) {
System.out.println("stockDelete_Pro");
String url = req.getParameter("url");
hService.stockDeletePro(req, model);
if (url.equals("stockDelete_musical")) {
stockDelete_musical(req, model);
} else if (url.equals("stockDelete_concert")) {
stockDelete_concert(req, model);
} else if (url.equals("stockDelete_drama")) {
stockDelete_drama(req, model);
} else if (url.equals("stockDelete_classic")) {
stockDelete_classic(req, model);
}

return "tcat/productList/" + url;
}

// 스토어상품삭제alert
@RequestMapping("storeDelete_Pro")
public String storeDelete_Pro(HttpServletRequest req, Model model) {
System.out.println("storeDelete_Pro");
String url = req.getParameter("url");
hService.storeDeletePro(req, model);
stockDelete_store(req, model);

return "tcat/productList/" + url;
}

// 품절상품관리
@RequestMapping("stockOutOf_musical_side")
public String stockOutOf(HttpServletRequest req, Model model) {
System.out.println("stockOutOf_musical_side");

return "tcat/productList/stockOutOf_musical_side";
}

//공연상품품절관리
@RequestMapping("stockOutOf_musical")
public String stockOutOf_musical(HttpServletRequest req, Model model) {
System.out.println("stockOutOf_musical");

hService.productList(req, model);

return "tcat/productList/stockOutOf_musical";
}

// 공연판매중단하기
@RequestMapping("perfstoreSale_stop")
public String perfstoreSale_stop(HttpServletRequest req, Model model) {
System.out.println("perfstoreSale_stop");
String url = req.getParameter("url");
System.out.println(url);
hService.perfSale_stop(req, model);
hService.productList(req, model);
return "tcat/productList/stockOutOf_musical";
}

// 공연판매중단해제하기
@RequestMapping("perfstoreSale_Release")
public String perfstoreSale_Release(HttpServletRequest req, Model model) {
System.out.println("perfstoreSale_Release");
String url = req.getParameter("url");
hService.perfSale_Release(req, model);
hService.productList(req, model);
return "tcat/productList/" + url;

}

// 스토어상품품절관리
@RequestMapping("stockOutOf_store")
public String stockOutOf_store(HttpServletRequest req, Model model) {
System.out.println("stockOutOf_store");
// int disc_count = Integer.parseInt(req.getParameter("disc_count"));
req.setAttribute("url", "stockOutOf_store");
hService.storeOutOf(req, model);


return "tcat/productList/stockOutOf_store";
}

// 판매중단하기
@RequestMapping("storeSale_stop")
public String storeSale_stop(HttpServletRequest req, Model model) {
System.out.println("storeSale_stop");
String url = req.getParameter("url");
hService.storeSale_stop(req, model);
stockOutOf_store(req, model);
return "tcat/productList/" + url;
}

// 판매중단해제하기
@RequestMapping("storeSale_Release")
public String storeSale_Release(HttpServletRequest req, Model model) {
System.out.println("storeSale_Release");
String url = req.getParameter("url");
hService.storeSale_Release(req, model);
stockOutOf_store(req, model);

return "tcat/productList/" + url;

}

////////////////공지사항 게시판////////////
//공지사항 게시판 관리 사이드바
@RequestMapping("noticeManager_side")
public String noticeManager_side(HttpServletRequest req, Model model) {
System.out.println("noticeManager_side");


return "tcat/borderManager/noticeManager_side";

}
//공지사항 게시판 관리
@RequestMapping("noticeManager")
public String noticeManager(HttpServletRequest req, Model model) {
System.out.println("noticeManager");
//String url = req.getParameter("url");
req.setAttribute("url", "noticeManager");
hService.noticeManager(req, model);

return "tcat/borderManager/noticeManager";
}

//공지사항 게시판 게시글 작성
@RequestMapping("noticeManagerWrite")
public String noticeManagerWrite(HttpServletRequest req, Model model) {
System.out.println("noticeManagerWrite");

return "tcat/borderManager/noticeManagerWrite";
}

//공지사항 게시판 게시글 작성처리페이지(사진이미지등록)
@RequestMapping("noticeManagerWritePro")
public String noticeManagerWritePro(MultipartHttpServletRequest req, Model model) {
System.out.println("noticeManagerWritePro");
//req.setAttribute("url", "noticeManagerWritePro");
hService.noticeManagerWritePro(req, model);

return "tcat/borderManager/noticeManagerWritePro";
}

//공지사항 게시판 게시글 삭제
@RequestMapping("noticeManagerListDelete")
public String noticeManagerListDelete(HttpServletRequest req, Model model) {
System.out.println("noticeManagerListDelete");
//String url = req.getParameter("url");
hService.noticeManagerListDelete(req, model);
return "tcat/borderManager/noticeManagerListDeletePro";
}

//공지사항 게시판 게시글 수정페이지
@RequestMapping("noticeManagerListUpdate")
public String noticeManagerListUpdate(HttpServletRequest req, Model model) {
System.out.println("noticeManagerListUpdate");
int notice_num = Integer.parseInt(req.getParameter("notice_num"));
model.addAttribute("notice_num", notice_num);

return "tcat/borderManager/noticeManagerUpdate";
}


//공지사항 게시판 게시글 수정처리페이지
@RequestMapping("noticeManagerListUpdatePro")
public String noticeManagerListUpdate(MultipartHttpServletRequest req, Model model) {
System.out.println("noticeManagerListUpdate");
hService.noticeManagerListUpdatePro(req, model);
return "tcat/borderManager/noticeManagerListUpdatePro";
}

//공지사항 상세페이지
@RequestMapping("noticeManagerContent")
public String noticeManagerContent(HttpServletRequest req, Model model) {
System.out.println("noticeManagerContent");

hService.noticeManagerContent(req, model);

return "tcat/borderManager/noticeManagerContent";
}

////////////////qna 게시판////////////
//qna게시판 관리 사이드바
@RequestMapping("qnaManager_side")
public String qnaManager_side(HttpServletRequest req, Model model) {
System.out.println("qnaManager_side");


return "tcat/borderManager/qnaManager_side";

}

//qna 게시판 관리
@RequestMapping("qnaManager")
public String qnaManager(HttpServletRequest req, Model model) {
System.out.println("qnaManager");
//String url = req.getParameter("url");
//req.setAttribute("url", "noticeManager");
hService.qnaManager(req, model);

return "tcat/borderManager/qnaManager";
}

//qna게시판 게시글 삭제
@RequestMapping("qnaManagerListDelete")
public String qnaManagerListDelete(HttpServletRequest req, Model model) {
System.out.println("qnaManagerListDelete");
//String url = req.getParameter("url");
hService.qnaManagerListDelete(req, model);
return "tcat/borderManager/qnaManagerListDeletePro";
}

//Q&A게시판 상세보기
@RequestMapping("qnaManagerContent")
public String qnaManagerContent(HttpServletRequest req, Model model) {
System.out.println("qnaManagerContent");
//상세글
hService.qnaManagerContent(req, model);
//댓글
hService.qnaManagerComment(req, model);

return "tcat/borderManager/qnaManagerContent";
}

//댓글달기
@RequestMapping("qnaManagerCommentWrite")
public String qnaManagerCommentWrite(HttpServletRequest req, Model model) {
System.out.println("qnaManagerCommentWrite");
//댓글작성
hService.qnaManagerWrite(req, model);
//상세글
hService.qnaManagerContent(req, model);
//댓글
hService.qnaManagerComment(req, model);

return "tcat/borderManager/qnaManagerContent";
}


//댓글삭제
@RequestMapping("deleteManagerComment")
public String deleteManagerComment(HttpServletRequest req,Model model) {
System.out.println("deleteManagerComment");
//댓글삭제
hService.commentmanagerDelete(req, model);
//상세글불러오기
hService.qnaManagerContent(req, model);
//댓글
hService.qnaManagerComment(req, model);

return "tcat/borderManager/qnaManagerContent";
}

//1:1게시판 관리 사이드바
@RequestMapping("oneManager_side")
public String oneManager_side(HttpServletRequest req, Model model) {
System.out.println("oneManager_side");


return "tcat/borderManager/oneManager_side";

}

//1:1 게시판 관리
@RequestMapping("oneManager")
public String oneManager(HttpServletRequest req, Model model) {
System.out.println("oneManager");
//String url = req.getParameter("url");
//req.setAttribute("url", "noticeManager");
hService.oneManager(req, model);

return "tcat/borderManager/oneManager";
}

//1:1게시판 게시글 삭제
@RequestMapping("oneManagerListDelete")
public String oneManagerListDelete(HttpServletRequest req, Model model) {
System.out.println("oneManagerListDelete");
//String url = req.getParameter("url");
hService.oneManagerListDelete(req, model);
return "tcat/borderManager/oneManagerListDeletePro";
}

//1:1게시판 상세보기
@RequestMapping("oneManagerContent")
public String oneManagerContent(HttpServletRequest req, Model model) {
System.out.println("oneManagerContent");
//상세글
hService.oneManagerContent(req, model);
//댓글
hService.oneManagerComment(req, model);

return "tcat/borderManager/oneManagerContent";
}

//댓글달기
@RequestMapping("oneManagerCommentWrite")
public String oneManagerCommentWrite(HttpServletRequest req, Model model) {
System.out.println("oneManagerCommentWrite");
//댓글작성
hService.oneManagerWrite(req, model);
//상세글
hService.oneManagerContent(req, model);
//댓글
hService.oneManagerComment(req, model);

return "tcat/borderManager/oneManagerContent";
}

//댓글삭제
@RequestMapping("deleteOneManagerComment")
public String deleteOneManagerComment(HttpServletRequest req,Model model) {
System.out.println("deleteOneManagerComment");
//댓글삭제
hService.commentOnemanagerDelete(req, model);
//상세글불러오기
hService.oneManagerContent(req, model);
//댓글
hService.oneManagerComment(req, model);

return "tcat/borderManager/oneManagerContent";
}



/////////////////////// 동금 1/17 end ///////////////////////////
	////////////////////// 태성 1/21 start////////////////////////////
	// 관람/상품 후기 관리 게시판 목록
	@RequestMapping("commentManager")
	public String commentManager(HttpServletRequest req, Model model) {
		System.out.println("commentManager");

		hService.commentList(req, model);
		req.getSession().setAttribute("page", "commentManagerCate");

		return "tcat/borderManager/commentManager";
	}

	// 관람/상품 후기 관리 게시판_side
	@RequestMapping("commentManager_side")
	public String commentManager_side(HttpServletRequest req, Model model) {
		System.out.println("commentManager_side");
		return "tcat/borderManager/commentManager_side";
	}

	// 관람/상품 후기 관리 게시판 - 삭제기능
	@RequestMapping("commentDelete")
	public String commentDelete(HttpServletRequest req, Model model) {

		System.out.println("commentDelete");

		hService.commentDelete(req, model);
		hService.commentList(req, model);

		return "tcat/borderManager/commentManager";
	}

	////////////////////// 태성 1/21 end////////////////////////////
	////////////////////// 태성 1/23 start////////////////////////////
	// 환불
	@RequestMapping("productRefund_side")
	public String productRefund_side(HttpServletRequest req, Model model) {
		System.out.println("productRefund_side");
		return "tcat/productManager/productRefund_side";
	}

	// 공연 환불 - 목록
	@RequestMapping("productRefund")
	public String productRefund(HttpServletRequest req, Model model) {

		System.out.println("productRefund");
		hService.productRefundBoard(req, model);
		return "tcat/productManager/productRefund";

	}

	// 스토어 환불 - 목록
	@RequestMapping("productRefundS")
	public String productRefundS(HttpServletRequest req, Model model) {

		System.out.println("productRefundS");
		hService.productRefundBoardS(req, model);

		return "tcat/productManager/productRefundS";
	}

	// 공연 환불 - 승인
	@RequestMapping("productRefundUpdate")
	public String productRefundUpdate(HttpServletRequest req, Model model) {

		System.out.println("productRefundUpdate");
		hService.productRefundUpdate(req, model);
		hService.productRefundBoard(req, model);

		return "tcat/productManager/productRefund";
	}

	// 공연 환불 - 취소
	@RequestMapping("productRefundCancel")
	public String productRefundCancel(HttpServletRequest req, Model model) {
		System.out.println("productRefundCancel");

		hService.productRefundCancel(req, model);
		hService.productRefundBoard(req, model);

		return "tcat/productManager/productRefund";
	}

	// 스토어 환불 - 승인
	@RequestMapping("productRefundUpdateS")
	public String productRefundUpdateS(HttpServletRequest req, Model model) {

		System.out.println("productRefundUpdateS");

		hService.productRefundUpdateS(req, model);
		hService.productRefundBoardS(req, model);

		return "tcat/productManager/productRefundS";
	}

	// 스토어 환불 - 취소
	@RequestMapping("productRefundCancelS")
	public String productRefundCancelS(HttpServletRequest req, Model model) {

		System.out.println("productRefundCancelS");

		hService.productRefundCancelS(req, model);
		hService.productRefundBoardS(req, model);

		return "tcat/productManager/productRefundS";
	}
	////////////////////// 태성 1/23 end////////////////////////////
	///////////////////// 태성 1/30 start//////////////////////////

	// 사진관리 게시판
	@RequestMapping("photoManager")
	public String photoManager(HttpServletRequest req, Model model) {

		System.out.println("photoManager");

		hService.photoManagerList(req, model);

		return "tcat/borderManager/photoManager";

	}

	// 사진관리 게시판_side
	@RequestMapping("photoManager_side")
	public String photoManager_side(HttpServletRequest req, Model model) {
		System.out.println("photoManager_side");
		return "tcat/borderManager/photoManager_side";
	}

	// 사진관리 게시판 - 수정
	@RequestMapping("photoManagerNomo")
	public String photoManagerNomo(MultipartHttpServletRequest req, Model model) {

		System.out.println("photoManagerNomo");

		hService.photoManagerNomoService(req, model);
		hService.photoManagerList(req, model);

		return "tcat/borderManager/photoManager";

	}

	// 사진관리 게시판 - 삭제
	@RequestMapping("photoManagerDelete")
	public String photoManagerDelete(HttpServletRequest req, Model model) {

		System.out.println("photoManagerDelete");

		req.setAttribute("category", req.getParameter("category"));
		hService.photoManagerDeleteService(req, model);
		hService.photoManagerList(req, model);

		return "tcat/borderManager/photoManager";

	}

	// 영상관리 게시판
	@RequestMapping("movieManager")
	public String movieManager(HttpServletRequest req, Model model) {

		System.out.println("movieManager");
		hService.movieManagerList(req, model);
		
		return "tcat/borderManager/movieManager";
	}

	// 영상관리 게시판 - side
	@RequestMapping("movieManager_side")
	public String movieManager_side(HttpServletRequest req, Model model) {

		System.out.println("movieManager_side");

		return "tcat/borderManager/movieManager_side";
	}
	// 영상관리 게시판 - 수정
		@RequestMapping("movieManagerNomo")
		public String movieManagerNomo(MultipartHttpServletRequest req, Model model) {

			System.out.println("movieManagerNomo");

			hService.movieManagerNomoService(req, model);
			hService.movieManagerList(req, model);

			return "tcat/borderManager/movieManager";

		}

		// 영상관리 게시판 - 삭제
		@RequestMapping("movieManagerDelete")
		public String movieManagerDelete(HttpServletRequest req, Model model) {

			System.out.println("movieManagerDelete");

			req.setAttribute("category", req.getParameter("category"));
			hService.movieManagerDeleteService(req, model);
			hService.movieManagerList(req, model);

			return "tcat/borderManager/movieManager";

		}
		// 스토어 반품 - 목록
		@RequestMapping("productReturn")
		public String productReturn(HttpServletRequest req, Model model) {

			System.out.println("productReturn");
			hService.productReturn(req, model);

			return "tcat/productManager/productReturn";
		}

		// 스토어 반품 - 승인
		@RequestMapping("productReturnUpdateS")
		public String productReturnUpdateS(HttpServletRequest req, Model model) {

			System.out.println("productReturnUpdateS");
			hService.productReturnUpdateS(req, model);
			hService.productReturn(req, model);

			return "tcat/productManager/productReturn";
		}
	///////////////////// 태성 1/30 end//////////////////////////
}
