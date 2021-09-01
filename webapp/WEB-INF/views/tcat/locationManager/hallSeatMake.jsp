<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script type="text/javascript">
	function seatReload(){
		location.reload();
	}

	function seatMake(){
		var seatType=document.all.seatType.value;
		var seatChecknum=document.all.seatCheck;
		
		if(seatType=="VIP"){
			var addVIPCheck="";
		for(var i=0;i<seatChecknum.length;i++){
			
			if(document.all.seatCheck[i].checked){
				document.all.seatCheck[i].disabled = 1;
				document.all.seatCheck[i].checked = false;
				addVIPCheck += (addVIPCheck==0) ? seatChecknum[i].value : "/" + seatChecknum[i].value;
			}
		}
		document.all.VIPseat.value=addVIPCheck;
		}
		if(seatType=="R"){
			var addRCheck="";
			for(var i=0;i<seatChecknum.length;i++){
				
				if(document.all.seatCheck[i].checked){
					document.all.seatCheck[i].disabled = 1;
					document.all.seatCheck[i].checked = false;
					addRCheck += (addRCheck==0) ? seatChecknum[i].value : "/" + seatChecknum[i].value;
				}
			}
		document.all.Rseat.value=addRCheck;
			}
		if(seatType=="S"){
			var addSCheck="";
			for(var i=0;i<seatChecknum.length;i++){
				
				if(document.all.seatCheck[i].checked){
					document.all.seatCheck[i].disabled = 1;
					document.all.seatCheck[i].checked = false;
					addSCheck += (addSCheck==0) ? seatChecknum[i].value : "/" + seatChecknum[i].value;
				}
			}
		document.all.Sseat.value=addSCheck;
			}
		if(seatType=="A"){
			var addACheck="";
			for(var i=0;i<seatChecknum.length;i++){
				
				if(document.all.seatCheck[i].checked){
					document.all.seatCheck[i].disabled = 1;
					document.all.seatCheck[i].checked = false;
					addACheck += (addACheck==0) ? seatChecknum[i].value : "/" + seatChecknum[i].value;
				}
			}
		document.all.Aseat.value=addACheck;
			}
		if(seatType=="B"){
			var addBCheck="";
			for(var i=0;i<seatChecknum.length;i++){
				
				if(document.all.seatCheck[i].checked){
					document.all.seatCheck[i].disabled = 1;
					document.all.seatCheck[i].checked = false;
					addBCheck += (addBCheck==0) ? seatChecknum[i].value : "/" + seatChecknum[i].value;
				}
			}
		document.all.Bseat.value=addBCheck;
			}
	
	}
	
	function goHallAdd(){
		var vipseat=document.all.VIPseat.value;
		var rseat=document.all.Rseat.value;
		var sseat=document.all.Sseat.value;
		var aseat=document.all.Aseat.value;
		var bseat=document.all.Bseat.value;
		
		opener.document.all.VIPseat.value=vipseat;
		opener.document.all.Rseat.value=rseat;
		opener.document.all.Sseat.value=sseat;
		opener.document.all.Aseat.value=aseat;
		opener.document.all.Bseat.value=bseat;
		self.close();
	}

</script>
</head>
<body class="baaaaaa">
	<div class="row baaaaaa">
	
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h4>좌석배치도</h4>
			<hr>
		</div>
	
	</div>
	<div class="row bf5f5f5">
		<div class="col-md-12 c pt30 thumbnail ">
	<%
		int seatRow=Integer.parseInt(request.getParameter("seatRow"));
		int seatColumn=Integer.parseInt(request.getParameter("seatColumn"));
		for(int i=0;i<=seatRow;i++){
			for(int j=0;j<=seatColumn;j++){ %>
				
				&nbsp;<input type="checkbox" name="seatCheck" class="w20 h20" value="<%=i%>-<%=j%>" ><%=i%>-<%=j%>&nbsp;
				
	<%		}%>
			<br>
			
	<%		}%>
		</div>
	</div>
<div class="row c baaaaaa">
<div class="col-xs-4"></div>
		<div class="col-xs-4 c">
		<p>좌석타입</p><select name="seatType"  class="form-control" id="seatTypeSelect"> 
		<option value="VIP">VIP</option>
		<option value="R">R</option>
		<option value="S">S</option>
		<option value="A">A</option>
		<option value="B">B</option>
		</select>
		<input type="button" class="btn m10" value="확인" onclick="seatMake();">
		<br>
		<hr>
		</div>
</div>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">	
	<span>VIPseat:</span><input type="text" name="VIPseat" class="form-control">
	<span>Rseat:</span><input type="text" name="Rseat" class="form-control">
	<span>Sseat:</span><input type="text" name="Sseat" class="form-control">
	<span>Aseat:</span><input type="text" name="Aseat" class="form-control">
	<span>Bseat:</span><input type="text" name="Bseat" class="form-control">
	</div>
</div>
<div class="c">
		<input type="button" class="btn m10" value="등록완료" onclick="goHallAdd()">	
		<input type="reset" class="btn m10" value="다시작성" onclick="seatReload();">	

</div>
</body>
</html>