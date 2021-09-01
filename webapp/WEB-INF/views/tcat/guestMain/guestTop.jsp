<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tcat메인페이지</title>

<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {

		new daum.Postcode(
				{
					oncomplete : function(data) {

						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<script>
	function searchMain(search){
		$("#result").load("${pageContext.request.contextPath}/searchMain?search="+search);
	}
	function memberSubmit(url) { /*AJAX submit  */
		var formData = $("#memberForm").serialize();
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				$('#result').html(msg);
			},
			error : onError
		});
		function onError(data, status) {
			alert("error");
		}
	}
	/* 0111 현석 */
	$(function() {
		$("#d1").datepicker();
		$("#d2").datepicker();

		$("#mainMenu").mouseenter(function() {
			ShowDoSlidingDown(this);
		});

		$("html, body").on('mousewheel DOMMouseScroll', function(e) {
			ShowDoSlidingUp(this);
		});

		function ShowDoSlidingDown() {
			$("#inMenu").addClass("show");
			$("#inMenu").slideDown("slow");
			$("#inMenu").show("slow");
		}
		function ShowDoSlidingUp() {
			$("#inMenu").removeClass("show");
			$("#inMenu").slideUp("slow");
			$("#inMenu").hide("slow");
		}

		//로그인 모달 by명훈
		$("#login").click(
				function() {
					$("#modal_result").load(
							"${pageContext.request.contextPath}/memberLogin");
				});
	
	});
	//by명훈
	function findId() {
		$("#modal_result")
				.load("${pageContext.request.contextPath}/memberFind");
	}
</script>
<script type="text/javascript">
	//ajax
	function ajaxSubmit(url) { /* AJAX submit */
		var result = document.getElementById("result");
		var formData = $("#ajaxSubmitForm").serialize();
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				$('#result').html(msg);
			},
			error : onError
		});
		function onError(data, status) {
			alert("error");
		}
	}

	function load(url) {
		$("#result").load("${pageContext.request.contextPath}/" + url,
				function(msg) {
					history.pushState({
						page : url
					}, null);//1. history에 pushState로  page를 저장 이때 url에 get방식을 쓰면 그 파라미터도 같이 넘어감
					//history.pushState(state,title,url);
					//state:key와 value 형태의 데이터를 여러개 넘길수 있다 너무 클경우 불가는 640k로 제한되어있다.
					//title: 웹페이지 상단에 띄울 제목 null이나 "" 를 줘도 상관 없다.
					//url:  아무 의미 없이 url만 변경, 현 방식을 한 이유는 새로고침시 입력되있는 주소에 따라 페이지 전송을 하는데 ajax이기 때문에 새로고침시 guestPage로 이동을 해야하기 때문에 비워둠
				});
	}
	$(document).ready(
			function() {
				//새로고침
				$(window).bind(
						'load',
						function(event) { //2-새로고침: url이 guestPage를 지칭하고 있기때문에 새로고침시 guestPage를 불러온다.
							if (history.state == null) { //2-2: 만약 처음 들어온 경우, 즉 push를 한 적이 없으면 게스트 메인을 뿌려준다.
								load("guestMain");
							} else { //2-1: 새로고침한 페이지 에 따라 pushState의 state를 가져와 ajax  결과에 뿌려준다.
								$("#result").load(
										"${pageContext.request.contextPath}/"
												+ history.state.page)
							}
						});
				//뒤로 갈때 
				$(window).bind(
						'popstate',
						function(event) {
							//2-뒤로가거나 앞으로 갔을경우  1에서 푸쉬해놓았던 url 데이터를 받아 ajax 결과에 뿌린다.
							$("#result").load(
									"${pageContext.request.contextPath}/"
											+ event.originalEvent.state.page);
							//event.originalEvent.state.page: 푸시해 놓았던 데이터의 page(key값)에 따라 url을 받음
						});
				
				
				
				$(window).scroll(function() {
		            if ($(this).scrollTop() > 400) {
		                $('#topMove').fadeIn();
		            } else {
		                $('#topMove').fadeOut();
		            }
		        });
		        
		        $("#topMove").click(function() {
		            $('html, body').animate({
		                scrollTop : 0
		            }, 400);
		            return false;
		        });
			});

	//공연 상세페이지 onclick시
	function contentPage(per_id) {
		load('contentMain?per_id=' + per_id);
	}
	//스토어 상세페이지 onclick시
	function contentMain_store(disc_code) {
		load('contentMain_store?disc_code=' + disc_code);
	}
	//이벤트 상세페이지
	
	function hotCategoryLoad(url){
		$("#hotMainResult").load("${pageContext.request.contextPath}/" + url);
	}
	

	
	
	
</script>
</head>
<body>

	<div class="w100p" id="mainMenu">
		<div class="w100p " id="inMenu">
			<div class="row bf5f5f5">
				<div class="col-md-1"></div>
				<div class="col-md-8 ">
					<ol class="breadcrumb floatR fs12px h18 pt10">
						<li class="active"><c:if test="${login_id==null }">
								<a data-toggle="modal" data-target="#login-modal" id="login">로그인</a>
							</c:if> <c:if test="${login_id!=null }">
								<a href="logout">로그아웃</a>
							</c:if></li>
							<c:if test="${login_id==null }">
								<li><a onclick="load('signUp')">회원가입</a></li>
							</c:if> 
							<c:if test="${login_id!=null }">
								<li><a onclick="load('myPage');">마이페이지</a></li>
								<li><a onclick="load('ticketCheck');">예매확인/취소</a></li>
							</c:if>
						<li><a onclick="load('qnaBoardMain');">고객센터</a></li>
						<c:if test="${sessionScope.login_id!=null}">
							<li><a onclick="load('wishList?wish_step=1');">위시리스트</a></li>
							<li><a onclick="load('cartList');">장바구니</a></li>
						</c:if>
						<li><a onclick="load('commentBoard');">후기</a></li>
						<li><a onclick="load('intro');">회사</a></li>
					</ol>
				</div>
				<div class="col-md-2">
					<div class="input-group w200 floatL pt3" id="searchGuestTop">
						<input type="text" class="form-control" name="searchMain" placeholder="Search for..."> 
						<span class="input-group-btn">
							<button class="btn btn-default" onclick="searchMain(document.all.searchMain.value);" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row  bff3333">
			<div class="col-md-2 col-lg-3">
				<div class="col-lg-2"></div>
				<div class="container1">
					<div class="navbar-header ">
							<a onclick="load('guestMain');"><img alt="main" src="${image}main/webmainICON.PNG" 
								onmouseover="this.src='${image}main/inWebmainICON.PNG'"
								onmouseout="this.src='${image}main/webmainICON.PNG'"	
							class="h45 w110 m2 ml30"></a>
						<button type="button" id="headermenu" class="btn btn-navbar collapsed floatR w60 m10 "
							data-toggle="collapse" data-target="#navbar-collapse-1">
							<span class="glyphicon glyphicon-list"></span>
						</button>
					</div>
				</div>
			</div>
			
			<div class="col-md-7 col-lg-6">
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse pt17" id="navbar-collapse-1">


					<ul class=" navbar-nav navbar-right">
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('musicalMain');">뮤지컬</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('concertMain');">콘서트</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('dramaMain');">연극</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('classicMain');">클래식</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('danceMain');">무용/발레</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('storeMain');">스토어</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<div class="col-md-3 b333366">
				<div class="collapse navbar-collapse" id="navbar-collapse-1">

					<ul class="nav navbar-nav">
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('dayListMain')">날짜</a></li>
						<li><a class="trgothic ffffff fs14px b mr20 guestMenuHover"
							onclick="load('placeListMain')">지역</a></li>

					</ul>

				</div>
				<!-- /.navbar-collapse -->


			</div>
		</div>

	</div>



	<!--로그인 창 MODAL  -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		data-backdrop="static" aria-labelledby="myModalLabel"
		aria-hidden="true" style="display: none;">
		<!--모달 결과창  -->
		<div class="modal-dialog" id="modal_result"></div>
	</div>

	<!--로그인창 끝  -->


</body>
<!--탑 이동  -->
<div  id="topMove" style="position: fixed; bottom:20px;right:30px;  z-index: 99; width: 100px; display: none; ">
	<a href="#"><img src="${image}bar/topcat.png" ></a>
</div>
</html>