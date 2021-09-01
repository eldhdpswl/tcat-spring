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
	$("#hostProUp").click(function() {
		var formData = new FormData();
		if(!$("input[name=perf_title]").val()){
			alert("공연제목을 입력해주세요!");
			$("input[name=perf_title]").focus();
		}else if($("select[name=cateNum]").val()==0){
			alert("카테고리를 선택해주세요!");
			$("select[name=cateNum]").focus();
		}else if(!$("input[name=perf_Image]")[0].files[0]){			
			alert("공연이미지를 입력해주세요!");
			$("input[name=perf_Image]").focus();
		}else if(!$("input[name=startDate]").val()){			
			alert("공연시작일자를 선택해주세요!");
			$("input[name=startDate]").focus();
		}else if(!$("input[name=endDate]").val()){			
			alert("공연종료일자를 선택해주세요!");
			$("input[name=endDate]").focus();
		}else if($("select[name=hall_id]").val()==0){			
			alert("공연장을 선택해주세요!");
			$("select[name=hall_id]").focus();
		}else if($("select[name=first_grade]").val()==0){			
			alert("우선순위를 선택해주세요!");
			$("select[name=first_grade]").focus();
		}else if(!$("input[name=remain_round]").val()){			
			alert("회차를 선택해주세요!");
			$("input[name=remain_round]").focus();
		}else if(!$("input[name=possible_age]").val()){			
			alert("관람가능 연령을 선택해주세요!");
			$("input[name=possible_age]").focus();
		}else if(!$("input[name=seatPrice]").val()){			
			alert("좌석정보를 선택해주세요!");
			$("input[name=seatPrice]").focus();
		}else{
			formData.append("per_id", $("input[name=per_id]").val());
			formData.append("perf_title", $("input[name=perf_title]").val());
			formData.append("cateNum",$("select[name=cateNum]").val());
			formData.append("perf_Image",$("input[name=perf_Image]")[0].files[0]);
			formData.append("startDate", $("input[name=startDate]").val());
			formData.append("endDate", $("input[name=endDate]").val());
			formData.append("hall_id",$("select[name=hall_id]").val());
			formData.append("first_grade", $("select[name=first_grade]").val());
			formData.append("remain_round", $("input[name=remain_round]").val());
			formData.append("possible_age", $("input[name=possible_age]").val());
			formData.append("VIP_seatPrice", $("input[name=VIP_seatPrice]").val());
			formData.append("R_seatPrice", $("input[name=R_seatPrice]").val());
			formData.append("S_seatPrice", $("input[name=S_seatPrice]").val());
			formData.append("A_seatPrice", $("input[name=A_seatPrice]").val());
			formData.append("B_seatPrice", $("input[name=B_seatPrice]").val());
			$.ajax({
				url : 'hostProUpdate',
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



//좌석
function seatPrice(title,hall_name,vip,r,s,a,b){
	var url="seatPrice?title="+title+"&hall_name="+hall_name+"&vip="+vip+"&r="+r+"&s="+s+"&a="+a+"&b="+b;
	window.open(url, "confirm", "menubar=no, width=500, height=330");
}
//가격펑션
function cheackSeatPrice(){
	window.open("cheackSeatPrice", "confirm", "menubar=no, width=500, height=330");
}
</script>

</head>
<body class="b400040">
<script>
		/* 0111 현석 */
		$(function() {
			$("#d1").datepicker();
			$("#d2").datepicker();
		});
		/* 0111 현석끝 */
	</script>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<h4>
						<b>상품정보 수정</b>
					</h4>
					<div>
					
					<br> <br>
					<div>
					
						<!-- 상세페이지 -->
						<form action="hostProUpdate" id="hostProUpdate" method="post"
						enctype="multipart/form-data">
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th>공연번호</th>
								<th>공연제목</th>
								<th>카테고리</th>
								<th style="width: 15%">공연이미지</th>
								<th style="width: 10%">시작날짜</th>
								<th style="width: 10%">종료날짜</th>
								<th>공연장</th>
								<th>좌석별 가격 설정</th>
								<th style="width: 10%">우선순위</th>
								<th style="width: 4%">회차</th>
								<th style="width: 8%">관람가능연령</th>
								<th style="width: 7%">수정</th>
							</tr>
						
								<c:forEach var="dto" items="${dtos}">
								<tr>
									<td>${dto.per_id}</td>
									<input type="hidden" name="per_id" value="${dto.per_id}">
									<td><input type="text" name="perf_title"
									style="width: 100%" value="${dto.perf_title}"></td>
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
								<td><input type="file" name="perf_Image"
									style="width: 100%"></td>
									<td><input type="text" name="startDate" value="${dto.startDate}" style="width: 100%"
									id="d1" readonly></td>
								<td><input type="text" name="endDate" value="${dto.endDate}" style="width: 100%"
									id="d2" readonly></td>
									
									<td><select name="hall_id" style="width: 100%">
										<option value="0"></option>
										<%
											ArrayList<SelectHellInfoVO> HDtos = (ArrayList<SelectHellInfoVO>) request.getAttribute("HDtos");
												for (int j = 0; j < HDtos.size(); j++) {
													int hall_id = HDtos.get(j).getHall_id();
													String hall_name = HDtos.get(j).getHall_name();
										%>
										<option value="<%=hall_id%>"><%=hall_name%></option>
										<%
											}
										%>
								</select></td>
								
									<td><input type="text" name="seatPrice" onclick="cheackSeatPrice();">
									<input type="hidden" name="VIP_seatPrice" value="0">
									<input type="hidden" name="R_seatPrice" value="0">
									<input type="hidden" name="S_seatPrice" value="0">
									<input type="hidden" name="A_seatPrice" value="0">
									<input type="hidden" name="B_seatPrice" value="0">
								</td>
								<td><select name="first_grade" style="width: 100%">
										<option value="0"></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
								</select></td>
								<td><input type="text" name="remain_round"
									onclick="round();" style="width: 100%" readonly></td>
								<td><input type="text" name="possible_age"
									style="width: 100%"></td>
										<td>
												<button type="button" class="btn btn-info" id="hostProUp">
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