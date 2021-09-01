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
		<div class="col-md-12 h25"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<br>
			<h4 class="trgothic">공지사항 게시판 관리</h4>
			<hr>
			<div>
				<table
				class="table table-hover table-bordered table-condensed c fs11">
				<tr class="bg-primary">
					<td><b>번호</b></td>
					<td style="width: 15%"><b>제목<b></td>
					<td style="width: 20%"><b>이미지</b></td>
					<td style="width: 15%"><b>내용</b></td>
					<td><b>조회수</b></td>
					<td><b>날짜</b></td>
					<td><b>선택</b></td>
					
				</tr>
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td><a onclick="load('noticeManagerContent?notice_num=${dto.notice_num}');">${dto.notice_title}</a></td>
							<td>
								<div class="w200 h170 overflow">
								<img src="/tcat/resources/image/Boarder/${dto.notice_image}" 
								     style="width: 100%;">
								</div>
							</td>
							<td>${dto.contents}</td>
							<td>${dto.refNum}</td>
							<td>${dto.writeDate}</td>
							<td>
								<input type="button" onclick="noticeManagerDel(${dto.notice_num});"
								 value="삭제" ><!-- ,'noticeManager' -->
								 <input type="button" onclick="noticeManagerUpdate(${dto.notice_num});"
								 value="수정" >
								 
								
							</td>
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
								<a onclick="load('noticeManager?cDev=${cDev}&keyword=${keyword}');">[◀◀]</a>
								<a href="load('noticeManager?pageNum=${startPage - pageBlock}&cDev=${cDev}&keyword=${keyword}');">[◀]</a>
							</c:if>
		
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
		
								</c:if>
		
								<c:if test="${i != currentPage}">
									<a href="load('noticeManager?pageNum=${i}&cDev=${cDev}&keyword=${keyword}');">[${i}]</a>
								</c:if>
							</c:forEach>
		
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a href="load('noticeManager?pageNum=${startPage + pageBlock}&cDev=${cDev}&keyword=${keyword}');">[▶]</a>
								<a href="load('noticeManager?pageNum=${pageCount}&cDev=${cDev}&keyword=${keyword}');">[▶▶]</a>
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
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">번호</option>
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
					onclick="ajaxSubmit('noticeManager');">검색</button>
			</form>

			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div class="col-md-1"></div>
		<!--리스트목록 끝  -->
			<div class="col-md-12 h100"></div>
</body>
</html>