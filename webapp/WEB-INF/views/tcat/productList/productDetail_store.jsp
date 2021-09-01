<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${disc.disc_title }-상세페이지</title>

<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<div><span>스토어 상세 정보</span></div>
		<table class="table table-hover table-bordered table-condensed c fs10">
			<tr>
				<td class="bg-primary"><b>제품이미지</b></td>
				<td><b><img src="${image}store/${disc.disc_image }" class="w30p"></b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제품코드</b></td>
				<td><b>${disc.disc_code }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제품명</b></td>
				<td><b>${disc.disc_title }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>카테고리</b></td>
				<td><b>
					Num: ${disc.cateNum }   ( ${disc.category} > ${disc.mDev} )
				</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제품가격</b></td>
				<td><b>${disc.disc_price }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>상품우선순위</b></td>
				<td><b> ${disc.first_grade } (A:최고,B:우수,C:보통,D:하,E:최하,F:부적합)</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>상품스텝</b></td>
				<td><b> ${disc.disc_step } (1:등록,2:핫카테고리,3:판매중단,4:판매안함)</b></td>
			</tr>
			<tr>
				<td class="bg-primary" colspan="2"><b>상품소개</b></td>
			</tr>
			<tr>
				<td colspan="2"><pre>${disc.disc_con }</pre></td>
			</tr>
			<tr>
				<td class="bg-primary" colspan="2"><b>상세이미지</b></td>
			</tr>
			<tr>
				<td colspan="2"><b><img src="${image}store/${disc.getDetail_Image()}"></b></td>
			</tr>
		</table>
	</div>

	<div class="col-md-1"></div>
</body>
</html>