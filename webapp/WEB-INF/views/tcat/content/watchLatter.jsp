<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관람후기 게시판</title>
<script type="text/javascript">
	function commentWrite(url) { /* AJAX submit */
		var result = document.getElementById("result");
		var formData = $("#commentGWrite").serialize();
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				/*    $('#myPageResult').html(msg); */
				alert("한줄평을 써주셔셔 감사합니다");
			},
			error : onError
		});
		function onError(data, status) {
			alert("로그인 후 이용하시기 바랍니다.");
		}
		location.reload();
	}	
	
	
	$(".watch").click(function(){
		/* alert($(this).attr("name")); */
		alert("수정되었습니다.")
		var classn = $(this).attr("name");
		var formData = new FormData();
			formData.append("notice_num",$("input[name="+classn+"notice_num]").val());
			formData.append("contents",$("input[name="+classn+"contents]").val());
			formData.append("per_id",$("input[name="+classn+"per_id]").val());
			formData.append("perf_title",$("input[name="+classn+"perf_title]").val());
			$.ajax({
				url : 'commentModify',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					$('#commentList').html(data);
				} 
			});
		
		
	});
	//화면 뿌리기
function commentDel(notice_num ,per_id,perf_title,url) {
		alert("후기 글이 삭제 되었습니다.")
		load('commentDel?notice_num='+notice_num+'&per_id='+per_id+'&perf_title='+perf_title+'&url='+url);
	}	
</script>
</head>
<body>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공연 후기 게시판</h3>
	<hr>
	<div class="row">
		<div class="col-md-16">
			<table border="0">
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" value="${dto.notice_num}">
			    	<input type="hidden" value="${dto.contents}"> 
					<input type="hidden" value="${dto.per_id}">
					<tr>	
						<td width="150px" height="100px"><h6 class="floatL mr20">
							<label>번호 : </label> ${dto.notice_num}
						</h6></td>
						
						<td width="500px" height="100px"><h6 class="floatL mr20">
							<label>후기(한줄평) : </label> ${dto.contents}
						</h6></td>
						
						<td width="250px" height="100px"><h6 class="floatL mr20">
							<label>작성자 : </label> ${dto.member_id}
						</h6></td>
						
						<td width="250px" height="100px"><h6 class="floatL mr20">
							<label>작성일 : </label>
							<fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd" />
						</h6></td>
						
						
						<c:if test="${sessionScope.login_id==dto.member_id}">
						<td>
							<button type="button" data-toggle="modal" data-target="#${dto.notice_num}" class="btn btn-info">						    	  
	  							<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
							</button>
							
						</td>	
						
							<td>
							<button type="button" class="btn btn-info" onclick="commentDel('${dto.notice_num}','${dto.per_id}','${dto.perf_title}','contentMain');">
	  						<span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>
								</button>
							</td> 
							
						</c:if>				
					</tr>			
					<div id="${dto.notice_num}" class="modal fade" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="row bf0f0f0">
								<div class="col-md-12 h25"></div>
								<div class="col-md-1"></div>

								<div class="col-sm-10 col-md-10">
									<h4>
										<b>공연 후기 게시판 수정</b>
									</h4>
									<hr>
									<div class="thumbnail c">
									<form action="commentModify" id="commentModify" method="POST" >
								
											<div class="disInline ">
											<input type="hidden" name="${dto.notice_num}notice_num" value="${dto.notice_num}">
											<input type="hidden" name="${dto.notice_num}per_id" value="${dto.per_id}">
											<input type="hidden" name="${dto.notice_num}perf_title" value="${dto.perf_title}">
											</div>
												<hr>
												<div class="caption">
													<h6 class="floatL">
														<label>내용 : </label>
													</h6>
													<input type="textarea"  name="${dto.notice_num}contents" class="w100p h250" value="${dto.contents}">
												</div>
												<hr>
												<input type="submit" class="btn btn-info watch" name= "${dto.notice_num}"  value="수정하기"  >
										</form>
									</div>
									
									<!-- outline -->
								</div>
								
								<!-- md10 -->
								<div class="col-md-1"></div>
								
							</div>
							<!--row 끝  -->
							
						</div>
				</c:forEach>
				
			</table>
		</div>
		
	</div>
			
	<!-- 페이지 컨트롤 -->
	<table style="width: 1000px" align="center">
		<tr>
			<th align="center"><c:if test="${cnt > 0}">
					<c:if test="${startPage > pageBlock}">
						<a onclick="commentList('watchLatter?&perf_title=${perf_title}&per_id=${per_id}');">[◀◀]</a>
						<a onclick="commentList('watchLatter?&pageNum=${startPage - pageBlock}&perf_title=${perf_title}&per_id=${per_id}');">[◀]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a
								onclick="commentList('watchLatter?&pageNum=${i}&perf_title=${perf_title}&per_id=${per_id}');">[${i}]</a>
						</c:if>
					</c:forEach>
					<!-- 다음[▶] / 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a
							onclick="commentList('watchLatter?&pageNum=${startPage + pageBlock}&perf_title=${perf_title}&per_id=${per_id}');">[▶]</a>
						<a
							onclick="commentList('watchLatter?&pageCount=${pageCount}&perf_title=${perf_title}&per_id=${per_id}');">[▶▶]</a>
					</c:if>
				</c:if></th>
		</tr>
	</table>
	<div class="col-md-1"></div>
	<form action="" name="commentGWrite" id="commentGWrite">

		<div class="col-md-9">
			<table
				class="borderCollSe borderSpace20 w100p">
			
				<tr>
					<td><input type="text" class="form-control" name="contents"
						id="contents" maxlength="200" placeholder="한줄평을 작성해주세요"></td>
					<td><button type="button" class="btn btn-info"
							onclick="commentWrite('commentWrite?per_id=${per_id}');">
							작성하기<i class="fa fa-check spaceLeft"></i>
						</button>
				</tr>

			</table>
		</div>
		<hr>
	</form>
	<div class="col-md-1"></div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>