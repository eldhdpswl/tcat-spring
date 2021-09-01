<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">

<style type="text/css">
.borderMenu {
	border: 3px solid #f2ecdc;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		myPageLoad('myPageMain');
	})
	//화면 뿌리기
	function myPageLoad(url) {
		$("#myPageResult").load(url);
	}
</script>

</head>
<!--마이페이지 메인  -->
<div class="row h25"></div>


<!--메뉴  -->
<div class="col-md-12">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2 ">
			<div class="sidebar-nav disInline w100p">
				<!--사이드 메뉴  -->
				<div class="sidebar-nav disInline w100p ">
					<div class="well borderMenu disInline w100p floatR"
						style="background-color: white; padding: 8px 0;">
						<ul class="nav nav-list  w100p ">
							<li><a onclick="myPageLoad('myPageMain');" class="000000"><b>마이페이지</b></a>
								<hr class="w90p" style="margin: 0 auto;"></li>
							<li><a onclick="myPageLoad('myModifyForm');" class="000000">회원정보수정</a></li>
							<li><a onclick="myPageLoad('memberPoint');" class="000000">회원등급포인트관리</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--뿌려주는 div-->
		<div class="col-md-8" id="myPageResult"></div>
		<div class="col-md-1"></div>
	</div>

</div>
</html>