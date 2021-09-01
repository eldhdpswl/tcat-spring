<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	/* 18.01.11 명훈!! */
</script>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div>
			<!--검색  -->
			<form class="navbar-form navbar-left " role="search"
				id="ajaxSubmitForm">
				<input type="hidden" name="category" value="performance">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="keyword">
				</div>
				<button type="button" class="btn btn-default" onclick="ajaxSubmit('productList_perf')">검색</button>

				<!--카테고리  -->
				<select id="mDev" name="mDev" class="btn btn-default"
					onchange="select_sDev()">
					<option value="null">중분류</option>
					<option value="뮤지컬">뮤지컬</option>
					<option value="콘서트">콘서트</option>
					<option value="연극">연극</option>
					<option value="클래식">클래식</option>
				</select> <select id="sDev" name="sDev" class="btn btn-default">
					<option value="null">소분류</option>
				</select>
			</form>
		</div>
		<table class="table table-hover table-bordered table-condensed c fs10">
			<tr class="bg-primary">
				<td><b>공연코드</b></td>
				<td><b>공연명</b></td>
				<td><b>공연기간</b></td>
				<td><b>지역</b></td>
				<td><b>카테고리</b></td>
				<td><b>이미지파일명</b></td>
				<td><b>할인조건</b></td>
			</tr>
			<c:if test="${performances!=null }">
				<c:forEach var="performance" items="${performances}">
					<tr>
						<td>${performance.per_id }</td>
						<td>${performance.perf_title}</td>
						<td>${performance.startdate}-${performance.enddate}</td>
						<td>${performance.province}${performance.city}
							${performance.gu} ${performance.address}</td>
						<td>${performance.category}>${performance.getMdev()} >
							${performance.getSdev()}</td>
						<td>${performance.perf_Image}</td>
						<td>${performance.sale_div}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="row c">
			<div class="disInline">
				<!--1번페이지, 앞으로 하나  -->
				<c:if test="${currentPage!=1}">
					<a
						onclick="productGet('productList_perf','performance','${keyword}','${mDev}','${sDev}','1')">
						◀◀ </a>
					<a
						onclick="productGet('productList_perf','performance','${keyword}','${mDev}','${sDev}','${currentPage-1}')">
						◀ </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage }">
						<a class="gray"
							onclick="productGet('productList_perf','performance','${keyword}','${mDev}','${sDev}','${i}')">
							${i} </a>
					</c:if>
					<c:if test="${i != currentPage }">
						<a
							onclick="productGet('productList','performance','${keyword}','${mDev}','${sDev}','${i}')">
							${i} </a>
					</c:if>
				</c:forEach>
				<!--마지막 페이지, 뒤로 하나  -->
				<c:if test="${currentPage!=pageCnt}">
					<a
						onclick="productGet('productList','performance','${keyword}','${mDev}','${sDev}','${currentPage+1}')">
						▶ </a>
					<a
						onclick="productGet('productList','performance','${keyword}','${mDev}','${sDev}','${pageCnt}')">
						▶▶ </a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
	<!--리스트목록 끝  -->
</body>
</html>