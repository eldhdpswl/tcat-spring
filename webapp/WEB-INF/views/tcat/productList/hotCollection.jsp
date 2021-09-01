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

					<h4 class="trgothic">Hot카테고리
					</h4>
					<div>
						<hr>
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><b>공연번호</b></td>
								<td><b>공연제목</b></td>
								<td><b>대분류</b></td>
								<td><b>소분류</b></td>
								<td><b>판매량</b></td>
								<td><b>스텝</b></td>
								<td><b>삭제</b></td>
							</tr>


							<tr>
								<c:forEach var="v" items="${vo}">
									<tr>
										<td>${v.per_id}</td>
										<td>${v.perf_title}</td>
										<td>${v.mDev}</td>
										<td>${v.sDev}</td>
										<td>${v.ticet_max}</td>
										<td>${v.per_step}</td>
										<td><c:if test="${vo.size()!=null}">
												<button type="button" class="btn btn-primary"
													onclick="return hotDelete('${vo.size()}','${v.per_id}','hotCollection')">삭제</button>
											</c:if></td>

									</tr>
								</c:forEach>
						</table>
					</div>

					<br> <br> <br>
					<h4 class="trgothic">컬렉션 전체리스트</h4>
					<div>
						<hr>
						<!-- 컬렉션전체리스트 -->
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><b>공연번호</b></td>
								<td><b>공연제목</b></td>
								<td><b>대분류</b></td>
								<td><b>소분류</b></td>
								<td><b>판매량</b></td>
								<td><b>스텝</b></td>
								<td><b>추가</b></td>
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="full" items="${full}">
									<tr>
										<td>${full.per_id}</td>
										<td>${full.perf_title}</td>
										<td>${full.mDev}</td>
										<td>${full.sDev}</td>
										<td>${full.ticet_max}</td>
										<td>${full.per_step}</td>
										<td><c:if test="${vo.size()==null}">
												<button type="button" class="btn btn-primary"
													onclick="return hotUpdate(1,${full.per_id})">추가</button>
											</c:if> <c:if test="${vo.size()!=null}">
												<button type="button" class="btn btn-primary"
													onclick="return hotUpdate('${vo.size()}','${full.per_id}','hotCollection')">추가</button>
											</c:if></td>
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
													onclick="load('hotCollection?pageNum=${startPage - pageBlock}');">[◀]</a>
											</c:if>

											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${i == currentPage}">
													<span><b>[${i}]</b></span>
												</c:if>

												<c:if test="${i != currentPage}">
													<a onclick="load('hotCollection=pageNum=${i}');">[${i}]</a>
												</c:if>
											</c:forEach>

											<!-- 다음[▶] / 끝[▶▶] -->
											<c:if test="${pageCount > endPage}">
												<a
													onclick="load('hotCollection?pageNum=${startPage + pageBlock}');">[▶]</a>
												<a onclick="load('hotCollection?pageNum=${pageCount}');">[▶▶]</a>
											</c:if>
										</c:if></th>
								</tr>
							</table>
						</div>
						<form class="navbar-form navbar-right" role="search"
							id="ajaxSubmitForm" onsubmit="return false">
							카테고리 <select id="sDev" name="sDev" class="m10 p5">
								<option value="0">분류</option>
								<option value="1">공연번호</option>
								<option value="2">제목</option>
								<option value="3">소분류</option>
							</select>

							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search"
									name="keyword">
							</div>
							<button type="button" class="btn btn-default"
								onclick="ajaxSubmit('hotCollection')">검색</button>

						</form>

					</div>
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