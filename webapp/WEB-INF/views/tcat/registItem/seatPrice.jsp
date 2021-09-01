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

</head>
<body>
<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="span12">
					<div class="thumbnail center well well-small text-center">
						<h2>좌석가격</h2>

						<p><b>${perf_title}[${hall_name}]</b></p><br>

						<form action="" method="post">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> 
								<ul>
									<li>
										VIP 좌석가격 : ${vip}
									</li>
									<li>
										R 석가격 : ${r}
									</li>
									<li>
										S 석가격 : ${s}
									</li>
									<li>
										A 석가격 : ${a}
									</li>
									<li>
										B 석가격 : ${b}
									</li>
								</ul>
							</div>
							<br/> 
							<input type="button" onclick="self.close();" value="확인" class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</body>
</html>