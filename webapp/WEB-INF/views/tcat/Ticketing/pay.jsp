<%@page import="java.util.Date"%>
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
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<style type="text/css">
.chooseTb {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #050505), color-stop(1, #050405));
	background:-moz-linear-gradient(top, #050505 5%, #050405 100%);
	background:-webkit-linear-gradient(top, #050505 5%, #050405 100%);
	background:-o-linear-gradient(top, #050505 5%, #050405 100%);
	background:-ms-linear-gradient(top, #050505 5%, #050405 100%);
	background:linear-gradient(to bottom, #050505 5%, #050405 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#050505', endColorstr='#050405',GradientType=0);
	background-color:#050505;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:15px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr class="chooseTb">
			<th>결제방법</th>
		</tr>
		<tr>
			<td>
				<table class="table table-striped ">
					<tr>
						<td>TCAT머니</td>
						<td><input type="text" value="0">원</td>
						<td><input type="checkbox">전액사용(총 0원)</td>
					</tr>
					<tr>
						<td>TCAT포인트</td>
						<td align="right">0 원</td>
						<td><input type="button" value="TCAT머니로 환전"> TCAT포인트 5,000원 이상이면 TCAT머니로 환전가능</td>
					</tr>
					<tr>
						<td>예치금</td>
						<td><input type="text" value="0">원</td>
						<td><input type="checkbox">전액사용(총 0원)</td>
					</tr>
					<tr>
						<td>TCAT상품권</td>
						<td><input type="text" value="0">원</td>
						<td><input type="button" value="사용하기">(총 0원/사용가능 0장)</td>
					</tr>
					<tr>
						<td>공연예매권</td>
						<td>사용가능 예매권[총 0장]</td>
						<td><input type="button" value="예매권 번호 등록/사용"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
			<table style="width:450px">
				<tr>
					<th>결제방법 선택</th>
					<td>신용카드 <input type="checkbox"></td>
					<td>계좌이체 <input type="checkbox"></td>
					<td>무통장입금 <input type="checkbox"></td>
				</tr>
			</table>
			<td>
		</tr>
		<tr>
			<td><img src="${image}/예매시 주의.png" style="width:100%">
		</tr>
	</table>
</body>
</html>