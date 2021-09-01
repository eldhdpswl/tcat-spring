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
						<li><a class="list_side"><b>스토어</b></a>
							<hr class="w90p" style="margin: 0 auto;"></li>
						<li><a
							onclick="load('storeList?sDev=뮤지컬OST&order=disc_title');"
							class="list_side">뮤지컬OST</a></li>
						<li><a
							onclick="load('storeList?sDev=콘서트LIVE&order=disc_title');"
							class="list_side">콘서트LIVE</a></li>
						<li><a
							onclick="load('storeList?sDev=클래식LIVE&order=disc_title');"
							class="list_side">클래식LIVE</a></li>
						<li><a
							onclick="load('storeList?sDev=전시컬렉션&order=disc_title');"
							class="list_side">전시컬렉션</a></li>
					</ul>
				</div>
			</div>

		</div>
		<!--리스트 -->
		<div class="col-md-9">
			<div class="col-sm-12 c">
				<div class="col-sm-6 fs11 pt3">현재 구입 가능한 ${sDev }은 총
					${productCnt}개 있습니다.</div>
				<div class="col-sm-5">
					<a class="order" id="disc_title"
						onclick="load('storeList?sDev=${sDev}&order=disc_title');">상품명순</a>
					<img src="${image}bar/bl_gray.gif"> <a class="order"
						id="disc_price"
						onclick="load('storeList?sDev=${sDev}&order=disc_price');">가격순</a>

				</div>
				<div class="col-sm-1"></div>
			</div>
			<div class="col-sm-12 c bf0f0f0 pt5"
				style="border: 1px solid #d0d0d0; border-top: 2px solid #3369ff; height: 30px;">
				<div class="col-sm-8 ">
					<b>상품명</b>
				</div>
				<div class="col-sm-2 "
					style="border: 1px solid lightgrey; border-bottom: none; border-top: none;">
					<b>수량</b>
				</div>
				<div class="col-sm-2 ">
					<b>가격</b>
				</div>
			</div>
			<!--리스트 시작  -->
			<c:forEach var="disc" items="${discs }">
				<div class="col-sm-12 c" style="border-bottom: 1px solid #d0d0d0">
					<div class="col-sm-8 tm">
						<div class="col-sm-3 p5">
							<a onclick="contentMain_store(${disc.disc_code})"> <img  class="img-responsive" src="${image}store/${disc.disc_image }"
								width="100%" height="80px">
							</a>
						</div>
						<div class="col-sm-9 pt18">
							<b class="floatL"> <a onclick="contentMain_store(${disc.disc_code})" style="color: black">
									${disc.disc_title } </a>
							</b>
						</div>
					</div>
					<div class="col-sm-2 pt5">
						${disc.disc_count } 개
					</div>
					<div class="col-sm-2 pt5">
						${disc.disc_price } 원
					</div>
				</div>
			</c:forEach>
			<!--리스트 끝  -->

			<!--페이지 컨트롤러  -->
			<div class="col-sm-12 c">

				<ul class="pagination">
					<c:if test="${currentPage!=1}">
						<li><a
							onclick="load('storeList?sDev=${sDev }&order=${order}&pageNum=1');">《</a></li>
						<li><a
							onclick="load('storeList?sDev=${sDev }&order=${order}&pageNum=${currentPage-1}');">〈</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li id="${i }"><a
							onclick="load('storeList?sDev=${sDev }&order=${order}&pageNum=${i}');">${i }</a></li>
					</c:forEach>
					<c:if test="${currentPage!=pageCnt}">
						<li><a
							onclick="load('storeList?sDev=${sDev }&order=${order}&pageNum=${currentPage+1}');">〉</a></li>
						<li><a
							onclick="load('storeList?sDev=${sDev }&order=${order}&pageNum=${pageCnt}');">》</a></li>
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