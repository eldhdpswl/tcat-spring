<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.list_side {
	color: black;
}

.order {
	color: black;
}

.order.active {
	color: #3369ff;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".order").removeClass("active");
		$("#${order}").addClass("active");
		$("#${currentPage}").addClass("active");
	});
</script>
</head>
<br>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<!--사이드 메뉴 -->
		<div class="col-md-2">
			<div class="sidebar-nav disInline w100p floatR">
				<div class="well borderMenu disInline w100p"
					style="background-color: white; padding: 8px 0;">
					<ul class="nav nav-list  w100p ">
						<li><a class="list_side"><b>무용/발레</b></a>
							<hr class="w90p" style="margin: 0 auto;"></li>
						<li><a
							onclick="load('danceList?sDev=무용&order=startDate');"
							class="list_side">무용</a></li>
						<li><a onclick="load('danceList?sDev=발레&order=startDate');"
							class="list_side">발레</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--리스트 -->
		<div class="col-md-9">
			<div class="col-sm-12 c">
				<div class="col-sm-6 fs11 pt3">현재 예매 가능한 ${sDev }은 총
					${productCnt}개 있습니다.</div>
				<div class="col-sm-5">
					<a class="order" id="startDate"
						onclick="load('danceList?sDev=${sDev}&order=startDate');">등록순</a>
					<img src="${image}bar/bl_gray.gif"> <a class="order"
						id="endDate"
						onclick="load('danceList?sDev=${sDev}&order=endDate');">종료임박순</a>
					<img src="${image}bar/bl_gray.gif"> <a class="order"
						id="perf_title"
						onclick="load('danceList?sDev=${sDev}&order=perf_title');">상품명순</a>
				</div>
				<div class="col-sm-1"></div>
			</div>
			<div class="col-sm-12 c bf0f0f0 pt5"
				style="border: 1px solid #d0d0d0; border-top: 2px solid #3369ff; height: 30px;">
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
			<!--리스트 시작  -->
			<c:forEach var="perf" items="${perfs }">
				<div class="col-sm-12 c" style="border-bottom: 1px solid #d0d0d0">
					<div class="col-sm-8 tm">
						<div class="col-sm-3 p5">
							<a onclick="contentPage(${perf.per_id})"> <img class="img-responsive" src="${image}performance/${perf.perf_Image }"
								width="100%" height="80px">
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
					<div class="col-sm-2 pt5">${perf.province }${perf.city }</div>
				</div>
			</c:forEach>
			<!--리스트 끝  -->

			<!--페이지 컨트롤러  -->
			<div class="col-sm-12 c">

				<ul class="pagination">
					<c:if test="${currentPage!=1}">
						<li><a
							onclick="load('danceList?sDev=${sDev }&order=${order}&pageNum=1');">《</a></li>
						<li><a
							onclick="load('danceList?sDev=${sDev }&order=${order}&pageNum=${currentPage-1}');">〈</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li id="${i }"><a
							onclick="load('danceList?sDev=${sDev }&order=${order}&pageNum=${i}');">${i }</a></li>
					</c:forEach>
					<c:if test="${currentPage!=pageCnt}">
						<li><a
							onclick="load('danceList?sDev=${sDev }&order=${order}&pageNum=${currentPage+1}');">〉</a></li>
						<li><a
							onclick="load('danceList?sDev=${sDev }&order=${order}&pageNum=${pageCnt}');">》</a></li>
					</c:if>
				</ul>

			</div>

		</div>
	</div>

	<div class="col-md-1"></div>
</div>
<div class="col-md-1"></div>
<br>

</html>