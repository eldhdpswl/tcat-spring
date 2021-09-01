<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품후기 게시판</title>
<script type="text/javascript">
function commentWriteS(url){   /* AJAX submit */  
	   var result = document.getElementById("result");
	   var formData = $("#commentGWriteS").serialize();
	   $.ajax({
	               type : "POST",
	               url : url,
	               cache : false,
	               data : formData,
	               success :  function(msg) {
	               /*    $('#myPageResult').html(msg); */
	                  alert("한줄평을 써주셔셔 감사합니다");
	               }, 
	               error : onError
	   });
	   function onError(data, status){alert("로그인 후 이용하시기 바랍니다.");}
	   location.reload();
	}
$(".watchS").click(function(){
	/* alert($(this).attr("name")); */
	alert("스토어 후기가 수정되었습니다.")
	var classn = $(this).attr("name");
	var formData = new FormData();
		formData.append("notice_num",$("input[name="+classn+"notice_num]").val());
		formData.append("contents",$("input[name="+classn+"contents]").val());
		formData.append("disc_code",$("input[name="+classn+"disc_code]").val());
		formData.append("disc_title",$("input[name="+classn+"disc_title]").val());
		$.ajax({
			url : 'commentModifyS',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#commentListS').html(data);
			} 
		});
	
	
});
//화면 뿌리기
function commentDelS(notice_num ,disc_code,disc_title,url) {
	alert("후기 글이 삭제 되었습니다.")
	load('commentDelS?notice_num='+notice_num+'&disc_code='+disc_code+'&disc_title='+disc_title+'&url='+url);
}	
</script>
</head>
<body>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 후기 게시판</h3>
<hr>            
		<div class="row">
			<div class="col-md-16">
			<table border="0">
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" value="${dto.notice_num}">
			    	<input type="hidden" value="${dto.contents}"> 
					<input type="hidden" value="${dto.disc_code}">
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
						<button type="button" class="btn btn-info" onclick="commentDelS('${dto.notice_num}','${dto.disc_code}','${dto.disc_title}','contentMain_store');">
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
										<b>스토어 후기 게시판 수정</b>
									</h4>
									<hr>
									<div class="thumbnail c">
									<form action="commentModifyS" id="commentModifyS" method="POST" >
								
											<div class="disInline ">
											<input type="hidden" name="${dto.notice_num}notice_num" value="${dto.notice_num}">
											<input type="hidden" name="${dto.notice_num}disc_code" value="${dto.disc_code}">
											<input type="hidden" name="${dto.notice_num}disc_title" value="${dto.disc_title}">
											</div>
												<hr>
												<div class="caption">
													<h6 class="floatL">
														<label>내용 : </label>
													</h6>
													<input type="textarea"  name="${dto.notice_num}contents" class="w100p h250" value="${dto.contents}">
												</div>
												<hr>
												<input type="submit" class="btn btn-info watchS" name= "${dto.notice_num}"  value="수정하기"  >
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
							<a onclick="commentListS('watchLatterS?&disc_title=${disc_title}&disc_code=${disc_code}');">[◀◀]</a>
							<a onclick="commentListS('watchLatterS?&pageNum=${startPage - pageBlock}&disc_title=${disc_title}&disc_code=${disc_code}');">[◀]</a>				
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="commentListS('watchLatterS?&pageNum=${i}&disc_title=${disc_title}&disc_code=${disc_code}');">[${i}]</a>
							</c:if>
						</c:forEach>
						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="commentListS('watchLatterS?&pageNum=${startPage + pageBlock}&disc_title=${disc_title}&disc_code=${disc_code}');">[▶]</a>
							<a onclick="commentListS('watchLatterS?&pageCount=${pageCount}&disc_title=${disc_title}&disc_code=${disc_code}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		<div class="col-md-1"></div>
			<form action="" name="commentGWriteS" id="commentGWriteS">
		
			<div class="col-md-9">
				<table
					class="borderCollSe borderSpace20 w100p">
				
						<tr>
		
					<td><input type="text" class="form-control" name="contents"
						id="contents" maxlength="200" placeholder="한줄평을 작성해주세요"></td>
					<td><button type="button" class="btn btn-info"
							onclick="commentWriteS('commentWriteS?disc_code=${disc_code}');">
							작성하기<i class="fa fa-check spaceLeft"></i>
						</button>
				</tr>
				</table>
			</div>
			</form>
				<div class="col-md-1"></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>