<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(function() {
		$('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
			$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			//e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			//e.preventDefault();
		});
	});
	//emailSubmit(보낼 url, form아이디, 결과 뿌려줄 div아이디)
	function emailSubmit(url, form, result) { /*AJAX submit  */
		var formData = $(form).serialize();
		var member_ = $(form + " input[class='form-control member_']");
		var member_email = $(form + " input[name='member_email']");
		var admit_code = $(form + " input[name='admit_code']");
		var admit_code_submit = $("#admit_code_submit").val();
		if (url == "findResult") {
			if (admit_code_submit != 1) {
				alert("인증번호 전송을 해주세요.");
				return false;
			}
			if (!admit_code.val()) {
				alert("인증번호를 입력해주세요.");
				admit_code.focus();
				return false;
			}
			if (admit_code.val().length != 6) {
				alert("인증번호는 6자리 입니다.");
				admit_code.focus();
				return false;
			}
		}
		
		if (!member_.val()) {
			alert("이름을 입력해주세요.");
			member_.focus();
			return false;
		}
		if (!member_email.val()) {
			alert("이메일을 입력하세요.");
			member_email.focus();
			return false;
		}
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				$(result).html(msg);
			},
			error : onError
		});
		function onError(data, status) {
			alert("error");
		}
	}
</script>
<style type="text/css">
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>
</head>
<!--  -->
<div class="panel panel-login">
	<!--탭  -->
	<div class="row ">
		<div class="col-xs-12" style="padding-right: 20px;">
			<a data-dismiss="modal" class="00ffff fs20 floatR">X</a>
		</div>
	</div>
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-6">
				<a class="active" id="login-form-link">아이디 찾기</a>
			</div>
			<div class="col-xs-6">
				<a id="register-form-link">비밀번호 찾기</a>
			</div>
		</div>
		<hr>
	</div>
	<!--탭시 보여주는 패널  -->
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">


				<form id="login-form" action="" method="post" role="form"
					style="display: block;">

					<!--회원 이름 입력  -->
					<div class="form-group">
						<input type="text" name="member_name" id="member_" tabindex="1"
							class="form-control member_" placeholder="이름">
					</div>

					<div class="form-group fs10">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,
						인증번호를 받을 수 있습니다.</div>
						
					<!--이메일 입력  -->
					<div class="form-group">
						<div class="row">
							<div class="col-md-8">
								<input type="text" name="member_email" tabindex="3"
									class="form-control" placeholder="E-mail">
							</div>
							<div class="col-md-4">
								<input type="button" tabindex="3"
									onclick="return emailSubmit('findId','#login-form','#idResult')"
									class="form-control btn btn-login" value="인증번호 전송">
							</div>
						</div>
					</div>
					<!--	아이디, 이메일 매치시: 인증번호가 전송되었습니다
							 비매치: 등록된 아이디가 아니거나 이메일주소가 아닙니다.  -->
					<div id="idResult"></div>

					<!--이메일 인증번호입력  -->
					<div class="form-group text-center">
						<input type="text" name="admit_code" tabindex="4" maxlength="6"
							class="form-control" placeholder="인증코드 입력(6자리)">
					</div>
					<!--아이디찾기  -->
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="button" name="login-submit" id="login-submit"
									tabindex="5" class="form-control btn btn-login" value="아이디 찾기"
									onclick="return emailSubmit('findResult','#login-form','#idResult')">
							</div>
						</div>
					</div>
				</form>

				<!--비밀번호 찾기  -->
				<form id="register-form" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
					<!--회원 아이디 입력  -->
					<div class="form-group">
						<input type="text" name="member_id" tabindex="1" class="form-control member_" placeholder="아이디">
					</div>
					<div class="form-group fs10">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,
						인증번호를 받을 수 있습니다.</div>
					<!--이메일 입력  -->
					<div class="form-group">
						<div class="row">
							<div class="col-md-8">
								<input type="text" name="member_email" tabindex="3"
									class="form-control" placeholder="E-mail">
							</div>
							<div class="col-md-4">
								<input type="button" tabindex="3"
									onclick="return emailSubmit('findId','#register-form','#pwdResult')"
									class="form-control btn btn-login" value="인증번호 전송">
							</div>
						</div>
					</div>
					<div id="pwdResult"></div>
					<!--이메일 인증번호입력  -->
					<div class="form-group text-center">
						<input type="text" name="admit_code" tabindex="4" maxlength="6"
							class="form-control" placeholder="인증코드 입력(6자리)">
					</div>
					<!--	아이디, 이메일 매치시: 인증번호가 전송되었습니다
							 비매치: 등록된 아이디가 아니거나 이메일주소가 아닙니다.  -->
					
					
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="button" name="login-submit" id="login-submit"
									tabindex="5" class="form-control btn btn-login" value="비밀번호 찾기"
									onclick="return emailSubmit('findResult','#register-form','#pwdResult')">
							</div>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
</div>
<!--  -->

</html>