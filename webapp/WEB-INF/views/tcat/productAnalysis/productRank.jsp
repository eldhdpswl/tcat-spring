<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.table-inbox {
	border: 1px solid #d3d3d3;
	margin-bottom: 0;
}
.table-inbox tr td {
	padding: 12px !important;
}
.table-inbox tr td:hover {
	cursor: pointer;
}
.table-inbox tr td .fa-star.inbox-started, .table-inbox tr td .fa-star:hover
	{
	color: #f78a09;
}
.table-inbox tr td .fa-star {
	color: #d5d5d5;
}
.table-inbox tr.unread td {
	background: none repeat scroll 0 0 #f7f7f7;
	font-weight: 600;
}
</style>
<script type="text/javascript">
function perf_load(url){
	 $( "#perf_div" ).load( "${pageContext.request.contextPath}/"+url );	
}
function store_load(url){
	 $( "#store_div" ).load( "${pageContext.request.contextPath}/"+url );	
}
$(document).ready(function(){//첫화면
	//공연
	perf_load('productRank_perf');
	//스토어
	store_load('productRank_store');
});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-1" ></div>
		<div class="col-md-5" id="perf_div"></div>
		<div class="col-md-5" id="store_div"></div>
		<div class="col-md-1" ></div>
	</div>
</body>
</html>