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

<script type="text/javascript">
	//배송부분인데 여기서는 Ajax가 안먹어서 css로 보여지고 안보여지고를 나타냄
	$("#1").click(function(){
		 var a=$("input[name='delpay']").val(0);
		 var b=$("input[name='price']").val();
		 var total=b;
		 $("input[name='totalPrice']").val(total);
		
		 $("input[name='addr']").val(1);
		 $('.delAddr').css('display','none');
	});
	$("#2").click(function(){
		$("input[name='delpay']").val(2500);
		 var a=$("input[name='delpay']").val();
		 var b=$("input[name='price']").val();
		 var total=(a*1+b*1);
		 $("input[name='totalPrice']").val(total);

		$("input[name='addr']").val(0);
		$('.delAddr').css('display','inline');
	});
	
	$('#input_name').blur(function(){//포커스가 사라졋을때 사라지는것 :blur
		var name=$('#input_name').val();
		$("input[name='name']").val(name);
	});
	$('#input_hp').blur(function(){
		var hp=$('#input_hp').val();
		$("input[name='hp']").val(hp);
	});
	$("input[name='addr2']").blur(function(){
		var addr1=$('#sample6_address').val();
		var addr2=$('#sample6_address2').val();
		var postNum=$('#sample6_postcode').val();
		var addr="["+postNum+"]"+addr1+" "+addr2;

		$("input[name='addr']").val(addr);
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
<table class="table">
	<tr class="chooseTb">
		<th>수령방법</th>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<th>수령방법선택 :			
						<input type="radio" name="ra" id="1">현장수령 <input type="radio" name="ra" id="2">배송(2,500원)
					</th>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<th>주문자 확인<br><hr></th>
				</tr>
				<tr>
					<td>
						
							<!-- 주문자 확인 현장수령일때는 이름,연락처만 받고/배송일때는 주소까지 받는다. -->

							<table>
								<tr>
									<th>이름</th>
									<td><input type='text' id='input_name' name='input_name'><td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type='text' id='input_hp' name='input_hp'><td>
								</tr>
								<tr>
									<th>주소</th>
							 		<td>
							 			<input type='text' class="delAddr" id='sample6_postcode' name='postNum' placeholder='우편번호'>
										<input type='button' class="delAddr" onclick='sample6_execDaumPostcode()' value='우편번호 찾기'><br>
										<input type='text' class="delAddr" id='sample6_address' name='addr1'placeholder='주소'>
										<input type='text' class="delAddr" id='sample6_address2' name='addr2' placeholder='상세주소'>
									</td>
								</tr>
							</table>
							
						<br>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<div style="border:1px solid #cccccc">
		   		주의사항 * 부정확한 정보 입력으로 인한 문제 발생 시 tcat은 책임을 지지 않습니다.<br>
				1)<span style="color:red">배송 선택 시 티켓 수령자의 배송지 정보를 정확히 입력해주시기 바랍니다.</span><br>
				2)<span style="color:red">티켓은 유가증권으로 본인에게 직접 전달해야 하며, 분실된 티켓은 재발권되지 않습니다.</span><br>
				3)<span style="color:red">일괄배송의 경우 정해진 날짜에 티켓 배송이 시작되며, 주소 수정은 일괄배송일 2일 전까지 가능합니다.</span><br>
				4)<span style="color:red">예매 티켓 배송은 예매완료일,혹은 일괄배송으로부터 4~5일(영업일 기준)이내 수령 가능합니다.</span><br>
				5)긴급연락처는 공연 공연 취소와 같은 유사 시 안내를 받으실 연락처이므로 정확히 입력해주시기 바랍니다.<br>
				6)이메일 정보 미 입력 시 예매 관련 안내 메일을 받을 수 없으니 이메일 받기를 원하시는 경우 마이페이지에서<br>
				    회원정보를 수정해주시기 바랍니다.<br>
			</div>
		</td>
	</tr>

</table>
</body>
</html>