<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/tcat/resources/style.css" rel="stylesheet" type="text/css" media="screen" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
   /*탭 스크립트  */
   $('#myTab a[href="#performance"]').tab('show') // 공연상품 탭 클릭시 #myTab a[href="#performance"] 보여줌
   $('#myTab a[href="#store"]').tab('show') // Select tab by name
   
</script>
</head>
<body>
   <div class="row mt50">
      <div class="col-md-1"></div>
      <div class="col-md-10">
         <div role="tabpanel">
            <!-- 탭 네비게이션 -->
            <ul class="nav nav-tabs" role="tablist">
               <li role="presentation" class="${perActive}"><a
                  href="#performance" aria-controls="home" role="tab"
                  data-toggle="tab"
                  onclick="< productGet('productList','performance');">공연상품</a></li>
               <li role="presentation" class="${storeActive}"><a
                  href="#store" aria-controls="profile" role="tab" data-toggle="tab"
                  onclick="productGet('productList','store')">스토어상품</a></li>
            </ul>

            <!-- 탭시 출력 -->
            <div class="tab-content">
               <!--공연 출력  #myTab a[href="#performance"]-->
               <div role="tabpanel" class="tab-pane ${perActive}" id="performance">
                  <div id="perResult">
                     <!--리스트목록  -->
                     <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                           <div>
                              <!--검색  -->
                              <form class="navbar-form navbar-left" role="search">
                                 <!--카테고리  -->
	                             <select id="mDev" class="m10 p5" onchange="select_sDev();">
	                                <option value="">중분류</option>
	                                <option value="콘서트">콘서트</option>
	                                <option value="뮤지컬">뮤지컬</option>
	                                <option value="연극">연극</option>
	                                <option value="클래식">클래식</option>
	                             </select> 
	                             
	                             <select id="sDev" class="m10 p5">
	                                <option value="">소분류</option>
	                                <option></option>
	                             </select>	
                                 
                                 
                                 <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search"
                                       name="keyword">
                                 </div>
                                 <button type="button" class="btn btn-default" onclick="stocksearch();">검색</button>
                              </form>
                              
                           </div>
                           <table class="table table-hover table-bordered table-condensed c fs10">
                              <tr class="bg-primary">
                                 <!-- <td><b>아이디</b></td>
                                 <td><b>제목</b></td>
                                 <td><b>작성자</b></td>
                                 <td><b>조회수</b></td>
                                 <td><b>답글</b></td>
                                 <td><b>선택</b></td> -->
                                 <td><b>공연번호</b></td>
                                 <td><b>이미지<b></td>
                                 <td><b>제목</b></td>
                                 <td><b>카테고리</b></td>
                                 <td><b>시작날짜</b></td>
                                 <td><b>공연지역(도)</b></td>
                                 <td><b>공연지역(시)</b></td>
                                 <td><b>공연지역(구)</b></td>
                                 <td><b>장소</b></td>
                                 <td><b>선택</b></td>
                              </tr>
                              <c:if test="${cnt > 0}">
	                              <c:forEach var="performance" items="${performances}">
	                                 <tr>
	                                    <td>${dto.per_id}</td>
	                                    <td>${dto.perf_image}</td>
	                                    <td>${dto.perf_title}</td>
	                                    <td>${dto.category}</td>
	                                    <td>${dto.startdate}</td>
	                                    <td>${dto.province}</td>
	                                    <td>${dto.city}</td>
	                                    <td>${dto.address}</td>
	                                    <td>${dto.place}</td>
	                                    <td><input type="button" onclick="window.location='' " value="삭제"></td>
	                                 </tr>
	                              </c:forEach>
                              </c:if>
                           </table>
                           
                           <table class="table table-hover table-bordered table-condensed c fs10">
                           		<c:if test="${cnt > 0}">
									<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
									<c:if test="${startPage > pageBlock}">
										<a href="stockDelete">[◀◀]</a>
										<a href="stockDelete?pageNum=${startPage - pageBlock}">[◀]</a>
									</c:if>
									
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b>[${i}]</b></span>
										
										</c:if>
										
										<c:if test="${i != currentPage}">
											<a href="stockDelete?pageNum=${i}">[${i}]</a>
										</c:if>
									</c:forEach>
									
									<!-- 다음블록[▶] / 끝[▶▶] -->
									<c:if test="${pageCount > endPage}">
										<a href="stockDelete?pageNum=${startPage + pageBlock}">[▶]</a>
										<a href="stockDelete?pageNum=${pageCount}">[▶▶]</a>
									</c:if>
								</c:if>
                           </table>
                           <!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
                        </div>
                        <div class="col-md-1"></div>
                        <!--리스트목록 끝  -->

                     </div>
                  </div>
               </div>
               <!--스토어 출력  #myTab a[href="#store"]-->
               <div role="tabpanel" class="tab-pane ${storeActive }" id="store">
                  <!--리스트 시작  -->
                  <div class="row">
                     <div class="col-md-1"></div>
                     <div class="col-md-10">
                        <div>
                           <!--검색  -->
                           <form class="navbar-form navbar-left" role="search">
                              <div class="form-group">
                                 <input type="text" class="form-control" placeholder="Search"
                                    name="keyword">
                              </div>
                              <button type="button" class="btn btn-default" onclick="">검색</button>
                           </form>
                           <!--카테고리  -->
                           <select class="navbar-form navbar-left" >
                              <option value="">중분류</option>
                              <option value="뮤지컬">뮤지컬 OST</option>
                           </select> 
                           <select class="navbar-form navbar-left" >
                              <option value="">소분류</option>
                              <option value="뮤지컬">뮤지컬</option>
                           </select>
                        </div>
                        <table class="table table-hover table-bordered table-condensed c fs10">
                           <tr class="bg-primary">
                              <td><b>상품코드</b></td>
                              <td><b>상품명</b></td>
                              <td><b>카테고리</b></td>
                              <td><b>이미지 유,무</b></td>
                              <td><b>가격</b></td>
                              <td><b>할인조건</b></td>
                           </tr>
                           <c:forEach var="performance" items="performances">
                              <tr>
                                 <td>afasdsa</td>
                                 <td>2</td>
                                 <td>3</td>
                                 <td>4</td>
                                 <td>5</td>
                                 <td>6</td>
                              </tr>
                           </c:forEach>
                        </table>
                        <div class="row">
                           <div class="disInline">여기는 페이지 컨트롤러 아직 미구현</div>
                        </div>
                     </div>
                     <div class="col-md-1"></div>
                     <!--리스트 시작  -->
                  </div>
               </div>
            </div>
         </div>
         <div class="col-md-1"></div>
      </div>
</body>
</html>