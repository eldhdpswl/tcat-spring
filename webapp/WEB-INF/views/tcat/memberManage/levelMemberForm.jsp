<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$("#levelUp").click(function() {
		var formData = new FormData();
			formData.append("sale_div", $("input[name=sale_div]").val());
			formData.append("sale_rate",$("input[name=sale_rate]").val());
			$.ajax({
				url : 'levelMemberUpdate',
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
	
	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div>
						<h2>혜택수정</h2>
						<hr>
						<br>
						<form action="levelMemberUpdate" id="levelMemberUpdate" method="POST">
							<c:forEach var="dto" items="${dtos}">
								<h4><strong>${dto.sale_div}</strong></h4>
								<input type="hidden" name="sale_div" class="form-control"
									value="${dto.sale_div}">
								<br>
								<h4>할인률(%)</h4>
								<input type="number" name="sale_rate" class="form-control"
									maxlength="50" value="${dto.sale_rate}">
							
								<br>
								<br>
								<br>
							</c:forEach>
							<button type="button" class="btn btn-info" id="levelUp">
									수정완료<i class="fa fa-check spaceLeft"></i>
							</button>  
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