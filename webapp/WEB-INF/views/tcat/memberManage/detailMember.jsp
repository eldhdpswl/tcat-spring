<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../setting.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<style type="text/css">
.text-danger strong {
	color: #9f181c;
}

.receipt-main {
	background: #ffffff none repeat scroll 0 0;
	border-bottom: 12px solid #333333;
	border-top: 12px solid #9f181c;
	padding: 40px 30px !important;
	position: relative;
	box-shadow: 0 1px 21px #acacac;
	color: #333333;
	font-family: open sans;
}

.receipt-main p {
	color: #333333;
	font-family: open sans;
	line-height: 1.42857;
}

.receipt-footer h1 {
	font-size: 15px;
	font-weight: 400 !important;
	margin: 0 !important;
}

.receipt-main::after {
	background: #414143 none repeat scroll 0 0;
	content: "";
	height: 5px;
	left: 0;
	position: absolute;
	right: 0;
	top: -13px;
}

.receipt-main thead {
	background: #414143 none repeat scroll 0 0;
}

.receipt-main thead th {
	color: #fff;
}

.receipt-right h5 {
	font-size: 16px;
	font-weight: bold;
	margin: 0 0 7px 0;
}

.receipt-right p {
	font-size: 12px;
	margin: 0px;
}

.receipt-right p i {
	text-align: center;
	width: 18px;
}

.receipt-header-mid .receipt-left h1 {
	font-weight: 50;
	margin: 34px 0 0;
	text-align: right;
	text-transform: uppercase;
}

.receipt-header-mid {
	margin: 24px 0;
	overflow: hidden;
}

#container {
	background-color: #dcdcdc;
}

input {
	width: 200px;
}
</style>
<script type="text/javascript">
	$(function(){
		$('.hd').prop('readonly', true);
		$('.hd').css('border','none');
	});
	function modified(){
		$('.hd').prop('readonly', false);
		$('.hd').css('border','1px solid #aaaaaa');
		$('#mo').css('display','none');
		$('#modi').css('display','inline');
	}
	function rs(){
		$('.hd').prop('readonly', true);
		$('.hd').css('border','none');
		$('#mo').css('display','inline');
		$('#modi').css('display','none');
	}
</script>
</head>
<body>
	<c:if test="${cnt>0}">
		<script type="text/javascript">
			alert("수정되었습니다.");
			opener.parent.location.reload();
			window.close();
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("수정에 실패하였습니다.");
		</script>
	</c:if>
	<div class="container">
		<div class="row">
			<div
				class="receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-right">
							<h3>Member Information</h3>
						</div>
					</div>
					<div class="receipt-header receipt-header-mid">
						<div class="col-xs-8 col-sm-8 col-md-8 text-left">
							<div class="receipt-right">
								<form action="detailMember_update" method="post" name="memberUpdateForm">
									<table style="text-align: left;">
										<tr>
											<th>아이디</th>
											<th>:</th>
											<td>${dto.member_id}<input type="hidden" name="member_id" value="${dto.member_id}"></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<th>:</th>
											<td><input class="hd" type="text" name="member_pwd"
												value="${dto.member_pwd}"></td>
										</tr>
										<tr>
											<th>연락처</th>
											<th>:</th>
											<td><input class="hd" type="text" name="member_hp"
												value="${dto.member_hp}"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<th>:</th>
											<td><input class="hd" type="text" name="member_email"
												value="${dto.member_email}"></td>
										</tr>
										<tr>
											<th>이름</th>
											<th>:</th>
											<td><input class="hd" type="text" name="member_name"
												value="${dto.member_name}"></td>
										</tr>
										<tr>
											<th>등급</th>
											<th>:</th>
											<td><input class="hd" type="text" name="Rating"
												value="${dto.getRating()}"></td>
										</tr>
										<tr>
											<th>포인트</th>
											<th>:</th>
											<td><input class="hd" type="text" name="point" value="${dto.point}"></td>
										</tr>
										<tr>
											<th>주소</th>
											<th>:</th>
											<td><input class="hd" type="text" name="member_addr"
												value="${dto.member_addr}"></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<th>:</th>
											<td>${dto.member_birth}</td>
										</tr>
										<tr>
											<th>성별</th>
											<th>:</th>
											<td>${dto.member_gender}</td>
										</tr>
										<tr>
											<th>마지막접속일</th>
											<th>:</th>
											<td>${dto.lastDate}</td>
										</tr>
										<tr>
											<th>가입일</th>
											<th>:</th>
											<td>${dto.member_joindate}</td>
										</tr>
										<tr>
											<th><br></th>
										</tr>
										<tr>
											<td colspan="3" style="align: center">
												<input type="button" id="mo" onclick="modified();" value="수정하기" style="width: 100px;"> 
												<input type="submit" id="modi" value="수정완료" style="width: 100px; display:none;" > 
												<input type="button" value="취소" onclick="rs();" style="width: 100px;">
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>


</body>
</html>