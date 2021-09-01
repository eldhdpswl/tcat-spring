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
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
function Ticketing(url){
	 $( "#Ticketing" ).load( "${pageContext.request.contextPath}/"+url );
}
$( function() {  //바로시작되는 부분
	var per_id=${vo.per_id};
	 $( "#Ticketing" ).load( "${pageContext.request.contextPath}/chooseDay?per_id="+per_id );
});
function next(form){
	var nextBtn=document.all.nextBtn.value;
	
	var td=$("input[name='ticet_date']").val();
	var rd=$("input[name='round']").val();
	if(td==0){
		alert("날짜를 선택해주세요!");
	}else if(rd==0){
		alert("회차를 선택해주세요!");
	}else if(nextBtn=="좌석선택"){
		
			document.all.nextBtn.value="할인/쿠폰";
			$( "#Ticketing" ).load( "${pageContext.request.contextPath}/ticketSeat?per_id=${vo.per_id}&ticet_date="+form.ticet_date.value+"&round="+form.round.value);
			$("#menu1").removeClass("active");
			$("#menu2").addClass("active");
			
			playAlert = setInterval(function() {
				$( "#Ticketing" ).load( "${pageContext.request.contextPath}/ticketSeat?per_id=${vo.per_id}&ticet_date="+form.ticet_date.value+"&round="+form.round.value);
				}, 5000); //공연장 좌석선택부분을 선택하는 페이지를 5초마다 반복시켜줌
		
	}else if($("input[name='seat_type']").val()==0){
		alert("좌석을 선택해주세요!");
	}else if(nextBtn=="할인/쿠폰"){
	
		clearInterval(playAlert);  //할인/쿠폰 버튼을 클릭하면 다음 화면으로 넘어가야되는데 그전에 Interval(좌석선택화면부분)을 종료시켜야지 다음화면으로 보여줌
		document.all.nextBtn.value="수령방법";
		$( "#Ticketing" ).load( "${pageContext.request.contextPath}/sale");
		$("#menu2").removeClass("active");
		$("#menu3").addClass("active");
	}else if(nextBtn=="수령방법"){
		var sale_div=$("input[name='sale_div']").val();
		
		document.all.nextBtn.value="결제방법";
		$("#Ticketing").load( "${pageContext.request.contextPath}/del");
		$("#menu3").removeClass("active");
		$("#menu4").addClass("active");
	
	
	}else if(nextBtn=="결제방법"){
		var addr=$("input[name='addr']").val();
		var hp=$("input[name='hp']").val();
		var name=$("input[name='name']").val();
		
		if(name==0){
			alert("이름을 입력해주세요!");
		}else if(hp==0){
			alert("연락처를 입력해주세요!");
		}else if(addr==0){
			alert("주소를 입력해주세요!");
		}else{
			document.all.nextBtn.value="결제";
			
			var totalPrice=$("input[name='totalPrice']").val();
			var totalSale=$("input[name='totalSale']").val();
			var total=(totalPrice*1)-(totalSale*1);
			$("input[name='total']").val(total);
			
			$( "#Ticketing" ).load( "${pageContext.request.contextPath}/pay");		
			$("#menu4").removeClass("active");
			$("#menu5").addClass("active");
		}
	}else if(nextBtn=="결제"){
		//ajax
		$(function(){   /* AJAX submit */  
		   var result = document.getElementById("result");
		   var formData = $("#ticketingForm").serialize();
		   $.ajax({
		               type : "POST",
		               url : "insertTicket",
		               cache : false,
		               data : formData,
		               success :  function(msg) {
		                  alert("구매되었습니다.");
		                  self.close();
		               }, 
		               error : onError
		   });
		   function onError(data, status){ alert("구매되었습니다.");self.close();}
		});
		
	}
}



</script>
<style type="text/css">
.TicketingButton {
	-moz-box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	-webkit-box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);
	background-color:#7892c2;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Trebuchet MS;
	font-size:14px;
	font-weight:bold;
	padding:7px 65px;
	text-decoration:none;
	text-shadow:1px 1px 3px #283966;
}
.TicketingButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #7892c2));
	background:-moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#7892c2',GradientType=0);
	background-color:#476e9e;
}
.TicketingButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body style="background-color:black">

	<div class="navbar navbar-inverse navbar-static-top">

		<div class="container">

			<a href="#" class="navbar-brand">예매</a>
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navHeaderCollapse"></button>
			<div id="b"></div>
			<div class="collapse navbar-collapse navHeaderCollapse">
				<ul class="nav navbar-nav navbar-right">
					<li id="menu1" class="active"><a href="#">관람일/회차</a></li>
					<li id="menu2" ><a href="#">좌석선택</a></li>
					<li id="menu3" ><a href="#">할인/쿠폰</a></li>
					<li id="menu4" ><a href="#">수령방법</a></li>
					<li id="menu5" ><a href="#">결제방법</a></li>
				</ul>
			</div>
		</div>
	</div>


	
		<div class="row">
			<div class="col-md-2 pt-8">
			<div id="side_bar">
					<table style="border:1px solid black; margin-top:0; padding:10px; color:white">
						<tr>
							<td style="width:100px;"><img src="${image}/performance/${vo.perf_Image}" style="width:100px;margin:10px;">
							<td style="width:80px;">
								<c:set var="startdate" value="${fn:split(vo.startDate,' ')}"/>
								<c:set var="enddate" value="${fn:split(vo.endDate,' ')}"/>
								<b>${vo.perf_title}</b><br><br>
								${startdate[0]}<br>
								~
								${enddate[0]}<br>
							</td>
						</tr>
					</table>
					<hr style="color:white;margin:5px;">
					<form action="" id="ticketingForm" name="ticketingForm">
						<input type="hidden" name="addr" value="0">
						<input type="hidden" name="hp" value="0">
						<input type="hidden" name="name" value="0">
						<input type="hidden" name="per_id" value="${vo.per_id}">
						
						<h3>선택내역</h3>
						<table style="color:white;margin:10px;">
							<tr>
								<th>날짜</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="0" name="ticet_date" readonly></td>
							</tr>
							<tr>
								<th>공연회차</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="0" name="round" readonly></td>
							</tr>
							<tr>
								<th>좌석</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="0" name="seat_type" readonly></td>
							</tr>
							
							
						</table>
						<br>
						<hr style="color:#fafafaf;margin:5px;">
						<h3>결제내역</h3>
						<table style="color:white;margin:10px;">
							<tr>
								<th>티켓금액</th>
								<td><input  style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="price" readonly></td>
							</tr>
							<tr>
								<th>배송료</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="delpay" readonly></td>
							</tr>
							<tr>
								<th>총금액</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="totalPrice" readonly></td>
							</tr>
						</table>
						<br>
						<hr style="color:#fafafaf;margin:5px;">

						<table style="color:white;margin:10px;">
							<tr>
								<th>할인구분</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="sale_div" readonly></td>
							</tr>
							<tr>
								<th>할인율</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="sale_rate" readonly></td>
							</tr>							
							<tr>
								<th>총 할인금액</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="totalSale" readonly></td>
							</tr>
						</table>
						<br>
						<hr style="color:#fafafaf;margin:5px;">
						<br>
						최종결제금액  <input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="total" readonly>
						<br><br>
						<input type="button" class="TicketingButton" style="margin:5px; width:100%;"value="좌석선택" name="nextBtn" onclick="next(this.form);">
						
					</form>
				</div>
			</div>
			<div class="col-md-9 bffffff ml-2" style="height:700px;">
				
				<div id="Ticketing">
					<!-- 밑에 뿌려줄 부분 -->
				</div>
				<br>
					
					
			</div>
		</div>
	

</body>
</html>