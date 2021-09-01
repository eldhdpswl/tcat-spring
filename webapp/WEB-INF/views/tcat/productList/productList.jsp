<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(function(){
		//검색후돌아왔을떄
		if("${mDev}"!=null){												//중분류가 넘어오면
			$("option[value='${mDev}']").attr("selected","selected");		//해당되는 중분류를 셀렉트
			select_sDev();													//해당되는 중분류의 소분류를 뿌린다.
			if("${sDev}"!=null){											//소분류도 넘어왔으면	
				$("option[value='${sDev}']").attr("selected","selected");	//해당되는 소분류를 셀렉트
			}
		}
		
		//ajax submit enter
		$('#ajaxSubmitForm').keydown(function(e) {
	        if (e.keyCode == 13) {
	          ajaxSubmit('productList');
	        }
   		 });
	});
	

	
</script>

</head>
<body>
	<br>
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<br>
		<div><h4 class="trgothic">공연 상품 리스트</h4></div>
		<br>
		<div>
			<!--검색  -->
			<form class="navbar-form navbar-left " role="search"
				id="ajaxSubmitForm" onsubmit="return false" >
				<!--카테고리  -->
				<select id="mDev" name="mDev" class="btn btn-default"
					onchange="select_sDev()"  >
					<option value="">중분류</option>
					<option value="뮤지컬">뮤지컬</option>
					<option value="콘서트">콘서트</option>
					<option value="연극">연극</option>
					<option value="클래식">클래식</option>
					
				</select> <select id="sDev" name="sDev" class="btn btn-default">
					<option value="">소분류</option>
				</select>
				
				<!--검색창  -->
				<input type="hidden" name="category" value="공연">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="keyword" value="${keyword }">
				</div>
				<button type="button" class="btn btn-default" onclick="ajaxSubmit('productList')">검색</button>
			</form>
		</div>
		<table class="table table-hover table-bordered table-condensed c fs10">
			<tr class="bg-primary">
				<td><b>공연코드</b></td>
				<td><b>공연명</b></td>
				<td><b>공연기간</b></td>
				<td><b>지역</b></td>
				<td><b>카테고리</b></td>
				<td><b>이미지파일명</b></td>
			</tr>
			<c:if test="${performances!=null }">
				<c:forEach var="performance" items="${performances}">
					<tr>
						<td>${performance.per_id }</td>
						<td>
							<a onclick="detailOpen('performance','${performance.per_id}')">
							${performance.perf_title}
							</a>
						</td>
						<td>${performance.startDate}  ~  ${performance.endDate}</td>
						<td>${performance.province} ${performance.city} ${performance.address} ${performance.hall_name}</td>
						<td>${performance.category} > ${performance.mDev} > ${performance.sDev}</td>
						<td>${performance.perf_Image}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${performances==null }">
				<tr><td colspan="6" class="h550 ">
				<span class="tm fs15">검색결과가 없습니다.</span>
				</td></tr>
			</c:if>
		</table>
		<c:if test="${performances!=null }">
		<div class="row c">
			<div class="disInline">
				<!--1번페이지, 앞으로 하나  -->
				<c:if test="${currentPage!=1}">
					<a	onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=1')">
						◀◀ </a>
					<a	onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${currentPage-1}')">
						◀ </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage }">
						<a class="red" onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${i}')">
							${i} </a>
					</c:if>
					<c:if test="${i != currentPage }">
						<a onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${i}')">
							${i} </a>
					</c:if>
				</c:forEach>
				<!--마지막 페이지, 뒤로 하나  -->
				<c:if test="${currentPage!=pageCnt}">
					<a	onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${currentPage+1}')">
						▶ </a>
					<a	onclick="load('productList?category=공연&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${pageCnt}')">
						▶▶ </a>
						
				</c:if>
			</div>
		</div>
		</c:if>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="col-md-1"></div>
	<!--리스트목록 끝  -->
</body>
</html>