<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pwdCheck(pwd){
	var url= "pwdCheck?member_pwd="+pwd;
	 $( "#myPageResult" ).load( "${pageContext.request.contextPath}/"+url );
}
</script>
</head>
<body>
	<c:if test="${pwdCheck==1}">
		<script type="text/javascript">
			$( "#myPageResult" ).load( "${pageContext.request.contextPath}/myModifyPro");
		</script>
	</c:if>
	<c:if test="${pwdCheck==0}">
		<script type="text/javascript">
			alert("비밀번호가 다릅니다!");
		</script>
	</c:if>
	<h2>회원정보 수정 페이지</h2>
	<hr>
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
		<form action="" name="modifyForm">
				<table align="center"
					class="table table-hover table-bordered table-condensed c fs10"
					style="width: 400px; height: 150px;">
					<tr class="bg-primary">
						<td style="font-size: 15pt"><strong>비밀번호</strong></td>
					</tr>

					<tr>
						<td><input class="input" type="password" name="member_pwd"
							maxlength="50" style="width: 150px; height: 30px"></td>
					</tr>

					<tr>
						<td style="font-size: 12pt">
							<button type="button" class="btn btn-info"
								onclick="pwdCheck(document.modifyForm.member_pwd.value);">
								정보수정<i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="submit" class="btn btn-warning" value="취소"
								onclick="window.history.back();">
								취소<i class="fa fa-times spaceLeft"></i>
							</button>

						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<hr>
</body>
</html>