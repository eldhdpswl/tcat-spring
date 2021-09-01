<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<br>
<br>
<div class="row ">
	<div class="panel panel-primary h250" style="width: 90%; margin: 20px">
		<div class="panel-heading">
			<h3 class="panel-title">공연: 카테고리별 판매분석</h3>
		</div>
		<div class="panel-body" style="margin: 0px; width: 100%;">
			<!--mDev 데이터  -->
			<script type="text/javascript">
				var mLabels = new Array; 
				var mData = new Array;
				var sLabels = new Array; 
				var sData = new Array;
			</script>
			<!--중분류  -->
			<c:forEach var="mDev" items="${mDevs}">
				<script type="text/javascript">
					mLabels.push("${mDev.mDev}");
					mData.push(${mDev.sellCnt});
				</script>
			</c:forEach>
			<!--뮤지컬 소분류  -->
			<c:forEach var="sDev" items="${musicals}">
				<script type="text/javascript">
						sLabels.push("${sDev.sDev}");
						sData.push(${sDev.sellCnt});
					</script>
			</c:forEach>
			<!--콘서트 소분류  -->
			<c:forEach var="sDev" items="${concerts}">
				<script type="text/javascript">
						sLabels.push("${sDev.mDev}");
						sData.push(${sDev.sellCnt});
					</script>
			</c:forEach>
			<!--연극 소분류  -->
			<c:forEach var="sDev" items="${dramas}">
				<script type="text/javascript">
						sLabels.push("${sDev.mDev}");
						sData.push(${sDev.sellCnt});
					</script>
			</c:forEach>
			<!--클래식 소분류  -->
			<c:forEach var="sDev" items="${classics}">
				<script type="text/javascript">
						sLabels.push("${sDev.mDev}");
						sData.push(${sDev.sellCnt});
					</script>
			</c:forEach>
	  	<canvas id="chartjs-1" class="chartjs" 
				style="height: 100%; width: 100%;">
			</canvas>
			<script type="text/javascript">
				new Chart(document.getElementById("chartjs-1"),
						{
							"type" : "bar",
							"data" : {
								"labels" : mLabels,
								"datasets" : [ {
									"label" : "공연 카테고리별 판매량",
									"data" : mData,
									"fill" : false,
									"backgroundColor" : [
											"rgba(255, 99, 132, 0.2)",
											"rgba(255, 159, 64, 0.2)",
											"rgba(255, 205, 86, 0.2)",
											"rgba(75, 192, 192, 0.2)",
											"rgba(201, 203, 207, 0.2)" ],
									"borderColor" : [ 	"rgb(255, 99, 132)",
														"rgb(255, 159, 64)",
														"rgb(255, 205, 86)",
														"rgb(75, 192, 192)",
														"rgb(201, 203, 207)" ],
									"borderWidth" : 3
								} ]
							},
							"options" : {
								"scales" : {
									"yAxes" : [ {
										"ticks" : {
											"beginAtZero" : true
										}
									} ]
								}
							}
						});
			</script>
		
		</div>
	</div>
</div>



<div class="row">
	<table class="table table-inbox table-hover fs12px">
		<tbody>
			<c:forEach var="mDev" items="${mDevs }">
				<c:if test="${mDev.rNum<1 }">
					<tr>
				</c:if>
				<c:if test="${mDev.rNum == 1}">
					<tr class="unread">
				</c:if>
				<td class="inbox-small-cells">${mDev.rNum}위</td>
				<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
				<td class="view-message  dont-show"></td>
				<td class="view-message ">${mDev.mDev }</td>
				<td class="view-message  inbox-small-cells"><i
					class="fa fa-paperclip"></i></td>
				<td class="view-message  text-right">판매수량: ${mDev.sellCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br> <br> <br> <br>
</div>
</html>