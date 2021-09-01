package spring.project.tcat.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.project.tcat.VO.CategoryVO;
import spring.project.tcat.VO.HostVO;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.VO.ProductRankVO;
import spring.project.tcat.VO.SaleVO;
import spring.project.tcat.VO.SelectHellInfoVO;
import spring.project.tcat.VO.TcatBoardVO;
import spring.project.tcat.VO.TcatDiscBuyVO;
import spring.project.tcat.VO.TcatPerDiscVO;
import spring.project.tcat.VO.TcatPerformanceVO;
import spring.project.tcat.VO.TcatTicketingVO;
import spring.project.tcat.VO.detailPageVO;

public interface HostDAO {
	
	//최근가입 회원 숫자 체크
	public int latelyJoinMemberCnt(Map<String,Object> map);
	//최근 가입 회원 리스트
	public ArrayList<MemberVO> latelyJoinMember(Map<String,Object> map);
	//휴면카테고리 회원리스트 숫자
	public int sleepMemberCnt(int Hcnt);
	//휴면카테고리 회원리스트
	public ArrayList<MemberVO> sleepMember(Map<String,Object> map);
	//휴면회원 처리
	public int sleepMemberPro(Map<String,Object> map);
	//검색정보수량
	public int memberManagerSerchListCnt(Map<String,Object> map);
	//검색정보
	public ArrayList<MemberVO> memberManagerSerchList(Map<String,Object> map);
	//지역인서트 넘버키 가져오기
	public int placeNum();
	//지역정보 인서트
	public int placeInsert(TcatPerformanceVO vo);
	//hall 인서트
	public int insertHall(TcatPerformanceVO vo);
	//공연장 삭제 리스트 숫자
	public int hallDeleteCnt();
	//공연장 삭제 리스트
	public ArrayList<TcatPerformanceVO> hallDelete(Map<String,Object> map);
	//공연장 리스트 숫자
	public int hallListCnt();
	//공연장 리스트
	public ArrayList<TcatPerformanceVO> hallList(Map<String,Object> map);
	//공연장서치
	public ArrayList<TcatPerformanceVO> hallSerchList(Map<String,Object> map);
	//공연장 서치 숫자
	public int hallSerchListCnt(Map<String,Object> map);
	//플레이스 삭제
	public int placeDeletePro(Map<String,Object> map);
	//공연장 삭제
	public int hallDeletePro(Map<String,Object> map);
	//공연장 수정 데이터 가져오기
	public TcatPerformanceVO hallModifyDB(String hall_id);
	//플레이스 업데이트
	public int placeUpdate(TcatPerformanceVO vo);
	//공연장 업데이트
	public int hallModifyUpdate(TcatPerformanceVO vo);
	//일별 결산 카운트
	public ArrayList<TcatPerformanceVO> dayslseCount(Map<String,Object> map);
	//일별 결산 금액정보
	public ArrayList<TcatPerformanceVO> dayslsePerPrice(Map<String,Object> map);
	//일별 결산 스토어 카운트
	public ArrayList<TcatDiscBuyVO> dayStoreCount(Map<String,Object> map);
	//일별 결산 스토어 금액정보
	public ArrayList<TcatDiscBuyVO> dayStorePrice(Map<String,Object> map);
	
	//월별 결산 카운트
	public ArrayList<TcatPerformanceVO> monthSalsePerCount(String dayStr);
	//월별 결산 금액정보
	public ArrayList<TcatPerformanceVO> monthSalsePerPrice(String dayStr);
	//월별 결산 스토어 카운트
	public ArrayList<TcatDiscBuyVO> monthSalseStoreCount(String dayStr);
	//월별 결산 스토어 금액정보
	public ArrayList<TcatDiscBuyVO> monthSalseStorePrice(String dayStr);
	
	//메인 정보 공연 오더 수량 파악
	public int orderInfoMain(Map<String,Object> map);
	//메인 정보 스토어 오더 수량 파악
	public int orderStoreInfoMain(Map<String,Object> map);
	//메인 정보 카트 수량 파악
	public int cartMainInfoCount(String dayStr);
	//메인 정보 게시판 수량 파악
	public int boarderMainInfoCount(String dayStr);
	//메인 정보 후기게시판 수량 파악
	public int comentMainInfoCount(String dayStr);
	//메인 정보 qna게시판 수량 파악
	public int qnaMainInfoCount(String dayStr);
	//메인 정보 1:1게시판 수량 파악
	public int one_1MainInfoCount(String dayStr);
	
	
	
	
	

	//////////////////////////////////////18.01.16 명훈//////////////////////////////////////////////////
	//스토어 구매스인
	public void orderCon(String disc_num);
	//출력할 공연상품 갯수 가져오기
	public int perProductCnt(Map<String, Object> map);
	//출력할 스토어상품 갯수 가져오기
	public int storeProductCnt(Map<String, Object> map);
	//공연 상품 출력
	public ArrayList<TcatPerformanceVO> perProduct(Map<String, Object> map);
	//스토어 상품 출력
	public ArrayList<TcatPerDiscVO> storeProduct(Map<String, Object> map);
	//공연 상품 상세정보 - 1건
	public TcatPerformanceVO productDetail_perf(int perf_id);
	//스토어 상품 상세정보 1건 
	public TcatPerDiscVO productDetail_store(int disc_code);
	//orderListCnt 주문목록 갯수
	public int orderListCnt(Map<String, Object> map);
	//orderList 주문목록 가져오기
	public ArrayList<TcatTicketingVO> orderList(Map<String, Object> map);
	//orderList_storeCnt 스토어 주문 갯수
	public int orderList_storeCnt(Map<String, Object> map);
	//orderList_store
	public ArrayList<TcatDiscBuyVO> orderList_store(Map<String, Object> map);
	//////////////////////////////////////18.01.16 명훈 끝//////////////////////////////////////////////////
	
	//////////////////////////////////////18.01. 명훈 시작//////////////////////////////////////////////////
	//상품 랭크 getProductRank_perfCnt
	public int getProductRank_perfCnt();
	//상품 랭크 getProductRank_perfCnt
	public ArrayList<ProductRankVO > productRank_perf(int productNum);
	//스토어 상품 랭크
	public int getProductRank_storeCnt();
	//스토어 상품 랭크
	public ArrayList<ProductRankVO > productRank_store(int productNum);
	
	//중분류 랭크
	public ArrayList<ProductRankVO > mDevRank();
	//소분류 랭크
	public ArrayList<ProductRankVO > sDevRank(String mDev);
	//mDevRank_store 스토어 중분류
	public ArrayList<ProductRankVO > mDevRank_store();
	//스토어 소분류
	public ArrayList<ProductRankVO > sDevRank_store(String mDev);
	//환불 랭크 개수
	public int returnRank_perfCnt();
	//환불 랭크 리스트
	public ArrayList<ProductRankVO > returnRank_perf(int productNum);
	//스토어 환불 랭크
	public int returnRank_storeCnt();
	//스토어 환불 랭크
	public ArrayList<ProductRankVO > returnRank_store(int productNum);
	//장바구니랭크 갯수
	public int cartRankCnt();
	//장바구니 랭크 리스트
	public ArrayList<ProductRankVO > cartRank(int productNum);
	//위시리스트 갯수
	public int wishListRank_perfCnt();
	//위시리스트 리스트
	public ArrayList<ProductRankVO > wishListRank_perf(int productNum);
	//위시리스트 스토어 갯수
	public int wishListRank_storeCnt();
	//위시리스트 스토어 리스트
	public ArrayList<ProductRankVO > wishListRank_store(int productNum);
	//////////////////////////////////////18.01. 명훈 끝//////////////////////////////////////////////////
	
	
	/////////////////////////////////////18.01.25 명훈 시작//////////////////////////////////////////////////
	//배송관리 스텝 변경
	public void orderMangement_storeChange(Map<String, Object> map);
	//예매 관리 스탭 변경
	public void orderMangement_Change(Map<String, Object> map);

	//////////////////////////////////////18.01.25 명훈 끝//////////////////////////////////////////////////
	
	
	/////////////////////////////////// 태성 1/9 start ////////////////////////////////////////
	//상품 목록 출력 진열
	public ArrayList<TcatPerformanceVO> getArticleList(Map<String, Object> map);
	//카테고리 상품 개수
	public int getCate(Map<String, Object> map);
	//스토어 상품 개수 
	public int getStore(Map<String, Object> map) ;
	//카테고리별 출력(스토어 제외)
	public ArrayList<TcatPerformanceVO> musiList(Map<String, Object> map);
	//카테고리별 출력(스토어만)
	public ArrayList<TcatPerformanceVO> storeList(Map<String, Object> map);
	////////////////////////////////////태성 1/9 end //////////////////////////////////////////
	
	////////////////////////////////////태성 1/10 start ///////////////////////////////////////
	//우선순위 수정
	public int Cfirst_grade(Map<String, String > map); //뮤지컬,연극,콘서트 우선순위 변경
	public int Sfirst_grade(Map<String, String > map); //스토어 우선순위 변경
	//스텝 변경
	public int Cstep(Map<String, String > map); //뮤지컬,연극,콘서트 스텝변경
	public int Sstep(Map<String, String > map); //스토어 스텝변경
	////////////////////////////////////태성 1/10 end //////////////////////////////////////////
	
	///////////////////////  태성 1/12 start ///////////////////////////
	//수정재고관리 목록개수
	//스토어 상품 개수 
	public int stockStore(Map<String, Object> map) ;
	//수정재고관리 출력
	//수정재고관리 카테고리별 출력(스토어만)
	public ArrayList<TcatPerDiscVO> stockManageListstore(Map<String, Object> map);
	//수정할 개수(disc_code)
	public int clickStockCnt(int per_id);
	//수정할 수 있는 목록
	public ArrayList<TcatPerDiscVO> clickStockList(Map<String, Object> map);
	//재고 수정 처리
	public void updateStock(Map<String, Object> map);
	///////////////////////  태성 1/12 end  ///////////////////////////
	

	
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 갯수 구하기
	public int performanceCnt();
	//공연정보 리스트 구하기
	public ArrayList<TcatPerformanceVO> performanceList(Map<String,Integer> map);
	//카테고리 리스트 가져오기 [공연]
	public ArrayList<CategoryVO> cateList();
	//카테고리 리스트 가져오기 [스토어]
	public ArrayList<CategoryVO> cateListStore();
	//공연지역 리스트 가져오기
	public ArrayList<SelectHellInfoVO> HellList();
	//상세페이지 번호 찾아오기
	public int SearchDetail_num();
	//상세페이지 번호 찾아오기[store]
	public int SearchDetail_numStore();
	//상세페이지 생성[초기화]
	public void insertDetailP_DEFAULT(int detail_num);
	//공연정보 추가하기
	public void insertPerformance(Map<String,Object> map);
	//스토어 갯수 구하기
	public int perDiscCnt();
	//스토어 리스트 가져오기
	public ArrayList<TcatPerDiscVO> perDiscList(Map<String,Object> map);
	//스토어 재고 추가
	public void insertStore(TcatPerDiscVO dto);
	//2018-01-15---------------------------------------------------------------------
	//고객정보 갯수 가져오기
	public int member_cnt();
	//고객정보 리스트 가져오기
	public ArrayList<MemberVO> member_list(Map<String, Object> map);
	//고객정보 가져오기
	public MemberVO detailMember(String member_id);
	//고객정보 수정
	public int detailMember_update(Map<String,Object> map);
	//2018-01-16---------------------------------------------------------------------
	//관리자 추가
	public int HostPlus(Map<String,Object> map);
	//관리자 id있는지 체크
	public int HostIdCheack(String host_id);
	//관리자 리스트 갯수 구하기
	public int HostMemberListCnt();	
	//관리자 리스트 가져오기
	public ArrayList<HostVO> HostMemberList(Map<String,Object> map);
	//관리자 삭제
	public int deleteHost(String host_id);
	//상세페이지 정보 가져오기
	public detailPageVO detaillist(int detail_num);
	//상세페이지 수정
	public void updateDetail(Map<String,Object> map);
	//동영상 추가
	public void updatePer(Map<String,Object> map);
	
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////


////////////////////////////////////영민 1/10 start ///////////////////////////////////////
	
//핫리스트 5개 출력
public ArrayList <TcatPerformanceVO>hotList();
//핫리스트 갯수
public int hotArticleCnt();
//핫리스트 아닌 갯수
public int hotNoArticleCnt(Map<String,Object> map);
//업데이트
public int hotUpdate(int per_id);
//전체 리스트
public ArrayList <TcatPerformanceVO>hotLast(Map<String,Object> map);

//hot 카테고리 내리기
public int hotDeleteList(int strPer_id);

//hot 카테고리 올리기
public int hotUpdateList(int strPer_id);

//스토어 핫리스트
public int hotStoreCnt();
//스토어리스트
public int hotNoStoreCnt(Map<String,Object> map);
//스토어 전체리스트
public ArrayList <TcatPerDiscVO>hotStore(Map<String,Object> map);
//hot 스토어 내리기
public int hotStoreDeleteList(int disc_code);
//hot 스토어 올리기
public int hotStoreUpdateList(int disc_code);

//구매요청 갯수
public int provalCnt();
//구매요청 리스트
public ArrayList <TcatTicketingVO>provalList(Map<String,Object> map);

//구매요청
public int provalUpdateCnt(int num);
//혜택 갯수
public int levelCnt();
//혜택 리스트
public ArrayList <SaleVO>levelList(Map<String,Object> map);
//혜택삭제
public int levelDeleteCnt(String sale);
//혜택 상세
public ArrayList<SaleVO> levelMemberForm(String sale_div);
//혜택 수정
public int levelUpdateCnt(Map<String,Object> map);
//혜택등록
public int levelAdd(Map<String,Object> map);
//상품상세
public ArrayList<TcatPerformanceVO> hostProCnt(int per_id);
//상품 수정
public int hostProUpdateCnt1(Map<String,Object> map1);
public int hostProUpdateCnt2(Map<String,Object> map2);
public int hostProUpdateCnt3(Map<String,Object> map3);

//스토어 상세
public ArrayList<TcatPerDiscVO> hostStoreCnt(int disc_code);
public int hostProStoreUpdateCnt1(Map<String,Object> map1);
public int hostProStoreUpdateCnt2(Map<String,Object> map2);

////////////////////////////////////영민 1/10 end ///////////////////////////////////////
///////////////////////  동금 1/11  ///////////////////////////
	
//상품갯수 불러오기
public int getPerfoCnt(Map<String, Object> map);

//상품리스트 불러오기
public ArrayList<TcatPerformanceVO> getPerfoDeleteList(Map<String, Object> map);

//스토어상품갯수 불러오기
public int getStoreCnt(Map<String, Object> map);

//스토어상품리스트 불러오기
public ArrayList<TcatPerDiscVO> getStoreDeleteList(Map<String, Object> map);

//상품삭제 처리페이지
public int registerDel(int per_id);

//스토어상품삭제 처리페이지
public int storeRegisterDel(int disc_code);

////////품절관리/////////
//스토어상품갯수불러오기
public int storeOutOfCnt(Map<String, Object> map);

//스토어상품리스트불러오기
public ArrayList<TcatPerDiscVO> storeOutOfList(Map<String, Object> map);

//스토어판매중단
public int storeSaleStop(int disc_code);

//스토어판매중단해제하기
public int storeSaleStopRelease(int disc_code);

//스토어수량0개일때 step=>3
public void storediscCount();

//공연판매중단
public int perfSaleStop(int disc_code);

//공연판매중단해제하기
public int perfSaleStopRelease(int disc_code);

//스토어수량0개일때 step=>3
public void perfdiscCount();

//////////////////게시판 관리//////////////////////
//공지사항 게시판 갯수불러오기
public int noticeManagerCnt(Map<String, Object> map);

//공지사항 게시판 리스트 불러오기
public ArrayList<TcatBoardVO> noticeManagerList(Map<String, Object> map);

//공지사항 업로드
public int insertNoticeBoardImage(Map<String, Object> map);

//공지사항 게시판 게시글 삭제
public int deleteNoticeList(int notice_num);

//공지사항 게시판 게시글 수정
public int updateNoticeBoardImage(Map<String, Object> map);

//공지사항 상세페이지 불러오기
public TcatBoardVO noticeManagerContent(int notice_num);

//Q&A게시판 갯수불러오기
public int qnaManagerCnt(Map<String, Object> map);

//Q&A게시판 리스트 불러오기
public ArrayList<TcatBoardVO> qnaManagerList(Map<String, Object> map);

//Q&A게시판 게시글 삭제
public int deleteQnaList(int service_num);

//Q&A게시판 상세보기
public TcatBoardVO qnaManagerContent(int service_num);

//Q&A게시판 상세보기 댓글
public ArrayList<TcatBoardVO> qnaManagerComment(String service_num);

//댓글달기
public int qnaManagerCommentWrite(Map<String, Object> map);
//답변상태 update
public void serviceManagerUpdate(int service_num);
//답글삭제
public int commentManagerDelete(int service_num);

//1:1게시판 갯수불러오기
public int oneManagerCnt(Map<String, Object> map);

//1:1게시판 리스트 불러오기
public ArrayList<TcatBoardVO> oneManagerList(Map<String, Object> map);

//1:1게시판 게시글 삭제
public int deleteOneList(int service_num);

//1:1게시판 상세보기
public TcatBoardVO oneManagerContent(int service_num);

//1:1게시판 상세보기 댓글
public ArrayList<TcatBoardVO> oneManagerComment(String service_num);

//댓글달기
public int oneManagerCommentWrite(Map<String, Object> map);
//답변상태 update
//public void serviceManagerUpdate(int service_num);
//답글삭제
public int commentOneManagerDelete(int service_num);


///////////////////////  동금 1/15 end ///////////////////////////
		
///////////////////////  태성 1/21 start ///////////////////////////
	// 관람 후기 개수
	public int commentCnt(Map<String, Object>map);
	// 상품 후기 개수
	public int commentCntS(Map<String, Object>map);
	
	// 관람/상품 후기 목록
	public ArrayList<TcatBoardVO> commentList(Map<String, Object> map);
	//공연후기 목록 출력
	public ArrayList<TcatBoardVO> commentListView(Map<String, Object> map);
	//상품후기 목록 출력
	public ArrayList<TcatBoardVO> commentListStore(Map<String, Object> map);
	
	// 관람/상품후기 삭제
	public int commentDel(int notice_num);
	
	
	////////////////////////////////
	// 환불 공연 개수
	public int refundCnt(Map<String, Object>map);
	// 환불 스토어 개수
	public int refundSCnt(Map<String, Object>map);
	
	
	// 환불 공연 목록
	public ArrayList<TcatTicketingVO> refundListA(Map<String, Object> map);
	// 환불 스토어 목록
	public ArrayList<TcatDiscBuyVO> refundListB(Map<String, Object> map);
	
	// 환불 승인 - 공연
	public int refundPerformanceOk(int refundUpdate);
	// 환불 취소 - 공연
	public int refundPerformanceCancel(int refundDown);
	
	// 환불 승인 - 스토어
	public int refundStoreOk(Map<String, Object> map);
	// 환불 승인시 - 수량 추가
	public int refundCount(Map<String, Object> map);
	// 환불 취소 - 스토어
	public int refundStoreCancel(int refundDownS);
	
///////////////////////  태성 1/21 end ///////////////////////////
///////////////////////  태성 1/30 start ///////////////////////////
	//사진게시판 게시글 개수
	public int photoManagerCnt();
	//사진게시판 게시글 목록
	public ArrayList<TcatBoardVO> photoManagerList(Map<String,Object> map);
	//사진게시판 답글 가져오기
	public ArrayList<TcatBoardVO> photoManagerComment();
	//사진게시판 수정
	public int photoManagerNomoDao(TcatBoardVO vo);
	//사진게시판 삭제
	public int photoManagerDeleteDao(int notice_num);
	
	//영상게시판 게시글 개수
	public int movieManagerCnt();
	//영상게시판 게시글 목록
	public ArrayList<TcatBoardVO> movieManagerList(Map<String,Object> map);
	//영상게시판 답글 가져오기
	public ArrayList<TcatBoardVO> movieManagerComment();
	//영상게시판 수정
	public int movieManagerNomoDao(TcatBoardVO vo);
	//영상게시판 삭제
	public int movieManagerDeleteDao(int notice_num);
	//교환 목록 개수
	public int returnCnt(Map<String,Object> map);
	//교환 목록
	public ArrayList<TcatDiscBuyVO> returnList(Map<String, Object> map);
	//교환 승인
	public int returnStoreOk(int returnUpdate);
///////////////////////  태성 1/30 end ///////////////////////////
	
}
