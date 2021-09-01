<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!--결제취소 완료  -->
<c:if test="${ticStepUpdateRs!=0 }">
	<script type="text/javascript">
		alert("예매 취소가 요청되었습니다.");
		load("ticketCheck");
	</script>
</c:if>
<!--결제취소 실패  -->
<c:if test="${ticStepUpdateRs==0 }">
	<script type="text/javascript">
		alert("예매 취소를 실패하였습니다.");
		load("ticketCheck");
	</script>
</c:if>
</html>