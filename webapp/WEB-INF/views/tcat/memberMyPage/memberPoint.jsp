<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body class="b400040">
<c:set var="image" value="/tcat/resources/image/"/>

	
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-10">
					<div>
					<h2>포인트</h2>
					<hr>
					<br>
					<img src="${image}memberPoint/log1.png"  width="100%" height="60%">
					<img src="${image}memberPoint/log2.png"  width="100%" height="60%">
					</div>

					<div class=" bff3333">
					
					<center class=" ffffff fs18"><%=request.getSession().getAttribute("login_id") %></center>
					<center class=" ffffff fs25">${Rating}등급</center>
					<center class="ffffff fs18">총 구매횟수 ${cnt}회</center>
					<div class="b333366">
					<c:if test="${Rating.equals('VIP')}">
						<h4><center></center></h4>
					</c:if>
					<c:if test="${!Rating.equals('VIP')}">
						<h2><center class=" ffffff fs25">다음 등급은 ${nextRating}등급입니다</center></h2>
					</c:if>
  					</div>
					</div>
					<br>
					
					<div>
						<c:if test="${Rating.equals('A')}">
						
						<center class="  fs18">1년안에 10회 구매시 등급업</center>
						<center class=" fs18 ">등급기간</center>
						<center class=" fs18">${yesterDayStr} ~ ${todayStr}</center>
						<center class=" red fs18 ">이번년도 구매횟수 ${sRank}회</center>
					</c:if>
					
					<c:if test="${Rating.equals('S')}">
						
						<center class=" fs18px">1년안에 20회 구매시 등급업</center>
						<center class=" fs18px">등급기간</center>
						<center class=" fs18px">${yesterDayStr} ~ ${todayStr}</center>
						<center class=" red fs18px">이번년도 구매횟수 ${sRank}회</center>
					</c:if>
					<c:if test="${Rating.equals('VIP')}">
						<center class=" red fs18px">이번년도 구매횟수 ${vRank}회</center>
					</c:if>
					<div class="progress">
  					<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:${p}%" >
  					${p}%
  					</div>
					</div>
				</div>
					
					<br>
					
  					<br>
					<img src="${image}memberPoint/log3.png"  width="100%" height="60%">

				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
			<div class="col-md-1"></div>

</body>
</html>