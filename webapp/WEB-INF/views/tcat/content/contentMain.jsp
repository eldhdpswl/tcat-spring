<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.wish {
	border: 0;
	background: none;
	color: white;
	outline: none;
}

.wish.active {
	color: red;
}

/*탭  */
a {
	color: black;
}

.nav-tabs {
	border-bottom: 1.3px solid gray;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border: 1.3px solid gray;
	border-bottom-color: transparent;
	color: black;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var wish = ${wishResult != 0}
		;
		if (wish) {
			$(".wish").addClass("active");
		}
	});
	//탭
	$('#myTab a[href="#profile"]').tab('show');

	//위시리스트 킬릭시
	$(".wish").click(function() {
		var login = ${login_id==null};
		if (login) {
			alert("로그인 후 이용해 주세요.");
			return false;
		} else {
			var per_id = $("#per_id").val();
			var formData = {
				"per_id" : per_id
			};
			var active = $(".wish").hasClass("active");
			if (active) {
				$.ajax({
					type : "POST",
					url : "delWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").removeClass("active");
					},
					error : function() {
						alert("위시리스트 실패하였습니다.");
					}
				});
			} else {
				$.ajax({
					type : "POST",
					url : "addWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").addClass("active");
					},
					error : function() {
						alert("위시리스트 실패하였습니다.");
					}
				});
			}
		}
	});

	$("#login2").click(
			function() {
				$("#modal_result").load(
						"${pageContext.request.contextPath}/memberLogin");
			});
	function payPerformence(url) {
		window.open(url, "confirm", "menubar=no, width=1400, height=830");
	}

	//화면 뿌리기
	function commentList(url) {
		$("#commentList").load("${pageContext.request.contextPath}/" + url);
	}
</script>
</head>
<div class="row">
	<br>
	<!--공백  -->
	<div class="col-md-1"></div>
	<!--내용물  -->
	<div class="col-md-10">
		<!--사이드  -->
		<div class="col-md-2"></div>

		<!--공연정보  -->
		<div class="col-md-9">
			<!--상세페이지 상단  -->
			<div class="col-md-12" style="border: 1px solid lightgrey;">
				<h1>${perf.perf_title}</h1>
				<h5>${perf.mDev}
					- ${perf.sDev}<span class="m10">|</span>${perf.possible_age}세 이상 관람
					가능
				</h5>
			</div>

			<!--사진, 예매, 가격  -->
			<div class="col-md-12"
				style="border-top: 3px solid black; padding: 0;">
				<!--내용  -->
				<div class="col-md-12 bf0f0f0" style="padding: 0;">
					<div class="col-md-9 bffffff"
						style="border: 1px solid lightgrey; padding: 0;">
						<!--사진  -->
						<div class="col-md-4">
							<img src="${image}performance/${perf.perf_Image}" class="p10">
						</div>

						<div class="col-md-8">
							<!--장소  -->
							<div class="row p10">
								<div class="col-md-3">
									<b>장소</b>
								</div>
								<div class="col-md-9">${perf.hall_name}</div>
							</div>
							<div class="row p10">
								<div class="col-md-3">
									<b>기간</b>
								</div>
								<div class="col-md-9">
									<fmt:formatDate value="${perf.startDate }"
										pattern="yyyy년 MM월 dd일" />
									~ <br>
									<fmt:formatDate value="${perf.endDate }"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>
							<div class="row p10" style="border-top: 1px solid grey;">
								<div class="col-md-3 ">
									<b>기본가</b>
								</div>
								<div class="col-md-9">
									<div class="row">
										<div class="col-md-3">VIP</div>
										<div class="col-md-5 r">
											<span class="red"> <fmt:formatNumber
													value="${perf.VIP_seatPrice}" pattern="#,###" /></span>원
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">R</div>
										<div class="col-md-5 r">
											<span class="red"><fmt:formatNumber
													value="${perf.getR_seatPrice()}" pattern="#,###" /></span>원
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">S</div>
										<div class="col-md-5 r">
											<span class="red"><fmt:formatNumber
													value="${perf.getS_seatPrice()}" pattern="#,###" /></span>원
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">A</div>
										<div class="col-md-5 r">
											<span class="red"><fmt:formatNumber
													value="${perf.getA_seatPrice()}" pattern="#,###" /></span>원
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">B</div>
										<div class="col-md-5 r">
											<span class="red"><fmt:formatNumber
													value="${perf.getB_seatPrice()}" pattern="#,###" /></span>원
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--예매  -->
					<div class="col-md-3 " style="padding: 0;">
						<div class="col-md-12 p10">
							<input type="hidden" id="per_id" value="${perf.per_id }">
							<input type="hidden" id="per_id" value="${perf.per_id }">
							<button type="button" class="wish btn-xl">
								<i class="glyphicon glyphicon-heart fs20"></i>
							</button>
							<span>좋아요</span>
						</div>
						<div class="col-md-12">
							<c:if test="${sessionScope.login_id!=null}">
								<input class="btn btn-danger btn-xl w100p" type="button"
									onclick="payPerformence('Ticketing?per_id=${perf.per_id}')"
									value="예매하기">
							</c:if>
							<c:if test="${sessionScope.login_id==null}">
								<input class="btn btn-danger btn-xl w100p" type="button"
									data-toggle="modal" data-target="#login-modal" id="login2"
									value="예매하기">
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 h21"></div>
			<!--하단  -->
			<div class="col-md-12" style="padding: 0;">
				<!--탭  -->
				<div class="col-md-12" style="padding: 0;">

					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#content"
							aria-controls="home" role="tab" data-toggle="tab">상세정보</a></li>
						<li role="presentation"><a href="#review"
							aria-controls="profile" role="tab" data-toggle="tab"
							onclick="commentList('watchLatter?per_id=${perf.per_id}');">관람후기</a></li>
						<li role="presentation"><a href="#cancelInfo"
							aria-controls="messages" role="tab" data-toggle="tab">취소/환불안내</a></li>
					</ul>
				</div>
				<div class="col-md-12 h25"></div>
			</div>
			<div class="col-md-12" style="padding: 0;">
				<!--상세내용  -->
				<div class="col-md-9 bffffff" style="padding: 0;">
					<!--출력 내용  -->
					<div class="col-md-12" style="padding: 0;">
						<div class="tab-content">
							<!--상세정보  -->
							<div role="tabpanel" class="tab-pane active" id="content">
								<div class="col-md-12"
									style="padding: 0; border-bottom: 1px solid grey">
									<h5>
										<i class="glyphicon glyphicon-play"></i> 공연상세내용
									</h5>
								</div>
								<div class="col-md-12" style="padding: 0;">
									<br>
									<pre>${perf.per_ex }</pre>
								</div>
								<div class="col-md-12"
									style="padding: 0; border-bottom: 1px solid grey">
									<h5>
										<i class="glyphicon glyphicon-play"></i> 공연상세정보
									</h5>
								</div>
								<div class="col-md-12" style="padding: 0;">
									<img src="${image }performance/${perf.getDetail_Image()}"
										class="w100p">
								</div>
							</div>
							<!--관람후기  -->
							<div role="tabpanel" class="tab-pane" id="review">
								<div class="col-md-15" id="commentList"></div>
							</div>

							<!--취소환불 안내  -->
							<div role="tabpanel" class="tab-pane" id="cancelInfo">
								<img src="${image}content/refundPage.jpg">
							</div>
						</div>
					</div>
				</div>

				<!--성별 구매율-->
				<div class="col-md-3 " style="padding: 0;">
					<div class="col-md-11 c"
						style="border: 1px solid lightgrey; margin-left: 10px; padding: 0">
						<h5>성별예매율</h5>
						<div class="progress"
							style="background-color: pink; margin: 0; font-size: 12px; line-height: 20px; color: #fff;">
							<div class="progress-bar" role="progressbar" aria-valuenow="60"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${100*genderData.get('남자')/genderData.get('총합')}%;">
								<fmt:formatNumber
									value="${100*genderData.get('남자')/genderData.get('총합')}"
									pattern="##.##" />
								%
							</div>
							<fmt:formatNumber
								value="${100*genderData.get('여자')/genderData.get('총합')}"
								pattern="##.##" />
							%
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="color: #337ab7">남자</div>
							<div class="col-md-6" style="color: pink">여자</div>
						</div>
					</div>
				</div>

				<!--연령별 구매율-->
				<div class="col-md-3 " style="padding: 10px 0;">
					<div class="col-md-11 c"
						style="border: 1px solid lightgrey; margin-left: 10px; padding: 0">
						<div class="col-md-12 l" style="padding: 0;">
							<div class="col-md-12 c"
								style="background-color: lightgrey; padding: 0;">
								<h5>연령별 예매율</h5>
								<c:set var="sum"
									value="${ageData.get('10대')+ageData.get('20대')+ageData.get('30대')+ageData.get('40대')+ageData.get('50대 이상')}" />
							</div>
							10대
							<div class="progress">
								<div
									class="progress-bar progress-bar-success progress-bar-striped"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width: ${100*ageData.get('10대')/sum}%">
									<fmt:formatNumber value="${100*ageData.get('10대')/sum}"
										pattern="##.##" />
									%
								</div>
							</div>
							20대
							<div class="progress">
								<div class="progress-bar progress-bar-info " role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: ${100*ageData.get('20대')/sum}%">
									<fmt:formatNumber value="${100*ageData.get('20대')/sum}"
										pattern="##.##" />
									%
								</div>
							</div>
							30대
							<div class="progress">
								<div class="progress-bar progress-bar-warning "
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100"
									style="width: ${100*ageData.get('30대')/sum}%">
									<fmt:formatNumber value="${100*ageData.get('30대')/sum}"
										pattern="##.##" />
									%
								</div>
							</div>
							40대
							<div class="progress">
								<div class="progress-bar progress-bar-danger "
									role="progressbar" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100"
									style="width: ${100*ageData.get('40대')/sum}%">
									<fmt:formatNumber value="${100*ageData.get('40대')/sum}"
										pattern="##.##" />
									%
								</div>
							</div>
							50대 이상
							<div class="progress">
								<div class="progress-bar pprogress-bar-striped"
									role="progressbar" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100"
									style="width: ${100*ageData.get('50대 이상')/sum}%">
									<fmt:formatNumber value="${100*ageData.get('50대 이상')/sum}"
										pattern="##.##" />
									%
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<!--공백  -->
		<div class="col-md-1"></div>
	</div>
	<br>
	<!--공백  -->
	<div class="col-md-1"></div>
</div>
</html>