<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<title>상품 재고 관리</title>
<script type="text/javascript">
	opener.location.reload();
</script>
</head>
<body>

	<!--  18.01.11 태성!!  -->
	<!-- 	<h3 align="center">카테고리별 상품 나열 및 우선순위</h3> -->
	<!-- 뮤지컬 -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">

			<table class="table table-hover table-bordered table-condensed c fs13">
				<tr class="warning">
					<td><b>상품번호</b></td>
					<td><b>상품이름</b></td>
					<td><b>상품가격</b></td>
					<td><b>중분류</b></td>
					<td><b>소분류</b></td>
					<td><b>상품수량</b></td>
					<td><b>수정할 상품수량</b></td>
					<td><b>수정</b></td>
				</tr>
				<%
					int i = 0;
				%>
				<c:forEach var="dto" items="${dtos}">
					<form action="stockManagement_stock" name="stockForm<%=i%>">
						<%
							i++;
						%>
					
					<tr>
						<td>${dto.disc_code}</td>
						<td>${dto.disc_title}</td>
						<td>${dto.disc_price}</td>
						<td>${dto.mDev}</td>
						<td>${dto.sDev}</td>
						<td>${dto.disc_count}</td>
						
						<td><input class="input" type="text" name="disc_count"
							maxlength="20" style="width: 100px"> <input type="hidden"
							value="${dto.disc_code}" name="disc_code"> <input type="hidden"
							value="${dto.disc_count}" name="disc_count"> <input
							type="hidden" value="${currentPage}" name="pageNum"></td>
						<td><input type="submit" value="확인"></td>
					</tr>
					</form>
				</c:forEach>
			</table>

		</div>
		<div class="col-md-1"></div>
	</div>
<center><input type="button" value="창닫기" onclick="javascript:self.close();"></center>
</body>
</html>