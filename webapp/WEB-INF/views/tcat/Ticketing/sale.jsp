<%@page import="spring.project.tcat.VO.MemberVO"%>
<%@page import="spring.project.tcat.VO.SaleVO"%>
<%@page import="java.util.ArrayList"%>
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

function sale(value){
	$("input[name='sale_div']").val(value);
	var price=$("input[name='price']").val();
	if(value=="학생할인"){//30
		/* 할인구분[sale_div],할인율[sale_rate],총할인금액[totalSale] */
		$("input[name='sale_rate']").val("30%");
		var price2=price*0.7;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="경로할인"){//30
		$("input[name='sale_rate']").val("30%");
		var price2=price*0.7;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="미취학아동"){//50
		$("input[name='sale_rate']").val("50%");
		var price2=price*0.5;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="국가유공자"){//50
		$("input[name='sale_rate']").val("50%");
		var price2=price*0.7;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="소외계층"){//80
		$("input[name='sale_rate']").val("80%");
		var price2=price*0.2;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="저소득층"){//80
		$("input[name='sale_rate']").val("80%");
		var price2=price*0.2;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="VIP"){//25
		$("input[name='sale_rate']").val("25%");
		var price2=price*0.75;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="S"){//20
		$("input[name='sale_rate']").val("20%");
		var price2=price*0.80;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="A"){//15
		$("input[name='sale_rate']").val("15%");
		var price2=price*0.85;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="B"){//10
		$("input[name='sale_rate']").val("10%");
		var price2=price*0.90;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value=="C"){//5
		$("input[name='sale_rate']").val("5%");
		var price2=price*0.95;
		price=(price*1)-(price2*1);
		$("input[name='totalSale']").val(price);
	}else if(value==0){
		$("input[name='sale_rate']").val("0");
		$("input[name='totalSale']").val("0");
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<table class="table">
	<tr class="chooseTb">
		<th>할인 정보 보기</th>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<th>내 등급 : ${mvo.getRating()}</th>
				</tr>
				<tr>
					<th><b>할인정보</b></th>
				</tr>
				<tr>
					<td>
					<table>
						<tr class="chooseTb">
							<th>할인명</th>
							<th>할인율(%)</th>
						</tr>
						<%
							ArrayList<SaleVO> dtos=(ArrayList<SaleVO>)request.getAttribute("dtos");
							MemberVO mvo=(MemberVO)request.getAttribute("mvo");
						for(int i=0;i<dtos.size();i++){
						%>
							<tr>
								<td><%=dtos.get(i).getSale_div()%></td>
								<td><%=dtos.get(i).getSale_rate()%></td>
							</tr>
						<%} %>
					</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="chooseTb">
		<th>할인 선택</th>
	</tr>
	<tr>
		<th>
			<select onchange="sale(this.value);">
			<option value="0">할인선택</option>
			<%
			for(int i=0;i<dtos.size();i++){
				if(i<6){  //위에 공통(할인방법)되는 부분을 보여줌
			%>
				<option value="<%=dtos.get(i).getSale_div()%>"><%=dtos.get(i).getSale_div()%></option>
			<%
				}else if(i>=6&&dtos.get(i).getSale_div().equals(mvo.getRating()))	{			
			%>	
				<option value="<%=dtos.get(i).getSale_div()%>"><%=dtos.get(i).getSale_div()%></option>
			<%}
			}%>
			</select>
		</th>
	</tr>
</table>
</body>
</html>