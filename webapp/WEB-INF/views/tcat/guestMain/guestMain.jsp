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
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script type="text/javascript">
$("#login2").click(function(){
	$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
});
function payPerformence(url){
    window.open(url, "confirm", "menubar=no, width=1400, height=830");
}
$(document).ready(function(){
	$("#hotMainResult").load("${pageContext.request.contextPath}/hotCategory?category=뮤지컬");
});



</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
</head>

<body>
<c:set var="image" value="/tcat/resources/image/"/>

<!-- 슬라이드 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="${image}guestMain/A_1.jpg" class="hand" onclick="contentPage('1');" width="100%" height="500px" alt="A_1">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_2.jpg" class="hand" onclick="contentPage('16');" width="100%" height="500px" alt="A_2">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_3.jpg" class="hand" onclick="contentPage('32');" width="100%" height="500px" alt="A_3">
      <div class="carousel-caption">

      </div>
    </div>

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- 슬라이드 끝 -->

<div class="thumbnail">
<div class="w100p h20 bff3333 ffffff top10 pl100 pt3"><span class="fontAchive opacity50">HOT CATEGORY</span></div>
<div class="c m10">
	<a class="btn btn-default" onclick="hotCategoryLoad('hotCategory?category=뮤지컬');" role="button">뮤지컬</a>
	<a class="btn btn-default" onclick="hotCategoryLoad('hotCategory?category=콘서트');" role="button">콘서트</a>
	<a class="btn btn-default" onclick="hotCategoryLoad('hotCategory?category=연극');" role="button">연극</a>
	<a class="btn btn-default" onclick="hotCategoryLoad('hotCategory?category=클래식');" role="button">클래식</a>
	<a class="btn btn-default" onclick="hotCategoryLoad('hotCategory?category=무용');" role="button">무용/발레</a>
</div>

<!-- 핫리스트 -->
<div id="hotMainResult">

</div><!-- 컨테이너 끝 -->
</div><!-- 핫리스트 끝 -->


<div class="w100p b333366">
<div id="movieMain_result" class="w100p b333366">


</div>
</div>

<div class="row">
	<div class="col-md-12 h60"></div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="w100p  h20">
		<span class="trgothic fs15 floatL">새로운 이벤트</span><span class="floatR trgothic hand" onclick="load('eventMain');">전체보기</span> 
		</div>
		<hr>
		
		<div class="col-md-8">
			<!-- 슬라이드 -->
				<div id="carousel-generic2" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-generic2" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-generic2" data-slide-to="1"></li>
				    <li data-target="#carousel-generic2" data-slide-to="2"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner"  role="listbox">
				    <div class="item active">		    
				      <img src="${image}eventList/event5.jpg"  width="100%"  alt="A_1"> 
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}eventList/event4.jpg" width="100%" alt="A_2">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}eventList/event3.jpg" width="100%"  alt="A_3">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-generic2" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-generic2" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div><!-- 슬라이드 끝 -->
			<div class="w50p floatL">
				<a onclick="load('storeMain');"><img alt="store_info" src="${image}eventList/store_info.jpg" width="100%"></a>
			</div>
			<div class="w50p floatL">
				<a onclick="load('commentBoard');"><img alt="coment_info" src="${image}eventList/coment_info.jpg" width="100%"></a>
			</div>
		</div>
		<div class="col-md-4">
				<a onclick="load('myPage');"><img alt="VIP" src="${image}eventList/vip_INFO.jpg" width="110%"></a>	
		</div>
	</div>

	<div class="col-md-2"></div>
</div>

<div class="row">	
	<div class="col-md-12 h60"></div>
	<div class="col-md-1"></div>
	<div class="col-md-6 thumbnail">
		<div class="col-md-12 h20"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="w100p">
				<span class="trgothic fs15 floatL">공지사항</span>
				<span class="glyphicon glyphicon-plus floatR hand" onclick="load('noticeBoard');"></span>
			</div>
			<table class="table table-condensed" style="table-layout:fixed">
			<c:forEach var="borderVo2" items="${borderDtos2}">
				<tr>
					<td><span class="b">${borderVo2.notice_title}</span> | <span class="fs10">${borderVo2.writeDate}</span></td>
				</tr>
				<tr>
					<td style="text-overflow:ellipsis; overflow:hidden"><nobr>${borderVo2.contents}</nobr></td>
				</tr>
			</c:forEach>
			</table>
		</div>		
		<div class="col-md-1"></div>
			
	</div>
	<div class="col-md-4 thumbnail">
		<div class="col-md-12 h20"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">		
		<div class="w100p">
			<span class="trgothic fs15 floatL">후기 게시판</span>
			<span class="glyphicon glyphicon-plus floatR hand" onclick="load('commentBoard');"></span>
		</div>
			
			<table class="table table-condensed" style="table-layout:fixed">
			<c:forEach var="borderVo" items="${borderDtos}">
				<tr>
					<td><span class="b fs11">${borderVo.member_id}</span> | <span class="fs10">${borderVo.writeDate}</span></td>
				</tr>
				<tr>
					<td style="text-overflow:ellipsis; overflow:hidden"><nobr>${borderVo.contents}</nobr></td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="col-md-1"></div>
</div>
</body>
</html>