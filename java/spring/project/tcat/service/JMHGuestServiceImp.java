package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.project.tcat.VO.ContentFavoriteVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.VO.WishListVO;
import spring.project.tcat.persistence.JMHGuestDAO;

@Service
public class JMHGuestServiceImp implements JMHGuestService {
	@Autowired
	private JMHGuestDAO mhDAO;

	// 아이디,비밀번호 찾기
	@Override
	public void findIdPwd(HttpServletRequest req, Model model) {
		// 웹에서 받아오기
		String member_email = req.getParameter("member_email");
		String member_name = req.getParameter("member_name");
		String member_id = req.getParameter("member_id");
		System.out.println(
				"member_email: " + member_email + "/" + "member_name" + member_name + "/" + "member_id" + member_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_email", member_email);
		map.put("member_name", member_name);
		map.put("member_id", member_id);
		// DB에 해당 이메일과 이름이 존재하는 확인
		int id_emailChk = mhDAO.id_emailChk(map); // 1: 존재, 0: 존재x
		// 웹으로 체크 결과 전송
		model.addAttribute("id_emailChk", id_emailChk);
		System.out.println("id_emailChk: " + id_emailChk);
		if (id_emailChk == 1) {
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 6; i++) {
				int rIndex = rnd.nextInt(2);
				switch (rIndex) {
				case 0:
					// A~Z 글자 난수
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				default:
					// 0~9 숫자 난수
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			// 6자 난수 받음
			String admit_code = temp.toString();
			// 세션에 띄우기
			req.getSession().setAttribute("admit_code", admit_code);
			mhDAO.sendIdMail(member_email, admit_code);
		}
	}

	// 아이디비밀번호 찾기 결과
	@Override
	public void findResult(HttpServletRequest req, Model model) {
		// 화면에서 값 받기
		String member_email = req.getParameter("member_email");
		String member_name = req.getParameter("member_name");
		String admit_code = req.getParameter("admit_code");
		String member_id = req.getParameter("member_id");
		String admit_code_key = (String) req.getSession().getAttribute("admit_code");
		System.out.println("admit_code_key: " + admit_code_key);
		// 승인코드 확인
		boolean admit = admit_code.equals(admit_code_key);

		// 값 전달 바구니
		Map<String, Object> map = new HashMap<String, Object>();
		// 승인코드 틀림
		if (admit == false) {
			// model 띄우기
			model.addAttribute("id_emailChk", 1);// 인증번호 전송됨
			model.addAttribute("admit_fail", 1);// 승인 FAIL
		}
		// 승인코드 맞음
		else {
			map.put("member_id", member_id);
			map.put("member_email", member_email);
			map.put("member_name", member_name);
			// 찾는 정보 가져오기
			String member_find = mhDAO.findIdPwd(map);

			// member_id!=null-> pwd
			// member_id==null-> id
			if (member_id == null) {
				model.addAttribute("member_id", member_find);
			} else {
				model.addAttribute("member_pwd", member_find);
			}
			// 띄우기
			model.addAttribute("admit_fail", 0);// 승인 OK
			req.getSession().removeAttribute("admit_code");
		}
	}

	// 로그인 처리
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		// 값 받기
		String member_id = req.getParameter("member_id");
		String member_pwd = req.getParameter("member_pwd");
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		// 로그인 확인
		int loginRs = mhDAO.loginPro(map);
		if (loginRs == 1) {
			// 접속일 갱신, 휴면계정 을 회원으로 스텝 변경
			mhDAO.updateLastDate(map);
			// 세션 태우기
			// 로그인 상태 아이디
			req.getSession().setAttribute("login_id", member_id);
		}
		// 로그인 결과값
		model.addAttribute("loginRs", loginRs);
	}

	// 마이페이지 정보가져오기
	@Override
	public void myPageInfo(HttpServletRequest req, Model model) {
		// 세션에 로그인된 아이디 받기
		String member_id = (String) req.getSession().getAttribute("login_id");
		System.out.println(member_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		// 회원 정보 받기
		MemberVO myPageInfo = mhDAO.myPageInfo(map);
		model.addAttribute("myPageInfo", myPageInfo);

		// 회원의 배송정보
		ArrayList<TcatDiscBuyVO> db = null;
		map.put("disc_buyStep", 0);// 초기값
		for (int index = 1; index <= 8; index++) {
			// 1:결제 2:상품준비중 3:배송시작 4:배송중 5:배송완료 6:환불요청 7:환불승인 8:교환
			map.replace("disc_buyStep", index);// 구입스텝 변경
			db = mhDAO.memDiscBuy(map);
			int cnt = db.size();
			model.addAttribute("step" + index, cnt);
			model.addAttribute("listStep" + index, db);
			System.out.println("cnt:" + cnt);
		}
	}

	// 공연정보 리스트 가져오기
	public void getPerfList(HttpServletRequest req, Model model) {
		System.out.println("getPerfList");
		// 화면에서 원하는 데이터 호출
		String sDev = req.getParameter("sDev"); // 소분류
		String order = req.getParameter("order"); // 정렬순

		if (order.equals(""))
			order = null;

		// 게시판 구조
		int pageSize = 5; // 한 페이지당 출력할 글의 갯수
		int pageBlock = 10; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 시작번호
		int end = 0; // 현재 페이지 글 마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지
		int pageCnt = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int productCnt = 0; // 앨범 갯수

		// 조건
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDev", sDev);
		map.put("order", order);

		// 갯수
		productCnt = mhDAO.getPerfListCnt(map);
		System.out.println("해당 공연 갯수: " + productCnt);

		// 현재 보고있는 페이지
		pageNum = req.getParameter("pageNum");
		if ((pageNum == null)) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정
		}
		System.out.println("pageNum: " + pageNum);

		// 현재 페이지
		currentPage = Integer.parseInt(pageNum);
		// 페이지 갯수 = 앨범 갯수 / 페이지에 보여줄 갯수 +(나머지가 존재하면 1페이지 추가)
		pageCnt = (productCnt / pageSize) + (productCnt % pageSize > 0 ? 1 : 0);

		// 현재페이지 글 시작번호
		number = 1 + (currentPage - 1) * pageSize;
		// 1페이지 경우 시작번호는 1
		start = (currentPage - 1) * pageSize + 1;
		// 현재페이지 끝번호
		end = start + pageSize - 1;

		// 만약 페이지 끝번호보다 앨범갯수보다 크면
		if (end > productCnt)
			end = productCnt;

		// 게시글 받아오기
		if (productCnt > 0) {
			// 게시물 가져오기
			map.put("start", start);
			map.put("end", end);
			// 담을 바구니 생성
			ArrayList<TcatPerformanceVO> perfs = mhDAO.getPerfList(map);
			System.out.println("공연 갯수: " + perfs.size());
			model.addAttribute("perfs", perfs);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}

		// req넘기기

		model.addAttribute("number", number);
		model.addAttribute("productCnt", productCnt);// 글갯수
		model.addAttribute("pageNum", pageNum);// 페이지 번호
		if (productCnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
			System.out.println("pageCnt" + pageCnt);
		}
		// 페이지 카테고리 정보
		model.addAttribute("sDev", sDev); // 대분류
		model.addAttribute("order", order); // 정렬
	}

	// 스토어 리스 가져오기
	public void getStoreList(HttpServletRequest req, Model model) {
		System.out.println("getPerfList");
		// 화면에서 원하는 데이터 호출
		String sDev = req.getParameter("sDev"); // 소분류
		String order = req.getParameter("order"); // 정렬순

		if (order.equals(""))
			order = null;

		// 게시판 구조
		int pageSize = 5; // 한 페이지당 출력할 글의 갯수
		int pageBlock = 10; // 한 블럭당 페이지 갯수
		int start = 0; // 현재 페이지 시작번호
		int end = 0; // 현재 페이지 글 마지막번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지
		int pageCnt = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		int productCnt = 0; // 앨범 갯수

		// 조건
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sDev", sDev);
		map.put("order", order);

		// 갯수
		productCnt = mhDAO.getStoreListCnt(map);
		System.out.println("해당 공연 갯수: " + productCnt);

		// 현재 보고있는 페이지
		pageNum = req.getParameter("pageNum");
		if ((pageNum == null)) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정
		}
		System.out.println("pageNum: " + pageNum);

		// 현재 페이지
		currentPage = Integer.parseInt(pageNum);
		// 페이지 갯수 = 앨범 갯수 / 페이지에 보여줄 갯수 +(나머지가 존재하면 1페이지 추가)
		pageCnt = (productCnt / pageSize) + (productCnt % pageSize > 0 ? 1 : 0);

		// 현재페이지 글 시작번호
		number = 1 + (currentPage - 1) * pageSize;
		// 1페이지 경우 시작번호는 1
		start = (currentPage - 1) * pageSize + 1;
		// 현재페이지 끝번호
		end = start + pageSize - 1;

		// 만약 페이지 끝번호보다 앨범갯수보다 크면
		if (end > productCnt)
			end = productCnt;

		// 게시글 받아오기
		if (productCnt > 0) {
			// 게시물 가져오기
			map.put("start", start);
			map.put("end", end);
			// 담을 바구니 생성
			ArrayList<TcatPerDiscVO> discs = mhDAO.getStoreList(map);
			System.out.println("공연 갯수: " + discs.size());
			model.addAttribute("discs", discs);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // (5%3) == 0
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}

		// req넘기기

		model.addAttribute("number", number);
		model.addAttribute("productCnt", productCnt);// 글갯수
		model.addAttribute("pageNum", pageNum);// 페이지 번호
		if (productCnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
			System.out.println("pageCnt" + pageCnt);
		}
		// 페이지 카테고리 정보
		model.addAttribute("sDev", sDev); // 대분류
		model.addAttribute("order", order); // 정렬
	}

	// 공연 상세 정보 가져오기
	public void getContent(HttpServletRequest req, Model model) {
		int per_id = Integer.parseInt(req.getParameter("per_id"));
		// 로그인이 된경우에만 조회수 업데이트
		String login_id = (String) req.getSession().getAttribute("login_id");
		if (login_id != null) {
			mhDAO.upHits(per_id);
		}
		TcatPerformanceVO perf = mhDAO.getContent(per_id);

		model.addAttribute("perf", perf);

	}

	// getFavorite 연령,성별 선호도
	public void getFavorite(HttpServletRequest req, Model model) {
		int per_id = Integer.parseInt(req.getParameter("per_id"));
		ArrayList<ContentFavoriteVO> ages = mhDAO.getAge(per_id);
		ArrayList<ContentFavoriteVO> genders = mhDAO.getGender(per_id);

		// 성별 데이터 만들기
		Map<String, Integer> ageData = new HashMap<String, Integer>();
		ageData.put("10대", 0);
		ageData.put("20대", 0);
		ageData.put("30대", 0);
		ageData.put("40대", 0);
		ageData.put("50대 이상", 0);
		for (int i = 0; i < ages.size(); i++) {
			ContentFavoriteVO info = ages.get(i);
			switch (info.getAges()) {
			case 1:
				ageData.replace("10대", info.getCnt());
				break;
			case 2:
				ageData.replace("20대", info.getCnt());
				break;
			case 3:
				ageData.replace("30대", info.getCnt());
				break;
			case 4:
				ageData.replace("40대", info.getCnt());
				break;
			default:
				int cnt = ageData.get("50대 이상") + info.getCnt();
				ageData.replace("50대 이상", cnt);
				break;
			}
		}

		// 연령 데이터 만들기
		Map<String, Integer> genderData = new HashMap<String, Integer>();
		genderData.put("남자", 0);
		genderData.put("여자", 0);
		genderData.put("총합", 0);
		for (int i = 0; i < genders.size(); i++) {
			ContentFavoriteVO info = genders.get(i);
			switch (info.getMember_gender()) {
			case 1:
				genderData.put("남자", info.getCnt());
				int cnt = genderData.get("총합") + info.getCnt();
				genderData.put("총합", cnt);
				break;
			default:
				genderData.put("여자", info.getCnt());
				cnt = genderData.get("총합") + info.getCnt();
				genderData.put("총합", cnt);
				break;
			}
		}
		model.addAttribute("ageData", ageData);
		model.addAttribute("genderData", genderData);
	}

	// 스토어 상세정보
	public void getContent_store(HttpServletRequest req, Model model) {
		int disc_code = Integer.parseInt(req.getParameter("disc_code"));
		System.out.println(disc_code);
		// 로그인이 된경우에만 조회수 업데이트
		String login_id = (String) req.getSession().getAttribute("login_id");
		if (login_id != null) {
			mhDAO.upHits(disc_code);
		}
		TcatPerDiscVO str = mhDAO.getContent_store(disc_code);
		System.out.println(str.getDisc_title());
		model.addAttribute("str", str);
	}

	// 연령별, 성별별 선호도 가져오기
	public void getFavorite_store(HttpServletRequest req, Model model) {
		int disc_code = Integer.parseInt(req.getParameter("disc_code"));
		ArrayList<ContentFavoriteVO> ages = mhDAO.getAge_store(disc_code);
		ArrayList<ContentFavoriteVO> genders = mhDAO.getGender_store(disc_code);

		// 성별 데이터 만들기
		Map<String, Integer> ageData = new HashMap<String, Integer>();
		ageData.put("10대", 0);
		ageData.put("20대", 0);
		ageData.put("30대", 0);
		ageData.put("40대", 0);
		ageData.put("50대 이상", 0);
		for (int i = 0; i < ages.size(); i++) {
			ContentFavoriteVO info = ages.get(i);
			switch (info.getAges()) {
			case 1:
				ageData.replace("10대", info.getCnt());
				break;
			case 2:
				ageData.replace("20대", info.getCnt());
				break;
			case 3:
				ageData.replace("30대", info.getCnt());
				break;
			case 4:
				ageData.replace("40대", info.getCnt());
				break;
			default:
				int cnt = ageData.get("50대 이상") + info.getCnt();
				ageData.replace("50대 이상", cnt);
				break;
			}
		}

		// 연령 데이터 만들기
		Map<String, Integer> genderData = new HashMap<String, Integer>();
		genderData.put("남자", 0);
		genderData.put("여자", 0);
		genderData.put("총합", 0);
		for (int i = 0; i < genders.size(); i++) {
			ContentFavoriteVO info = genders.get(i);
			switch (info.getMember_gender()) {
			case 1:
				genderData.put("남자", info.getCnt());
				int cnt = genderData.get("총합") + info.getCnt();
				genderData.put("총합", cnt);
				break;
			default:
				genderData.put("여자", info.getCnt());
				cnt = genderData.get("총합") + info.getCnt();
				genderData.put("총합", cnt);
				break;
			}
		}
		model.addAttribute("ageData", ageData);
		model.addAttribute("genderData", genderData);
	}

	// 위시 리스트
	public void getWishList(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		int wish_step = Integer.parseInt(req.getParameter("wish_step"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("wish_step", wish_step);

		ArrayList<WishListVO> wishs = mhDAO.getWishList(map);
		System.out.println("wishs: " + wishs.size());
		model.addAttribute("wishs", wishs);
	}

	// addWishList 위시리스트 추가
	public void addWishList(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String per = req.getParameter("per_id");
		String disc = req.getParameter("disc_code");
		int wish_step = 0;
		int disc_code = 0;
		int per_id = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);

		if (per == null) {
			wish_step = 2; // 스토어
			disc_code = Integer.parseInt(disc);
			map.put("disc_code", disc_code);
			map.put("per_id", 0);
		} else {
			wish_step = 1; // 공연
			per_id = Integer.parseInt(per);
			map.put("per_id", per_id);
			map.put("disc_code", 0);
		}
		map.put("wish_step", wish_step);

		mhDAO.addWishList(map);
	}

	// 해당 위시리스트 삭제
	public void delWishList(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		int per_id = 0;
		int disc_code = 0;
		int wish_num = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		// wish_num가 있을 경우
		String wish_n = req.getParameter("wish_num");
		if (wish_n != null) {
			wish_num = Integer.parseInt(wish_n);
			map.put("wish_num", wish_num);
		}
		// 없을 경우
		if (wish_n == null) {
			per_id = req.getParameter("per_id") == null ? 0 : Integer.parseInt((String) req.getParameter("per_id"));
			disc_code = req.getParameter("disc_code") == null ? 0
					: Integer.parseInt((String) req.getParameter("disc_code"));
			map.put("per_id", per_id);
			map.put("disc_code", disc_code);
			map.put("member_id", member_id);
		}

		mhDAO.delWishList(map);
	}

	// getWishListIn 위시리스트 해당 공연 존재 확인
	public void getWishListIn(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String per = req.getParameter("per_id");
		String disc = req.getParameter("disc_code");
		int disc_code = disc == null ? 0 : Integer.parseInt(disc);
		int per_id = per == null ? 0 : Integer.parseInt(per);
		int wishResult = 0;
		if (member_id != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", member_id);
			map.put("disc_code", disc_code);
			map.put("per_id", per_id);
			wishResult = mhDAO.getWishListIn(map);
		}
		System.out.println("getWishListIn: "+wishResult);
		model.addAttribute("wishResult", wishResult);
	}

	// 결제취소
	public void buyCancel(HttpServletRequest req, Model model) {
		int disc_num = Integer.parseInt(req.getParameter("disc_num"));
		int buyCancelRs = mhDAO.buyCancel(disc_num);
		model.addAttribute("buyCancelRs", buyCancelRs);
	}

	// perfRefund 환불요청
	public void perfRefund(HttpServletRequest req, Model model) {
		int disc_num = Integer.parseInt(req.getParameter("disc_num"));
		int perfRefundRs = mhDAO.perfRefund(disc_num);
		model.addAttribute("perfRefundRs", perfRefundRs);
	}
	//perfChange 교환요청
	public void perfChange(HttpServletRequest req,Model model) {
		int disc_num = Integer.parseInt(req.getParameter("disc_num"));
		int perfChangeRs = mhDAO.perfChange(disc_num);
		model.addAttribute("perfChangeRs", perfChangeRs);
	}
	
	// 호스트 로그인
	public void host_loginPro(HttpServletRequest req, Model model) {
		// 값 받기
		String host_id = req.getParameter("host_id");
		String host_pwd = req.getParameter("host_pwd");
		Map<String, String> map = new HashMap<String, String>();
		map.put("host_id", host_id);
		map.put("host_pwd", host_pwd);
		// 로그인 확인
		int loginRs = mhDAO.host_loginPro(map);
		if (loginRs == 1) {
			// 세션 태우기
			// 로그인 상태 아이디
			req.getSession().setAttribute("host_id", host_id);
		}
		// 로그인 결과값
		model.addAttribute("loginRs", loginRs);
	}

	// getTicketInfo예매 정보
	public void getTicketInfo(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("login_id");
		String year = (String) req.getParameter("year"); // 기간 판정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		// 미래 티켓
		// 배송번호 받아오기
		map.put("date", "ticet_date	>=TO_DATE(SYSDATE,'yy/MM/dd')");// 미래판정
		ArrayList<Integer> del_nums = mhDAO.getDel_nums(map);
		Map<Integer, ArrayList<TcatTicketingVO>> futureTicket = new HashMap<Integer, ArrayList<TcatTicketingVO>>();

		map.put("del_num", 0);// 배송정보 초기화
		if (del_nums.size() > 0) {
			for (int index = 0; index < del_nums.size(); index++) {
				map.replace("del_num", del_nums.get(index));
				futureTicket.put(del_nums.get(index), mhDAO.getTickets(map));// 미래 티켓들의 티켓정보
			}
		}
		// 데이터 전송
		model.addAttribute("futureTicket_num", del_nums);
		model.addAttribute("futureTicket", futureTicket);

		/////////////////////////////////////////////////
		// 과거 기록
		// 배송번호 받아오기
		map.replace("date", "ticet_date	< TO_DATE(SYSDATE,'yy/MM/dd')");// 과거판정
		ArrayList<Integer> past_nums = mhDAO.getDel_nums(map);
		Map<Integer, ArrayList<TcatTicketingVO>> pastTicket = new HashMap<Integer, ArrayList<TcatTicketingVO>>();
		if (past_nums.size() > 0) {
			for (int index = 0; index < past_nums.size(); index++) {
				map.replace("del_num", past_nums.get(index));
				pastTicket.put(past_nums.get(index), mhDAO.getTickets(map));// 미래 티켓들의 티켓정보
			}
		}
		// 데이터 전송
		model.addAttribute("past_nums", past_nums);
		model.addAttribute("pastTicket", pastTicket);

	}

	// 예매취소 ticCancel
	public void ticStepUpdate(HttpServletRequest req, Model model) {
		int del_num = Integer.parseInt(req.getParameter("del_num"));
		int ticket_step = Integer.parseInt(req.getParameter("ticket_step"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("del_num", del_num);
		map.put("ticket_step", ticket_step);
		int ticStepUpdateRs = mhDAO.ticStepUpdate(map);
		model.addAttribute("ticStepUpdateRs", ticStepUpdateRs);
	}

	/////////////////////////////////////////////////////////////////
	// HOST
	// getAgeAnalysis 연령별 분석
	public void getAgeAnalysis(HttpServletRequest req, Model model) {
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ages = mhDAO.getAgeHostCount();
		// 총 예매량 차트 데이터 생성
		Map<String, Integer> ageData = new HashMap<String, Integer>();
		ageData.put("10대", 0);
		ageData.put("20대", 0);
		ageData.put("30대", 0);
		ageData.put("40대", 0);
		ageData.put("50대 이상", 0);
		int sum = 0;
		for (int i = 0; i < ages.size(); i++) {
			ContentFavoriteVO info = ages.get(i);
			sum += info.getCnt();
			switch (info.getAges()) {
			case 1:
				ageData.replace("10대", info.getCnt());
				break;
			case 2:
				ageData.replace("20대", info.getCnt());
				break;
			case 3:
				ageData.replace("30대", info.getCnt());
				break;
			case 4:
				ageData.replace("40대", info.getCnt());
				break;
			default:
				int cnt = ageData.get("50대 이상") + info.getCnt();
				ageData.replace("50대 이상", cnt);
				break;
			}
		}
		ageData.put("sum", sum);
		model.addAttribute("ageData", ageData);

		// 연령 선호 장르
		// 장르 정보 가져오기 & 데이터 초기화
		Map<String, Integer> ages10 = new HashMap<String, Integer>();
		Map<String, Integer> ages20 = new HashMap<String, Integer>();
		Map<String, Integer> ages30 = new HashMap<String, Integer>();
		Map<String, Integer> ages40 = new HashMap<String, Integer>();
		Map<String, Integer> ages50 = new HashMap<String, Integer>();
		String mDev[] = { "뮤지컬", "무용", "콘서트", "클래식", "연극" };
		for (String dev : mDev) { // 초기화
			ages10.put(dev, 0);
			ages20.put(dev, 0);
			ages30.put(dev, 0);
			ages40.put(dev, 0);
			ages50.put(dev, 0);
		}
		// 데이터 가져오기
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ageGenre = mhDAO.getAgeGenre();
		for (int i = 0; i < ageGenre.size(); i++) {
			ContentFavoriteVO info = ageGenre.get(i);
			switch (info.getAges()) {
			case 1:
				ages10.replace(info.getmDev(), info.getCnt());
				break;
			case 2:
				ages20.replace(info.getmDev(), info.getCnt());
				break;
			case 3:
				ages30.replace(info.getmDev(), info.getCnt());
				break;
			case 4:
				ages40.replace(info.getmDev(), info.getCnt());
				break;
			default:
				int cnt = ages50.get(info.getmDev()) + info.getCnt();
				ages50.replace(info.getmDev(), cnt);
				break;
			}
		}
		ArrayList<Map<String, Integer>> ageGenreList = new ArrayList<Map<String, Integer>>();
		ageGenreList.add(ages10);
		ageGenreList.add(ages20);
		ageGenreList.add(ages30);
		ageGenreList.add(ages40);
		ageGenreList.add(ages50);
		model.addAttribute("ageGenreList", ageGenreList);

		// 연령 선호 작품 top5
		// 데이터 가져오기
		ArrayList<ContentFavoriteVO> agePerf10 = mhDAO.getAgePerf(1);
		ArrayList<ContentFavoriteVO> agePerf20 = mhDAO.getAgePerf(2);
		ArrayList<ContentFavoriteVO> agePerf30 = mhDAO.getAgePerf(3);
		ArrayList<ContentFavoriteVO> agePerf40 = mhDAO.getAgePerf(4);
		ArrayList<ContentFavoriteVO> agePerf50 = mhDAO.getAgePerf(5);
		model.addAttribute("agePerf10", agePerf10);
		model.addAttribute("agePerf20", agePerf20);
		model.addAttribute("agePerf30", agePerf30);
		model.addAttribute("agePerf40", agePerf40);
		model.addAttribute("agePerf50", agePerf50);

	}

	// 연령별 분석 스토어
	public void getAgeAnalysis_store(HttpServletRequest req, Model model) {
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ages = mhDAO.getAgeHostCount_store();
		// 총 예매량 차트 데이터 생성
		Map<String, Integer> ageData = new HashMap<String, Integer>();
		ageData.put("10대", 0);
		ageData.put("20대", 0);
		ageData.put("30대", 0);
		ageData.put("40대", 0);
		ageData.put("50대 이상", 0);
		int sum = 0;
		for (int i = 0; i < ages.size(); i++) {
			ContentFavoriteVO info = ages.get(i);
			sum += info.getCnt();
			switch (info.getAges()) {
			case 1:
				ageData.replace("10대", info.getCnt());
				break;
			case 2:
				ageData.replace("20대", info.getCnt());
				break;
			case 3:
				ageData.replace("30대", info.getCnt());
				break;
			case 4:
				ageData.replace("40대", info.getCnt());
				break;
			default:
				int cnt = ageData.get("50대 이상") + info.getCnt();
				ageData.replace("50대 이상", cnt);
				break;
			}
		}
		ageData.put("sum", sum);
		model.addAttribute("ageData", ageData);

		// 연령 선호 장르
		// 장르 정보 가져오기 & 데이터 초기화
		Map<String, Integer> ages10 = new HashMap<String, Integer>();
		Map<String, Integer> ages20 = new HashMap<String, Integer>();
		Map<String, Integer> ages30 = new HashMap<String, Integer>();
		Map<String, Integer> ages40 = new HashMap<String, Integer>();
		Map<String, Integer> ages50 = new HashMap<String, Integer>();
		String sDev[] = { "뮤지컬OST", "콘서트LIVE", "클래식LIVE", "전시컬렉션" };
		for (String dev : sDev) { // 초기화
			ages10.put(dev, 0);
			ages20.put(dev, 0);
			ages30.put(dev, 0);
			ages40.put(dev, 0);
			ages50.put(dev, 0);
		}
		// 데이터 가져오기
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ageGenre = mhDAO.getAgeGenre_store();
		for (int i = 0; i < ageGenre.size(); i++) {
			ContentFavoriteVO info = ageGenre.get(i);
			System.out.println(info.getsDev() + "-" + info.getCnt());

			switch (info.getAges()) {
			case 1:
				ages10.replace(info.getsDev(), info.getCnt());
				break;
			case 2:
				ages20.replace(info.getsDev(), info.getCnt());
				break;
			case 3:
				ages30.replace(info.getsDev(), info.getCnt());
				break;
			case 4:
				ages40.replace(info.getsDev(), info.getCnt());
				break;
			default:
				int cnt = ages50.get(info.getsDev()) + info.getCnt();
				ages50.replace(info.getsDev(), cnt);
				break;
			}
		}
		ArrayList<Map<String, Integer>> ageGenreList = new ArrayList<Map<String, Integer>>();
		ageGenreList.add(ages10);
		ageGenreList.add(ages20);
		ageGenreList.add(ages30);
		ageGenreList.add(ages40);
		ageGenreList.add(ages50);
		System.out.println(ageGenreList.get(0));
		System.out.println(ageGenreList.get(1));
		System.out.println(ageGenreList.get(2));
		System.out.println(ageGenreList.get(3));
		System.out.println(ageGenreList.get(4));
		model.addAttribute("ageGenreList", ageGenreList);

		// 연령 선호 작품 top5
		// 데이터 가져오기
		ArrayList<ContentFavoriteVO> agePerf10 = mhDAO.getAgePerf_store(1);
		ArrayList<ContentFavoriteVO> agePerf20 = mhDAO.getAgePerf_store(2);
		ArrayList<ContentFavoriteVO> agePerf30 = mhDAO.getAgePerf_store(3);
		ArrayList<ContentFavoriteVO> agePerf40 = mhDAO.getAgePerf_store(4);
		ArrayList<ContentFavoriteVO> agePerf50 = mhDAO.getAgePerf_store(5);
		model.addAttribute("agePerf10", agePerf10);
		model.addAttribute("agePerf20", agePerf20);
		model.addAttribute("agePerf30", agePerf30);
		model.addAttribute("agePerf40", agePerf40);
		model.addAttribute("agePerf50", agePerf50);
	}

	// getGenderAnalysis 성별 예약 분석
	public void getGenderAnalysis(HttpServletRequest req, Model model) {
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> genders = mhDAO.getGenderHostCount();
		// 총 예매량 차트 데이터 생성
		Map<String, Integer> genderData = new HashMap<String, Integer>();
		genderData.put("남자", 0);
		genderData.put("여자", 0);
		int sum = 0;
		for (int i = 0; i < genders.size(); i++) {
			ContentFavoriteVO info = genders.get(i);
			sum += info.getCnt();
			switch (info.getMember_gender()) {
			case 1:
				genderData.replace("남자", info.getCnt());
				break;
			case 2:
				genderData.replace("여자", info.getCnt());
				break;
			}
		}
		genderData.put("sum", sum);
		model.addAttribute("genderData", genderData);

		// 연령 선호 장르
		// 장르 정보 가져오기 & 데이터 초기화
		Map<String, Integer> manGenre = new HashMap<String, Integer>();
		Map<String, Integer> womanGenre = new HashMap<String, Integer>();
		String mDev[] = { "뮤지컬", "무용", "콘서트", "클래식", "연극" };
		for (String dev : mDev) { // 초기화
			manGenre.put(dev, 0);
			womanGenre.put(dev, 0);
		}
		// 데이터 가져오기
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ageGenre = mhDAO.getGenderGenre();
		for (int i = 0; i < ageGenre.size(); i++) {
			ContentFavoriteVO info = ageGenre.get(i);
			switch (info.getMember_gender()) {
			case 1:
				manGenre.replace(info.getmDev(), info.getCnt());
				break;
			case 2:
				womanGenre.replace(info.getmDev(), info.getCnt());
				break;
			}
		}
		ArrayList<Map<String, Integer>> genderGenreList = new ArrayList<Map<String, Integer>>();
		genderGenreList.add(manGenre);
		genderGenreList.add(womanGenre);
		model.addAttribute("genderGenreList", genderGenreList);

		// 연령 선호 작품 top5
		// 데이터 가져오기
		ArrayList<ContentFavoriteVO> manPerf = mhDAO.getGenderPerf(1);
		ArrayList<ContentFavoriteVO> womanPerf = mhDAO.getGenderPerf(2);
		model.addAttribute("manPerf", manPerf);
		model.addAttribute("womanPerf", womanPerf);
	}
	
	//getGenderAnalysis_store 성별 스토어 분석
	public void  getGenderAnalysis_store(HttpServletRequest req,Model model) {
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ages = mhDAO.getGenderHostCount_store();
		// 총 예매량 차트 데이터 생성
		Map<String, Integer> genderData = new HashMap<String, Integer>();
		genderData.put("남자", 0);
		genderData.put("여자", 0);
		int sum = 0;
		for (int i = 0; i < ages.size(); i++) {
			ContentFavoriteVO info = ages.get(i);
			sum += info.getCnt();
			switch (info.getMember_gender()) {
			case 1:
				genderData.replace("남자", info.getCnt());
				break;
			case 2:
				genderData.replace("여자", info.getCnt());
				break;
			}
		}
		genderData.put("sum", sum);
		model.addAttribute("genderData", genderData);

		// 연령 선호 장르
		// 장르 정보 가져오기 & 데이터 초기화
		Map<String, Integer> manGenre = new HashMap<String, Integer>();
		Map<String, Integer> womanGenre = new HashMap<String, Integer>();
		String sDev[] = { "뮤지컬OST", "콘서트LIVE", "클래식LIVE", "전시컬렉션" };
		for (String dev : sDev) { // 초기화
			manGenre.put(dev, 0);
			womanGenre.put(dev, 0);
		}
		// 데이터 가져오기
		// 총 예매량 카운트
		ArrayList<ContentFavoriteVO> ageGenre = mhDAO.getGenderGenre_store();
		for (int i = 0; i < ageGenre.size(); i++) {
			ContentFavoriteVO info = ageGenre.get(i);
			System.out.println(info.getsDev() + "-" + info.getCnt());

			switch (info.getMember_gender()) {
			case 1:
				manGenre.replace(info.getsDev(), info.getCnt());
				break;
			case 2:
				womanGenre.replace(info.getsDev(), info.getCnt());
				break;
			}
		}
		ArrayList<Map<String, Integer>> ageGenreList = new ArrayList<Map<String, Integer>>();
		ageGenreList.add(manGenre);
		ageGenreList.add(womanGenre);
		System.out.println(ageGenreList.get(0));
		System.out.println(ageGenreList.get(1));
		model.addAttribute("ageGenreList", ageGenreList);
		// 연령 선호 작품 top5
		// 데이터 가져오기
		ArrayList<ContentFavoriteVO> agePerf10 = mhDAO.getGenderPerf_store(1);
		ArrayList<ContentFavoriteVO> agePerf20 = mhDAO.getGenderPerf_store(2);
		model.addAttribute("agePerf10", agePerf10);
		model.addAttribute("agePerf20", agePerf20);
	}
	
	////// 안드로이드
	public Map<String, Object> and_login(HttpServletRequest req, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		//ArrayList<MemberVO> member = mhDAO.getAndroid();
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		int login_result = 0;
		/*for(int i=0;i<member.size();i++) {
			id += member.get(i).getMember_id()+",";
			name += member.get(i).getMember_name()+",";
		}*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("member_id", id);
		map.put("member_pwd" , pwd);
		//아이디 확인
		login_result = mhDAO.and_idChk(map);
		//비밀번호 확인
		if(login_result==1) {
			login_result  = mhDAO.and_login(map);
			if(login_result == 0) {
				login_result = 2;
			}
		}
		result.put("login_result", login_result);
		return result;
	}
	

	//beacon_react
	public Map<String, Object> beacon_react(HttpServletRequest req,Model model){
		//안드로이드로 보낼 맵 만들기
		int ticketing_cnt=0;
		Map<String, Object> result = new HashMap<String, Object>();
		//안드로이드 에서 보낸 정보 받기
		String member_id =req.getParameter("id");
		String hall_id_str = req.getParameter("hall_id");
		
		//DAO에 보낼 맵
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("hall_id", Integer.parseInt(hall_id_str));
		
		//공연정보 가져오기
		TcatPerformanceVO performance = mhDAO.getAnd_perfInfo(map);
		//해당하는 시간대 해당하는 공연티켓 예매확인
		ArrayList<TcatTicketingVO> tickets = mhDAO.getAnd_ticketingNow(map);
		
		
		if(tickets.size()>0) {
			ticketing_cnt =  tickets.size();//티켓 갯수
		}
		
		//결과 담기
		//result.put("performance", performance);
		//result.put("tickets", tickets);
		result.put("perf_image", performance.getPerf_Image());
		result.put("perf_title", performance.getPerf_title());
		result.put("hall_name", performance.getHall_name());
		//result.put("start_end", performance.getStartDate()+"-"+performance.getEndDate());
		
		result.put("ticketing_cnt", ticketing_cnt);
		System.out.println("tic: "+ticketing_cnt);
		System.out.println("performance: "+performance.getPerf_title());
		return result;
	}
	//공연 아이디 가져오기
	public String getPer_id(HttpServletRequest req) {
		String hall_id = req.getParameter("hall_id");
		String per_id = mhDAO.getPer_id(hall_id);
		
		return per_id;
	}
	
	//현석이형
	@Override
	public void Tcat_android01(HttpServletRequest req) {
		String member_id=req.getParameter("member_id");
		String hall_id=req.getParameter("hall_id");
		System.out.println("member_id");
		System.out.println("hall_id: "+hall_id);
		Map<String,String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("hall_id", hall_id);
		ArrayList<TcatTicketingVO> dtos=mhDAO.searchTcat01(map);
		req.setAttribute("dtos", dtos);			
	}
	
	//dk android
	@Override
	public TcatPerformanceVO and_content(HttpServletRequest req, Model model) {
		TcatPerformanceVO perfoVO = new TcatPerformanceVO();
		int per_id = Integer.parseInt(req.getParameter("per_id"));
		String login_id = req.getParameter("login_id");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("per_id", per_id);
		map.put("login_id", login_id);
		
		perfoVO = mhDAO.and_perf(map);
		
		
		return perfoVO;
	}
}
