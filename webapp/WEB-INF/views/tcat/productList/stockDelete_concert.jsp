<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <link href="/tcat/resources/style.css" rel="stylesheet" type="text/css" media="screen" /> -->

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
			<h4>
				<b>콘서트상품삭제</b>
			</h4>
			<hr>
			<div>
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="bg-primary">
						<td><b>공연번호</b></td>
						<td style="width: 20%"><b>이미지<b></td>
						<td style="width: 15%"><b>제목</b></td>
						
						<td><b>분류</b></td>
						<td><b>시작날짜</b></td>
						<td><b>공연지역(도/시)</b></td>
						<td><b>공연지역(시/구)</b></td>
						<td><b>우편번호</b></td>
						<td><b>세부주소</b></td>
						<td><b>장소</b></td>
						<td><b>선택</b></td>
					</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.per_id}</td>
								<td>
									<img src="/tcat/resources/image/performance/${dto.perf_Image}" 
								      style="width: 200px; height: 200px;">
								</td>
								<td><a onclick="detailOpen('performance',${dto.per_id});">${dto.perf_title}</a></td>
								
								<td>${dto.mDev}</td>
								<td>${dto.startDate}</td>
								<td>${dto.province}</td>
								<td>${dto.city}</td>
								<td>${dto.postNum}</td>
								<td>${dto.address}</td>
								<td>${dto.hall_name}</td><!--  -->
								<td><input type="button" onclick="stock_Delete(${dto.per_id},'stockDelete_concert');"
									value="삭제"></td>
								<!-- stock_Delete(공연번호,'다시돌아올url?mDev=그 중분류','중분류: sql에서 검색될'); -->
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
									<a onclick="load('stockDelete_concert?sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
									<a onclick="load('stockDelete_concert?pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>

									</c:if>

									<c:if test="${i != currentPage}">
										<a onclick="load('stockDelete_concert?pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="load('stockDelete_concert?pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
									<a onclick="load('stockDelete_concert?pageNum=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
								</c:if>
							</c:if>
						</table>
					</div>
				</div>
				<!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
				<!--검색  -->
				<form class="navbar-form navbar-right" role="search"
					id="ajaxSubmitForm" onsubmit="return false">
					<!--카테고리  -->
					<select id="sDev" name="sDev" class="m10 p5">
						
						<option value="1">공연번호</option>
						<option value="2">제목</option>
						<option value="3">카테고리번호</option>
						<option value="4">공연지역(도)</option>
						<option value="5">장소</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="ajaxSubmit('stockDelete_concert')">검색</button>
					<!-- stocksearch(); -->
				</form>

			</div>
			<br> <br> <br> <br> <br> 
		</div>
		<div class="col-md-1"></div>
	</div>
	<!--리스트목록 끝  -->
</body>
</html>