<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rating(value){
		if(value==0){
			alert("등급을 선택해주세요!");
		}else{
			$( "#rating" ).load( "${pageContext.request.contextPath}/infoLevel?rating="+value );		
		}
	}
	$(function(){
		$( "#rating" ).load( "${pageContext.request.contextPath}/infoLevel?rating=D" );
	});
</script>
</head>
<body>

	<div class="row">
		<div class="col-md-2" style="border:2px solid #dddddd;padding:10px; background-color:black">
		<span style="color:white;margin-left:20px;">등급 지정 :</span>
		<select onchange="rating(this.value);">
			<option value="0"></option>
			<option value="VIP">VIP</option>
			<option value="S">S</option>
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
			<option value="D">D</option>
		</select>
		</div>
		<div class="col-md-10">
		<div id="rating"></div>
		</div>
	</div>

</body>
</html>