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
	<div class="row mt50">
		<div class="col-md-10">
			<div class="row">

				<div class="col-md-10">
					<div>
					<h2>이벤트</h2>
						<hr>
						<br>
						<c:forEach var="vo" items="${dto}" >
						<h4>${vo.notice_num}</h4>
						<h4>${vo.notice_title}</h4>
							${vo.writeDate}
						<img src="${image}eventList/${vo.notice_image}">
						<h4>${vo.contents}</h4>
						<h4>(* 티켓 소진시까지 진행)</h4>
						<br><br><br>
						</c:forEach>
						
						
					</div>
					
				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
			<div class="col-md-1"></div>

	</div>

</body>
</html>