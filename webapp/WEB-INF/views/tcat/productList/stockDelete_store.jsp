<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/tcat/resources/style.css" rel="stylesheet" type="text/css" media="screen" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--리스트목록  -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<br>
			<h4><b>스토어상품삭제</b></h4>
			<hr>
			<div>
				<table
				class="table table-hover table-bordered table-condensed c fs11">
				<tr class="bg-primary">
					<td><b>상품코드</b></td>
					<td style="width: 15%"><b>상품이름<b></td>
					<td style="width: 20%"><b>상품이미지</b></td>
					<td style="width: 10%"><b>상품설명</b></td>
					<td><b>상품가격</b></td>
					<td><b>상품수량</b></td>
					
					<td><b>중분류</b></td>
					<td><b>소분류</b></td>
					<td><b>선택</b></td>
				</tr>
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.disc_code}</td>
							<td><a onclick="detailOpen('store',${dto.disc_code});">${dto.disc_title}</a></td>
							<td>
								<img src="/tcat/resources/image/store/${dto.disc_image}" 
								     style="width: 200px; height: 200px;">
							
							</td>
							<td>${dto.disc_con}</td>
							<td>${dto.disc_price}</td>
							<td>${dto.disc_count}</td>
							
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><input type="button" onclick="store_Delete(${dto.disc_code},'stockDelete_store');"
								value="삭제"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="row c">
				<div class="disInline">
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
							<c:if test="${startPage > pageBlock}">
								<a onclick="load('stockDelete_store?cDev=${cDev}&keyword=${keyword}');">[◀◀]</a>
								<a onclick="load('stockDelete_store?pageNum=${startPage - pageBlock}&cDev=${cDev}&keyword=${keyword}');">[◀]</a>
							</c:if>
		
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
		
								</c:if>
		
								<c:if test="${i != currentPage}">
									<a onclick="load('stockDelete_store?pageNum=${i}&cDev=${cDev}&keyword=${keyword}');">[${i}]</a>
								</c:if>
							</c:forEach>
		
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a onclick="load('stockDelete_store?pageNum=${startPage + pageBlock}&cDev=${cDev}&keyword=${keyword}');">[▶]</a>
								<a onclick="load('stockDelete_store?pageNum=${pageCount}&cDev=${cDev}&keyword=${keyword}');">[▶▶]</a>
							</c:if>
						</c:if>
					</table>
				</div>
			</div>
			<!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
			<!--검색  -->
			<form class="navbar-form navbar-right" role="search" id="ajaxSubmitForm" onsubmit="return false">
				<!--카테고리  -->
				<select id="cDev" name="cDev" class="m10 p5"><!-- onchange="select_sDev();" -->
					<option value="1">상품코드</option>
					<option value="2">제목</option>
					<option value="3">가격</option>
					<option value="4">중분류</option>
					<option value="5">소분류</option>
				</select> 
				<!-- <select id="sDev" class="m10 p5">
					<option value="">소분류</option>
					<option></option>
				</select> -->


				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="keyword">
				</div>
				<button type="button" class="btn btn-default"
					onclick="ajaxSubmit('stockDelete_store')">검색</button>
					
			</form>
</div>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div class="col-md-1"></div>
		<!--리스트목록 끝  -->
</body>
</html>