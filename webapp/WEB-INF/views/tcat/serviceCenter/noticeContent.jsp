<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

/* function photoBoarderCommentWrite(member_id,notice_num,form){
     var contents=form.contents.value; 
     var url="photoBoarderCommentWrite?member_id="+member_id+"&notice_num="+notice_num+"&contents="+contents;
   $( "#result" ).load( "${pageContext.request.contextPath}/"+url );  
} */

/* function qnacomment(service_num,service_div,service_title,member_id,QuestionCon,form){
	var content= form.content.value;
	var url="qnaCommentWrite?service_num="+service_num+"&service_div="+service_div
					+"&service_title="+service_title+"&member_id="+member_id
					+"&QuestionCon="+QuestionCon+"&AnsersCon="+content;
	$( "#result2" ).load( "${pageContext.request.contextPath}/"+url );
} */



</script>
<%-- <link href="${css}style.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script> --%>
</head>
<body>
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<hr>
		<div><span>'${dto.notice_title}' 의 상세 정보</span></div>
		<hr><br>
		
		 <%-- <table class="table table-hover table-bordered table-condensed c fs12">
		
			<tr>
				<td class="bg-primary"><b>번호</b></td>
				<td>
					${dto.notice_num}
					<input type="hidden" value="${dto.service_num}" name="service_num">
				</td>
				<td class="bg-primary"><b>구분</b></td>
				<td>
					${dto.notice_div}
					<input type="hidden" value="${dto.service_div}" name="service_div">
					<c:if test="${dto.notice_div==1}">
					 	공지사항
					 </c:if>
					 <c:if test="${dto.notice_div==2}">
					 	영상컨텐츠 게시판
					 </c:if>
					 <c:if test="${dto.notice_div==3}">
					 	사진컨텐츠 게시판
					 </c:if>
				</td>
			</tr>
			<tr>
				<td class="bg-primary"><b>구분</b></td>
				<td>${dto.service_div}</td>
			</tr>
			<tr>
				<td class="bg-primary"><b>작성자</b></td>
				<td>
					${dto.member_id}
					<input type="hidden" value="${dto.member_id}" name="login_id">
				</td>
				<td class="bg-primary"><b>작성일</b></td>
				<td>${dto.writeDate}</td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제목</b></td>
				<td colspan=3>
					${dto.notice_title}
				<input type="hidden" value="${dto.service_title}" name="service_title">
				</td>
				
			</tr>
			<tr>
				<td class="bg-primary"><b>내용</b></td>
				<td colspan=3>
					${dto.contents}
				<input type="hidden" value="${dto.getQuestionCon()}" name="QuestionCon">	
				</td>
			</tr>
		</table> --%> 
		<div class="thumbnail c" >
			<div class="disInline ">						
				<h6 class="floatL mr20 ml15"><label>번호 : </label> ${dto.notice_num}</h6>
				<h6 class="floatL mr20"><label>제목 : </label> ${dto.notice_title}</h6>
				<h6 class="floatL mr20"><label>작성자 : </label> ${dto.member_id}</h6>
				<h6 class="floatL mr20"><label>작성일 : </label> ${dto.writeDate}</h6>
			</div>
			<hr>				
			<img src="${image}Boarder/${dto.notice_image}" class="img-responsive ">
			<div class="caption">
				<h6 class="floatL"><label>내용 : </label> ${dto.contents}</h6>
				
			</div><br>
			<hr>
	   </div>
		
		<div class="navbar-form navbar-right">
			 <input type="button" value="목록보기" class="btn btn-primary btn-sm btn btn-info" 
			        onclick="loadBoard('noticeBoard');">
		</div>
		
		<br><br><br>
		
	</div>

	<div class="col-md-1"></div>
</body>
</html>