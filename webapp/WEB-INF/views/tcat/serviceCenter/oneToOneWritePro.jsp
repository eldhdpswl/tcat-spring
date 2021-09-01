<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("게시글이 작성되었습니다!");
			 $( "#result2" ).load( "${pageContext.request.contextPath}/qnaOneToOneboard" );
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("게시글 작성이 실패했습니다. 다시작성해주세요!");
		</script>
	</c:if>
</body>
</html>