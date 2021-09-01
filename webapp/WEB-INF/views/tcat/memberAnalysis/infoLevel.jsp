<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	     <%@ include file="../setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${script}Chart.js"></script>
<script type="text/javascript">
   new Chart(document.getElementById("chart_div"),{
      "type":"doughnut",
      "data":{
            "labels":["뮤지컬", "콘서트", "연극", "클래식", "무용/발레","스토어"],
            "datasets":[{   "label":"My First Dataset",
                        "data":[${LevelMusicalCnt},
                     	   ${LevelConcertCnt},
                     	   ${LevelTheatricalCnt},
                     	   ${LevelClassicCnt},
                     	   ${LevelDancingCnt},
                     	   ${LevelStoreCnt}],
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

		<div class="col-md-8">
			<canvas id="chart_div"></canvas>
			<div>
				<table class="table table-striped">
					<tr>
						<th colspan="2" style="background-color:#dddddd" >
							등급별 구매율(등급:${rating})
						</th>
					</tr>
					<tr>
						<th>뮤지컬</th>
						<td>${LevelMusicalCnt}개</td>
					</tr>
					<tr>
						<th>콘서트</th>
						<td>${LevelConcertCnt}개</td>
					</tr>
					<tr>
						<th>연극</th>
						<td>${LevelTheatricalCnt}개</td>
					</tr>
					<tr>
						<th>클래식</th>
						<td>${LevelClassicCnt}개</td>
					</tr>
					<tr>
						<th>무용/발레</th>
						<td>${LevelDancingCnt}개</td>
					</tr>
					<tr>
						<th>스토어</th>
						<td>${LevelStoreCnt}개</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>