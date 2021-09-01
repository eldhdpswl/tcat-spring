<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	     <%@ include file="../setting.jsp" %>
<html>
<head>
<script src="${script}Chart.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   new Chart(document.getElementById("chart_div"),{
      "type":"doughnut",
      "data":{
            "labels":["뮤지컬", "콘서트", "연극", "클래식", "무용/발레"],
            "datasets":[{   "label":"My First Dataset",
                        "data":[${placeMusicalCnt},
                     	   ${placeConcertCnt},
                     	   ${placeTheatricalCnt},
                     	   ${placeClassicCnt},
                     	   ${placeDancingCnt}],
                        "backgroundColor":[   "rgb(255, 99, 132)",
                                       "rgb(54, 162, 235)",
                                       "rgb(255, 205, 86)",
                                       "rgb(200, 200, 200)",
                                       "rgb(120, 140, 200)"]
                     }]
            }
   });
</script>

</head>
<body>
<div class="row">

		<div class="col-md-8">
		<canvas id="chart_div"></canvas>
			<div>
				<table class="table table-striped">
					<tr>
						<th colspan="2" style="background-color:#dddddd" >
							장소별 구매율(장소:${place})
						</th>
					</tr>
					<tr>
						<th>뮤지컬</th>
						<td>${placeMusicalCnt}개</td>
					</tr>
					<tr>
						<th>콘서트</th>
						<td>${placeConcertCnt}개</td>
					</tr>
					<tr>
						<th>연극</th>
						<td>${placeTheatricalCnt}개</td>
					</tr>
					<tr>
						<th>클래식</th>
						<td>${placeClassicCnt}개</td>
					</tr>
					<tr>
						<th>무용/발레</th>
						<td>${placeDancingCnt}개</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>