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
/* 0111 현석 */
function load(){
	var result = document.getElementById("result");
	var remain_round=document.all.remain_round.value;
	var msg ="";
	for(var i=0;i<(remain_round*1);i++){
		msg += "<select name='remain_time"+(i+1)+"'>"+
		   "	<option value='/09:00'>(09:00)</option>"+
		   "	<option value='/10:00'>(10:00)</option>"+
		   "	<option value='/11:00'>(11:00)</option>"+
		   "	<option value='/12:00'>(12:00)</option>"+
		   "	<option value='/13:00'>(13:00)</option>"+
		   "	<option value='/14:00'>(14:00)</option>"+
		   "	<option value='/15:00'>(15:00)</option>"+
		   "	<option value='/16:00'>(16:00)</option>"+
		   "	<option value='/17:00'>(17:00)</option>"+
		   "	<option value='/18:00'>(18:00)</option>"+
		   "	<option value='/19:00'>(19:00)</option>"+
		   "	<option value='/20:00'>(20:00)</option>"+
		   "	<option value='/21:00'>(21:00)</option>"+
		   "	<option value='/22:00'>(22:00)</option>"+
	   	   "</select><br>";
	}
	result.innerHTML=msg;
	
}
 function goBack(){
	var remain_round=document.all.remain_round.value;
	var ed="";
	for(var i=0;i<(remain_round*1);i++){
		switch(i){
		case 0:
			var a=document.all.remain_time1.value;
			ed+=(i+1)+"회차"+a;
			break;
		case 1:
			var a=document.all.remain_time2.value;
			ed+=","+(i+1)+"회차"+a;
			break;
		case 2:
			var a=document.all.remain_time3.value;
			ed+=","+(i+1)+"회차"+a;
			break;
		case 3:
			var a=document.all.remain_time4.value;
			ed+=","+(i+1)+"회차"+a;
			break;
		case 4:
			var a=document.all.remain_time5.value;
			ed+=","+(i+1)+"회차"+a;
			break;
		case 5:
			var a=document.all.remain_time6.value;
			ed+=","+(i+1)+"회차"+a;
			break;
		}
		
	}
	opener.document.all.remain_round.value=ed;
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
						<h2>공연회차</h2>

						<p><b>회차[하루간공연회차]</b></p>

						<form action="" method="post">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> 
								<ul>
									<li><select name="remain_round" onchange="load()">
											<option value="0">하루간 공연회차</option>
											<option value="1">1회차</option>
											<option value="2">2회차</option>
											<option value="3">3회차</option>
											<option value="4">4회차</option>
											<option value="5">5회차</option>
											<option value="6">6회차</option>
										</select>
									</li>
									<li>
										<div id="result">
						
										</div>
									</li>
								</ul>
							</div>
							<br/> 
							<input type="button" onclick="goBack();" value="Subscribe Now!" class="btn btn-large" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</body>
</html>