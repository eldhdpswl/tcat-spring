<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<br>
<br>
<br>
<br>
<table class="table table-inbox table-hover fs12px">
	<tbody>
	<c:forEach var="rank" items="${ranks }">
		<c:if test="${rank.rNum > 5 }"><tr onclick="detailOpen('store','${rank.disc_code}')"></c:if>
		<c:if test="${rank.rNum <= 5 }"><tr class="unread" onclick="detailOpen('store','${rank.disc_code}')"></c:if>
			<!--상위권  -->
			<td class="inbox-small-cells">${rank.rNum}위</td>
			<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
			<!--빈칸  -->
			<td class="view-message  dont-show">code: ${rank.disc_code }</td>
			<td class="view-message ">${rank.disc_title }</td>
			<td class="view-message  inbox-small-cells"><i
				class="fa fa-paperclip"></i></td>
			<td class="view-message  text-right">판매수량: ${rank.sellCnt}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="row">
	<c:if test="${productNum<allCnt }">
	<a onclick="store_load('cartRank_table?showNum=${productNum}')">10건 더보기 ( ${productNum}/${allCnt} )</a>
	</c:if>
</div>
<br>
<br>
</html>