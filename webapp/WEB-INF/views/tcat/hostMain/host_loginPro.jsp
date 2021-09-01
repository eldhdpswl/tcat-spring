<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TCAT 로그인처리페이지</title>
</head>
<body>
	<!--로그인 성공  -->
	<c:if test="${loginRs==1 }">
		<script type="text/javascript">
			alert("<%=request.getSession().getAttribute("host_id") %>사원님 반갑습니다.");
			window.location = "hostPage";
		</script>
	</c:if>
	
	<!--로그인 실패 -->
	<c:if test="${loginRs==0 }">
		<script type="text/javascript">
			alert("삭제된 사원이거나 아이디 혹은 비밀번호가 틀렸습니다.");
			window.location = "guestPage";
		</script>
	</c:if>
</body>
</html>