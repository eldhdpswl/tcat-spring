<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function movieMainLoad(movieurl){
	$("#movieMain_result").load("${pageContext.request.contextPath}/movieMain?movie_url="+movieurl );
}

//위시리스트 킬릭시
$(".wish").click(function(){
	if(${login_id == null}){
		alert("로그인 후 이용해 주세요.");
		return false;
	}else{
			var per_id = $(this).attr("name");
			var formData = {"per_id":per_id};
			var active = $(".wish").hasClass("active");
			if(active){
				$.ajax({
					type : "POST",
					url : "delWishList",
					cache : false,
					data : formData,
					success : function() {
						alert("위시리스트 추가하였습니다.");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}else{
				$.ajax({
					type : "POST",
					url : "addWishList",
					cache : false,
					data : formData,
					success : function() {
						alert("위시리스트 추가하였습니다.");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}
	}
});

</script>
</head>
<body>
    <div class="row">
    	<div class="col-md-12">
    	<div class="col-md-12 h20"></div>    	
    	<div class="col-md-1 hidden-md"></div>
    	<% int i=0; %>
    	<c:forEach var="vo" items="${dtos}" >
			<div class="col-md-3 col-lg-2
			<%if(i==4){ %>
				hidden-md<%}%>">
			<%i++; 
			System.out.println(i);%>
				<div class="thumbnail" >
					<div class="w100p h260 overflow">
					<a onclick="movieMainLoad('${vo.movie_url}');"><img src="${image}performance/${vo.perf_Image}" class="img-responsive"></a>
					</div>
					<div class="caption">
						<table class="table table-condensed" style="table-layout:fixed">
							<tr>
								<td style="text-overflow:ellipsis; overflow:hidden"><h6 class="c"><nobr><label>${vo.perf_title}</label></nobr></h6></td>
							</tr>
						</table>
						<h6 class="c">${vo.hall_name}</h6>
						<h6 class="c">
							<c:set var="startdate" value="${fn:split(vo.startDate,' ')}"/>
							${startdate[0]}
						</h6>
						<h6 class="c">
							<c:set var="enddate" value="${fn:split(vo.endDate,' ')}"/>
							<span> ~ </span> ${enddate[0]}
						</h6>
					</div>
					<div class="c m5">
						<a class="btn btn-primary btn-product wish" name="${vo.per_id}"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
						<c:if test="${sessionScope.login_id!=null}">
							<a onclick="payPerformence('Ticketing?per_id=${vo.per_id}')" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
						<c:if test="${sessionScope.login_id==null}">
							<a data-toggle="modal" data-target="#login-modal" id="login2" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
					</div>
					</div><!-- outline -->
				</div><!-- md2 -->
		</c:forEach>
		</div><!-- md12 -->

        <div class="col-md-1 hidden-md"></div>
	</div><!--row 끝  -->


</body>
</html>