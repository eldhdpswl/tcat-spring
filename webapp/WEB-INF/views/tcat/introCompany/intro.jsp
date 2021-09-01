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
		introLoad('introCompany');
	})
	//화면 뿌리기
	function introLoad(url) {
		$("#introResult").load(url);
	}
</script>

</head>
<!--회사소개 메인  -->

<!--메뉴  -->
<div class="col-md-12">

	<div class="col-md-3 ">
		<div class="sidebar-nav disInline w70p">
			<div class="well borderMenu disInline w100p"
				style="background-color: white; padding: 8px 0;">
				<ul class="nav nav-list  w100p ">
				
					<li><a onclick="introLoad('introCompany');" class="000000">Tcat소개<b></b></a>
					<hr class="w90p" style="margin: 0 auto;"></li>
					<li><a onclick="introLoad('introPath')" class="000000">Tcat오시는길</a></li>
				</ul>
			</div>

		</div>


		</div>
<!--뿌려주는 div-->
	<div class="col-md-8" id="introResult"></div>
	</div>


</html>