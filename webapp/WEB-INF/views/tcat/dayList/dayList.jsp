<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--리스트 시작  -->
			<div class="col-sm-12 c bf0f0f0 pt5"
				style="border: 1px solid #d0d0d0; border-top: 2px solid #534556; height: 30px;">
				<div class="col-sm-8 ">
					<b>공연명</b>
				</div>
				<div class="col-sm-2 "
					style="border: 1px solid lightgrey; border-bottom: none; border-top: none;">
					<b>일시</b>
				</div>
				<div class="col-sm-2 ">
					<b>장소</b>
				</div>
			</div>
			<c:forEach var="perf" items="${dtos}">
				<div class="col-sm-12 c" style="border-bottom: 1px solid #d0d0d0; ">
					<div class="col-sm-8 tm">
						<div class="col-sm-3 p5">
							<a onclick="contentPage(${perf.per_id})"> <img src="${image}performance/${perf.perf_Image}" width="130px">
							</a>
						</div>
						<div class="col-sm-9 pt18">
							<b class="floatL"> <a onclick="contentPage(${perf.per_id})" style="color: black">
									${perf.perf_title } </a>
							</b>
						</div>
					</div>
					<div class="col-sm-2 pt5">
						<fmt:formatDate value="${perf.startDate }" pattern="yyyy년 MM월 dd일" />
						~
						<fmt:formatDate value="${perf.endDate }" pattern="yyyy년 MM월 dd일" />
					</div>
					<div class="col-sm-2 pt5">${perf.province}${perf.city}</div>
				</div>
			</c:forEach>
			<!--리스트 끝  -->

			<!--페이지 컨트롤러  -->
			<div class="col-sm-12 c">
				
				<ul class="pagination">
					<c:if test="${currentPage!=1}">
						<li><a onclick="dayList('daySearch?date=${date}&pageNum=1');">《</a></li>
						<li><a onclick="dayList('daySearch?date=${date}&pageNum=${currentPage-1}');">〈</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li id="${i }"><a onclick="dayList('daySearch?date=${date}&pageNum=${i}');">${i }</a></li>
					</c:forEach>
					<c:if test="${currentPage!=pageCnt}">
						<li><a onclick="dayList('daySearch?date=${date}&pageNum=${currentPage+1}');">〉</a></li>
						<li><a onclick="dayList('daySearch?date=${date}&pageNum=${pageCnt}');">》</a></li>
					</c:if>
				</ul>
			</div>
</body>
</html>