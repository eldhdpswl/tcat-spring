<%@page import="spring.project.tcat.VO.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="../setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.xBtn {
	-moz-box-shadow:inset 0px 2px 2px 0px #f29c93;
	-webkit-box-shadow:inset 0px 2px 2px 0px #f29c93;
	box-shadow:inset 0px 2px 2px 0px #f29c93;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100));
	background:-moz-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-webkit-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-o-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-ms-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100',GradientType=0);
	background-color:#fe1a00;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#faf5fa;
	font-family:Georgia;
	font-size:12px;
	padding:3px 4px;
	text-decoration:none;
	text-shadow:0px 2px 4px #b23e35;
}
.xBtn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00));
	background:-moz-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-webkit-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-o-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-ms-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00',GradientType=0);
	background-color:#ce0100;
}
.xBtn:active {
	position:relative;
	top:1px;
}
</style>
<script type="text/javascript">
function pay(url){
	 var checkArr = [];     // 배열 초기화
	 $("input[name='seatCheck']:checked").each(function(i){
	     checkArr.push($(this).val());    // 체크된 것만 값을 뽑아서 배열에 push
	 });
	 
		 $.ajax({
	        url: url
	        , type: 'post'
	        , dataType: 'text'
	        , data: {
	            valueArrTest: checkArr
	        },
	        success :  function(msg) {
	            $('#result').html(msg);
	        }
	    });
	 
	 /*$( "#result" ).load( "${pageContext.request.contextPath}/"+url ); */
}
function error(){
	alert("구매할 상품이 없습니다!");
	return false;
}

function deleteCart(disc_code){
	$( "#result" ).load( "${pageContext.request.contextPath}/deleteCart?disc_code="+disc_code);
}

function changeCount(count,disc_code){

	$( "#result" ).load( "${pageContext.request.contextPath}/changeCount?count="+count+"&disc_code="+disc_code);
}
</script>
</head>
<body>
<c:if test="${pay==1}">
	<script type="text/javascript">
		alert("구매되었습니다.");
	</script>
</c:if>
<c:if test="${deleteCart==1}">
	<script type="text/javascript">
		alert("삭제되었습니다.");
	</script>
</c:if>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-6">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> 카트</h5>
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-primary btn-sm btn-block" onclick="load('myPage');">
									<span class="glyphicon glyphicon-share-alt"></span> 마이페이지로 가기
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<%
					ArrayList<Integer> dtos2=(ArrayList<Integer>)request.getAttribute("dtos2");
					int o=0;
				%>
					<c:forEach var="vo" items="${dtos}" >
					<c:set var="count" value="<%=dtos2.get(o)%>"></c:set>
					<%o++;%>
					<!-- 데이터 -->
					<div class="row">	
						<c:if test="${(vo.cart_count*1)<=(count*1)}">
						<div class="col-xs-1"><input type="checkbox" name="seatCheck" onclick="cheack(this.value,'${vo.cart_count}')" value="${vo.disc_code}"></div>
						</c:if>
						<c:if test="${(vo.cart_count*1)>(count*1)}">
						<div class="col-xs-1"><input type="button" value="재고초과" class="xBtn"></div>
						</c:if>
						
						<div class="col-xs-2"><img class="img-responsive" src="${image}/store/${vo.disc_image}">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name"><strong>${vo.disc_title}</strong></h4><h4><small>${vo.disc_con}</small></h4>
						</div>
						<div class="col-xs-5">
							<div class="col-xs-6 text-right">
								<h6><strong><fmt:formatNumber value="${vo.disc_price}" pattern="#,###"/> <span class="text-muted">x</span></strong></h6>
							</div>
							<div class="col-xs-4">
								<input type="number" onclick="changeCount(this.value,'${vo.disc_code}')" min="1" class="form-control input-sm" id="cart_count" value="${vo.cart_count}">
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs" onclick="deleteCart('${vo.disc_code}');">
									<span class="glyphicon glyphicon-trash"> </span>
								</button>
							</div>
						</div>
					</div>
					<hr>
					</c:forEach>
					<div class="row">
						<div class="text-center">
							<div class="col-xs-9">
								<h6 class="text-right">쇼핑하러 가기</h6>
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-default btn-sm btn-block" onclick="load('storeMain');">
									스토어 메뉴로..
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
						<%
							ArrayList<CartVO> dtos=null;
							dtos=(ArrayList<CartVO>)request.getAttribute("dtos");
							int price=0;
						%>
							<h4 class="text-right">Total <strong><%if(dtos!=null){for(int i=0;i<dtos.size();i++){
								int count=dtos.get(i).getCart_count();
								int price2=dtos.get(i).getDisc_price();
								price+=(count*price2);
								}
							}%>
							<fmt:formatNumber value="<%=price%>" pattern="#,###"/>
							</strong></h4>
						</div>
						<div class="col-xs-3">
							<%if(dtos!=null){ %>
							<button type="button" id="myBtn" class="btn btn-success btn-block" onclick="pay('storePay');">
								구입하기
							</button>
							<%} %>
							<%if(dtos==null){ %>
							<button type="button" id="myBtn" class="btn btn-success btn-block" onclick="return error();">
								구입하기
							</button>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>