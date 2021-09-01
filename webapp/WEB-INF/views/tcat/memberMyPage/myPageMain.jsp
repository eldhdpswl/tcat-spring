<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
/* USER PROFILE PAGE */
.card {
	padding: 30px;
	background-color: rgba(214, 224, 226, 0.2);
	-webkit-border-top-left-radius: 5px;
	-moz-border-top-left-radius: 5px;
	border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-top-right-radius: 5px;
	border-top-right-radius: 5px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.card.hovercard {
	position: relative;
	padding-top: 0;
	overflow: hidden;
	text-align: center;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 1);
}

.card.hovercard .card-background {
	height: 130px;
}

.card-background img {
	-webkit-filter: blur(25px);
	-moz-filter: blur(25px);
	-o-filter: blur(25px);
	-ms-filter: blur(25px);
	filter: blur(25px);
	margin-left: -100px;
	margin-top: -200px;
	min-width: 130%;
}

.card.hovercard .useravatar {
	position: absolute;
	top: 15px;
	left: 0;
	right: 0;
}

.card.hovercard .useravatar img {
	width: 100px;
	height: 100px;
	max-width: 100px;
	max-height: 100px;
}

.card.hovercard .card-info {
	position: absolute;
	bottom: 14px;
	left: 0;
	right: 0;
}

.card.hovercard .card-info .card-title {
	padding: 0 5px;
	font-size: 20px;
	line-height: 1;
	color: #262626;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.card.hovercard .card-info {
	overflow: hidden;
	font-size: 12px;
	line-height: 20px;
	color: #737373;
	text-overflow: ellipsis;
}

.card.hovercard .bottom {
	padding: 0 20px;
	margin-bottom: 17px;
}

/* 배송조회  */
.btn-default.active {
	background-color: #ff3333;
	color: white;
}

.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 100%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}
</style>


<script type="text/javascript">
	$(function() {
		$("a[href='#step1']").click(function(e) {
			for (var i = 1; i <= 5; i++) {
				$("a[href='#step" + i + "']").removeClass('active');
			}
			$(this).addClass('active');
		});
		$("a[href='#step2']").click(function(e) {
			for (var i = 1; i <= 5; i++) {
				$("a[href='#step" + i + "']").removeClass('active');
			}
			$(this).addClass('active');
		});
		$("a[href='#step3']").click(function(e) {
			for (var i = 1; i <= 5; i++) {
				$("a[href='#step" + i + "']").removeClass('active');
			}
			$(this).addClass('active');
		});
		$("a[href='#step4']").click(function(e) {
			for (var i = 1; i <= 5; i++) {
				$("a[href='#step" + i + "']").removeClass('active');
			}
			$(this).addClass('active');
		});
		$("a[href='#step5']").click(function(e) {
			for (var i = 1; i <= 5; i++) {
				$("a[href='#step" + i + "']").removeClass('active');
			}
			$(this).addClass('active');
		});

	});
	//결제취소
	function buyCancel(disc_num){
		var bool = confirm("결제취소 하시겠습니까?");
		if(bool){//결제취소
			load("buyCancel?disc_num="+disc_num);
		}
	}
	//환불요청
	function perfRefund(disc_num){
		var bool = confirm("환불요청 하시겠습니까?");
		if(bool){//결제취소
			load("perfRefund?disc_num="+disc_num);
		}
	}
	//교환요청
	function perfChange(disc_num){
		var bool = confirm("교환요청 하시겠습니까?");
		if(bool){//결제취소
			load("perfChange?disc_num="+disc_num);
		}
	}
</script>
</head>

<!--  회원등급  -->
<div class="row">
	<!--  -->
	<div class="col-lg-12 col-sm-12" style="padding: 0;">
		<div class="card hovercard">
			<div class="row h25"></div>
			<div class="card-background">
				<img class="card-bkimg" alt=""
					src="${image}memberRatingIcon/${myPageInfo.getRating()}.png">
			</div>
			<div class="useravatar">
				<img alt=""
					src="${image}memberRatingIcon/${myPageInfo.getRating()}.png">
			</div>
			<div class="card-info">
				<span class="card-title">${myPageInfo.member_id}님의 회원등급</span> <br>
			</div>
		</div>

		<div class=" btn-group btn-group-justified btn-group-lg" role="group">
			<div class="btn-group" role="group">
				<div class="w100p c pt3" style="border: solid 1px #d0d0d0">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<div class="hidden-xs">포인트: ${myPageInfo.point }p</div>
				</div>
			</div>
			<div class="btn-group" role="group">
				<div class="w100p c pt3" style="border: solid 1px #d0d0d0">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
					<div class="hidden-xs">${myPageInfo.member_email }</div>
				</div>
			</div>
			<div class="btn-group" role="group">
				<div class="w100p c pt3" style="border: solid 1px #d0d0d0;">
					<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
					<div class="hidden-xs">${myPageInfo.member_hp}</div>
				</div>
			</div>
		</div>

	</div>
	<!--  -->
</div>






<br>
<!--  배송정보  -->
<div class="row" style="border: 1px solid #d0d0d0">
	<div class="col-sm-12 c">
		<h2>배송정보</h2>
	</div>
	<div class="stepwizard">
		<div class="stepwizard-row">
			<div class="stepwizard-step w18p">
				<a class="btn btn-default btn-circle " data-toggle="tab"
					href="#step1">${step1}</a>
				<p>결제</p>
			</div>

			<div class="stepwizard-step">
				<h3>></h3>
			</div>

			<div class="stepwizard-step w18p">
				<a class="btn btn-default btn-circle" data-toggle="tab"
					href="#step2">${step2}</a>
				<p>구매승인</p>
			</div>

			<div class="stepwizard-step">
				<h3>></h3>
			</div>

			<div class="stepwizard-step w18p">
				<a class="btn btn-default btn-circle" data-toggle="tab"
					href="#step3">${step3}</a>
				<p>상품준비</p>
			</div>

			<div class="stepwizard-step">
				<h3>></h3>
			</div>

			<div class="stepwizard-step w18p">
				<a class="btn btn-default btn-circle" data-toggle="tab"
					href="#step4">${step4}</a>
				<p>배송 중</p>
			</div>

			<div class="stepwizard-step">
				<h3>></h3>
			</div>

			<div class="stepwizard-step w18p">
				<a class="btn btn-default btn-circle" data-toggle="tab"
					href="#step5">${step5}</a>
				<p>배송완료</p>
			</div>
		</div>
	</div>
</div>
<!--배송정보 ajax-->
<div class="row" style="border: 1px solid #d0d0d0">





	<div class="tab-content">
		<div class="tab-pane fade in active c"
			style="background-color: #f0f0f0">
			<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
			클릭하시면 상세내역이 나옵니다.
		</div>


		<!--결제 탭 노출  -->
		<div class="tab-pane fade in" id="step1">
			<!--  리스트 시작 -->
			<div class="list-group">
				<!--결제완료  -->
				<c:if test="${listStep1.size()==0}">
					<div class="c h70 pt30">결제완료인 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="list" items="${listStep1 }">
					<div class="col-md-12 h10"></div>
					<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
						<div class="media col-md-2 ">
							<div>주문번호: ${list.disc_num}</div>
							<figure class="pull-left"> <img
								class="media-object img-rounded img-responsive"
								src="${image }store/${list.disc_image}"> </figure>
						</div>
						<div class="col-md-8 h100p">
							<br>
							<div class="col-md-12">
								<h4 class="list-group-item-heading">${list.disc_title}</h4>
							</div>
							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">결제날짜:</div>
								<div class="col-md-8">
									<fmt:formatDate value="${list.disc_buyDate}"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>

							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">배송지:</div>
								<div class="col-md-8">${list.del_addr }</div>
							</div>

							<div class="list-group-item-text col-md-12" style="color: red;">결제완료</div>
						</div>
						<div class="col-md-2 text-center">
							<br>
							<div>
								<input class="btn btn-danger btn-xl w80p" type="button"
									onclick="buyCancel(${list.disc_num})" value="결제취소">
							</div>
							<h2>
								${list.disc_price*list.buy_count }<small> 원 </small>
							</h2>
						</div>
						<div class="col-md-12 h18"></div>
					</div>
				</c:forEach>
			</div>
			<!--리스트 끝  -->
		</div>


		<div class="tab-pane fade" id="step2">
			<!--  리스트 시작 -->
			<div class="list-group">
				<c:if test="${listStep2.size()==0}">
					<div class="c h70 pt30">구매승인 중인 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="list" items="${listStep2 }">
					<div class="col-md-12 h10"></div>
					<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
						<div class="media col-md-2 ">
							<div>주문번호: ${list.disc_num}</div>
							<figure class="pull-left"> <img
								class="media-object img-rounded img-responsive"
								src="${image }store/${list.disc_image}"> </figure>
						</div>
						<div class="col-md-8 h100p">
							<br>
							<div class="col-md-12">
								<h4 class="list-group-item-heading">${list.disc_title}</h4>
							</div>
							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">구입날짜:</div>
								<div class="col-md-8">
									<fmt:formatDate value="${list.disc_buyDate}"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>

							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">배송지:</div>
								<div class="col-md-8">${list.del_addr }</div>
							</div>

							<div class="list-group-item-text col-md-12" style="color: red;">구매승인</div>
						</div>
						<div class="col-md-2 text-center">
							<br>
							<div>
								<input class="btn btn-danger btn-xl w80p" type="button"
									onclick="perfRefund(${list.disc_num})" value="환불요청">
							</div>
							<h2>
								${list.disc_price*list.buy_count }<small> 원 </small>
							</h2>
						</div>
						<div class="col-md-12 h18"></div>
					</div>
				</c:forEach>
			</div>
			<!--리스트 끝  -->
		</div>
		<div class="tab-pane fade" id="step3">
			<!--  리스트 시작 -->
			<div class="list-group">
				<c:if test="${listStep3.size()==0}">
					<div class="c h70 pt30">상품준비 중인 상품이 없습니다.</div>
				</c:if>

				<c:forEach var="list" items="${listStep3 }">
					<div class="col-md-12 h10"></div>
					<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
						<div class="media col-md-2 ">
							<div>주문번호: ${list.disc_num}</div>
							<figure class="pull-left"> <img
								class="media-object img-rounded img-responsive"
								src="${image }store/${list.disc_image}"> </figure>
						</div>
						<div class="col-md-8 h100p">
							<br>
							<div class="col-md-12">
								<h4 class="list-group-item-heading">${list.disc_title}</h4>
							</div>
							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">구입날짜:</div>
								<div class="col-md-8">
									<fmt:formatDate value="${list.disc_buyDate}"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>

							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">배송지:</div>
								<div class="col-md-8">${list.del_addr }</div>
							</div>

							<div class="list-group-item-text col-md-12" style="color: red;">상품준비
								중</div>
						</div>
						<div class="col-md-2 text-center">
							<br>
							<div>
								<input class="btn btn-danger btn-xl w80p" type="button"
									onclick="perfRefund(${list.disc_num})" value="환불요청">
							</div>
							<h2>
								${list.disc_price*list.buy_count }<small> 원 </small>
							</h2>
						</div>
						<div class="col-md-12 h18"></div>
					</div>
				</c:forEach>
			</div>
			<!--리스트 끝  -->
		</div>
		<div class="tab-pane fade" id="step4">
			<!--  리스트 시작 -->
			<div class="list-group">
				<c:if test="${listStep4.size()==0}">
					<div class="c h70 pt30">배송 중인 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="list" items="${listStep4 }">
					<div class="col-md-12 h10"></div>
					<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
						<div class="media col-md-2 ">
							<div>주문번호: ${list.disc_num}</div>
							<figure class="pull-left"> <img
								class="media-object img-rounded img-responsive"
								src="${image }store/${list.disc_image}"> </figure>
						</div>
						<div class="col-md-8 h100p">
							<br>
							<div class="col-md-12">
								<h4 class="list-group-item-heading">${list.disc_title}</h4>
							</div>
							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">구입날짜:</div>
								<div class="col-md-8">
									<fmt:formatDate value="${list.disc_buyDate}"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>

							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">배송지:</div>
								<div class="col-md-8">${list.del_addr }</div>
							</div>

							<div class="list-group-item-text col-md-12" style="color: red;">배송
								중</div>
						</div>
						<div class="col-md-2 text-center">
							<br>
							<div>
								<input class="btn btn-danger btn-xl w80p" type="button"
									onclick="perfRefund(${list.disc_num})" value="환불요청">
							</div>
							<h2>
								${list.disc_price*list.buy_count }<small> 원 </small>
							</h2>
						</div>
						<div class="col-md-12 h18"></div>
					</div>
				</c:forEach>
			</div>
			<!--리스트 끝  -->
		</div>
		<div class="tab-pane fade" id="step5">
			<!--  리스트 시작 -->
			<div class="list-group">
				<c:if test="${listStep5.size()==0}">
					<div class="c h70 pt30">배송완료인 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="list" items="${listStep5 }">
					<div class="col-md-12 h10"></div>
					<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
						<div class="media col-md-2 ">
							<div>주문번호: ${list.disc_num}</div>
							<figure class="pull-left"> <img
								class="media-object img-rounded img-responsive"
								src="${image }store/${list.disc_image}"> </figure>
						</div>
						<div class="col-md-8 h100p">
							<br>
							<div class="col-md-12">
								<h4 class="list-group-item-heading">${list.disc_title}</h4>
							</div>
							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">구입날짜:</div>
								<div class="col-md-8">
									<fmt:formatDate value="${list.disc_buyDate}"
										pattern="yyyy년 MM월 dd일" />
								</div>
							</div>

							<div class="list-group-item-text col-md-12" style="padding: 0;">
								<div class="col-md-3">배송지:</div>
								<div class="col-md-8">${list.del_addr }</div>
							</div>

							<div class="list-group-item-text col-md-12" style="color: red;">배송완료</div>
						</div>
						<div class="col-md-2 text-center">
							<br>
							<div>
								<input class="btn btn-warning btn-xl w80p" type="button"
									onclick="perfChange(${list.disc_num})" value="교환요청">
							</div>
							<br>
							<div>
								<input class="btn btn-danger btn-xl w80p" type="button"
									onclick="perfRefund(${list.disc_num})" value="환불요청">
							</div>
							<h2>
								${list.disc_price*list.buy_count }<small> 원 </small>
							</h2>
						</div>
						<div class="col-md-12 h18"></div>
					</div>
				</c:forEach>
			</div>
			<!--리스트 끝  -->
		</div>
	</div>
</div>



<br>


<!--환불 정보  -->
<div class="row" style="border: 1px solid #d0d0d0">

	<div class="col-sm-12 c bf5f5f5">
		<h3 >취소·환불·교환내역</h3>
		<hr style="color: white;">
	</div>
	<div class="col-sm-12">
		<div class="list-group">
			<!-- 환불요청 -->
			<c:if test="${listStep6.size()+listStep7.size()+listStep8.size()==0}">
				<div class="c h70 pt30">환불,교환 중인 상품이 없습니다.</div>
			</c:if>
			<c:forEach var="list" items="${listStep6 }">
				<div class="col-md-12 h10"></div>
				<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
					<div class="media col-md-2 ">
						<div>주문번호: ${list.disc_num}</div>
						<figure class="pull-left"> <img
							class="media-object img-rounded img-responsive"
							src="${image }store/${list.disc_image}"> </figure>
					</div>
					<div class="col-md-8 h100p">
						<br>
						<div class="col-md-12">
							<h4 class="list-group-item-heading">${list.disc_title}</h4>
						</div>
						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">구입날짜:</div>
							<div class="col-md-8">
								<fmt:formatDate value="${list.disc_buyDate}"
									pattern="yyyy년 MM월 dd일" />
							</div>
						</div>

						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">배송지:</div>
							<div class="col-md-8">${list.del_addr }</div>
						</div>

						<div class="list-group-item-text col-md-12" style="color: red;">환불/반품
							요청</div>
					</div>
					<div class="col-md-2 text-center">
						<br>
						<h2>
							${list.disc_price*list.buy_count }<small> 원 </small>
						</h2>
					</div>
					<div class="col-md-12 h18"></div>
				</div>
			</c:forEach>

			<!--환불승인  -->
			<c:forEach var="list" items="${listStep7 }">
				<div class="col-md-12 h10"></div>
				<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
					<div class="media col-md-2 ">
						<div>주문번호: ${list.disc_num}</div>
						<figure class="pull-left"> <img
							class="media-object img-rounded img-responsive"
							src="${image }store/${list.disc_image}"> </figure>
					</div>
					<div class="col-md-8 h100p">
						<br>
						<div class="col-md-12">
							<h4 class="list-group-item-heading">${list.disc_title}</h4>
						</div>
						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">구입날짜:</div>
							<div class="col-md-8">
								<fmt:formatDate value="${list.disc_buyDate}"
									pattern="yyyy년 MM월 dd일" />
							</div>
						</div>

						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">배송지:</div>
							<div class="col-md-8">${list.del_addr }</div>
						</div>

						<div class="list-group-item-text col-md-12" style="color: red;">환불승인</div>
					</div>
					<div class="col-md-2 text-center">
						<br>
						<h2>
							${list.disc_price*list.buy_count }<small> 원 </small>
						</h2>
					</div>
					<div class="col-md-12 h18"></div>
				</div>
			</c:forEach>
			<!--교환  -->
			<c:forEach var="list" items="${listStep8 }">
				<div class="col-md-12 h10"></div>
				<div class="col-md-12" style="border-bottom: 1px solid lightgrey">
					<div class="media col-md-2 ">
						<div>주문번호: ${list.disc_num}</div>
						<figure class="pull-left"> <img
							class="media-object img-rounded img-responsive"
							src="${image }store/${list.disc_image}"> </figure>
					</div>
					<div class="col-md-8 h100p">
						<br>
						<div class="col-md-12">
							<h4 class="list-group-item-heading">${list.disc_title}</h4>
						</div>
						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">구입날짜:</div>
							<div class="col-md-8">
								<fmt:formatDate value="${list.disc_buyDate}"
									pattern="yyyy년 MM월 dd일" />
							</div>
						</div>

						<div class="list-group-item-text col-md-12" style="padding: 0;">
							<div class="col-md-3">배송지:</div>
							<div class="col-md-8">${list.del_addr }</div>
						</div>

						<div class="list-group-item-text col-md-12" style="color: red;">교환완료</div>
					</div>
					<div class="col-md-2 text-center">
						<br>
						<h2>
							${list.disc_price*list.buy_count }<small> 원 </small>
						</h2>
					</div>
					<div class="col-md-12 h18"></div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>



<br>
<br>
<br>
</html>