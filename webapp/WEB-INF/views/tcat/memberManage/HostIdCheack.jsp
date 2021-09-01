<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function setId(id) {
		opener.document.hostJoinForm.host_id.value = id;
		opener.document.hostJoinForm.hiddenId.value = "1";
		self.close();
	}
</script>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-10">
	<form action="HostIdCheack" method="post" name="confirmform"
		onsubmit="return confirmIdCheck();"  >
		<c:if test="${cnt==1}"><!-- id 중복 -->
		<div class="container" style="margin-top:20px;">
			<div class="row">
				<div class="span12">
					<div class="thumbnail center well well-small text-center">
						<h2>중복확인 페이지</h2>

						<p><span>${host_id}</span>는 사용할 수 없습니다.</p>

						<form action="" method="post">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> <input
									type="text" name="host_id" placeholder="다른아이디 입력">
							</div>
							<br /> <input type="submit" value="Subscribe Now!"
								class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${cnt!=1}"><!-- id 중복이 아닌 경우 -->
			<div class="container"  style="margin-top:20px;">
			<div class="row">
				<div class="span12">
					<div class="thumbnail center well well-small text-center">
						<h2>중복확인 페이지</h2>

						<p><span>${host_id}</span>는 사용할 수 있습니다.</p>

						<form action="" method="post">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span>
							</div>
							<br /> <input type="button" value="확인"onclick="setId('${host_id}');"
								class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
		</c:if>
	</form>
	</div>
	<div class="col-md-1"></div>
</body>
</html>