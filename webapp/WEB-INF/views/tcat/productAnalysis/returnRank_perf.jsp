<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${script}Chart.js"></script>
</head>
<br>
<br>
<div class="row">
	<div class="panel panel-primary" style="width:90%; margin:20px" >
    <div class="panel-heading">
  	<h3 class="panel-title">
  		공연: 환불순위(상위 5위)
    </h3>    
  </div>     
	<div class="panel-body"  style="margin:0px; width:100%;">
	  	<canvas id="chartjs-1" class="chartjs" width="800" height="400"
				style="display: block; height: 320px; width: 640px;">
			</canvas>
			<script type="text/javascript">
				var labels = new Array; 
				var data  = new Array;
			</script>
			<c:forEach var="rank" items="${ranks}" begin="0" end="4">
				<script type="text/javascript">
					labels.push("code.${rank.per_id}");
					data.push(${rank.sellCnt});
				</script>
			</c:forEach>
			<script type="text/javascript">
				new Chart(document.getElementById("chartjs-1"),
						{
							"type" : "bar",
							"data" : {
								"labels" : labels,
								"datasets" : [ {
									"label" : "예매취소 Top5",
									"data" : data,
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
<table class="table table-inbox table-hover fs12px">
	<tbody>
	<c:forEach var="rank" items="${ranks }">
		<c:if test="${rank.rNum > 5 }"><tr onclick="detailOpen('performance','${rank.per_id}')"></c:if>
		<c:if test="${rank.rNum <= 5 }"><tr class="unread" onclick="detailOpen('performance','${rank.per_id}')"></c:if>
			<!--상위권  -->
			<td class="inbox-small-cells">${rank.rNum}위</td>
			<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
			<!--빈칸  -->
			<td class="view-message  dont-show">code: ${rank.per_id }</td>
			<td class="view-message ">${rank.perf_title }</td>
			<td class="view-message  inbox-small-cells"><i
				class="fa fa-paperclip"></i></td>
			<td class="view-message  text-right">판매수량: ${rank.sellCnt}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="row">
	<c:if test="${productNum<allCnt }">
	<a onclick="perf_load('returnRank_perf?showNum=${productNum}')">10건 더보기 ( ${productNum}/${allCnt} )</a>
	</c:if>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</html>