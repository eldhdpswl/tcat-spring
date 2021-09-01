<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리별 상품진열 관리</title>
</head>
<body class="b400040">


	<div class="row">
		<div class="col-md-6">
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=뮤지컬');" class="ffffff">뮤지컬</a></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=연극');" class="ffffff">연극</a></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=콘서트');" class="ffffff">콘서트</a></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=클래식');" class="ffffff">클래식/국악</a></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=무용');" class="ffffff">무용/발레</a></li>
				<li class="b400040"><a
					onclick="load('categoryList?category=스토어');" class="ffffff">스토어</a></li>
			</ul>
		</div>
	</div>
</body>
</html>