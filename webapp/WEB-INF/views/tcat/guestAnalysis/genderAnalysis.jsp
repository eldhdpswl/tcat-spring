<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="col-md-2"><img src="${image}bar/1.png" class="w30p floatR"></div>
		<!-- 연령별 구매량  -->
		<div class="col-md-8">
			<h3>성별 예약분석</h3>
			<div class="progress tm c fs20"  style="background: pink; height: 50px; color:white; ">
				<div class="progress-bar" style=" width:${100*genderData.get('남자')/genderData.get('sum')}%; font-size:100%; line-height: normal;">
				<fmt:formatNumber value="${100*genderData.get('남자')/genderData.get('sum')}" pattern="##.##" />%</div>
				<fmt:formatNumber value="${100*genderData.get('여자')/genderData.get('sum')}" pattern="##.##" />%
			</div>
		</div>
		<div class="col-md-2"><img src="${image}bar/2.png" class="w30p"></div>
	</div>


	<!--초기 -->
	<c:set var="index" value="1" />
	<c:forEach var="genderGenre" items="${genderGenreList}">
		<c:set var="tf"
			value="${genderGenre.get('뮤지컬') + genderGenre.get('무용') +genderGenre.get('콘서트')+genderGenre.get('클래식')+genderGenre.get('연극')}" />
		<c:if test="${tf !=0  }">
			<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
				<!-- 연령별 장르 선호도  -->
				<div class="col-md-6">
					<h3>
						<c:if test="${index==1}">남자 장르 선호도</c:if>
						<c:if test="${index==2}">여자 장르 선호도</c:if>
					</h3>
					<br>
					<canvas id="${index}" class="w100p"></canvas>
					<script type="text/javascript">
						new Chart(document.getElementById(${index}),{
							"type":"doughnut",
							"data":{
									"labels":["뮤지컬", "무용", "콘서트", "클래식", "연극"],
									"datasets":[{	"label":"My First Dataset",
													"data":[${genderGenre.get("뮤지컬")},
															${genderGenre.get("무용")},
															${genderGenre.get("콘서트")},
															${genderGenre.get("클래식")},
															${genderGenre.get("연극")}],
													"backgroundColor":[	"rgb(255, 99, 132)",
																		"rgb(54, 162, 235)",
																		"rgb(255, 205, 86)",
																		"rgb(200, 200, 200)",
																		"rgb(120, 140, 200)"]
												}]
									}
						});
					</script>
				</div>
				
				
				
				
				<!--연령별 선호 작품  -->
				<div class="col-md-6 ">
					<h3>
						<c:if test="${index==1}">남자 선호 작품 TOP5</c:if>
						<c:if test="${index==2}">여자 선호 작품 TOP5</c:if>
					</h3>
					<table class="table table-inbox table-hover fs12px">
						<tbody>
							<c:choose>
								<c:when test="${index==1}">
									<c:forEach var="list" items="${manPerf}">
										<tr class="unread ">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.per_id}</td>
											<td class="view-message ">${list.perf_title}</td>
											<td class="view-message  text-right">판매수량: ${list.cnt}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${index==2}">
									<c:forEach var="list" items="${womanPerf}">
										<tr class="unread">
											<!--상위권  -->
											<td class="inbox-small-cells">${list.rownum}위</td>
											<td class="view-message  dont-show">code: ${list.per_id}</td>
											<td class="view-message ">${list.perf_title}</td>
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