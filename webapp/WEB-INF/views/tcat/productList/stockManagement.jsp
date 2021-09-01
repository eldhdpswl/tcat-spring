<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 재고 관리</title>
<script type="text/javascript">
function stockManagement_modify(code){
    window.open("stockManagement_modify?disc_code="+code, "confirm", "menubar=no, width=900, height=150");
 }
</script>
</head>
<body>

<div class="col-md-12">
<div class="col-md-12 h25"></div>
<div class="col-md-1"></div>
<div class="col-md-10">
	<hr>
	<h4 class="trgothic">스토어 재고 확인 및 변경</h4>
	<h5 class="trgothic">(수량변경할 상품을 클릭하세요!)</h5>
	<hr>
</div>
<div class="col-md-1"></div>
</div>
<div class="col-md-1"></div>
	<br>
	


	<div class="col-md-12 h25"></div>
	<c:if test="${category=='스토어'}">
		<!-- 스토어 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="warning">
						<td><b>상품코드</b></td>
						<td><b>상품이름</b></td>
						<td><b>상품가격</b></td>
						<td><b>상품우선순위</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>상품수량</b></td>
						<td><b>스텝</b></td>
					</tr>

					<c:forEach var="dto" items="${dtos}">
						<tr onclick="stockManagement_modify('${dto.disc_code}');">
							<!-- 목록 클릭시 윈도우창 출력(stockManagement_modify)  -->
							<td>${dto.disc_code}</td>
							<td>${dto.disc_title}</td>
							<td>${dto.disc_price}</td>
							<td>${dto.first_grade}</td>
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td>${dto.disc_count}</td>
							<td>${dto.disc_step}</td>
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
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a onclick="load('stockManagement?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('stockManagement?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('stockManagement?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('stockManagement?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('stockManagement?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table></div>
			<!--검색  -->
		<form class="navbar-form navbar-right" role="search"
			id="ajaxSubmitForm" onsubmit="return false">
			<input type="hidden" name="category" value=${category}>
			<!--카테고리  -->
			<select id="sDev" name="sDev" class="m10 p5">
				<option value="0">분류</option>
				<option value="1">상품코드</option>
				<option value="2">상품이름</option>
				<option value="3">스텝</option>
			</select>

			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					name="keyword">
			</div>
			<button type="button" class="btn btn-default"
				onclick="ajaxSubmit('stockManagement')">검색</button>
			<!-- stocksearch(); -->
		</form>
		<div class="col-md-1"></div>
            </div></div>
	</c:if>

</body>
</html>