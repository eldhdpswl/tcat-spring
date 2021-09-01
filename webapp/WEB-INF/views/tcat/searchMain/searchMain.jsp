<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script type="text/javascript">
	$(function (){
		$("#searchPerList").load("${pageContext.request.contextPath}/searchPerList?search=${search}");
		$("#searchStoreList").load("${pageContext.request.contextPath}/searchStoreList?search=${search}");
	});
	function searchPerList(url){
		$("#searchPerList").load("${pageContext.request.contextPath}/"+url);
	}
	function searchStoreList(url){
		$("#searchStoreList").load("${pageContext.request.contextPath}/"+url);
	}
	
</script>
</head>
<body>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
			<h4 align="center">검색리스트 [공연(검색키워드:${search})]</h4>
			<div id="searchPerList">
			
			</div>
			<h4 align="center">검색리스트 [스토어(검색키워드:${search})]</h4>
			<div id="searchStoreList">
			
			</div>
	</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>