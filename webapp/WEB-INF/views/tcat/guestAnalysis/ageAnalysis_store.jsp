<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${script}Chart.js"></script>
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row h20"></div>
<div class="row">

	<div class="col-md-12">
		<div class="col-md-2"></div>
		<!-- 연령별 구매량  -->
		<div class="col-md-8">
			<h3>연령별 스토어 구매분석</h3>
			<canvas id="ageTicketingCnt" class="w10p"></canvas>
			<script>
				var ctx = document.getElementById("ageTicketingCnt");
				var ageTicketingCnt = new Chart(ctx, {
					type : 'radar',
					data : {
						labels : [ "10대", "20대", "30대", "40대", "50대 이상" ],
						datasets : [ {
							label : '연령별 총 판매량',
							data : [ ${ageData.get("10대")}, ${ageData.get("20대")}, ${ageData.get("30대")}, ${ageData.get("40대")}, ${ageData.get("50대")} ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)'],
							borderColor : [ 'rgba(255,99,132,1)'],
							borderWidth : 3
						} ]
					},
					options : {
						scales : {
						}
					}
				});
			</script>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!--초기 -->
	<c:set var="index" value="1" />
	<c:forEach var="ageGenre" items="${ageGenreList}">
		<c:set var="tf"



			value="${ageGenre.get('뮤지컬OST') + ageGenre.get('콘서트LIVE') +ageGenre.get('클래식LIVE')+ageGenre.get('전시컬렉션')}" />
		<c:if test="${tf !=0  }">
			<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
				<!-- 연령별 장르 선호도  -->
				<div class="col-md-6">
					<h3>${index}0대이상 구매 분야 선호도</h3>
					<br>
					<canvas id="${index}" class="w100p"></canvas>
					<script type="text/javascript">
						new Chart(document.getElementById(${index}),{
							"type":"doughnut",
							"data":{
									"labels":["뮤지컬OST", "전시컬렉션", "콘서트LIVE", "클래식LIVE"],
									"datasets":[{	"label":"My First Dataset",
													"data":[${ageGenre.get("뮤지컬OST")},
															${ageGenre.get("전시컬렉션")},
															${ageGenre.get("콘서트LIVE")},
															${ageGenre.get("클래식LIVE")}],
													"backgroundColor":[	"rgb(255, 99, 132)",
																		"rgb(54, 162, 235)",
																		"rgb(255, 205, 86)",
																		"rgb(120, 140, 200)"]
												}]
									}
						});
					</script>
				</div>
				<!--연령별 선호 작품  -->
				<div class="col-md-6 ">
					<h3>${index}0대이상 스토어 TOP10</h3>
					<table class="table table-inbox table-hover fs12px">
						<tbody>
							<c:choose>
								<c:when test="${index==1}">

									<c:forEach var="list" items="${agePerf10}">
										<tr class="unread ">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.disc_code}</td>
											<td class="view-message ">${list.disc_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${index==2}">
									<c:forEach var="list" items="${agePerf20}">
										<tr class="unread">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.disc_code}</td>
											<td class="view-message ">${list.disc_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>
								</c:when>

								<c:when test="${index==3}">
									<c:forEach var="list" items="${agePerf30}">
										<tr class="unread">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.disc_code}</td>
											<td class="view-message ">${list.disc_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${index==4}">
									<c:forEach var="list" items="${agePerf40}">
										<tr class="unread">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.disc_code}</td>
											<td class="view-message ">${list.disc_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${index==5}">
									<c:forEach var="list" items="${agePerf50}">
										<tr class="unread">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.disc_code}</td>
											<td class="view-message ">${list.disc_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>

								</c:when>
							</c:choose>
						</tbody>
					</table>

				</div>
			</div>

		</c:if>
		<c:set var="index" value="${index+1 }" />
	</c:forEach>
	<br>



</div>
</html>