<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$("input[name='member_id']").keydown(function(e) {
		if (e.keyCode == 121) {
			$("#modal_result").load("${pageContext.request.contextPath}/host_login");
		}
	});

</script>
</head>


<div class="loginmodal-container">
	<a data-dismiss="modal" class="00ffff fs20 floatR">X</a>
	<h1>로그인하세요</h1>
	<br>
	<form action="loginPro" method="Post">
		<input type="text" name="member_id" placeholder="아이디" id="member_id"> <input
			type="password" name="member_pwd" placeholder="비밀번호"> <input
			type="submit" name="login" class="login loginmodal-submit"
			value="로그인">
	</form>
	<div class="login-help">
		<a href="#">회원가입</a> - <a onclick="findId()">아이디/비밀번호 찾기</a>
	</div>
</div>


</html>