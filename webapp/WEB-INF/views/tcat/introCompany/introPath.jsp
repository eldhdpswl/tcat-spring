<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tcat 오시는 길</title>

<html>
<head>
<style>
#map {
	height: 690px;
	width: 650px;
}
</style>
</head>
<body>
	<h2>Tcat오시는 길</h2>
	<hr>
	<div>
		<div id="map"
			style="border: 0px solid gold; float: top; width: 90%; height: 450px; padding: 5px;"></div>
		<script>
			function initMap() {
				var uluru = {
					lat : 37.478792,
					lng : 126.878710
				}; //경도와 위도
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 15,
					center : uluru
				});
				var marker = new google.maps.Marker({
					position : uluru,
					map : map
				});
			}
		</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZbdRNew08wI606Kaxf-FDoYOmcW_d2Vk&callback=initMap">
			
		</script>
		<hr>

		<div style="border: 0px solid black; float: bottom; width: 70%; height: 176px; padding: 10px;">

			<div
				style="border: 0px solid black; float: left; width: 48%; padding: 10px;">
				<ul class="direction">
					<li class="fl"><strong class="sub_tit">● 대중교통으로 방문하시는
							경우</strong>
						<ul class="bul_dot">
						<p>
							<li><strong>- 지하철</strong>
								<p>
									6번출구 나오셔서 좌측횡단보도 건너 좌측으로 10m 가시면 삼거리가 나옵니다. <br> 삼거리에서 우측
									방향으로 직진하셔서 사거리 대각선방향에 우리은행 건물 <br> 410호입니다.
								</p></li>
							<li><strong>- 버스</strong></li>
							<p>21, 571, 652, 금천 05[디지털3단지월드벤쳐센터] 정류장에서 하차</p>

						</ul></li>
				</ul>
			</div>
				
			<div
				style="border: 0px solid black; float: right; width: 48%; padding: 10px;">
				<li class="fl"><strong class="sub_tit">● 자가용으로 방문하시는 경우</strong>
					<ul class="bul_dot">
							<p>
						<li>서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전</li>
						<li>가리봉5거리에서 철산방향 수출의 다리를 넘어 첫 사거리(한진사거리)에서 우회전</li>
						<li>남부순황도로 구로IC로 나와 좌회전</li>

					</ul></li>
			</div>
		</div>
		</div>
		<hr>
		
		<br><br>
</body>
</html>