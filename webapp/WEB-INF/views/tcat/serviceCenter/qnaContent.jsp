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

function qnacomment(service_num,service_div,service_title,member_id,QuestionCon,form){
	   var formData = $("#commentGWrite").serialize();
	   $.ajax({
	               type : "POST",
	               url : "qnaCommentWrite",
	               cache : false,
	               data : formData,
	               success :  function(msg) {
	                  $('#result2').html(msg);
	               }, 
	               error : onError
	   });
	   function onError(data, status){alert("error");}
}

 
 //댓글 삭제
 function commentDel(service_num){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		//loadBoard("deleteComment?service_num="+service_num+"&url="+url);
	    var url="deleteComment?service_num=${dto.service_num}&delService_num="+service_num;
	    $( "#result2" ).load( "${pageContext.request.contextPath}/"+url );
	}else{   //취소
	    return;
	}		
 }
 
 //글수정
 function qnaBoardUpdate(service_num){
	 if(${sessionScope.login_id != dto.member_id}){
		 alert("본인이 쓴 글이 아닙니다. 수정할수 없습니다!");
	 }else if(${sessionScope.login_id == dto.member_id}){
		 if (confirm("수정하시겠습니까??") == true){    //확인
			loadBoard("qnaWriteUpdate?service_num="+service_num);
			 //var url="qnaCommentWrite?service_num="+service_num+"&service_div="+service_div 
			 //$( "#result2" ).load( "${pageContext.request.contextPath}/"+url );
		 }else{   //취소
		    return;
		 }	
	 }
 }
 
 //글삭제
 function qnaBoardDelete(service_num){
	 if(${sessionScope.login_id != dto.member_id}){
		 alert("본인이 쓴 글이 아닙니다. 삭제할수 없습니다!");
	 }else if(${sessionScope.login_id == dto.member_id}){
		 if (confirm("삭제하시겠습니까??") == true){    //확인
			loadBoard("qnaWriteDelete?service_num="+service_num);
			 //var url="qnaCommentWrite?service_num="+service_num+"&service_div="+service_div 
			 //$( "#result2" ).load( "${pageContext.request.contextPath}/"+url );
		 }else{   //취소
		    return;
		 }	
	 }
 }

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
		<div><span>Q&A게시판 '${dto.service_title}' 의 상세 정보</span></div>
		<hr><br>
		
		<table class="table table-hover table-bordered table-condensed c fs12">
		
			<tr>
				<td class="bg-primary"><b>번호</b></td>
				<td>
					${dto.service_num}
					<%-- <input type="hidden" value="${dto.service_num}" name="service_num"> --%>
				</td>
				<td class="bg-primary"><b>구분</b></td>
				<td>
					${dto.service_div}
					<%-- <input type="hidden" value="${dto.service_div}" name="service_div"> --%>
				</td>
			</tr>
			<%-- <tr>
				<td class="bg-primary"><b>구분</b></td>
				<td>${dto.service_div}</td>
			</tr> --%>
			<tr>
				<td class="bg-primary"><b>작성자</b></td>
				<td>
					${dto.member_id}
					<%-- <input type="hidden" value="${dto.member_id}" name="login_id"> --%>
				</td>
				<td class="bg-primary"><b>작성일</b></td>
				<td>${dto.writeDate}</td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제목</b></td>
				<td colspan=3>
					${dto.service_title}
				<%-- <input type="hidden" value="${dto.service_title}" name="service_title"> --%>
				</td>
				
			</tr>
			<tr>
				<td class="bg-primary"><b>질문내용</b></td>
				<td colspan=3>
					${dto.getQuestionCon()}
				<%-- <input type="hidden" value="${dto.getQuestionCon()}" name="QuestionCon"> --%>	
				</td>
				
			</tr>
			
			<tr>
				<td class="bg-primary"><b>답변상태</b></td>
				<td colspan=3>
					 <c:if test="${dto.getAnswersStatus()==1}">
					 	대기
					 </c:if>
					 <c:if test="${dto.getAnswersStatus()==2}">
					 	답변완료
					 </c:if>
				</td>
			</tr>
		</table>
		<div class="navbar-form navbar-right">
			 <c:if test="${dto.member_id.equals(sessionScope.login_id)}">
				<input type="button" value="글삭제" onclick="qnaBoardDelete('${dto.service_num}');"
					   class="btn btn-primary btn-sm btn btn-info">
				<input type="button" value="글수정" onclick="qnaBoardUpdate('${dto.service_num}');"
					   class="btn btn-primary btn-sm btn btn-info">
			 </c:if>		   
				<input type="button" value="목록보기" onclick="loadBoard('qnaBoardList');"
		 			   class="btn btn-primary btn-sm btn btn-info">
		</div>
		<br>
		댓글
		<hr>
		<div class="m5 bf0f0f0">
	        <c:forEach var="dto2" items="${dtos2}" >
	        	 <input type="hidden" value="${dto2.service_num}" name="service_num">
	             <h6 class="floatL"><label>${dto2.member_id} : </label>&nbsp;${dto2.getAnswersCon()}&nbsp;&nbsp;<span class="fs8">(${dto2.writeDate})</span>
	             &nbsp;&nbsp;
	             <c:if test="${dto2.member_id.equals(sessionScope.login_id)}">
	             	<a onclick="commentDel('${dto2.service_num}')">X</a>
	             </c:if>
	             </h6><br><br><!-- ,'qnaContent' -->
	        </c:forEach>
            <form action="" name="commentGWrite" id="commentGWrite">
           	<div>      
            <table class="table table-hover table-bordered table-condensed c fs12">
           	 <input type="hidden" value="${dto.service_num}" name="service_num">
           	 <input type="hidden" value="${dto.service_div}" name="service_div">
           	 <input type="hidden" value="${dto.getQuestionCon()}" name="QuestionCon">
                  <tr>
                     <td class=w600>
                     	<input type="text" class="form-control" name="AnsersCon" id="content" maxlength="200" placeholder="답글을 작성해주세요">
                     </td>
                     <td>
	                 	 <button type="reset" class="btn btn-warning">
		                     	취소하기<i class="fa fa-check spaceLeft"></i>
		                 </button>   
		                 <button type="button" class="btn btn-info" onclick="qnacomment();">
		                     	작성하기<i class="fa fa-check spaceLeft"></i>
		                 </button>
                	 </td>
                     <%-- <c:if test="${sessionScope.login_id!=null}">
	                     <td>
	                      <button type="button" class="btn btn-info" onclick="photoBoarderCommentWrite('${login_id}','${vo.notice_num}',this.form);">
	                      	작성하기<i class="fa fa-check spaceLeft"></i>
	                      </button>               
	                     </td>
                     </c:if> --%>
                     <%--  <c:if test="${sessionScope.login_id==null}">
                         <td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#login-modal" id="photoBoarderLogin" >
                        	 작성하기<i class="fa fa-check spaceLeft"></i>
                         </button>
                         </td>
                      </c:if> --%>
                  </tr>
            </table>
            <%-- <c:if test="${sessionScope.login_id==vo.member_id}">
            	<input type="button" data-toggle="modal" data-target="#modify-modal" class="btn btn-info" value="수정">
            	<input type="button" class="btn btn-danger" value="삭제" onclick="load('photoBorderDelete?notice_num=${vo.notice_num}');" >
            </c:if> --%>
         	</div>
         	</form>

        </div>
		
		<br>
		
		<!-- <table class="table table-hover table-bordered table-condensed c fs12 m5 bf5f5f5" >m5 bf0f0f0
			<div class="bf5f5f5">
			<tr>
				<td>asdasdawdwadwsawdawdawdawdaw<br>
					asdaswdwdawdawdawdawdawdawda<br>
					asdaswdwdawdawdawdawdawdawda<br>
					asdaswdwdawdawdawdawdawdawda<br>
					asdaswdwdawdawdawdawdawdawda<br>
					asdaswdwdawdawdawdawdawdawda<br>
					asdaswdwdawdawdawdawdawdawda<br>
					
				
				</td>
			</tr>
			</div>
		</table> -->
		
	</div>

	<div class="col-md-1"></div>
</body>
</html>