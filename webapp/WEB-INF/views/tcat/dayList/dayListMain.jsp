<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var d=new Date();
		var y=d.getFullYear();
		var m=d.getMonth()+1;
		var dt=d.getDate();
		
		if((m*1)<10){
			date=y+"-0"+m+"-"+dt;
		}else{
			date=y+"-"+m+"-"+dt;
		} 

		$(".dayList").load("${pageContext.request.contextPath}/daySearch?date="+date);
		
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker({
			dateFormat: 'yy-mm-dd',//데이터 형식 변경
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
		    	$( ".dayList" ).load( "${pageContext.request.contextPath}/daySearch?date="+dateText );
		    }
		});
	});
	function dayList(url){
		
		$( ".dayList" ).load( "${pageContext.request.contextPath}/"+url);
	}
</script>
</head>
<body>
	<div class="row" >
	<div class="col-md-2"></div>
		<div class="col-md-10">
	<div id="datepicker" align="center" style="margin-left:20px;float:left;border:1px solid #dddddd; margin-top:10px; padding:5px;"></div>				
	<div class="row" >
		<div class="col-md-8">
			<div class="row">
				
				<div class="col-md-10" style="margin-top:10px">
					<div class="dayList"></div>
				</div>
			</div>
		</div>

	</div>
	
	</div>
	</div>
</body>
</html>