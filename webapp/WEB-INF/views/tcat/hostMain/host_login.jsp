<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

/*  */
.main {
	max-width: 320px;
	margin: 0 auto;
}

.login-or {
	position: relative;
	font-size: 18px;
	color: #aaa;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.span-or {
	display: block;
	position: absolute;
	left: 50%;
	top: -2px;
	margin-left: -25px;
	background-color: #fff;
	width: 50px;
	text-align: center;
}

.hr-or {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

h3 {
	text-align: center;
	line-height: 300%;
}

footer {
	margin: 15px;
}

/*  */
</style>
<!--  -->
<script type="text/javascript">
$(document).ready(function(){
	$("#inputUsernameEmail").focus();
	$("#host_form").submit(function(){
		var id = $("#inputUsernameEmail");
		var pwd = $("#inputPassword");
		if(!id.val()){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		if(!pwd.val()){
			alert("비밀번호를 입력하세요.");
			pwd.focus();
			return false;
		}
	});
});
</script>
</head>
<!--  -->
<div class="col-md-12" style="background-color: #d0d0d0;">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-4">
					<h3>
						HOST 로그인</a>
					</h3>
					<hr class="hr-or">
					<form role="form" id="host_form" action="host_loginPro" >
						<div class="form-group">
							<label for="inputUsernameEmail">HOST 아이디</label> <input
								type="text" class="form-control" id="inputUsernameEmail" name="host_id">
						</div>
						<div class="form-group">
							<label for="inputUsernameEmail">비밀번호</label> <input
								type="password" class="form-control" id="inputPassword" name="host_pwd"
								style="height: 34px;">
						</div>
						<div class="form-group c">
							<button type="submit" class="btn btn btn-primary">로그인</button>
						</div>
					</form>
				</div>
				<div class="col-md-8">
					<div class="col-md-12 h50"></div>
					<div id="carouselExampleSlidesOnly" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w100p" src="${image}host/host_login.png"
									height="220px">
								<div class="carousel-caption d-none d-md-block"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!--  -->
</html>