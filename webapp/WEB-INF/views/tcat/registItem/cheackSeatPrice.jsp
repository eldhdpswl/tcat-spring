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
<title>Insert title here</title>
<script type="text/javascript">
function seatPriceCheack(){
	var vip=document.all.vip.value;
	var vip=document.all.vip.value;
	var r=document.all.r.value;
	var s=document.all.s.value;
	var a=document.all.a.value;
	var b=document.all.b.value;
	
	if(!vip){
		alert("VIP석 가격을 입력해주세요!");
		document.all.vip.focus();
		return false;
	}else if(!r){
		alert("R석 가격을 입력해주세요!");
		document.all.r.focus();
		return false;
	}else if(!s){
		alert("S석 가격을 입력해주세요!");
		document.all.s.focus();
		return false;
	}else if(!a){
		alert("A석 가격을 입력해주세요!");
		document.all.a.focus();
		return false;
	}else if(!b){
		alert("B석 가격을 입력해주세요!");
		document.all.b.focus();
		return false;
	}
	var seat="VIP:"+vip+","+"R:"+r+","+"S:"+s+","+"A:"+a+","+"B:"+b;
	opener.document.all.VIP_seatPrice.value=vip;
	opener.document.all.R_seatPrice.value=r;
	opener.document.all.S_seatPrice.value=s;
	opener.document.all.A_seatPrice.value=a;
	opener.document.all.B_seatPrice.value=b;
	opener.document.all.seatPrice.value=seat;
	
	self.close();
}
</script>
</head>
<body>
<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="span12">
					<div class="thumbnail center well well-small text-center">
						<h2>좌석가격 설정</h2>

						<p><b>좌석별[VIP,R,S,A,B]</b></p><br>

						<form action="" method="post" name="seatPriceForm">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> 
								<ul>
									<li>
										VIP 좌석가격 : <input type="text" name="vip">
									</li>
									<li>
										R 석가격 : <input type="text" name="r">
									</li>
									<li>
										S 석가격 : <input type="text" name="s">
									</li>
									<li>
										A 석가격 : <input type="text" name="a">
									</li>
									<li>
										B 석가격 : <input type="text" name="b">
									</li>
								</ul>
							</div>
							<br/> 
							<input type="button" onclick="return seatPriceCheack();" value="확인" class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</body>
</html>