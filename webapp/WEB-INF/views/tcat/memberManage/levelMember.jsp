<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$("#levelcheck").click(function() {
		var formData = new FormData();
		//notice_num =nextval ,writeDate=sysdate
			formData.append("sale_div",$("input[name=sale_div]").val());
			formData.append("sale_rate", $("input[name=sale_rate]").val());
			$.ajax({
				url : 'levelAdd',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					$('#result').html(data);
				}
			});	
	});
});
</script>

</head>
<body class="b400040">

	<div class="row">
				<div class="col-md-12 h25"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					</div>

					
					<h4><b>회원혜택관리</b></h4>
					
					<hr>
					<br><br>
					<div>
						<form action="levelAdd" id="levelAdd" method="POST">
							<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th colspan="2"><h5><center>할인등록</center></h5></th>
							</tr>
							<tr>
								<th><h5><center>혜택정보</center></h5></th>
								<td>
								<input type="text" name="sale_div" class="form-control"
									maxlength="50">
								</td>
							</tr>
							<tr>
								<th><h5><center>혜택률</center></h5></th>
								<td>
								<input type="number" name="sale_rate" class="form-control"
									maxlength="50">
								</td>
							</tr>
							</table>
							<button type="button" class="btn btn-info" id="levelcheck">
									등록<i class="fa fa-check spaceLeft"></i>
								</button> 
							</form>
					</div>
					<br><br>
					<div>
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><h6><b>혜택정보</b></h6></td>
								<td><h6><b>혜택률(%)</b></h6></td>
								<td><h6><b>혜택수정</b></h6></td>
								<td><h6><b>혜택삭제</b></h6></td>
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td><h5>${dto.sale_div}</h5></td>
										<td><h5>${dto.sale_rate}%</h5></td>
										<td>
											<button type="button" class="btn btn-primary"
											onclick="return levelMemberForm('${dto.sale_div}','levelMemberForm')">수정</button>
										</td>
										<td>
											<button type="button" class="btn btn-primary"
											onclick="return levelDelete('${dto.sale_div}','levelDelete')">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="7" align="center">혜택이 없습니다.</td>
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
												onclick="load('levelMember?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('levelMember?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('levelMember?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('levelMember?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>
						</div>
						<br><br>

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