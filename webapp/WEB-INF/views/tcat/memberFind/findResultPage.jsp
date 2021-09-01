<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	//로그인 모달
	$("#login2").click(function(){
		$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
	});
});
</script>
</head>

<div class="loginmodal-container">
	<a data-dismiss="modal" class="00ffff fs20 floatR">X</a>
	<c:choose>
		<c:when test="${member_id!=null}">
			<h1>회원님의 아이디는 <span class="00ffff">${member_id} 입니다.</span></h1>
		</c:when>
		<c:when test="${member_pwd!=null}">
			<h1>회원님의 비밀번호는 <span class="00ffff">${member_pwd}</span> 입니다.</h1>
		</c:when>
	</c:choose>
	<form>
	<input type="button" class="login loginmodal-submit w100p" value="로그인하기" id="login2">
	</form>
</div>



</html>