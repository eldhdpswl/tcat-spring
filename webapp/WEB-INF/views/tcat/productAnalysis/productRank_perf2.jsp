<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	// add button style 
	$("[name='poll_bar'").addClass("btn btn-default");
	// Add button style with alignment to left with margin.
	$("[name='poll_bar'").css({"text-align":"left","margin":"5px"});		
	//loop 
	$("[name='poll_bar'").each(
			function(i){			
			  //get poll value 	
				var bar_width = (parseFloat($("[name='poll_val'").eq(i).text())/2).toString();
				bar_width = bar_width*2 + "%"; //add percentage sign.										
				//set bar button width as per poll value mention in span.
				$("[name='poll_bar'").eq(i).width(bar_width);					
				//Define rules.
				var bar_width_rule = parseFloat($("[name='poll_val'").eq(i).text());					 
				if(bar_width_rule >= 40){$("[name='poll_bar'").eq(i).addClass("btn btn-sm btn-success")}
				if(bar_width_rule <  40){$("[name='poll_bar'").eq(i).addClass("btn btn-sm btn-warning")}
				if(bar_width_rule <= 10){$("[name='poll_bar'").eq(i).addClass("btn btn-sm btn-danger")}	
				//Hide dril down divs
				$("#" + $("[name='poll_bar'").eq(i).text()).hide();
  });
});
</script>
</head>
<br>
<br>
<div class="row">
	<div class="panel panel-primary" style="width:90%; margin:20px" >
    <div class="panel-heading">
  	<h3 class="panel-title">
  		공연: 예매순위(상위 5위)
    </h3>    
  </div>     
	<div class="panel-body"  style="margin:0px; width:100%;">
	  	<div id="Main">
	  		<c:set var="sum" value="0" />
	  		<c:forEach var="rank" items="${ranks}">
	  			<c:if test="${rank.rNum<=5 }">
	  				<c:set var="sum" value="${sum + rank.sellCnt }" />
	  			</c:if>
	  		</c:forEach>
	  		<c:forEach var="rank" items="${ranks}">
	  			<c:if test="${rank.rNum<=5 }"> 
		     		<a name="poll_bar">${rank.perf_title } </a> 
		     		<span name="poll_val"><fmt:formatNumber value="${rank.sellCnt*100/sum}" pattern=".00"/>%</span><br/>
		     	</c:if>
		    </c:forEach>
    	</div>
	</div>  
</div>
</div>
<table class="table table-inbox table-hover">
	<tbody>
	<c:forEach var="rank" items="${ranks }">
		<c:if test="${rank.rNum > 5 }"><tr onclick="detailOpen('performance','${rank.per_id}')"></c:if>
		<c:if test="${rank.rNum <= 5 }"><tr class="unread" onclick="detailOpen('performance','${rank.per_id}')"></c:if>
			<!--상위권  -->
			<td class="inbox-small-cells w10p">${rank.rNum}위</td>
			<!--빈칸  -->
			<td class="view-message  dont-show w20p">code: ${rank.per_id }</td>
			<td class="view-message w50p">${rank.perf_title }</td>
			<td class="view-message  text-right w20p">판매수량: ${rank.sellCnt}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="row">
	<c:if test="${productNum<allCnt }">
	<a onclick="perf_load('productRank_perf?showNum=${productNum}')">10건 더보기 ( ${productNum}/${allCnt} )</a>
	</c:if>
</div>
<br>
<br>
</div>
</html>