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
		<div class="col-md-12 h21"></div>
		<div class="col-md-12 h25"><h4><b>매출 집계</b></h4></div>
		<div class="col-md-12 h21"></div>
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">월별 판매개수</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="monthCount" class="w100p"></canvas>
		</div>
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">월별 토탈 판매금액</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="monthPrice" class="w100p"></canvas>
		</div>
		<div class="col-md-12 h25"></div>
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">주별 판매개수</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="weekCount" class="w100p"></canvas>
		</div>
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">주별 토탈 판매금액</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="weekPrice" class="w100p"></canvas>
		</div>
		<div class="col-md-12 h25"></div>
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">일별 판매개수</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="dayCount" class="w100p"></canvas>
		</div>
		
		<div class="col-md-6">
			<div class="col-md-12 h21"><h6 class="trgothic">일별 토탈 판매금액</h6> </div>
			<div class="col-md-12 h21"></div>
			<canvas id="dayPrice" class="w100p"></canvas>
		</div>
		
	</div>
			<script type="text/javascript">
				var mlabels=new Array;
				var mdata=new Array;
				var mdata1=new Array;
				var mdata2=new Array;
				var wlabels=new Array;
				var wdata=new Array;
				var wdata1=new Array;
				var wdata2=new Array;
				var labels=new Array;
				var data=new Array;
				var data1=new Array;
				var data2=new Array;
			</script>
			<c:forEach var="vo" items="${monDtos}">
			<script type="text/javascript">
				mlabels.push("${vo.buyDate}");
				mdata.push("${vo.perCount}");
				mdata1.push("${vo.storeCount}");
				mdata2.push("${vo.totalPrice}");
			</script>
			</c:forEach>
			<c:forEach var="vo" items="${weekDtos}">
			<script type="text/javascript">
				wlabels.push("${vo.buyDate}");
				wdata.push("${vo.perCount}");
				wdata1.push("${vo.storeCount}");
				wdata2.push("${vo.totalPrice}");
			</script>
			</c:forEach>
			<c:forEach var="vo" items="${ddtos}">
			<script type="text/javascript">
				labels.push("${vo.buyDate}");
				data.push("${vo.perCount}");
				data1.push("${vo.storeCount}");
				data2.push("${vo.totalPrice}");
			</script>
			</c:forEach>
			
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
            
            
            new Chart(document.getElementById("weekCount"),
                    {
                       "type" : "line",
                       "data" : {
                          "labels" : wlabels,
                          "datasets" : [ {
                             "label" : "주별 공연 상품 판매개수",
                             "data" : wdata,
                             "fill" : false,
                             "backgroundColor" : [
                                   "rgba(201, 203, 207, 0.2)" ],
                             "borderColor" : [    "rgb(255, 99, 132)"],
                             "borderWidth" : 3
                          },
                          {
                              "label" : "주별 스토어 상품 판매개수",
                              "data" : wdata1,
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
            
              new Chart(document.getElementById("weekPrice"),
                      {
                         "type" : "bar",
                         "data" : {
                            "labels" : wlabels,
                            "datasets" : [ {
                               "label" : "주별 상품 판매금액",
                               "data" : wdata2,
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
            
              new Chart(document.getElementById("dayCount"),
                      {
                         "type" : "line",
                         "data" : {
                            "labels" : labels,
                            "datasets" : [ {
                               "label" : "일별 공연 상품 판매개수",
                               "data" : data,
                               "fill" : false,
                               "backgroundColor" : [
                                     "rgba(201, 203, 207, 0.2)" ],
                               "borderColor" : [    "rgb(255, 99, 132)"],
                               "borderWidth" : 3
                            },
                            {
                                "label" : "일별 스토어 상품 판매개수",
                                "data" : data1,
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
              
                new Chart(document.getElementById("dayPrice"),
                        {
                           "type" : "bar",
                           "data" : {
                              "labels" : labels,
                              "datasets" : [ {
                                 "label" : "일별 상품 판매금액",
                                 "data" : data2,
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