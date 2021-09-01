<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${script}Chart.js"></script>
		
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>		
		<div class="col-md-10 c">
			<br>
				<h4><b>월별 결산</b></h4>
				<hr>		
		<div class="col-md-12 h21"><h6 class="trgothic">월별 판매개수</h6> </div>
		<div class="col-md-12 h21"></div>
		<canvas id="monthCount" class="w100p"></canvas>
		<div class="col-md-12 h21"></div>
		<div class="col-md-12 h21"><h6 class="trgothic">월별 토탈 판매금액</h6> </div>
		<div class="col-md-12 h21"></div>
		<canvas id="monthPrice" class="w100p"></canvas>
		<br>
		<table class="table table-hover table-bordered table-condensed c fs11">
			<tr class="bg-primary">
				<td><b>날짜</b></td>
				<td><b>공연판매횟수</b></td>
				<td><b>공연판매금액</b></td>
				<td><b>스토어판매횟수</b></td>
				<td><b>스토어판매금액</b></td>
				<td><b>총판매금액</b></td>
			</tr>
			<script type="text/javascript">
				var mlabels=new Array;
				var mdata=new Array;
				var mdata1=new Array;
				var mdata2=new Array;
			</script>
			<c:forEach var="vo" items="${monDtos}">
			<script type="text/javascript">
				mlabels.push("${vo.buyDate}");
				mdata.push("${vo.perCount}");
				mdata1.push("${vo.storeCount}");
				mdata2.push("${vo.totalPrice}");
			</script>
			<tr>			
				<td>${vo.buyDate}</td>
				<td>${vo.perCount}</td>
				<td>${vo.perPrice}</td>
				<td>${vo.storeCount}</td>
				<td>${vo.storePrice}</td>
				<td>${vo.totalPrice}</td>
			</tr>
			</c:forEach>

		</table>
		</div>
		<div class="col-md-1"></div>		
	</div>


</div>
	<script type="text/javascript">
            new Chart(document.getElementById("monthCount"),
                  {
                     "type" : "line",
                     "data" : {
                        "labels" : mlabels,
                        "datasets" : [ {
                           "label" : "월별 공연 상품 판매개수",
                           "data" : mdata,
                           "fill" : false,
                           "backgroundColor" : [
                                 "rgba(201, 203, 207, 0.2)" ],
                           "borderColor" : [    "rgb(255, 99, 132)"],
                           "borderWidth" : 3
                        },
                        {
                            "label" : "월별 스토어 상품 판매개수",
                            "data" : mdata1,
                            "fill" : false,
                            "backgroundColor" : [
                                  "rgba(201, 203, 207, 0.2)" ],
                            "borderColor" : [    "rgb(201, 203, 207)" ],
                            "borderWidth" : 3
                         }]
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
          
            new Chart(document.getElementById("monthPrice"),
                    {
                       "type" : "bar",
                       "data" : {
                          "labels" : mlabels,
                          "datasets" : [ {
                             "label" : "월별 상품 판매금액",
                             "data" : mdata2,
                             "fill" : false,
                             "backgroundColor" : [
                                   "rgba(255, 99, 132, 0.2)",
                                   "rgba(255, 159, 64, 0.2)",
                                   "rgba(255, 205, 86, 0.2)",
                                   "rgba(75, 192, 192, 0.2)",
                                   "rgba(201, 203, 207, 0.2)" ],
                             "borderColor" : [    "rgb(255, 99, 132)",
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
</body>
</html>