<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function qnaManagercomment(){
	   var formData = $("#commentGWrite2").serialize();
	   $.ajax({
	               type : "POST",
	               url : "qnaManagerCommentWrite",
	               cache : false,
	               data : formData,
	               success :  function(msg) {
	                  $('#result').html(msg);
	               }, 
	               error : onError
	   });
	   function onError(data, status){alert("error");}
}

//댓글 삭제
function commentManagerDel(service_num){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		//loadBoard("deleteComment?service_num="+service_num+"&url="+url);
	    var url="deleteManagerComment?service_num=${dto.service_num}&delService_num="+service_num;
	    $( "#result" ).load( "${pageContext.request.contextPath}/"+url );
	}else{   //취소
	    return;
	}		
}


</script>
</head>
<body>
	<div class="col-md-1"></div>
	
	<div class="col-sm-10 col-md-10">
		<hr>
		<div><span>Q&A 게시판 상세정보</span></div>
		<div><span>'${dto.service_title}'의 상세정보</span></div>
		<hr><br>
		<div class="thumbnail c" >
			<div class="disInline ">						
				<h6 class="floatL mr20 ml15"><label>번호 : </label> ${dto.service_num}</h6>
				<h6 class="floatL mr20"><label>구분 : </label> ${dto.service_div}</h6>
				<h6 class="floatL mr20"><label>제목 : </label> ${dto.service_title}</h6>
				<h6 class="floatL mr20"><label>작성자 : </label> ${dto.member_id}</h6>
				<h6 class="floatL mr20"><label>답변상태 : </label>
				     <c:if test="${dto.getAnswersStatus()==1}">
					 	대기
					 </c:if>
					 <c:if test="${dto.getAnswersStatus()==2}">
					 	답변완료
					 </c:if>
			    </h6>
				<h6 class="floatL mr20"><label>작성일 : </label> ${dto.writeDate}</h6>
			</div>
			<hr>				
			<div class="caption">
				<h6 class="floatL"><label>질문내용 : </label>${dto.getQuestionCon()}</h6>
				
			</div><br>
			<hr><br>
	   </div>
	   	댓글
		<hr>
		<div class="m5 bf0f0f0">
	        <c:forEach var="dto2" items="${dtos2}" >
	        	 <input type="hidden" value="${dto2.service_num}" name="service_num">
	             <h6 class="floatL"><label>${dto2.member_id} : </label>&nbsp;${dto2.getAnswersCon()}&nbsp;&nbsp;<span class="fs8">(${dto2.writeDate})</span>
	             &nbsp;&nbsp;
	             
	             <a onclick="commentManagerDel('${dto2.service_num}')">X</a>
	            
	             </h6><br><br><!-- ,'qnaContent' -->
	        </c:forEach>
            <form action="" name="commentGWrite2" id="commentGWrite2">
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
		                 <button type="button" class="btn btn-info" onclick="qnaManagercomment();">
		                     	작성하기<i class="fa fa-check spaceLeft"></i>
		                 </button>
                	 </td>
                    
                  </tr>
            </table>
           
         	</div>
         	</form>

        </div>
		
		<br>
	   <div class="navbar-form navbar-right">
	   		 <input type="button" onclick="qnaManagerDel(${dto.service_num});"
					value="삭제" class="btn btn-primary btn-sm btn btn-info"><!-- ,'noticeManager' -->
	   		 <input type="button" value="목록보기" onclick="load('qnaManager');"
			 		class="btn btn-primary btn-sm btn btn-info">
	   
			
	   </div>
	   <br><br><br>
	</div>
	
	<div class="col-md-1"></div>
  	
</body>
</html>