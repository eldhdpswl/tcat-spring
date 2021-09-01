<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function seatPrice(title,hall_name,vip,r,s,a,b){
	var url="seatPrice?title="+title+"&hall_name="+hall_name+"&vip="+vip+"&r="+r+"&s="+s+"&a="+a+"&b="+b;
	window.open(url, "confirm", "menubar=no, width=500, height=330");
}
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
						<b>상품정보 수정</b>
					</h4>
					<hr>
					<div>
					
					<div>
					
						<!-- 상품 전체리스트 -->
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><b>번호</b></td>
								<td><b>공연제목</b></td>
								<td><b>카테고리</b></td>
								<td><b>공연이미지</b></td>
								<td><b>공연날짜</b></td>
								<td><b>공연장</b></td>
								<td><b>좌석별 가격확인</b></td>
								<td><b>우선순위</b></td>
								<td><b>공연스텝</b></td>
								<td><b>회차(하루간 공연회차)</b></td>
								<td><b>관람가능연령</b></td>
								<td><b>정보수정</b></td>
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									<td>${dto.per_id}</td>
									<td>${dto.perf_title}</td>
									<td>${dto.category}&nbsp${dto.mDev}&nbsp${sDev}</td>
								<td><img
										src="/tcat/resources/image/performance/${dto.perf_Image}"
										style="width: 50px; height: 50px;"></td>
									<td>${dto.startDate}~${dto.endDate}</td>
									<td>${dto.hall_name}</td>
									<td><input type="button" class="btn" value="가격" onclick="seatPrice('${dto.perf_title}','${dto.hall_name}','${dto.getVIP_seatPrice()}','${dto.getR_seatPrice()}','${dto.getS_seatPrice()}','${dto.getA_seatPrice()}','${dto.getB_seatPrice()}');"></td>
									<td>${dto.first_grade}</td>
									<td>${dto.per_step}</td>
									<td>${dto.remain_round}</td>
									<td>${dto.possible_age}</td> 
										<td>
												<button type="button" class="btn btn-primary"
													onclick="return hostProForm('${dto.per_id}','hostProModify')">수정</button>
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
												onclick="load('hostProModify?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('hostProModify?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('hostProModify?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('hostProModify?pageNum=${pageCount}');">[▶▶]</a>
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