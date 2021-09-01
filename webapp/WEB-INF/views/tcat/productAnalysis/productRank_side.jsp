<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<ul class="nav nav-pills nav-stacked">
		<li class="b400040 h20"></li>
		<li class="b400040 h50 c"><span class="fs15 aaaaaa">상품분석</span></li>
		<li class="b400040"><a onclick="perf_load('productRank_perf');  store_load('productRank_store');" class="ffffff">판매상품순위</a></li>
		<li class="b400040"><a onclick="perf_load('categoryRank_perf'); store_load('categoryRank_store');" class="ffffff">카테고리순위</a></li>
		<li class="b400040"><a onclick="perf_load('returnRank_perf'); store_load('returnRank_store');" class="ffffff">취소/반품순위</a></li>
		<li class="b400040"><a onclick="perf_load('cartRank'); store_load('cartRank_table');" class="ffffff">장바구니 분석</a></li>
		<li class="b400040"><a onclick="perf_load('wishListRank_perf'); store_load('wishListRank_store');" class="ffffff">위시리스트 분석</a></li>
	</ul>

</body>
</html>