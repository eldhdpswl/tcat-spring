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
		eventLoad('eventList');
	})
	//화면 뿌리기
	function eventLoad(url,notice_num) {
		$("#eventResult").load(url);
	}
	
</script>

</head>
<!--이벤트메인  -->

<!--메뉴  -->
<div class="col-md-12">

	<div class="col-md-3 ">
		<div class="sidebar-nav disInline w70p">
			<div class="well borderMenu disInline w100p"
				style="background-color: white; padding: 8px 0;">
				<ul class="nav nav-list  w100p ">
				
					<li><a onclick="eventLoad('eventList');" class="000000">이벤트소개<b></b></a>
					
					
				</ul>
			</div>

		</div>


		</div>
<!--뿌려주는 div-->
	<div class="col-md-8" id="eventResult"></div>
	</div>


</html>