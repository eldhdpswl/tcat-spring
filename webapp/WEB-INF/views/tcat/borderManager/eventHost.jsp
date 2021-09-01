<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$("#eventcheck").click(function() {
		var formData = new FormData();
		if(!$("input[name=notice_title]").val()){
			alert("이벤트제목을 입력해주세요!");
			$("input[name=notice_title]").focus();
		}else if(!$("input[name=notice_image]")[0].files[0]){			
			alert("이벤트이미지를 입력해주세요!");
			$("input[name=notice_image]").focus();
		}else if(!$("input[name=writeDate]").val()){			
			alert("이벤트시작일자를 선택해주세요!");
			$("input[name=writeDate]").focus();
		}else if(!$("input[name=contents]").val()){			
			alert("이벤트내용 선택해주세요!");
			$("input[name=contents]").focus();
		}else if(!$("input[name=member_id]").val()){			
			alert("작성자를 입력해주세요!");
			$("input[name=member_id]").focus();
		}else{
			formData.append("notice_title",$("input[name=notice_title]").val());
			formData.append("notice_image", $("input[name=notice_image]")[0].files[0]);
			formData.append("writeDate", $("input[name=writeDate]").val());
			formData.append("contents", $("input[name=contents]").val());
			formData.append("member_id", $("input[name=member_id]").val());
			formData.append("notice_addfile", $("select[name=notice_addfile]").val());
			$.ajax({
				url : 'eventAdd',
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
<script>
		
$(function() {
	$("#d1").datepicker();
	
});
</script>
	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

				
						<h4>
						<b>이벤트</b>
						<hr>
						<br>
						</h4>
						<div>
						<form action="eventAdd" id="eventAdd" method="POST">
							<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th colspan="2"><h4>이벤트 정보를 입력하세요.</h4></th>
							</tr>
							<tr>
								<th><h5>제목</h5></th>
								<td>
								<input type="text" name="notice_title" class="form-control"
									maxlength="200">
								</td>
							</tr>
							<tr>
								<th><h5>이미지</h5></th>
								<td>
								<input type="file" name="notice_image">
								</td>
							</tr>
							
							 <tr>
								<th><h5>작성일</h5></th>
								<td>
								<input type="text" name="writeDate" class="form-control"
								id="d1" readonly>
								</td>
							</tr>
							<tr>
								<th><h5>내용</h5></th>
								<td>
								<input type="text" name="contents" class="form-control"
									maxlength="200">
								</td>
							</tr>
							<tr>
								<th><h5>작성자</h5></th>
								<td>
								<input type="text" name="member_id" class="form-control">
								</td>
							</tr>
							<tr>
								<th><h5>분류</h5></th>
								<td><h5><select name="notice_addfile" style="width: 100%">
										<option value="0"></option>
										<option value="event1">event1</option>
								</select></h5></td>
							</tr>
							</table>
							<button type="button" class="btn btn-info" id="eventcheck">
									등록<i class="fa fa-check spaceLeft"></i>
								</button> 
							</form>
						</div>
					<div>
					<br><br>
					<h4>
						<b>이벤트리스트</b>
						<hr>
						<br>
						</h4>
					<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><h5><b>번호</b></h5></td>
								<td><h5><b>제목</b></h5></td>
								<td><h5><b>이미지</b></h5></td>
								<td><h5><b>분류</b></h5></td>
								<td><h5><b>수정</b></h5></td>
								<td><h5><b>삭제</b></h5></td>
							</tr>
							<c:if test="${cnt > 0}">
									<c:forEach var="vos" items="${dtos}" >
									<tr>
										<td><br><br>${vos.notice_num}</td>
										<td><br><br>${vos.notice_title}</td>
										<td><img src="${image}eventList/${vos.notice_image}" width="150px" height="70px"></td>
										<td><br><br>${vos.notice_addfile}</td>
										<td><br><button type="button" class="btn btn-primary"
											onclick="eventUpdate('${vos.notice_num}','eventUpdate');">수정</button></td>
										<td><br><button type="button" class="btn btn-primary"
											onclick="eventDelete('${vos.notice_num}','eventHost');">삭제</button></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="7" align="center">이벤트가 없습니다.</td>
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
												onclick="load('eventHost?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('eventHost?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('eventHost?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('eventHost?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if>
									</th>
							</tr>
						</table>
					</div>
				
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->
					</div>
					</div>
			<br> <br> <br> <br> <br>
		</div>
		<div class="col-md-1"></div>

	</div>

</body>
</html>