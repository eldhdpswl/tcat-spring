<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>bootstrap template</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css" media="screen"
	title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<title>Insert title here</title>
<script type="text/javascript">
	function emailChoose(value) {
		if (value == 0) {
			document.hostJoinForm.host_email2.value = "";
		} else {
			document.hostJoinForm.host_email2.value = value;
		}
	}
	function emailCheack() {
		var email = document.hostJoinForm.host_email.value;
		if (!email) {
			alert("이메일을 입력한뒤 인증해주세요!");
		} else {
			window.open("emailCheack?email=" + email, "confirm",
					"menubar=no, width=500, height=255");
		}
	}
	function inputCheack() {
		if (!document.hostJoinForm.host_id.value) {
			alert("아이디를 입력해주세요!");
			return false;
		} else if (document.hostJoinForm.hiddenId.value == 0) {
			alert("아이디 인증을 해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_pwd.value) {
			alert("비밀번호를 입력해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_name.value) {
			alert("이름을 입력해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_Department.value) {
			alert("부서를 입력해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_grade.value) {
			alert("직급을 입력해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_email1.value) {
			alert("이메일을 입력해주세요!");
			return false;
		} else if (!document.hostJoinForm.host_email2.value) {
			alert("이메일을 입력해주세요!");
			return false;
		} else if (document.hostJoinForm.EmailCheck.value == 0) {
			alert("이메일 확인을 해주세요!");
			return false;
		}
	}
	function idCheak() {
		var host_id = document.hostJoinForm.host_id.value;
		if (!document.hostJoinForm.host_id.value) {
			alert("아이디를 입력하고 확인을 해주세요!");
		} else {
			window.open("HostIdCheack?host_id=" + host_id, "confirm",
					"menubar=no, width=500, height=255");
		}
	}
	function hostSubmit(url) { /*AJAX submit  */
		var formData = $("#JoinForm").serialize();
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				$('#result').html(msg);
			},
			error : onError
		});
		function onError(data, status) {
			alert("error");
		}
	}
</script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var host_id=$('#host_id');
		var host_name=$('#host_name');
		var host_email=$('#host_email');
		var host_Department=$('#host_Department');
		var host_grade=$('#host_grade');
		var host_phone=$('#host_phone');
		var host_authority=$('#host_authority');
		
		var repwd = $('#InputPassword2');
		var pwd = $('#InputPassword1');

		repwd.blur(function() {
			var R = repwd.val();
			var P = pwd.val();
			if (R == P) {
			} else {
				$("#errorPwd").css('display', 'inline');
			}

		});
		host_id.blur(function() {
			if (!host_id.val()) {
				$("#idError").css('display', 'inline');
			}else{
				$("#idError").css('display', 'none');
			}
		});
		pwd.blur(function() {
			if (!pwd.val()) {
				$("#pwdError").css('display', 'inline');
			}else{
				$("#pwdError").css('display', 'none');
			}
		});
		host_name.blur(function() {
			if (!host_name.val()) {
				$("#nameError").css('display', 'inline');
			}else{
				$("#nameError").css('display', 'none');
			}
		});
		host_email.blur(function() {
			if (!host_email.val()) {
				$("#emailError").css('display', 'inline');
			} else{
				$("#emailError").css('display', 'none');
			}
		});
		host_Department.blur(function() {
			if (!host_Department.val()) {
				$("#nullError").css('display', 'inline');
			} else{
				$("#nullError").css('display', 'none');
			}
		});
		host_grade.blur(function() {
			if (!host_grade.val()) {
				$("#nullError").css('display', 'inline');
			} else{
				$("#nullError").css('display', 'none');
			}
		});
		host_phone.blur(function() {
			if (!host_phone.val()) {
				$("#nullError").css('display', 'inline');
			} else{
				$("#nullError").css('display', 'none');
			}
		});
		host_authority.blur(function() {
			if (!host_authority.val()) {
				$("#authorityError").css('display', 'inline');
			} else{
				$("#authorityError").css('display', 'none');
			}
		});		
	});
</script>
</head>
<body>
	<!-- HostPlus -->
	<c:if test="${HostPlus==1}">
		<script type="text/javascript">
			alert("가입되었습니다.");
			$("#result").load("${pageContext.request.contextPath}/hostMain");
			$("#side_result").load(
					"${pageContext.request.contextPath}/hostMain_side");
		</script>
	</c:if>
	<c:if test="${HostPlus==0}">
		<script type="text/javascript">
			alert("가입에 실패하였습니다.");
		</script>
	</c:if>

	<div class="row">
		<div class="col-md-12 h25"></div>
		<div class="col-md-2"></div>
		<div class="col-md-10">
		<h4 class="trgothic">
			회원가입 <small>HOST</small>
		</h4>
		<div class="col-md-12 h50"></div>
		</div>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form action="HostPlus" role="form" method="post" id="JoinForm"
			name="hostJoinForm" onsubmit="return inputCheack();">
			<input type="hidden" value="0" name="EmailCheck"> <input
				type="hidden" value="0" name="hiddenId">

			<div class="form-group">
				<label for="username"><span style="color:red;">*</span> 아이디 입력 </label>
				<div class="input-group">
					<input type="text" class="form-control" id="host_id" name="host_id"
						placeholder="아이디 입력">
					 <span class="input-group-btn">
						<input type="button" class="btn btn-success" onclick="idCheak();"
						value="중복확인">
					</span>
				</div>
				<div style="display:inline">
					<span style="display: none; color: red;" id="idError">필수입력입니다.</span>
				</div>
			</div>
			<div class="form-group">
				<label for="InputPassword1"><span style="color:red;">*</span> 비밀번호 </label> <input type="password"
					name="host_pwd" class="form-control" id="InputPassword1"
					placeholder="비밀번호"><span style="display: none; color: red;" id="pwdError">필수입력입니다.</span>
			</div>
			<div class="form-group">
				<label for="InputPassword2"><span style="color:red;">*</span> 비밀번호 확인</label> <input type="password"
					class="form-control" name="host_pwd1" id="InputPassword2"
					placeholder="비밀번호 확인"><span
					style="display: none; color: red;" id="errorPwd">비밀번호가 다릅니다.</span>
				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
			</div>
			<div class="form-group">
				<label for="username"><span style="color:red;">*</span> 이름 </label> <input type="text" id="host_name"
					class="form-control" name="host_name" class="host_name"
					id="username" placeholder="이름을 입력해 주세요"><span
					style="display: none; color: red;" id="nameError">필수입력입니다.</span>
			</div>
			<div class="form-group">
				<label for="username"><span style="color:red;">*</span>이메일 인증</label>
				<div class="input-group">
					<input type="email" class="form-control" name="host_email"
						class="host_email" id="host_email" placeholder="@를 포함한 이메일형식을 맞춰주세요"><span
					style="display: none; color: red;" id="emailError">필수입력입니다.</span>
					<span class="input-group-btn"> <input type="button"
						class="btn btn-success" onclick="emailCheack();" value="인증번호 전송">
					</span>
				</div>
			</div>
			<div class="form-group">
				<label><span style="color:red;">*</span>부서&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<span style="color:red;">*</span>직급&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<span style="color:red;">*</span>연락처 </label>
				<div class="input-group">
					<input type="text" class="form-control" name="host_Department" id="host_Department"
						placeholder="부서 입력" style="width: 33%;"> <input
						type="text" class="form-control" name="host_grade" id="host_grade"
						placeholder="직급 입력" style="width: 33%;"> <input
						type="text" class="form-control" name="host_phone" id="host_phone"
						placeholder="연락처 입력" style="width: 33%;"><span
					style="display: none; color: red;" id="nullError">필수입력입니다.</span>
				</div>
			</div>
			<div class="form-group">
				<label for="InputEmail"><span style="color:red;">*</span> 권한</label> <select name="host_authority"
					class="form-control">
					<option value="1">모든권한</option>
					<option value="2">공연상품 권한[+공연장 지역 관리 권한]</option>
					<option value="3">스토어 상품 권한</option>
					<option value="4">고객 관리, 게시판관리 권한</option>
				</select>
				<span style="display: none; color: red;" id="authorityError">필수입력입니다.</span>
			</div>
			<div class="form-group">
				<label>약관 동의</label>
				<div data-toggle="buttons">
					<label class="btn btn-primary active"> <span
						class="fa fa-check"></span> <input id="agree" type="checkbox"
						autocomplete="off" checked>
					</label> <a href="#">이용약관</a>에 동의합니다.
				</div>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-info"
					onclick="hostSubmit('HostPlus');">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="submit" class="btn btn-warning">
					가입취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>
	
</body>
</html>