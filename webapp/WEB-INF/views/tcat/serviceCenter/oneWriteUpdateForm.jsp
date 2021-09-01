<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		$("#write4").click(function(){
			var formData = new FormData();
			if(!document.writeForm.title.value) {
		    	alert("제목을 작성해주세요!");
				return false;
			}else if(!document.writeForm.content.value){
		 		alert("질문내용을 작성해주세요!");
				return false;
			}
			formData.append("oneToOneBoard",$("input[name=oneToOneBoard]").val());
			formData.append("title",$("input[name=title]").val());
			formData.append("content",$("textarea[name=content]").val());
			formData.append("service_num",$("input[name=service_num]").val());
			$.ajax({
				url : 'oneWriteUpdatePro',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data){
					$('#result2').html(data);
				}
			});
		});
	});
	
</script>

</head>
<body>
	
	<form action="" role="form" method="post" id="writeForm" name="writeForm" onsubmit="return writeCheck();">
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<h1><center>1:1게시글 수정페이지 </center></h1>
		<hr><br>
		<table class="table table-hover table-bordered table-condensed c fs12">
			<tr>
				<td class="bg-primary"><b>작성자</b></td>
				<td ><!-- id="login_id" name="login_id" -->
					<%-- <%String login_id = (String)request.getSession().getAttribute("login_id");%> --%>
					${sessionScope.login_id}
					<%-- <input type="hidden" value="${sessionScope.login_id}" name="login_id"> --%>
				</td>
				<td class="bg-primary"><b>구분</b></td>
				<td>
					1:1게시판
					<input type="hidden" value="1:1게시판" name="oneToOneBoard">
					<%int service_num = Integer.parseInt(request.getParameter("service_num")); %>
					<input type="hidden" value="${service_num}" name="service_num">
				</td>
			</tr>
			
			<tr>	
				<td class="bg-primary"><b>제목</b></td>
				<td colspan=3>
					<input class="w100p" type="text" name="title"><!-- style="width:270px" -->
				</td><!-- .w50 -->
			</tr>
			
			<!-- <tr>
				<td class="bg-primary"><b>비밀번호</b></td>
				<td colspan=3>
					<input class="w100p h55" type="password" name="password">
				</td>
			</tr> -->
			
			<tr>
				<td class="bg-primary"><b>질문내용</b></td>
				<td colspan=3>
					<textarea class="w100p h300"  name="content"></textarea><!-- style="width:270px -->
				</td><!-- rows="10" cols="40" -->
			</tr>
			
			
		</table>
		<hr>
		<div>
			<center>
				<!-- <button type="button" id="write" style="border: 2px solid #cccccc;">작성</button> -->
			 	
			 	<!-- <input type="reset" value="작성" class="btn btn-primary btn-sm btn btn-info"> -->
			 	<button type="button" id="write4" class="btn btn-primary btn-sm btn btn-info">작성</button>
			 	<input type="reset" value="취소" 
			 	    class="btn btn-primary btn-sm btn btn-info">
			 	<input type="button" value="목록보기" onclick="loadBoard('qnaOneToOneboard');"
			 		class="btn btn-primary btn-sm btn btn-info">
			</center>
		</div>
		<br><br>
	</div>

	<div class="col-md-1"></div>
	</form>
</body>
</html>