<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					</select> <select id="sDev" class="m10 p5">
						<option value="">소분류</option>
						<option></option>
					</select>


					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="stocksearch();">검색</button>
				</form>

			</div>
			<table
				class="table table-hover table-bordered table-condensed c fs10">
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
							<td><input type="button" onclick="window.location='' "
								value="삭제"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>

			<table
				class="table table-hover table-bordered table-condensed c fs10">
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
</body>
</html>