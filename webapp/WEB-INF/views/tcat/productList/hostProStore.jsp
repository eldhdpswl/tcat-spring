<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

</script>

</head>
<body class="b400040">

	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<h4>
						<b>스토어 재고 수정</b>
					</h4>
					<hr>
					<div>
					
					<div>
					
						<!-- 스토어 전체리스트 -->
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
							<th>상품코드</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>이미지</th>
							<th>상품설명</th>
							<th>카테고리</th>
							<th>상품우선순위</th>
							<th>상품수량</th>
							<th>정보수정</th>
							<!-- <th>상세페이지 수정</th> -->
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									
									<td>${dto.disc_code}</td>
									<td>${dto.disc_title}</td>
									<td>${dto.disc_price}</td>
									<td><img
										src="/tcat/resources/image/store/${dto.disc_image}"
										style="width: 50px; height: 50px;"></td>
									<td>${dto.disc_con}</td>
									<td>${dto.mDev}&nbsp${dto.sDev}</td>
									<td>${dto.first_grade}</td>
									<td>${dto.disc_count}</td>
										<td>
												<button type="button" class="btn btn-primary"
													onclick="return hostProStoreForm('${dto.disc_code}','hostProModify')">수정</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="7" align="center">상품리스트가 없습니다.</td>
								</tr>
							</c:if>
						</table>
						<!-- 페이지 컨트롤 -->
						<div class="col-md-5"></div>
						<div class="col-md-6">
						<table style="width: 1000px" align="center">
							<tr>
								<th align="center"><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전 블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a
												onclick="load('hostProStore?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('hostProStore?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('hostProStore?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('hostProStore?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if>
									</th>
							</tr>
						</table>
					</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->
				</div>
				<div class="col-md-1"></div>
				</div>
				</div>
			</div>
			</div>
	</div>
</body>
</html>