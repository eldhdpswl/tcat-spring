<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function page(url) {
		$("#result").load("${pageContext.request.contextPath}/" + url);
	}
	function page(url, pageNum) {
		$("#result").load("${pageContext.request.contextPath}/" + url + "?pageNum="	+ pageNum);
	}
	function detailMember(member_id){
		 window.open("detailMember?member_id="+member_id, "confirm", "menubar=no, width=450, height=570");
	}
</script>

</head>
<body>
	<div class="col-md-12 bffffff">

		<div class="row">
		<div class="col-md-12 h50"></div>
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h4 class="trgothic">고객 리스트</h4>
				<div class="col-md-12 h25"></div>
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>마지막 접속일</th>
						<th>등급</th>
						<th>회원가입 날짜</th>
					</tr>
					<c:if test="${cnt>0}">
						<c:forEach var="dto" items="${dtos}">
							<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
							<tr onclick="detailMember('${dto.member_id}');" class="hand">
								<td>${number}<c:set var="number" value="${number-1}" /></td>
								<td>${dto.member_id}</td>
								<td >${dto.member_name}</td>
								<td>${dto.member_gender}</td>
								<td>${dto.member_birth}</td>
								<td>${dto.lastDate}</td>
								<td>${dto.getRating()}</td>
								<td>${dto.member_joindate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 회원이 없으면 -->
					<c:if test="${cnt==0}">
						<tr>
							<td colspan="9" align="center">회원이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<!--페이지 컨트롤러  -->
				<div class="col-sm-12 c">
					
					<ul class="pagination">
						<c:if test="${currentPage!=1}">
							<li><a onclick="page('memberModified')">《</a></li>
							<li><a onclick="page('memberModified','${startPage-pageBlock}')">〈</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li id="${i}"><a onclick="page('memberModified','${i}')">${i}</a></li>
						</c:forEach>
						<c:if test="${currentPage!=pageCnt}">
							<li><a onclick="page('memberModified','${startPage+pageBlock}')">〉</a></li>
							<li><a onclick="page('memberModified','${pageCount}')">》</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-12 h100"></div>
		</div>
	</div>
</body>
</html>