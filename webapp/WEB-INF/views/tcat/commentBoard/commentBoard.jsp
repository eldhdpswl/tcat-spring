<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>
<style type="text/css">
a {
	color: black;
}

.nav-tabs {
	border-bottom: 1.3px solid gray;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border: 1.3px solid gray;
	border-bottom-color: transparent;
	color: black;
}
</style>
<script type="text/javascript">
/* 탭 클릭시 active 활성화 조건 */
$(document).ready(function(){
	if(${commentCategory=='공연'}){
		$("#perf_tab").addClass("active");
		$("#store_tab").removeClass("active");
	}else{
		$("#store_tab").addClass("active");
		$("#perf_tab").removeClass("active");
	}
});
//탭
	$('#myTab a[href="#profile"]').tab('show');

</script>

</head>
<body>

	<br>
	<br>
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 게시판</h2>
	<hr>

	<div class="col-md-1"></div>
		<ul class="nav nav-tabs" role="tablist">
		
			<li role="presentation" class="active" id="perf_tab">
			<a href="#perf" aria-controls="home" role="tab" data-toggle="tab" onclick="load('commentBoard?commentCategory=공연');">공연</a></li>
			
			<li role="presentation" id="store_tab">
			<a  href="#store" aria-controls="profile" role="tab" data-toggle="tab" onclick="load('commentBoard?commentCategory=스토어');">스토어</a></li>
			
		</ul>
	
	<br>

		<div class="col-md-12 h25"></div>
	<c:if test="${commentCategory=='공연'}">
		<div class="row" id="perf">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-striped">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td width="150px" height="100px"><h6 class="floatL mr20">
									<label>번호 : </label> ${dto.notice_num}
								</h6></td>
							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>공연 제목 : </label> ${dto.perf_title}
								</h6></td>
							<td width="500px" height="100px"><h6 class="floatL mr20">
									<label>후기(한줄평) : </label> ${dto.contents}
								</h6></td>

							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>작성자 : </label> ${dto.member_id}
								</h6></td>

							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>작성일 : </label>
									<fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd" />
								</h6></td>
						</tr>
					</c:forEach>
				</table>

				<div class="col-md-1"></div>
				<div class="col-md-1"></div>

				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<br>
				<!-- 페이지 컨트롤 -->
				<div class="col-md-5"></div>
				<div class="col-md-6">
					<table style="width: 1000px" align="center">
						<tr align="center">
							<th><c:if test="${cnt > 0}">
									<c:if test="${startPage > pageBlock}">
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b>[${i}]</b></span>
										</c:if>
										<c:if test="${i != currentPage}">
											<a
												onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
										</c:if>
									</c:forEach>
									<!-- 다음[▶] / 끝[▶▶] -->
									<c:if test="${pageCount > endPage}">
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
									</c:if>
								</c:if></th>
						</tr>
					</table>
				</div>
				<div class="col-md-1"></div>
				<form class="navbar-form navbar-right" role="search"
					id="ajaxSubmitForm" onsubmit="return false">
					<input type="hidden" name="commentCategory" value=${commentCategory}>

					<!--카테고리  -->
					<select id="sDev" name="sDev" class="m10 p5">
						<option value="0">분류</option>
						<option value="1">후기번호</option>
						<option value="2">작성자</option>
						<option value="3">제목</option>
						<option value="4">내용</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="ajaxSubmit('commentBoard')">검색</button>
					<!-- stocksearch(); -->
				</form>
				<div class="col-md-1"></div>
			</div>
		</div>
	
	</c:if>

	<c:if test="${commentCategory=='스토어'}">
		<div class="row" id="store">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-striped">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td width="150px" height="100px"><h6 class="floatL mr20">
									<label>번호 : </label> ${dto.notice_num}
								</h6></td>
							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>상품명 : </label> ${dto.disc_title}
								</h6></td>
							<td width="500px" height="100px"><h6 class="floatL mr20">
									<label>후기(한줄평) : </label> ${dto.contents}
								</h6></td>

							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>작성자 : </label> ${dto.member_id}
								</h6></td>

							<td width="250px" height="100px"><h6 class="floatL mr20">
									<label>작성일 : </label>
									<fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd" />
								</h6></td>
						</tr>
					</c:forEach>
				</table>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<br>
				<!-- 페이지 컨트롤 -->
				<div class="col-md-5"></div>
				<div class="col-md-6">
					<table style="width: 1000px" align="center">
						<tr>
							<th align="center"><c:if test="${cnt > 0}">
									<c:if test="${startPage > pageBlock}">
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b>[${i}]</b></span>
										</c:if>
										<c:if test="${i != currentPage}">
											<a
												onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
										</c:if>
									</c:forEach>
									<!-- 다음[▶] / 끝[▶▶] -->
									<c:if test="${pageCount > endPage}">
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
										<a
											onclick="load('commentBoard?commentCategory=${commentCategory}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
									</c:if>
								</c:if></th>
						</tr>
					</table>
				</div>
				<div class="col-md-1"></div>

				<form class="navbar-form navbar-right" role="search"
					id="ajaxSubmitForm" onsubmit="return false">
					<input type="hidden" name="commentCategory" value=${commentCategory}>

					<!--카테고리  -->
					<select id="sDev" name="sDev" class="m10 p5">
						<option value="0">분류</option>
						<option value="1">후기번호</option>
						<option value="2">작성자</option>
						<option value="3">제목</option>
						<option value="4">내용</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="ajaxSubmit('commentBoard')">검색</button>
					<!-- stocksearch(); -->
				</form>
			</div>
		</div>
	</c:if>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="col-md-1"></div>
</body>
</html>