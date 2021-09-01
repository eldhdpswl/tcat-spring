<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function deleteHost(url,value){
	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?host_id="+value);
}

function page(url) {
	$("#result").load("${pageContext.request.contextPath}/" + url);
}
function page(url, pageNum) {
	$("#result").load(
			"${pageContext.request.contextPath}/" + url + "?pageNum="+ pageNum);
}
</script>
</head>
<body>
<c:if test="${deleteHost==1}">
	<script type="text/javascript">
		alert("삭제되었습니다.");
	</script>
</c:if>
<c:if test="${deleteHost==0}">
	<script type="text/javascript">
		alert("삭제에 실패하였습니다.");
	</script>
</c:if>
<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
				<div class="col-md-12 h50"></div>
			
					<h4 class="trgothic">호스트 멤버 탈퇴</h4>
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<td><b>번호</b></td>
							<td><b>아이디</b></td>
							<td><b>비밀번호</b></td>
							<td><b>이름</b></td>
							<td><b>부서</b></td>
							<td><b>직급</b></td>
							<td><b>이메일</b></td>
							<td><b>연락처</b></td>
							<td><b>권한</b></td>
							<td></td>
						</tr>
						<c:if test="${cnt>0}">
							<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									<td>${number}<c:set var="number" value="${number-1}" />
									</td>
									<td>${dto.host_id}</td>
									<td>${dto.host_pwd}</td>
									<td>${dto.host_name}</td>
									<td>${dto.host_Department}</td>
									<td>${dto.host_grade}</td>
									<td>${dto.host_email}</td>
									<td>${dto.host_phone}</td>
									<td>${dto.host_authority}</td>
									<td><input type="button" value="삭제" onclick="deleteHost('deleteHost','${dto.host_id}');"></td>
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
							<li><a onclick="page('hostMemberRetire')">《</a></li>
							<li><a onclick="page('hostMemberRetire','${startPage-pageBlock}')">〈</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li id="${i}"><a onclick="page('hostMemberRetire','${i}')">${i}</a></li>
						</c:forEach>
						<c:if test="${currentPage!=pageCnt}">
							<li><a onclick="page('hostMemberRetire','${startPage+pageBlock}')">〉</a></li>
							<li><a onclick="page('hostMemberRetire','${pageCount}')">》</a></li>
						</c:if>
					</ul>
				</div>
		</div>
		<div class="col-md-5"></div>

	</div>
		<div class="col-md-12 h250"></div>
</body>
</html>