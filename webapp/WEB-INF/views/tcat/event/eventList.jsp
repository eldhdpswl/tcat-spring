<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body class="b400040">
<c:set var="image" value="/tcat/resources/image/"/>
	<div class="row mt50">
		<div class="col-md-10">
			<div class="row">

				<div class="col-md-10">
					<div>
					<h2>이벤트</h2>
						<hr>
						<br>
						<c:if test="${cnt > 0}">
						<c:forEach var="vos" items="${dtos}" >
						<h4>${vos.notice_num}</h4>
						<img src="${image}eventList/${vos.notice_image}">
						<!-- load에 num값을 가지고 상세페이지로 이동 -->
						<a onclick="eventLoad('eventForm?notice_num=${vos.notice_num}');"><h4>${vos.notice_title}</h4></a>
						<br><br><br>
						</c:forEach>
						</c:if>
						<c:if test="${cnt==0}">
						<h2>이벤트 상품이 없습니다.</h2>
						</c:if>
						<table style="width: 1000px" align="center">
							<tr>
								<th align="center"><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전 블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a
												onclick="eventLoad('eventList?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="eventLoad('eventList?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="eventLoad('eventList?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="eventLoad('eventList?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>
					</div>
					<!-- 게시판 끝 -->
				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
			<div class="col-md-1"></div>

	</div>

</body>
</html>