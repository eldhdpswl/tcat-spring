<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}Chart.js"></script>
<script type="text/javascript">
   new Chart(document.getElementById("chart_div"),{
      "type":"doughnut",
      "data":{
            "labels":["뮤지컬", "콘서트", "연극", "클래식", "무용/발레","스토어"],
            "datasets":[{   "label":"My First Dataset",
                        "data":[${MonthMusicalCnt},
                     	   ${MonthConcertCnt},
                     	   ${MonthTheatricalCnt},
                     	   ${MonthClassicCnt},
                     	   ${MonthDancingCnt},
                     	   ${MonthStoreCnt}],
                        "backgroundColor":[   "rgb(255, 99, 132)",
                                       "rgb(54, 162, 235)",
                                       "rgb(255, 205, 86)",
                                       "rgb(200, 200, 200)",
                                       "rgb(152, 554, 152)",
                                       "rgb(120, 140, 200)"]
                     }]
            }
   });
  new Chart(document.getElementById("chart_div2"),{
	      "type":"doughnut",
	      "data":{
	            "labels":["뮤지컬", "콘서트", "연극", "클래식", "무용/발레","스토어"],
	            "datasets":[{   "label":"My First Dataset",
	                        "data":[${dayMusicalCnt},
	                     	   ${dayConcertCnt},
	                     	   ${dayTheatricalCnt},
	                     	   ${dayClassicCnt},
	                     	   ${dayDancingCnt},
	                     	   ${dayStoreCnt}],
	                        "backgroundColor":[   "rgb(255, 99, 132)",
	                                       "rgb(54, 162, 235)",
	                                       "rgb(255, 205, 86)",
	                                       "rgb(200, 200, 200)",
	                                       "rgb(152, 554, 152)",
	                                       "rgb(120, 140, 200)"]
	                     }]
	            }
	   }); 
</script>
</head>
<body>
	<div class="row">

		<div class="col-md-6">
			
			<canvas id="chart_div"></canvas>
			<div>
				<table class="table table-striped">
					<tr>
						<th colspan="2" style="background-color:#dddddd" >
							월간 카테고리별 구매율(${monS}~${monE})
						</th>
					</tr>
					<tr>
						<th>뮤지컬</th>
						<td>${MonthMusicalCnt}개</td>
					</tr>
					<tr>
						<th>콘서트</th>
						<td>${MonthConcertCnt}개</td>
					</tr>
					<tr>
						<th>연극</th>
						<td>${MonthTheatricalCnt}개</td>
					</tr>
					<tr>
						<th>클래식</th>
						<td>${MonthClassicCnt}개</td>
					</tr>
					<tr>
						<th>무용/발레</th>
						<td>${MonthDancingCnt}개</td>
					</tr>
					<tr>
						<th>스토어</th>
						<td>${MonthStoreCnt}개</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-md-6">
			<canvas id="chart_div2"></canvas>
			<div>
				<table class="table table-striped">
					<tr>
						<th colspan="2" style="background-color:#dddddd" >
							일간 카테고리별 구매율(${date})
						</th>
					</tr>
					<tr>
						<th>뮤지컬</th>
						<td>${dayMusicalCnt}개</td>
					</tr>
					<tr>
						<th>콘서트</th>
						<td>${dayConcertCnt}개</td>
					</tr>
					<tr>
						<th>연극</th>
						<td>${dayTheatricalCnt}개</td>
					</tr>
					<tr>
						<th>클래식</th>
						<td>${dayClassicCnt}개</td>
					</tr>
					<tr>
						<th>무용/발레</th>
						<td>${dayDancingCnt}개</td>
					</tr>
					<tr>
						<th>스토어</th>
						<td>${dayStoreCnt}개</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>