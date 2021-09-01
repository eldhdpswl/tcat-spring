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

<title>Insert title here</title>
<style type="text/css">
.roundButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:6px 67px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.roundButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.roundButton:active {
	position:relative;
	top:1px;
}
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

.ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; font-size: 20px;}

</style>
<script type="text/javascript">
function roundBt(round,form,per_id){
 	var ticet_date=form.ticet_date.value;
 	var sysday=ticet_date.split("-");//날짜에서 -를 잘르고나서
	
	
	 var date=new Date();
	var dateDay=date.getDate(); //날짜
	var dateHours=date.getHours();  //시간
	
	 
	var split1=round.split('/');
	var split2=split1[1].split(':');
	if(ticet_date=="0"){
		alert("날짜를 먼저 선택해주세요!");
		//sysday[2]는 날짜의 2번째 배열 (Ex 2018-2-18에서 18을 의미)
	}else if(sysday[2]==dateDay&&dateHours>=split2[0]){ //
		alert("마감되었습니다!");
		$("#RemainingSeats").load("${pageContext.request.contextPath}/fake");
	}else{

		$("input[name='round']").val(round);
		
		var url="RemainingSeats?round="+round+"&ticet_date="+form.ticet_date.value+"&per_id="+per_id;
		$("#RemainingSeats").load("${pageContext.request.contextPath}/"+ url);	
	}
}

//날짜 캘린더 출력하기
jQuery(function($){
    $.datepicker.regional['ko'] = {
   		closeText: '닫기',
   		prevText: '이전달',
   		nextText: '다음달',
   		currentText: '오늘',
   		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
   		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   		dayNames: ['일','월','화','수','목','금','토'],
   		dayNamesShort: ['일','월','화','수','목','금','토'],
   		dayNamesMin: ['일','월','화','수','목','금','토'],
   		weekHeader: 'Wk',dateFormat: 'yy-mm-dd',
   		firstDay: 0,
   		isRTL: false,
   		showMonthAfterYear: true,
   		yearSuffix: ''
   	};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    //달력 날짜 뿌려줄때 시작날짜,종료날짜 안의 날짜 외에는 막기
    $('#datepicker').datepicker({
    	showOn: 'both',
    	buttonText: "달력",
    	changeMonth: true,
    	changeYear: true,
    	showButtonPanel:true,
    	yearRange: 'c-99:c+99',
    	constrainInput: true,
    	maxDate: '+1y',
    	
    	beforeShowDay: noSundays, //막는부분(데이터피커옵션)
   		onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
    		$("input[name='ticet_date']").val(dateText);
   			
   		}
    });
});
// 일요일만 선택 막기
function noSundays(date) {
	 var startDate='${vo.startDate}';
	 var endDate='${vo.endDate}';
	 var sDate=startDate.split(" ");
	 var eDate=endDate.split(" ");
	 var ssDate=sDate[0].split("-");
	 var eeDate=eDate[0].split("-");
	 var sssDate=new Date(ssDate[0], (ssDate[1]*1)-1, ssDate[2]); //달에 -1을 줘서 맞춰줌
	 var eeeDate=new Date(eeDate[0], (eeDate[1]*1)-1, eeDate[2]);
	 var sysdate=new Date();
	 if(date<new Date()&&date.getDate()!=sysdate.getDate()||date<sssDate||date>eeeDate){
			 return[false];
	 }
	 return [true];
}
		 
	
</script>
</head>
<body style="background-color:white;">
<br><br>
<div class="row">

	<div class="col-md-11">
	<form action="" name="chooseDayForm">
		<table class="table-bordered" style="margin:20px;">
			<tr>
				<th class="chooseTb" style="width:35%; padding:5px;">관람일 선택</th>
				<th class="chooseTb" style="padding:5px;">회차 선택</th>
			</tr>
			<tr>
				<th><div id="datepicker"></div>
				<td>
					<br>
					<b style="margin-left:15px;">선택날짜&nbsp</b><input style="padding:2px 10px;background-color:#eeeeee;color:red;border:none" type="text" value="0" name="ticet_date">
					<table style="margin:10px;">
						<tr>
							<th style="width:20%; padding:5px;"><b>회차선택</b></th>
							<th>&nbsp&nbsp&nbsp</th>
							<th style="width:70%; padding:5px;" ><b>좌석등급/잔여석</b></th>
						</tr>
						<tr>
							<td>
								<div style="border:1px solid #dddddd; height:200px;" id="round">
									<c:set var="round" value="${fn:split(vo.remain_round,',')}"/>
									<c:forEach var="remain_round" items="${round}"><!-- 자바에서 for문 -->  
											<input type="button" class="roundButton" style="margin:1.5px 10px;" value="${remain_round}" onclick="roundBt(this.value,this.form,'${vo.per_id}')"><br>
									</c:forEach>
								</div>
							</td>
							<td>
								&nbsp
							</td>
							<td>
								<div id="RemainingSeats" style="border:1px solid #dddddd; height:200px; width:300px;">
							
								
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
		<table  class="table-bordered" style="margin:20px;">
			<tr>
				<th class="chooseTb" style="padding:0 10px;">
				유<br>
				의<br>
				사<br>
				항
				</th>
				<td style="padding:10px;">
					-장애인,국가유공자,학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, 현장에서 증빙서류 미지참 시 차액 지불하셔야 합니다.<br>
					-쿠폰을 사용하더나 복합결제를 한 경우 부분취소가 불가합니다. 고객센터로 문의해주시기 바랍니다.<br>
					-관람 당일 공연 예매 시에는 변경/취소/환불이 불가합니다.<br>
					-경우에 따라 ATM 기기에서 가상계좌 입금이 안 될 수 있으니 가급적 인터넷/폰뱅킹 등을 이용하여주시기 바랍니다.<br>
					-예매 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.<br>
					-예매 취소 시점에 따라 취소수수료가 부과될 수 있습니다. 예매 후 취소마감시간과 함께 취소수수료를 꼭 확인해주시기 바랍니다.<br>
				</td>
			</tr>
		</table>
	</div>

</div>
</body>

</html>