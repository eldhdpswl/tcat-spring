package spring.project.tcat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HostService {
	
	//최근 가입회원 화면
	public void join_retireMember(HttpServletRequest req,Model model);
	//휴면회원등록
	public void sleepMember(HttpServletRequest req,Model model);
	//휴면회원 처리
	public void sleepMemberPro(HttpServletRequest req,Model model);
	//회원검색리스트
	public void memberManagerSerchList(HttpServletRequest req,Model model);
	//공연장 리스트
	public void hallList(HttpServletRequest req, Model model);
	//공연장 인서트
	public void insertHall(HttpServletRequest req,Model model);
	//공연장 삭제리스트
	public void hallDelete(HttpServletRequest req,Model model);
	//공연장 검색
	public void hallSerchList(HttpServletRequest req, Model model);
	//공연장 삭제
	public void hallDeletePro(HttpServletRequest req, Model model);
	//공연장 수정 데이터 가져오기
	public void hallModifyDB(HttpServletRequest req, Model model);
	//공연장 리스트
	public void hallLIstDB(HttpServletRequest req, Model model);
	//공연장 수정 데이터 업데이트
	public void hallModifyUpdate(HttpServletRequest req, Model model);
	//일별 결산
	public void dayslse(HttpServletRequest req, Model model);
	//주별 결산	
	public void weekendSalse(HttpServletRequest req, Model model);
	//월별 결산
	public void monthSalse(HttpServletRequest req, Model model);
	//메인인포정보
	public void hostMainInfo(HttpServletRequest req, Model model);
	
	
	

	//////////////////////////////////////18.01.16 명훈//////////////////////////////////////////////////
	//스토어 구매 승인
	public void orderCon(HttpServletRequest req,Model model);
	//상품목록 나열
	public void productList(HttpServletRequest req,Model model);
	//공연상품정보 가져오기
	public void  productDetail_perf(HttpServletRequest req,Model model);
	//스토어상품정보 가져오기
	public void  productDetail_store(HttpServletRequest req,Model model);
	//예매 리스트 가져오기
	public void  orderList(HttpServletRequest req, Model model);
	//상품 구매 리스트 가져오기
	public void  orderList_store(HttpServletRequest req, Model model);
	//////////////////////////////////////18.01.16 명훈 끝//////////////////////////////////////////////////
	
	//////////////////////////////////////18.01.17 명훈시작 완//////////////////////////////////////////////////
	//판매량 정렬
	public void productRank_perf(HttpServletRequest req, Model model);
	//스토어 판매량 productRank_store
	public void productRank_store(HttpServletRequest req, Model model);
	
	
	//categoryRank_perf 공연 카테고리 판매량 분석
	public void categoryRank_perf(HttpServletRequest req, Model model);
	//스토어 판매량 카테고리 스토어
	public void categoryRank_store(HttpServletRequest req, Model model);
	
	//returnRank_perf 환불 승인 랭크
	public void returnRank_perf(HttpServletRequest req, Model model);
	//스토어 환불 승인
	public void returnRank_store(HttpServletRequest req, Model model);
	//장바구니 분석
	public void cartRank(HttpServletRequest req, Model model);
	
	//위시리스트
	public void wishListRank_perf(HttpServletRequest req, Model model);
	//위시리스트 스토어
	public void wishListRank_store(HttpServletRequest req, Model model);
	//////////////////////////////////////18.01.17 명훈시작 완//////////////////////////////////////////////////
	
	/////////////////////////////////////01.25장명훈 시작///////////////////////////////////////////////////////
	//배송관리
	public void orderManagement_store(HttpServletRequest req, Model model);
	//orderMangement_storeChange 배송스텝 변경
	public void orderMangement_storeChange(HttpServletRequest req, Model model);
	//orderManagement 
	public void orderManagement(HttpServletRequest req, Model model);
	//orderMangement_Change
	public void orderMangement_Change(HttpServletRequest req, Model model);
	/////////////////////////////////////01.25장명훈 시작///////////////////////////////////////////////////////
	
	

	
	/////////////////////////////////// 태성 1/9 start /////////////////////////////
	// HOST//상품관리//카테고리별 상품목록 출력
	public void categoryList(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/9 end//////////////////////////////

	///////////////////////////////// 태성 1/10 start//////////////////////////////
	// HOST//상품관리//카테고리별 상품진열관리 // 우선순위 변경
	public void updateGrade(HttpServletRequest req, Model model);
	
	// HOST//상품관리//카테고리별 상품진열관리 // 스텝변경
	public void changeStep(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/10 end ////////////////////////////
	
	///////////////////////////////// 태성 1/12 start//////////////////////////////
	// HOST//상품관리//상품재고관리
	public void stockManagementList(HttpServletRequest req, Model model);

	// HOST//상품관리//상품재고관리 수정 리스트
	public void stockManagementClickList(HttpServletRequest req, Model model);
	
	// HOST//상품관리//상품재고관리 수정처리
	public void updateStock(HttpServletRequest req, Model model);
	//////////////////////////////////// 태성 1/12 end ////////////////////////////
	


		
	////////////////////////////////////현석 1/11  //////////////////////////////////////////
	//공연정보 리스트 가져오기
	public void performanceList(HttpServletRequest req,Model model);
	//공연정보 추가
	public void performanceInsert(MultipartHttpServletRequest req,Model model);
	//스토어 리스트 가져오기
	public void storeList(HttpServletRequest req,Model model);
	//스토어 재고 추가
	public void insertStore (MultipartHttpServletRequest req,Model model);
	//고객 리스트 가져오기
	public void member_list(HttpServletRequest req,Model model);
	//상세 고객정보 가져오기
	public void detailMember(HttpServletRequest req,Model model);
	//고객정보 수정
	public void detailMember_update(HttpServletRequest req,Model model);
	//호스트 이메일 체크
	public void emailCheack(HttpServletRequest req,Model model);
	//호스트 추가
	public void HostPlus(HttpServletRequest req,Model model);
	//호스트가입에서 id있는지 체크
	public void HostIdCheack(HttpServletRequest req,Model model);
	//관리자 id리스트 가져오기
	public void HostMemberList(HttpServletRequest req,Model model);
	//관리자 삭제
	public void deleteHost(HttpServletRequest req,Model model);
	//상세페이지 정보 가져오기
	public void detaillist(HttpServletRequest req,Model model);
	//상세페이지 정보 업데이트[스토어]
	public void updateDetailStore(MultipartHttpServletRequest req,Model model);
	//상세페이지 정보 업데이트[공연]
	public void updateDetailPer(MultipartHttpServletRequest req,Model model);
		
	////////////////////////////////////현석 1/11 end //////////////////////////////////////////

	
////////////////////////////////////영민 1/11 start //////////////////////////////////////////
//hot 카테고리
public void hotMenu(HttpServletRequest req,Model model);
//hot 카테고리 내리기
public void hotMenuDelete(HttpServletRequest req,Model model);

//hot 카테고리 올리기
public void hotMenuUpdate(HttpServletRequest req,Model model);

//구매요청
public void provalHost(HttpServletRequest req,Model model);
//구매업데이트
public void provalUpdate(HttpServletRequest req,Model model);
//혜택관리
public void levelMember(HttpServletRequest req,Model model);
//혜택삭제
public void levelDelete(HttpServletRequest req,Model model);
//혜택상세
public void levelMemberForm(HttpServletRequest req,Model model);
//혜택업데이트
public void levelMemberUpdate(HttpServletRequest req,Model model);
//혜택등록
public void levelAdd(HttpServletRequest req,Model model);
//상품수정 폼
public void hostProForm(HttpServletRequest req,Model model);
//상품수정 업데이트
public void hostProUpdate(MultipartHttpServletRequest req,Model model);
//스토어수정 폼
public void hostProStoreForm(HttpServletRequest req,Model model);
//스토어 수정
public void hostProStoreUpdate(MultipartHttpServletRequest req,Model model);
//스토어 hot카테고리
public void hotStore(HttpServletRequest req,Model model);
//hot 스토어 내리기
public void hotStoreMenuDelete(HttpServletRequest req,Model model);
//hot 스토어 올리기
public void hotStoreMenuUpdate(HttpServletRequest req,Model model);
////////////////////////////////////영민 1/11 end //////////////////////////////////////////

///////////////////////  동금 1/9 start  //////////////////////// 
	
// HOST/상품관리/상품삭제  -- update부분
public void stockDelete(HttpServletRequest req, Model model);

//스토어상품삭제
public void storeDelete(HttpServletRequest req, Model model);

//상품삭제처리
public void stockDeletePro(HttpServletRequest req, Model model);

//스토어상품삭제처리
public void storeDeletePro(HttpServletRequest req, Model model);


////////품절상품관리/////////

//판매중단하기
public void perfSale_stop(HttpServletRequest req, Model model);

//판매중단해제하기
public void perfSale_Release(HttpServletRequest req, Model model);

//스토어품절상품관리
public void storeOutOf(HttpServletRequest req, Model model);

//판매중단하기
public void storeSale_stop(HttpServletRequest req, Model model);

//판매중단해제하기
public void storeSale_Release(HttpServletRequest req, Model model);



///////공지사항 게시판 관리
//공지사항 게시판 관리
public void noticeManager(HttpServletRequest req, Model model);

//공지사항 게시판 게시글 작성처리(사진이미지포함)
public void noticeManagerWritePro(MultipartHttpServletRequest req,Model model);

//공지사항 게시판 게시글 삭제
public void noticeManagerListDelete(HttpServletRequest req, Model model);

//공지사항 게시판 게시글 수정
public void noticeManagerListUpdatePro(MultipartHttpServletRequest req,Model model);

//공지사항 게시판 상세페이지
public void noticeManagerContent(HttpServletRequest req, Model model);

///////Q&A게시판 관리
//Q&A게시판 관리
public void qnaManager(HttpServletRequest req, Model model);

//Q&A게시판 리스트 삭제
public void qnaManagerListDelete(HttpServletRequest req, Model model);

//Q&A게시판 상세보기
public void qnaManagerContent(HttpServletRequest req, Model model);

//Q&A게시판 상세보기 댓글
public void qnaManagerComment(HttpServletRequest req, Model model);

//댓글달기
public void qnaManagerWrite(HttpServletRequest req, Model model);

//댓글삭제
public void commentmanagerDelete(HttpServletRequest req, Model model);


///////1:1게시판 관리
//1:1게시판 관리
public void oneManager(HttpServletRequest req, Model model);

//1:1게시판 리스트 삭제
public void oneManagerListDelete(HttpServletRequest req, Model model);

//1:1게시판 상세보기
public void oneManagerContent(HttpServletRequest req, Model model);

//1:1게시판 상세보기 댓글
public void oneManagerComment(HttpServletRequest req, Model model);

//댓글달기
public void oneManagerWrite(HttpServletRequest req, Model model);

//댓글삭제
public void commentOnemanagerDelete(HttpServletRequest req, Model model);



///////////////////////  동금 1/15 end ///////////////////////////
	
	///////////////////////  태성 1/21 start ///////////////////////////
	//관람/상품 후기 관리 게시판 목록
	public void commentList(HttpServletRequest req, Model model);
	//관람/상품 후기 삭제
	public void commentDelete(HttpServletRequest req, Model model);
	
	// 환불 승인할 목록 - 공연
	public void productRefundBoard(HttpServletRequest req, Model model);
	// 환불 승인할 목록 - 스토어
	public void productRefundBoardS(HttpServletRequest req, Model model);
	
	// 환불 승인 - 공연
	public void productRefundUpdate(HttpServletRequest req, Model model);
	// 환불 취소 - 공연
	public void productRefundCancel(HttpServletRequest req, Model model);
	
	// 환불 승인 - 스토어
	public void productRefundUpdateS(HttpServletRequest req, Model model);
	// 환불 취소 - 스토어
	public void productRefundCancelS(HttpServletRequest req, Model model);
	///////////////////////  태성 1/21 end ///////////////////////////
///////////////////////  태성 1/30 start ///////////////////////////
	//사진관리 게시판 목록 불러오기
	public void photoManagerList(HttpServletRequest req, Model model);
	//사진관리 게시물 수정하기
	public void photoManagerNomoService(MultipartHttpServletRequest req, Model model);
	//사진관리 게시물 삭제하기
	public void  photoManagerDeleteService(HttpServletRequest req, Model model);
	
	//영상 관리 게시판 목록 불러오기
	public void movieManagerList(HttpServletRequest req, Model model);
	//영상 관리 게시물 수정하기
	public void movieManagerNomoService(MultipartHttpServletRequest req, Model model);
	//영상 관리 게시물 삭제하기
	public void movieManagerDeleteService(HttpServletRequest req, Model model);
	
	//스토어 반품 목록 불러오기
	public void productReturn(HttpServletRequest req, Model model);
	// 환불 승인 - 스토어
	public void productReturnUpdateS(HttpServletRequest req, Model model);
///////////////////////  태성 1/30 end ///////////////////////////
}