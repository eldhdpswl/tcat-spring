<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<input type="hidden" id="admit_code_submit" value="${id_emailChk }">
	<!-- id_emailChk 1:아이디,이메일 매치 	2: 아이디,이메일 매치x -->
	<c:if test="${id_emailChk == 1}">
		<span class="fs10" style="color: green">인증번호를 전송하였습니다.</span>
	</c:if>
	<c:if test="${id_emailChk == 0 }">
		<span class="fs10" style="color: red">아이디가 존재하지않거나 이메일이 존재하지않습니다.</span>
	</c:if>
	
	
	<!--승인 OK  -->
	<c:if test="${admit_fail == 0}">
		<c:choose>
			<c:when test="${member_id!=null}">
				<input type="hidden" id="member_id" value="${member_id }">
				<script type="text/javascript">
					var member_id=$("#member_id").val();
					$("#modal_result").load("${pageContext.request.contextPath}/findResultPage?member_id="+member_id);
				</script>
			</c:when>
			<c:when test="${member_pwd!=null}">
				<input type="hidden" id="member_pwd" value="${member_pwd }">
				<script type="text/javascript">
					var member_pwd=$("#member_pwd").val();
					$("#modal_result").load("${pageContext.request.contextPath}/findResultPage?member_pwd="+member_pwd);
				</script>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
	</c:if>
	<c:if test="${admit_fail==1}">
		<script type="text/javascript">
			alert("인증코드가 틀렸습니다.");
		</script>
	</c:if>
</html>