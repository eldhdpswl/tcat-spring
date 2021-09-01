<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보 수정 페이지</h2>

	<c:if test="${cnt==0}">
			<script type="text/javascript">
				errorAlert(updateError);
			</script>
			</c:if>

		<c:if test="${cnt!=0}">
			<script type="text/javascript">
			alert("회원정보가 수정되었습니다.");
			window.location="guestMain";
			</script>
			
			</c:if>
</body>
</html>