<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	function setEmail(random, CheckNum) {
		if ((random * 1) == (CheckNum * 1)) {
			alert("인증에 성공하였습니다.");
			opener.document.memberForm.EmailCheck.value = "1";
			self.close();
		} else {
			alert("인증번호가 다릅니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="span12">
					<div class="thumbnail center well well-small text-center">
						<h2>이메일 인증 페이지</h2>

						<p>${email}에인증번호를 보냈습니다.</p>

						<form action="" method="post">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> <input
									type="text" name="CheckNum" placeholder="인증번호">
							</div>
							<br /> <input type="button"
								onclick="setEmail('${result}',document.all.CheckNum.value);"
								value="Subscribe Now!" class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</body>
</html>