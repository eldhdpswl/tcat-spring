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
function insertCart(cart_count,disc_code){
	var disc_count="${str.disc_count}";

	if((cart_count*1)>(disc_code*1)){
		alert("구매수량을 초과하였습니다.");
	}else if(cart_count==0){
		alert("수량을 정해주세요!");
	}else if(disc_count<=0){
		alert("재고가 없습니다!");	
	}else{
	
		var url="insertCart?cart_count="+cart_count+"&disc_code="+disc_code;
		$("#result").load("${pageContext.request.contextPath}/"+url);
	}

	
}

$("#login2").click(function(){
	$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
	
});
$(document).ready(function() {
	if(${wishResult!=0}){
		$(".wish").addClass("active");
	}
});
	//탭
	$('#myTab a[href="#profile"]').tab('show');
	
	//위시리스트 킬릭시
	$(".wish").click(function(){
		if(${login_id == null}){
			alert("로그인 후 이용해 주세요.");
			return false;
		}else{

			var disc_code = $("#disc_code").val();
			var formData = {"disc_code":disc_code};
			var active = $(".wish").hasClass("active");
			if(active){
				$.ajax({
					type : "POST",
					url : "delWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").removeClass("active");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}else{
				$.ajax({
					type : "POST",
					url : "addWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").addClass("active");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}
		}
	});
	
function directBuy(count,disc_code){
	var disc_count="${str.disc_count}";

	if((count*1)>(disc_count*1)){
		alert("구매수량을 초과하였습니다.");
	}else if(count==0){
		alert("수량을 정해주세요!");
	}else if(disc_count<=0){
		alert("재고가 없습니다!");	
	}else{
	
	
		var url="directBuy?count="+count+"&disc_code="+disc_code;
		$("#result").load("${pageContext.request.contextPath}/"+url);
	}
	
}

	//스토어 후기 화면 뿌리기
function commentListS(url) {
	$("#commentListS").load( "${pageContext.request.contextPath}/"+url);
}
</script>
</head>
<c:if test="${insertCart==1}">
	<script type="text/javascript">
      alert("장바구니에 담겼습니다.");
   </script>
</c:if>
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
				<h1>${str.disc_title}</h1>
				<h5>${str.mDev}-${str.sDev}</h5>
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
							<img src="${image}store/${str.disc_image}" class="p10">
						</div>

						<div class="col-md-8">
							<!--장소  -->
							<div class="row p10">
								<div class="col-md-3">
									<b>재고수량</b>
								</div>
								<div class="col-md-9">${str.disc_count}개</div>
							</div>
							<div class="row p10">
								<div class="col-md-3">
									<b>구매수량</b>
								</div>
								<div class="col-md-9">
									<input type="number" name="count" min="0" value="0">
								</div>
							</div>

							<div class="row p10" style="border-top: 1px solid grey;">
								<div class="col-md-3 ">
									<b>기본가</b>
								</div>
								<div class="col-md-9">
									<span class="red"> <fmt:formatNumber
											value="${str.disc_price}" pattern="#,###" /></span>원
								</div>
							</div>

						</div>
					</div>
					<!--예매  -->
					<div class="col-md-3 " style="padding: 0;">
						<div class="col-md-12 p10 c">
							<input type="hidden" id="disc_code" value="${str.disc_code }">
							<button type="button" class="wish btn-xl">
								<i class="glyphicon glyphicon-heart fs20"></i>
							</button>
							<span>좋아요</span>
							<c:if test="${sessionScope.login_id!=null}">
								<img src="/tcat/resources/image/cart_icon.png"
									onclick="insertCart(document.all.count.value,'${str.disc_code}');"
									style="width: 50px">
                     
                     
						</div>
						<input class="btn btn-danger btn-xl w100p" type="button"
							value="구매하기"
							onclick="directBuy(document.all.count.value,'${str.disc_code}');">
						</c:if>
						<c:if test="${sessionScope.login_id==null}">
							<img data-toggle="modal" data-target="#login-modal" id="login2"
								style="width: 50px" src="/tcat/resources/image/cart_icon.png">
					</div>
					<input class="btn btn-danger btn-xl w100p" data-toggle="modal"
						data-target="#login-modal" id="login2" type="button" value="구매하기">
					</c:if>
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
						onclick="commentListS('watchLatterS?disc_code=${str.disc_code}');">상품후기</a></li>
					<li role="presentation"><a href="#cancelInfo"
						aria-controls="messages" role="tab" data-toggle="tab">취소/환불안내</a></li>
				</ul>
			</div>
			<!--공백  -->
			<div class="col-md-12 h25"></div>

			<!--상세내용  -->
			<div class="col-md-9 bffffff" style="padding: 0;">
				<!--출력 내용  -->
				<div class="col-md-12" style="padding: 0;">
					<div class="tab-content">
						<!--상세정보  -->
						<div role="tabpanel" class="tab-pane active" id="content">
							<c:if test="${str.per_ex !=null}">
								<div class="col-md-12"
									style="padding: 0; border-bottom: 1px solid grey">
									<h5>
										<i class="glyphicon glyphicon-play"></i> 상품상세내용
									</h5>
								</div>
								<div class="col-md-12" style="padding: 0;">
									<br>
									<pre>
									${str.per_ex }
									</pre>
								</div>
							</c:if>
							<div class="col-md-12"
								style="padding: 0; border-bottom: 1px solid grey">
								<h5>
									<i class="glyphicon glyphicon-play"></i>상품상세정보
								</h5>
							</div>
							<div class="col-md-12" style="padding: 0;">
								<br> <img src="${image}store/${str.getDetail_Image()}"
									class="w100p">
							</div>
						</div>
						<!--관람후기  -->

						<div role="tabpanel" class="tab-pane" id="review">

							<div class="col-md-12" id="commentListS"></div>
						</div>


						<!--취소환불 안내  -->
						<div role="tabpanel" class="tab-pane" id="cancelInfo">
							<img src="${image}content/refundPage.jpg" class="W100P">
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
							<div class="progress-bar progress-bar-danger " role="progressbar"
								aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
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
			<!--공백  -->
			<div class="col-md-1"></div>
		</div>
		<br>
		<!--공백  -->
		<div class="col-md-1"></div>

	</div>

</div>
</body>
</html>