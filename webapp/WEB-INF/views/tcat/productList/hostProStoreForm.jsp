<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="spring.project.tcat.VO.SelectHellInfoVO"%>
<%@page import="spring.project.tcat.VO.CategoryVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$("#hostProStoreUp").click(function() {
		var formData = new FormData();
		if(!$("input[name=disc_title]").val()){
			alert("상품이름을 입력해주세요!");		
			$("input[name=disc_title]").focus();
		}else if(!$("input[name=disc_price]").val()){
			alert("상품가격을 입력해주세요!");
			$("input[name=disc_price]").focus();
		}else if(!$("input[name=disc_image]")[0].files[0]){
			alert("상품이미지를 넣어주세요!");				
			$("input[name=disc_image]").focus();
		}else if(!$("input[name=disc_con]").val()){
			alert("상품설명을 입력해주세요!");			
			$("input[name=disc_con]").focus();
		}else if($("select[name=cateNum]").val()==0){
			alert("카테고리를 선택해주세요!");	
			$("select[name=cateNum]").focus();
		}else if($("select[name=first_grade]").val()==0){
			alert("상품 우선순위를 선택해주세요!");	
			$("select[name=first_grade]").focus();
		}else if(!$("input[name=disc_count]").val()){
			alert("상품수량을 입력해주세요!");				
			$("input[name=disc_count]").focus();
		}else{
		formData.append("disc_code", $("input[name=disc_code]").val());
		formData.append("disc_title", $("input[name=disc_title]").val());
		formData.append("disc_price", $("input[name=disc_price]").val());
		formData.append("disc_image", $("input[name=disc_image]")[0].files[0]);
		formData.append("disc_con", $("input[name=disc_con]").val());
		formData.append("cateNum",$("select[name=cateNum]").val());
		formData.append("first_grade", $("select[name=first_grade]").val());
		formData.append("disc_count", $("input[name=disc_count]").val());
		$.ajax({
			url : 'hostProStoreUpdate',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
			}
			});
		}
	});
});

</script>

</head>
<body class="b400040">

		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<h4>
						<b>스토어정보 수정</b>
					</h4>
					<div>
					
					<br> <br>
					<div>
					
						<!-- 상세페이지 -->
						<form action="hostProStoreUpdate" id="hostProStoreUpdate" method="post"
						enctype="multipart/form-data">
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
							<th>수정</th>
							</tr>
						
								<c:forEach var="dto" items="${dtos}">
								<tr>
									<td>${dto.disc_code}</td>
									<input type="hidden" name="disc_code" value="${dto.disc_code}">
									<td><input type="text" name="disc_title" value="${dto.disc_title}"
									style="width: 100%"></td>
									<td><input type="text" name="disc_price" value="${dto.disc_price}"
									style="width: 100%"></td>
									<td><input type="file" name="disc_image" value="${dto.disc_image}"
									style="width: 100%"></td>
									<td><input type="text" name="disc_con" value="${dto.disc_con}" style="width: 100%" ></td>
									<td><select name="cateNum" style="width: 100%">
										<option value="0"></option>
										<%
											ArrayList<CategoryVO> SDtos = (ArrayList<CategoryVO>) request.getAttribute("SDtos");
												for (int i = 0; i < SDtos.size(); i++) {
													int cateNum = SDtos.get(i).getCateNum();
													String category = SDtos.get(i).getCategory();
													String mDev = SDtos.get(i).getmDev();
													String sDev = SDtos.get(i).getsDev();
										%>
										<option value="<%=cateNum%>"><%=cateNum%>[
											<%=mDev%>-
											<%=sDev%>]
										</option>
										<%
											}
										%>

								</select></td>
								<td><select name="first_grade" style="width: 100%">
										<option value="0"></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
								</select></td>
								<td><input type="text" name="disc_count" value="${dto.disc_count}"></td>
										<td>
												<button type="button" class="btn btn-info" id="hostProStoreUp">
													완료<i class="fa fa-check spaceLeft"></i>
												</button>
										</td>
									</tr>
								</c:forEach>
							
						</table>
					</form>
				
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->
				</div>
				<div class="col-md-1"></div>
			</div>
			</div>
			</div>
	</div>
</body>
</html>