package spring.project.tcat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import spring.project.tcat.VO.CartVO;
import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.SaleVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.persistence.HSGuestDAO;

@Service
public class HSGuestServiceImp implements HSGuestService{
	
	@Autowired
	HSGuestDAO HSDao;

	@Override
	public void MemberIdCheack(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id");
		int IdCheack=0;
		IdCheack=HSDao.MemberIdCheack(member_id);
		req.setAttribute("IdCheack", IdCheack);
		req.setAttribute("member_id", member_id);
	}

	@Override
	public void insertMember(HttpServletRequest req, Model model) {
		String member_id=req.getParameter("member_id"); 		//아이디+
		String member_pwd=req.getParameter("member_pwd"); 		//비밀번호+
		String member_name=req.getParameter("member_name"); 		//이름+
		String member_hp=req.getParameter("member_hp"); 		//연락처+
		
		String postNum=req.getParameter("postNum");
		String detailAddr=req.getParameter("detailAddr");
		String addr=req.getParameter("addr"); 		//주소-daum주소검색
		String member_addr="["+postNum+"]"+addr+" "+detailAddr;
		
		String member_email=req.getParameter("member_email"); 		//이메일+
		String member_gender=req.getParameter("member_gender"); 		//성별
		String member_birth=req.getParameter("member_birth"); 		//생년월일
		
		MemberVO dto=new MemberVO();
		dto.setMember_addr(member_addr);
		dto.setMember_birth(member_birth);
		dto.setMember_email(member_email);
		dto.setMember_gender(member_gender);
		dto.setMember_hp(member_hp);
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_pwd(member_pwd);
		System.out.println(
				"member_addr:"+member_addr+"\n"+
				"member_birth:"+member_birth+"\n"+
				"member_email:"+member_email+"\n"+
				"member_gender:"+member_gender+"\n"+
				"member_hp:"+member_hp+"\n"+
				"member_id:"+member_id+"\n"+
				"member_pwd:"+member_pwd+"\n"
		);
		
		int cnt=0;
		cnt=HSDao.insertMember(dto);
		req.setAttribute("cnt", cnt);

	}
	
	
	@Override
	public void daySearch(HttpServletRequest req, Model model) {
		int pageSize = 5; // 한 페이지당 출력한 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 글시작 번호
		int end = 0; // 현재 페이지 글마지막 번호
		int number = 0; // 출력할 글번호
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		
		// 글갯수 구하기
		String searchDate=null;
		searchDate=req.getParameter("date");
		req.setAttribute("date", searchDate);
		System.out.println("date:000:"+searchDate);
		
		cnt = HSDao.daySearchCnt(searchDate);
		System.out.println("cnt:" + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 설정
		}

		currentPage = Integer.parseInt(pageNum);// 현재 페이지
		// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

		// 현재 페이지 1=(1-1)*5+1
		// 6=(2-1)*5+1
		// 11=(3-1)*5+1
		// 21=(5-1)*5+1

		start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

		// 5=1+5-1;

		end = start + pageSize - 1; // 현재 페이지 끝번호

		System.out.println("start:" + start);
		System.out.println("end:" + end);

		if (end > cnt)
			end = cnt;

		// 21 - (5-1)*5;
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
		System.out.println("number:" + number);
		System.out.println("cnt:" + cnt);
		System.out.println("currentPage:" + currentPage);
		System.out.println("pageSize:" + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("searchDate",searchDate);
			ArrayList<TcatPerformanceVO> dtos=HSDao.daySearchList(map);
			
			System.out.println("R_seatPrice------------"+dtos.get(0).getR_seatPrice());
			req.setAttribute("dtos", dtos);

		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

		endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
		if (endPage > pageCount)
			endPage = pageCount;

		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number);// 글번호
		req.setAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage);// 현재 페이지
		}

	}	

	//지역별 리스트 가져오기
		@Override
		public void placeList(HttpServletRequest req, Model model) {
			int pageSize = 5; // 한 페이지당 출력한 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수

			int cnt = 0; // 글갯수
			int start = 0; // 현재 페이지 글시작 번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			// 글갯수 구하기
			String place=null;
			place=req.getParameter("place");
			req.setAttribute("place", place);
			System.out.println("place:000:"+place);
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("place", place);
			cnt = HSDao.placeCnt(map2);
			System.out.println("cnt:" + cnt);

			pageNum = req.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}

			currentPage = Integer.parseInt(pageNum);// 현재 페이지
			// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

			// 현재 페이지 1=(1-1)*5+1
			// 6=(2-1)*5+1
			// 11=(3-1)*5+1
			// 21=(5-1)*5+1

			start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

			// 5=1+5-1;

			end = start + pageSize - 1; // 현재 페이지 끝번호

			System.out.println("start:" + start);
			System.out.println("end:" + end);

			if (end > cnt)
				end = cnt;

			// 21 - (5-1)*5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
			System.out.println("number:" + number);
			System.out.println("cnt:" + cnt);
			System.out.println("currentPage:" + currentPage);
			System.out.println("pageSize:" + pageSize);

			if (cnt > 0) {
				// 게시글 목록 조회
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("place",place);
				ArrayList<TcatPerformanceVO> dtos=HSDao.placeList(map);
				
				req.setAttribute("dtos", dtos);

			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

			endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
			if (endPage > pageCount)
				endPage = pageCount;

			req.setAttribute("cnt", cnt); // 글갯수
			req.setAttribute("number", number);// 글번호
			req.setAttribute("pageNum", pageNum); // 페이지번호

			if (cnt > 0) {
				req.setAttribute("startPage", startPage); // 시작 페이지
				req.setAttribute("endPage", endPage); // 마지막 페이지
				req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
				req.setAttribute("pageCount", pageCount); // 페이지 갯수
				req.setAttribute("currentPage", currentPage);// 현재 페이지
			}

			
		}
		//장바구니에 담기
		@Override
		public void insertCart(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");
			int disc_code=Integer.parseInt(req.getParameter("disc_code"));
			int cart_count=Integer.parseInt(req.getParameter("cart_count"));
			System.out.println(disc_code+" "+cart_count);
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("member_id", member_id);
			map.put("disc_code", disc_code);
			map.put("cart_count", cart_count);
			int insertCart=0;
			int cnt=0;
			cnt=HSDao.searchCart(map);
			
			if(cnt>0) {
				insertCart=HSDao.updateCart(map);
			}else {
				insertCart=HSDao.insertCart(map);
			}
			req.setAttribute("insertCart", insertCart);
		}
		//장바구니 리스트 가져오기
		@Override
		public void cartList(HttpServletRequest req, Model model) {
			int pageSize = 10; // 한 페이지당 출력한 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수

			int cnt = 0; // 글갯수
			int start = 0; // 현재 페이지 글시작 번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			// 글갯수 구하기
			String member_id=(String)req.getSession().getAttribute("login_id");
			System.out.println("member_id:"+member_id);
			cnt = HSDao.cartCnt(member_id);
			System.out.println("cnt:" + cnt);

			pageNum = req.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}

			currentPage = Integer.parseInt(pageNum);// 현재 페이지
			// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

			// 현재 페이지 1=(1-1)*5+1
			// 6=(2-1)*5+1
			// 11=(3-1)*5+1
			// 21=(5-1)*5+1

			start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

			// 5=1+5-1;

			end = start + pageSize - 1; // 현재 페이지 끝번호

			System.out.println("start:" + start);
			System.out.println("end:" + end);

			if (end > cnt)
				end = cnt;

			// 21 - (5-1)*5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
			System.out.println("number:" + number);
			System.out.println("cnt:" + cnt);
			System.out.println("currentPage:" + currentPage);
			System.out.println("pageSize:" + pageSize);

			if (cnt > 0) {
				// 게시글 목록 조회
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("member_id", member_id);
				ArrayList<CartVO> dtos=HSDao.cartList(map);
				ArrayList<Integer> dtos2=new ArrayList<Integer>();
				for(int i=0;i<dtos.size();i++) {
					map.put("disc_code", dtos.get(i).getDisc_code());
					int disc_code=HSDao.getCount(map);
					dtos2.add(disc_code);
				}
				req.setAttribute("dtos", dtos);
				req.setAttribute("dtos2", dtos2);
				
			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

			endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
			if (endPage > pageCount)
				endPage = pageCount;

			req.setAttribute("cnt", cnt); // 글갯수
			req.setAttribute("number", number);// 글번호
			req.setAttribute("pageNum", pageNum); // 페이지번호

			if (cnt > 0) {
				req.setAttribute("startPage", startPage); // 시작 페이지
				req.setAttribute("endPage", endPage); // 마지막 페이지
				req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
				req.setAttribute("pageCount", pageCount); // 페이지 갯수
				req.setAttribute("currentPage", currentPage);// 현재 페이지
			}

		}

		@Override
		public void payList(HttpServletRequest req, Model model) {
			int per_id=Integer.parseInt(req.getParameter("per_id"));
			
			TcatPerformanceVO vo=new TcatPerformanceVO();
			vo=HSDao.payList(per_id);
			req.setAttribute("vo", vo);
		}

		@Override
		public void sussessPay(HttpServletRequest req, Model model) {
			String a=req.getParameter("checkArr");
			String point = req.getParameter("point");
			String disc_code[]=a.split(",");
			String member_id=(String)req.getSession().getAttribute("login_id");
			
			String addrChange=null;
			addrChange=req.getParameter("addrChange");
			ArrayList<CartVO> dtos=new ArrayList<CartVO>();
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("member_id", member_id);
			map2.put("point", point);
			
			//고객 포인트 증가
			HSDao.memberPoint(map2);
			
			MemberVO mem=new MemberVO();
			mem = HSDao.MemInfo(member_id);
			System.out.println("1");
			CartVO dto=new CartVO();
			for(int i=0;i<disc_code.length;i++) {
				map2.put("disc_code", disc_code[i]);
				dto=HSDao.cheackCartList(map2);
				dtos.add(dto);
			}
			
			HSDao.cartListDtos(map2);
			
			System.out.println("addr"+dtos);
			Map<String,Object> map=new HashMap<String,Object>();
			//주소 찾아오기
			if(addrChange.equals("0")) {
				//주소변경이 없으면
				
				map.put("member_name", mem.getMember_name());
				map.put("member_addr", mem.getMember_addr());
				map.put("member_hp", mem.getMember_hp());
			}else if(addrChange.equals("1")){
				//주소변경이 있으면
				String del_name=req.getParameter("member_name");
				String postNum=req.getParameter("postNum");
				String addr1=req.getParameter("addr1");
				String addr2=req.getParameter("addr2");
				String del_addr="["+postNum+"]"+addr1+" "+addr2;
				String del_hp=req.getParameter("member_hp");
				System.out.println("del_name:"+del_name);
				map.put("member_name", del_name);
				map.put("member_addr", del_addr);
				map.put("member_hp", del_hp);
			}

			//배송정보 추가
			HSDao.insertdelevaryInfo(map);
			System.out.println("4");
			//배송번호 가져오기
			int del_num=HSDao.maxdel_num();
			map.put("del_num", del_num);
			System.out.println("5");
			for(int i=0;i<dtos.size();i++) {
				//상품구입번호[시퀀스]
				//배송번호 del_num
				//구매일자 [sysdate]
				map.put("disc_code", dtos.get(i).getDisc_code());//상품코드 dtos.get(i).getDisc_code()
				map.put("member_id", member_id);//구매자 id member_id
				//구매스텝[1=구매]
				map.put("Rating", dtos.get(i).getRating());//할인조건[rating]
				map.put("buy_count", dtos.get(i).getCart_count());//구매수량 dtos.get(i).getCart_count()
				map.put("count", dtos.get(i).getCart_count());
				HSDao.insertStorePay(map);
				//재고목록에서 구매갯수 제거
				HSDao.updateCount(map);
			}
			System.out.println("6");
			//구매자의 장바구니 목록 제거
			for(int i=0;i<disc_code.length;i++) {
				map.put("disc_code", disc_code[i]);
				HSDao.cartDel(map);
			}
			
			
			System.out.println("7");
			req.setAttribute("Pay", 1);
		}

		@Override
		public void RemainingSeats(HttpServletRequest req, Model model) {
			String rd=req.getParameter("round");
			int round=Integer.parseInt(rd.substring(0, 1));
			
			String ticet_date=req.getParameter("ticet_date");
			int per_id=Integer.parseInt(req.getParameter("per_id"));
			System.out.println("round:"+round);
			System.out.println("ticet_date:"+ticet_date);
			System.out.println("per_id:"+per_id);
			
			TcatPerformanceVO dto=new TcatPerformanceVO();
			
			//보고자하는 공연정보 가져오기[공연정보+좌석 물리번호]
			dto=HSDao.payList(per_id);
			
			System.out.println("vip_seat[물리번호]:"+dto.getVIP_seat());
			
			//물리번호 자르기
			String vip[]=null;
			String r[]=null;
			String s[]=null;
			String a[]=null;
			String b[]=null;
			if(dto.getVIP_seat()!=null) {
				vip=dto.getVIP_seat().split("/");	
			}
			if(dto.getR_seat()!=null) {
				r=dto.getR_seat().split("/");
			}
			if(dto.getS_seat()!=null) {
				s=dto.getS_seat().split("/");
			}
			if(dto.getA_seat()!=null) {
				a=dto.getA_seat().split("/");
			}
			if(dto.getB_seat()!=null) {
				b=dto.getB_seat().split("/");	
			}
			
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("round", round);
			map.put("ticet_date", ticet_date);
			map.put("per_id", per_id);
			String Sdate=ticet_date+" 00:00:00";
			String Edate=ticet_date+" 23:59:59";
			System.out.println("Sdate:"+Sdate);
			System.out.println("Edate:"+Edate);
			
			map.put("Sdate", Sdate);
			map.put("Edate", Edate);
			
			int vipCount=0;
			int rCount=0;
			int sCount=0;
			int aCount=0;
			int bCount=0;
			//공연날짜+회차를 가져가서 그날짜+회차의 예매한 정보갯수를 가져온다.
			vipCount=HSDao.vipCount(map);
			rCount=HSDao.rCount(map);
			sCount=HSDao.sCount(map);
			aCount=HSDao.aCount(map);
			bCount=HSDao.bCount(map);
			
			System.out.println("vipCount:"+vipCount);
			System.out.println("rCount:"+rCount);
			System.out.println("sCount:"+sCount);
			System.out.println("aCount:"+aCount);
			System.out.println("bCount:"+bCount);
			
			int RemainingSeatsVIP=0;
			int RemainingSeatsR=0;
			int RemainingSeatsS=0;
			int RemainingSeatsA=0;
			int RemainingSeatsB=0;
			
			if(vip!=null) {
				//vip 물리번호 갯수-vip에서 예매된 갯수
				RemainingSeatsVIP=vip.length-vipCount;	
			}
			if(r!=null) {
				RemainingSeatsR=r.length-rCount;
			}
			if(s!=null) {
				RemainingSeatsS=s.length-sCount;
			}
			if(a!=null) {
				RemainingSeatsA=a.length-aCount;
			}
			if(b!=null) {
				RemainingSeatsB=b.length-bCount;
			}

			req.setAttribute("RemainingSeatsVIP", RemainingSeatsVIP);
			req.setAttribute("RemainingSeatsR", RemainingSeatsR);
			req.setAttribute("RemainingSeatsS", RemainingSeatsS);
			req.setAttribute("RemainingSeatsA", RemainingSeatsA);
			req.setAttribute("RemainingSeatsB", RemainingSeatsB);
			req.setAttribute("vo2", dto);

			
		}

		@Override
		public void sale(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");
			MemberVO mvo=new MemberVO();
			//고객정보 가져오기
			mvo=HSDao.getMember(member_id);
			//할인조건 가져오기
			ArrayList<SaleVO> dtos=null;
			dtos=HSDao.getSale();
			
			req.setAttribute("mvo", mvo);
			req.setAttribute("dtos", dtos);
		}

		@Override
		public void insertTicket(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");//구매자id
			int per_id=Integer.parseInt(req.getParameter("per_id"));//공연번호
			String ticet_date=req.getParameter("ticet_date");//공연날짜
			
			String a=req.getParameter("seat_type");

			String sale_div=req.getParameter("sale_div");//할인조건
			String round1=req.getParameter("round");//회차
			int round=Integer.parseInt(round1.substring(0, 1));
			
			//배송번호
			String addr=req.getParameter("addr");//주소
			String hp=req.getParameter("hp");//연락처
			String name=req.getParameter("name");//이름
			
			//1. 배송정보 insert
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("addr", addr);
			map.put("hp", hp);
			map.put("name", name);
			
			HSDao.insertdel(map);
			//최근 insert된 배송번호 가져오기
			int del_num=HSDao.maxdel_num();
			
			
			System.out.println(
					"member_id:"+member_id+"\n"+
					"per_id:"+per_id+"\n"+
					"ticet_date:"+ticet_date+"\n"+
					"seat_type:"+a+"\n"+
					"sale_div:"+sale_div+"\n"+
					"round:"+round1+"\n"+
					"divround:"+round+"\n"+
					"addr:"+addr+"\n"+
					"hp:"+hp+"\n"+
					"name:"+name+"\n"+
					"del_num:"+del_num
			);
			
			try{
				String b[]=a.split(",");
				String e="";
				for(int i=0;i<b.length;i++) {
					e=b[i];
					String[] c=e.split(".");
					System.out.println(e);
					String c1=b[i].substring(0, 3);
					String c2=null;
					if(c1.equals("VIP")) {
						c1=b[i].substring(0, 3);
						c2=b[i].substring(4, 7);
					}else {
						c1=b[i].substring(0, 1);
						c2=b[i].substring(2, 5);
					}
					
					
					map.put("member_id", member_id);
					map.put("per_id", per_id);
					map.put("ticet_date", ticet_date);
					map.put("seat_type", c1);
					map.put("seat_num", c2);
					map.put("sale_div", sale_div);
					map.put("del_num", del_num);
					map.put("ticket_step", 1);
					map.put("round", round);
					
					HSDao.insertTicket(map);
				}
			}catch(Exception e) {
				String b=a;
				String c1=b.substring(0, 3);
				String c2=null;
				if(c1.equals("VIP")) {
					c1=b.substring(0, 3);
					c2=b.substring(4, 7);
				}else {
					c1=b.substring(0, 1);
					c2=b.substring(2, 5);
				}
				map.put("member_id", member_id);
				map.put("per_id", per_id);
				map.put("ticet_date", ticet_date);
				map.put("seat_type", c1);
				map.put("seat_num", c2);
				map.put("sale_div", sale_div);
				map.put("del_num", del_num);
				map.put("ticket_step", 1);
				map.put("round", round);
				
				HSDao.insertTicket(map);
			}
	}

		@Override
		public void directBuy(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");//구매자 id
			int count=0;
			count=Integer.parseInt(req.getParameter("count"));//구매하려는 갯수
			int disc_code=Integer.parseInt(req.getParameter("disc_code"));//상품코드
			System.out.println("1");
			//1. 상품정보 가져오기
			TcatPerDiscVO perVO=new TcatPerDiscVO();
			perVO=HSDao.DiscInfo(disc_code);
			System.out.println("2");
			//2. member정보 가져오기
			MemberVO memVO=new MemberVO();
			memVO=HSDao.MemInfo(member_id);
			System.out.println("3");
			//3. 상품정보,member정보,구매수량을 넘기기
			req.setAttribute("perVO", perVO);
			req.setAttribute("memVO", memVO);
			req.setAttribute("count", count);
			System.out.println("4");
		}

		@Override
		public void directPay(HttpServletRequest req, Model model) {
			String member_id=(String)req.getSession().getAttribute("login_id");//구매자 id
			
			String count=req.getParameter("count");//구매하려는 갯수
			System.out.println("count:"+count);
			String disc_code=req.getParameter("disc_code");//상품코드
			int point=Integer.parseInt(req.getParameter("point"));
			Map<String,Object> map =new HashMap<String,Object>();
			//고객 포인트 증가
			map.put("member_id", member_id);
			map.put("point", point);
			HSDao.memberPoint(map);
			
			String addrChange=null;
			addrChange=req.getParameter("addrChange");
			MemberVO mem=new MemberVO();
			mem = HSDao.MemInfo(member_id);
			
			map.put("count", count);
			map.put("disc_code", disc_code);
			
			System.out.println(
					"disc_code"+disc_code+"\n"+
					"addrChange"+addrChange+"\n"						
			);
			
			//재고갯수 감소시키기
			HSDao.updateCount(map);
			
			//주소 찾아오기
			if(addrChange.equals("0")) {
				//주소변경이 없으면
				
				map.put("name", mem.getMember_name());
				map.put("addr", mem.getMember_addr());
				map.put("hp", mem.getMember_hp());
			}else if(addrChange.equals("1")){
				//주소변경이 있으면
				String del_name=req.getParameter("member_name");
				String postNum=req.getParameter("postNum");
				String addr1=req.getParameter("addr1");
				String addr2=req.getParameter("addr2");
				String del_addr="["+postNum+"]"+addr1+" "+addr2;
				String del_hp=req.getParameter("member_hp");
				System.out.println("del_name:"+del_name);
				map.put("name", del_name);
				map.put("addr", del_addr);
				map.put("hp", del_hp);
			}
			//배송정보 넣기
			HSDao.insertdel(map);
			//넣은 배송번호 가져오기
			int del_num=HSDao.maxdel_num();
			
			map.put("del_num", del_num);
			if(mem.getRating().equals("D")) {
				map.put("Rating", "D");
			}else {
				map.put("Rating", mem.getRating());
			}
			map.put("buy_count", count);
			
			
			
			HSDao.insertStorePay(map);
		}

		@Override
		public void changeCount(HttpServletRequest req, Model model) {
			int count=Integer.parseInt(req.getParameter("count"));
			int disc_code=Integer.parseInt(req.getParameter("disc_code"));
			String member_id=(String)req.getSession().getAttribute("login_id");
			//장바구니에 담긴 코드에 맞는 수량을 변경하기
			Map<String,Object> map=new HashMap<String,Object>();
			
			map.put("count", count);
			map.put("disc_code", disc_code);
			map.put("member_id", member_id);
			
			HSDao.changeCount(map);
		}

		@Override
		public void storePay(HttpServletRequest req, Model model,@RequestParam (value = "valueArrTest[]") List<String> valueArr) {
			//고객 id로 체크한 값을 dtos에 넣기
			String member_id=(String)req.getSession().getAttribute("login_id");
			ArrayList<CartVO> dtos=new ArrayList<CartVO>();
			Map<String,Object> map=new HashMap<String,Object>();
			CartVO dto=new CartVO();
			map.put("member_id", member_id);

			for(int i=0;i<valueArr.size();i++) {

				//장바구니 리스트에서 체크한 값 가져오기
				map.put("disc_code", valueArr.get(i));
	
				
				dto=HSDao.cheackCartList(map);
				dtos.add(dto);
			}
			
			req.setAttribute("dtos", dtos);
		}

		@Override
		public void deleteCart(HttpServletRequest req, Model model) {
			int disc_code=Integer.parseInt(req.getParameter("disc_code"));
			String member_id=(String)req.getSession().getAttribute("login_id");
			int deleteCart=0;
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("disc_code", disc_code);
			map.put("member_id", member_id);
			
			deleteCart=HSDao.deleteCart(map);
			
			req.setAttribute("deleteCart", deleteCart);
		}

		@Override
		public void searchPerList(HttpServletRequest req, Model model) {
			int pageSize = 5; // 한 페이지당 출력한 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수

			int cnt = 0; // 글갯수
			int start = 0; // 현재 페이지 글시작 번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			String search=req.getParameter("search");
			req.setAttribute("search", search);
			search="%"+search+"%";
			cnt = HSDao.searchPerCnt(search);
			System.out.println("cnt:" + cnt);

			pageNum = req.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}

			currentPage = Integer.parseInt(pageNum);// 현재 페이지
			// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

			// 현재 페이지 1=(1-1)*5+1
			// 6=(2-1)*5+1
			// 11=(3-1)*5+1
			// 21=(5-1)*5+1

			start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

			// 5=1+5-1;

			end = start + pageSize - 1; // 현재 페이지 끝번호

			System.out.println("start:" + start);
			System.out.println("end:" + end);

			if (end > cnt)
				end = cnt;

			// 21 - (5-1)*5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
			System.out.println("number:" + number);
			System.out.println("cnt:" + cnt);
			System.out.println("currentPage:" + currentPage);
			System.out.println("pageSize:" + pageSize);

			if (cnt > 0) {
				// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("search", search);
				
				ArrayList<TcatPerformanceVO> dtos=HSDao.searchPerList(map);
				
				req.setAttribute("dtos", dtos);

			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

			endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
			if (endPage > pageCount)
				endPage = pageCount;

			req.setAttribute("cnt", cnt); // 글갯수
			req.setAttribute("number", number);// 글번호
			req.setAttribute("pageNum", pageNum); // 페이지번호

			if (cnt > 0) {
				req.setAttribute("startPage", startPage); // 시작 페이지
				req.setAttribute("endPage", endPage); // 마지막 페이지
				req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
				req.setAttribute("pageCount", pageCount); // 페이지 갯수
				req.setAttribute("currentPage", currentPage);// 현재 페이지
			}
			
		}

		@Override
		public void searchStoreList(HttpServletRequest req, Model model) {
			int pageSize = 5; // 한 페이지당 출력한 글 갯수
			int pageBlock = 5; // 한 블럭당 페이지 갯수

			int cnt = 0; // 글갯수
			int start = 0; // 현재 페이지 글시작 번호
			int end = 0; // 현재 페이지 글마지막 번호
			int number = 0; // 출력할 글번호
			String pageNum = null; // 페이지번호
			int currentPage = 0; // 현재 페이지

			int pageCount = 0; // 페이지 갯수
			int startPage = 0; // 시작 페이지
			int endPage = 0; // 마지막 페이지
			
			String search=req.getParameter("search");
			req.setAttribute("search", search);
			search="%"+search+"%";
			cnt = HSDao.searchStoreCnt(search);
			System.out.println("StoreCnt:" + cnt);

			pageNum = req.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1"; // 첫페이지를 1페이지로 설정
			}

			currentPage = Integer.parseInt(pageNum);// 현재 페이지
			// pageCnt = 12/5+1; //나머지 2건이 1페이지로 할당되므로 3페이지
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수=(글갯수/페이지당 글갯수)+(나머지가 있으면1 아니면0)

			// 현재 페이지 1=(1-1)*5+1
			// 6=(2-1)*5+1
			// 11=(3-1)*5+1
			// 21=(5-1)*5+1

			start = (currentPage - 1) * pageSize + 1;// 현재 페이지 시작번호

			// 5=1+5-1;

			end = start + pageSize - 1; // 현재 페이지 끝번호

			System.out.println("start:" + start);
			System.out.println("end:" + end);

			if (end > cnt)
				end = cnt;

			// 21 - (5-1)*5;
			number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호.. 최신글(큰페이지)출력할 글번호
			System.out.println("number:" + number);
			System.out.println("cnt:" + cnt);
			System.out.println("currentPage:" + currentPage);
			System.out.println("pageSize:" + pageSize);

			if (cnt > 0) {
				// 게시글 목록 조회
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("search", search);
				
				ArrayList<TcatPerDiscVO> dtos=HSDao.searchStoreList(map);
				
				req.setAttribute("dtos", dtos);

			}

			startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지=(현재 페이지/한 블럭당 페이지 갯수)*한 블럭당 페이지 갯수+1;
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock; // (현재페이지%한 블럭당 페이지 갯수==0)

			endPage = startPage + pageBlock - 1; // 마지막페이지=시작페이지+한 블럭당 페이지 갯수-1;
			if (endPage > pageCount)
				endPage = pageCount;

			req.setAttribute("cnt", cnt); // 글갯수
			req.setAttribute("number", number);// 글번호
			req.setAttribute("pageNum", pageNum); // 페이지번호

			if (cnt > 0) {
				req.setAttribute("startPage", startPage); // 시작 페이지
				req.setAttribute("endPage", endPage); // 마지막 페이지
				req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
				req.setAttribute("pageCount", pageCount); // 페이지 갯수
				req.setAttribute("currentPage", currentPage);// 현재 페이지
			}
			
			
		}


}
