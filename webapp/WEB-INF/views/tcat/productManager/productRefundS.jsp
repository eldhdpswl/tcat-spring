<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스토어 환불 관리</title>
<script type="text/javascript">
/* 상품 환불 승인 */
function productRefundUpdateS(disc_num,buy_count,disc_code,url){
	 alert("환불이 승인되었습니다");
	load('productRefundUpdateS?disc_num='+disc_num+'&buy_count='+buy_count+'&disc_code='+disc_code+'&url='+url);
}
/* 상품 환불 취소 */
function productRefundCancelS(disc_num,url){
	 alert("환불이 취소되었습니다");
	load('productRefundCancelS?disc_num='+disc_num+'&url='+url);
}
</script>
</head>
<body class="b400040">
		<div class="row">
 	<div class="col-md-12 h25"></div>
 	<div class="col-md-1"></div>
 	<div class="col-md-11">
					<h4 class="trgothic">스토어 - 환불관리
					</h4>
					<hr>
	</div>
 	</div>
<div class="col-md-12 h25"></div>
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<table class="table table-hover table-bordered table-condensed c fs11">
					<tr class="warning">
						<td><b>상품구입번호 </b></td>
						<td><b>상품명</b></td>
						<td><b>구매자 id</b></td>
						<td><b>구매일자</b></td>
						<td><b>구매수량</b></td>
						<td><b>배송번호</b></td>
						<td><b>환불 승인</b></td>
						<td><b>환불 취소</b></td>
						
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.disc_num}</td>
							<td>${dto.disc_title}</td>
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.disc_buyDate}" pattern="yyyy-MM-dd"/></td>		
					 		<td>${dto.buy_count}</td>	
							<td>${dto.del_num}</td>	
							
				<td>
					<button type="button" class="btn btn-primary"onclick="productRefundUpdateS('${dto.disc_num}','${dto.buy_count}','${dto.disc_code}','productRefundUpdateS');">승인
					</button>
				</td>
				
				<td>
					<button type="button" class="btn btn-primary"onclick="productRefundCancelS('${dto.disc_num}','productRefundCancelS');">최소
					</button>
				</td>		
			
					
						</tr>
					</c:forEach>
				</table>
				<div class="col-md-1"></div>
			<div class="col-md-1"></div>
			<div class="col-md-1"></div>
			<div class="col-md-1"></div>
			<div class="col-md-1"></div>
		<br>
		<hr>
	
	<!-- 페이지 컨트롤 -->
	<div class="col-md-5"></div>
	<div class="col-md-6">
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
							<a onclick="load('productRefundS?sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('productRefundS?pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="load('productRefundS?pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
							</c:if>
						</c:forEach>
						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('productRefundS?pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('productRefundS?pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table></div>
		<form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="productRefundCategory" value=${productRefundCategory}>
            
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">구입 번호</option>
                  <option value="2">상품코드</option>
                  <option value="3">구매자id</option>
                  <option value="4">구매수량</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('productRefundS')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
		</div></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>