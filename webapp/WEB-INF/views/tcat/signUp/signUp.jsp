<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
  //ajax
    function memberSubmit(url){   /* AJAX submit */  
       var result = document.getElementById("result");
       var formData = $("#memberForm").serialize();
       if (!document.memberForm.member_id.value) {
			alert("아이디를 입력해주세요!");
			return false;
		} else if (document.memberForm.hiddenId.value == 0) {
			alert("아이디 인증을 해주세요!");
			return false;
		} else if (!document.memberForm.member_pwd.value) {
			alert("비밀번호를 입력해주세요!");
			return false;
		} else if (!document.memberForm.member_name.value) {
			alert("이름을 입력해주세요!");
			return false;
		} else if (!document.memberForm.member_hp.value) {
			alert("연락처를 입력해주세요!");
			return false;
		} else if (!document.memberForm.postNum.value) {
			alert("우편번호를 입력해주세요!");
			return false;
		} else if (!document.memberForm.addr.value){ 
			alert("주소를 입력해주세요!");
			return false;		
		} else if (!document.memberForm.detailAddr.value){ 
			alert("상세주소를 입력해주세요!");
			return false;		
		} else if (!document.memberForm.member_email.value) {
			alert("이메일을 입력해주세요!");
			return false;
		} else if (document.memberForm.EmailCheck.value == 0){
			alert("이메일 인증을 해주세요!");
			return false;
		} else if (!document.memberForm.member_gender.value) {
			alert("성별을 선택해주세요!");
			return false;
		} else if (document.memberForm.member_birth.value == 0) {
			alert("생년월일을 입력 해주세요!");
			return false;
		}
       $.ajax({
                   type : "POST",
                   url : url,
                   cache : false,
                   data : formData,
                   success :  function(msg) {
                      $('#result').html(msg);
                   }, 
                   error : onError
       });
       function onError(data, status){alert("error");}
    }
    	function emailCheack() {
    		var email = document.memberForm.member_email.value;
    		if (!email) {
    			alert("이메일을 입력한뒤 인증해주세요!");
    		} else {
    			window.open("GuestEmailCheack?email=" + email, "confirm",
    					"menubar=no, width=500, height=255");
    		}
    	}
    
    	function idCheak() {
    		
    		var member_id = document.memberForm.member_id.value;

    		if (!document.memberForm.member_id.value) {
    			alert("아이디를 입력하고 확인을 해주세요!");
    		}  else {
    			window.open("MemberIdCheack?member_id=" + member_id, "confirm",
    			"menubar=no, width=400, height=215");
    		}  
    	}
</script>
<script>
	$(function() {
		var member_id=$('#member_id');
		var pwd = $('#member_pwd');
		var repwd = $('#member_pwdRe');
		var member_name=$('#member_name');
		var member_hp=$('#member_hp');
		var postNum=$('#postNum');
		var addr=$('#addr');
		var detailAddr=$('#detailAddr');
		var member_email=$('#member_email');
		var member_gender=$('#member_gender');
		var member_birth=$('#member_birth');
		
		repwd.blur(function() {
			var R = repwd.val();
			var P = pwd.val();
			if (R == P) {
				$("#errorPwd").css('display', 'none');
			} else {
				$("#errorPwd").css('display', 'inline');
			}
		});
		member_id.blur(function() {
			if (!member_id.val()) {
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
		member_name.blur(function() {
			if (!member_name.val()) {
				$("#nameError").css('display', 'inline');
			}else{
				$("#nameError").css('display', 'none');
			}
		});
		member_email.blur(function() {
			if (!member_email.val()) {
				$("#emailError").css('display', 'inline');
			} else{
				$("#emailError").css('display', 'none');
			}
		});
		member_hp.blur(function() {
			if (!member_hp.val()) {
				$("#hpError").css('display', 'inline');
			} else{
				$("#hpError").css('display', 'none');
			}
		});
		member_birth.blur(function() {
			if (!member_birth.val()) {
				$("#birthError").css('display', 'inline');
			} else{
				$("#birthError").css('display', 'none');
			}
		});
		postNum.blur(function() {
			if (!postNum.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});
		addr.blur(function() {
			if (!addr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
		detailAddr.blur(function() {
			if (!detailAddr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
	});
</script>
</head>
<body>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("회원가입에 성공하였습니다.");
			 $( "#result" ).load( "${pageContext.request.contextPath}/guestMain" );
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("회원가입 실패!");
		</script>
	</c:if>
<div class="row">	
	<div class="col-md-1"></div>
		<div class="col-md-10">		
			<div class="page-header">
				<h1 style="margin-left:50px;">
					회원가입 <small>Guest</small>
				</h1>
			</div>
			<div class="col-md-6 col-md-offset-3">
				<form action="" role="form" method="post" id="memberForm"
					name="memberForm" onsubmit="return inputCheack();">
					<input type="hidden" value="0" name="EmailCheck"> 
					<input type="hidden" value="0" name="hiddenId">
					<!-- 아이디 -------------------------------------------------------------------------------- -->
					<div class="form-group">

						<label for="username"><span style="color:red;">*</span> 아이디 입력 </label>
						<div class="input-group">
							<input type="text" class="form-control" id="member_id" name="member_id"
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
					<!-- 아이디 -------------------------------------------------------------------------------- -->
					<!-- 비밀번호 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label for="InputPassword1"><span style="color:red;">*</span> 비밀번호 </label> <input type="password"
							name="member_pwd" class="form-control" id="member_pwd"
							placeholder="비밀번호"><span style="display: none; color: red;" id="pwdError">필수입력입니다.</span>
					</div>
					<div class="form-group">
						<label for="InputPassword2"><span style="color:red;">*</span> 비밀번호 확인</label> <input type="password"
							class="form-control" name="member_pwd1" id="member_pwdRe"
							placeholder="비밀번호 확인"><span
							style="display: none; color: red;" id="errorPwd">비밀번호가 다릅니다.</span>
						<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
					</div>
					<!-- 비밀번호 -------------------------------------------------------------------------------- -->
					<!-- 이름 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label for="username"><span style="color:red;">*</span> 이름 </label> 
						<input type="text" id="member_name"class="form-control" name="member_name" class="member_name" placeholder="이름을 입력해 주세요">
						<span style="display: none; color: red;" id="nameError">필수입력입니다.</span>
					</div>
					<!-- 이름 -------------------------------------------------------------------------------- -->
					<!-- 연락처 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label><span style="color:red;">*</span>연락처 </label>
						<input type="text" class="form-control" name="member_hp" id="member_hp"	placeholder="연락처 입력">
						<span style="display: none; color: red;" id="hpError">필수입력입니다.</span>
					</div>
					<!-- 연락처 -------------------------------------------------------------------------------- -->
					<!-- 주소검색 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label for="username"><span style="color:red;">*</span> 주소 </label>
							<div class="input-group">
							<input type="text" class="form-control"  id="sample6_postcode" name="postNum" placeholder="우편번호">
							<span class="input-group-btn">
								<input type="button"  class="btn btn-success" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><br>
							</span>
							</div>
							<input type="text" class="form-control" name="addr" id="sample6_address" placeholder="주소">
							<input type="text" class="form-control" name="detailAddr" id="sample6_address2" placeholder="상세주소">
		
						<span style="display: none; color: red;" id="addrError">필수입력입니다.</span>
					</div>	
					<!-- 주소검색 -------------------------------------------------------------------------------- -->
					<!-- 이메일 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label for="username"><span style="color:red;">*</span> 이메일 인증</label>
						<div class="input-group">
							<input type="email" class="form-control" name="member_email" class="member_email" id="member_email" placeholder="@를 포함한 이메일형식을 맞춰주세요">
							<span class="input-group-btn"> 
								<input type="button" class="btn btn-success" onclick="emailCheack();" value="인증번호 전송">
							</span>
						</div>
						<span style="display: none; color: red;" id="emailError">필수입력입니다.</span>
					</div>
					<!-- 이메일 -------------------------------------------------------------------------------- -->
					<!-- 성별 -------------------------------------------------------------------------------- -->
					
					<div class="form-group">
						<label><span style="color:red;">*</span> 성별</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						&nbsp&nbsp남자 &nbsp&nbsp&nbsp
						<input type="radio" name="member_gender" id="member_gender" value="1">&nbsp&nbsp&nbsp
						여자 &nbsp&nbsp&nbsp
						<input type="radio" name="member_gender" id="member_gender" value="2">&nbsp&nbsp
					</div>
					
					<!-- 성별 -------------------------------------------------------------------------------- -->
					<!-- 생년월일 -------------------------------------------------------------------------------- -->
					
							<div class="form-group">
						<label><span style="color:red;">*</span> 생년월일 </label>
						 <input
								type="text" class="form-control" name="member_birth" id="member_birth"
								placeholder="ex)920503"><span
							style="display: none; color: red;" id="birthError">필수입력입니다.</span>
						
					</div>		
					
					<!-- 생년월일 -------------------------------------------------------------------------------- -->
					<div class="form-group">
						<label>약관 동의</label>
						<div data-toggle="buttons">
							<label class="btn btn-primary active"> <span
								class="fa fa-check"></span> <input id="agree" type="checkbox"
								autocomplete="off" checked>
							</label><a href="#">이용약관</a>에 동의합니다.
						</div>
					</div>
					<div class="form-group text-center">
						<button type="button" class="btn btn-info" id="Imember" onclick="return memberSubmit('insertMember');">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button type="submit" class="btn btn-warning">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</form>

			</div>		
			
		
		</div>
	<div class="col-md-1"></div>
</div>

</body>
</html>