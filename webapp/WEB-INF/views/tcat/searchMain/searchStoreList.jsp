<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<c:forEach var="dto" items="${dtos}">
				<div class="col-sm-12 c" style="border-bottom: 1px solid #d0d0d0">
					<div class="col-sm-8 tm">
						<div class="col-sm-3 p5">
							<a onclick="contentMain_store(${dto.disc_code})"> <img src="${image}store/${dto.disc_image}"
								width="100px">
							</a>
						</div>
						<div class="col-sm-9 pt18">
							<b class="floatL"> <a onclick="contentMain_store(${dto.disc_code})" style="color: black">
									${dto.disc_title } </a>
							</b>
						</div>
					</div>
					<div class="col-sm-2 pt5">
						${dto.disc_count} 개
					</div>
					<div class="col-sm-2 pt5">
						${dto.disc_price} 원
					</div>
				</div>
			</c:forEach>
			<!--리스트 끝  -->

			<!--페이지 컨트롤러  -->
			<div class="col-sm-12 c">

				<ul class="pagination">
					<c:if test="${currentPage!=1}">
						<li><a onclick="searchStoreList('searchStoreList?search=${search}&pageNum=1');">《</a></li>
						<li><a onclick="searchStoreList('searchStoreList?search=${search}&pageNum=${currentPage-1}');">〈</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li id="${i }"><a onclick="searchStoreList('searchStoreList?search=${search}&pageNum=${i}');">${i}</a></li>
					</c:forEach>
					<c:if test="${currentPage!=pageCnt}">
						<li><a onclick="searchStoreList('searchStoreList?search=${search}&pageNum=${currentPage+1}');">〉</a></li>
						<li><a onclick="searchStoreList('searchStoreList?search=${search}&pageNum=${pageCnt}');">》</a></li>
					</c:if>
				</ul>

			</div>
</body>
</html>