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
					</div>

					
					<h4><b>구매요청</b></h4>
					
					<hr>
					<div>
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><h5><b>예매번호</b></h5></td>
								<td><h5><b>구매자id</b></h5></td>
								<td><h5><b>공연번호</b></h5></td>
								<td><h5><b>공연날짜</b></h5></td>
								<td><h5><b>좌석</b></h5></td>
								<td><h5><b>좌석번호</b></h5></td>
								<td><h5><b>구매상태</b></h5></td>
								<td><h5><b>구매요청</b></h5></td>
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td><h5>${dto.ticket_num}</h5></td>
										<td><h5>${dto.member_id}</h5></td>
										<td><h5>${dto.per_id}</h5></td>
										<td><h5>${dto.ticet_date}</h5></td>
										<td><h5>${dto.seat_type}</h5></td>
										<td><h5>${dto.seat_num}</h5></td>
										<td><h5>${dto.ticket_step}</h5></td>
										<td>
											<button type="button" class="btn btn-primary"
											onclick="return provalUpdate('${dto.ticket_num}','provalUpdate')">승인</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="7" align="center">구매완료 상품이 없습니다.</td>
								</tr>
							</c:if>
						</table>
						<div class="col-md-5"></div>
						<div class="col-md-6">
						<table style="width: 1000px" align="center">
							<tr>
								<th align="center"><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전 블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a
												onclick="load('provalMain?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('provalMain?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('provalMain?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('provalMain?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>

						

					</div>
				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
		<div class="col-md-1"></div>



</body>
</html>