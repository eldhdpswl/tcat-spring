<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../setting.jsp" %>
 <%@ page import="spring.project.tcat.VO.TcatPerformanceVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		var hall_name=$('#hall_name');
		var postNum=$('#postNum');
		var addr=$('#addr');
		var detailAddr=$('#detailAddr');
		var seatcolumn=$('#seatcolumn');
		var seatrow=$('#seatrow');


		hall_name.blur(function() {
			if (!hall_name.val()) {
				$("#hallError").css('display', 'inline');
			}else{
				$("#hallError").css('display', 'none');
			}
		});

		postNum.blur(function() {
			if (!postNum.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});
		addr.blur(function() {
			if (!addr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
		detailAddr.blur(function() {
			if (!detailAddr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
		seatrow.blur(function() {
			if (!seatrow.val()) {
				$("#seatError").css('display', 'inline');
			} else{
				$("#seatError").css('display', 'none');
			}
		});		
		seatcolumn.blur(function() {
			if (!seatcolumn.val()) {
				$("#seatError").css('display', 'inline');
			} else{
				$("#seatError").css('display', 'none');
			}
		});		
	});
	
</script>
</head>
<body>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("공연장 수정 성공하였습니다.");
			 $( "#result" ).load( "${pageContext.request.contextPath}/hallModify" );
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("공연장 수정 실패!");
		</script>
	</c:if> 
	
<div class="row">	
	<div class="col-md-1"></div>
		<div class="col-md-10 c">		
			<div class="page-header">
				<h3>
				공연장 정보
				</h3>
			</div>
			
					<!-- 공연장이름 -------------------------------------------------------------------------------- -->
					<input type="hidden" name="hall_id" value="${vo.hall_id}" disabled>
					<input type="hidden" name="place_num" value="${vo.place_num}" disabled>
					<div class="form-group">
						<label for="hall_name"><span style="color:red;">*</span> 공연장 이름 </label>
						<div>
							<input type="text" class="form-control" id="hall_name" name="hall_name"
								value="${vo.hall_name }" disabled>
						</div>
						<div style="display:inline">
							<span style="display: none; color: red;" id="hallError">필수입력입니다.</span>
						</div>
					</div>
					<!-- 공연장이름 -------------------------------------------------------------------------------- -->

						<!-- 주소검색 -------------------------------------------------------------------------------- -->
						<label for="sample6_postcode"><span style="color:red;">*</span> 주소 </label>
						<input type="text" class="form-control" name="postNum" 	value="${vo.province} ${vo.city} ${vo.address} ${vo.postNum }" disabled>

				
					<!-- 주소검색 -------------------------------------------------------------------------------- -->
						<div class="row">
							<div class="col-md-12 h25"></div>
						</div>
					<div class="form-group c">
					<label for="seatrow"><span style="color:red;">*</span> 좌석 </label><br>
							<c:set var="seatArr" value="${fn:split(vo.seat_line,'_') }"/>
						행 : <input type="number" name="seatrow" id="seatrow" value="${seatArr[0]}" disabled>
						열 : <input type="number" name="seatcolumn" id="seatcolumn" value="${seatArr[1]}" disabled>
											
					 <div class="row bf5f5f5">
					 <div class="col-md-12 h25"></div>
					<div class="col-md-12 c pt30 thumbnail ">
					<div class="col-md-12 h21"></div>
					
					<%
					TcatPerformanceVO vo=(TcatPerformanceVO)request.getAttribute("vo");
						String[] seatLineArr=vo.getSeat_line().split("_");
						int seatRow=Integer.parseInt(seatLineArr[0]);
						int seatColumn=Integer.parseInt(seatLineArr[1]);
						String vip=null;
						String r=null;
						String s=null;
						String a=null;
						String b=null;
						vip=vo.getVIP_seat();
						r=vo.getR_seat();
						s=vo.getS_seat();
						a=vo.getA_seat();
						b=vo.getB_seat();
						String[] vipArr=null;
						String[] rArr=null;
						String[] sArr=null;
						String[] aArr=null;
						String[] bArr=null;
						if(vip!=null) {
							vipArr=vip.split("/");
						}
						if(r!=null){
							rArr=r.split("/");			
						}
						if(s!=null){		
							sArr=s.split("/");
						}
						if(a!=null){
							aArr=a.split("/");					
						}
						if(b!=null){
							bArr=b.split("/");					
						}
						
						for(int i=0;i<=seatRow;i++){
							for(int j=0;j<=seatColumn;j++){ 
								%>
								&nbsp;<input type="button" name="<%=i%>-<%=j%>" 
								<%
									String check=i+"-"+j;
									int checkNum=0;
								if( vip != null && checkNum==0 ){
										for(int k=0; k < vipArr.length;k++){
											if(vipArr[k].equals(check)){
												checkNum=1;
												 %> class="myButtonVIP m1 w50" value="VIP.<%=check%>"><% 
											}
										}
									}
								if( r != null && checkNum==0 ){
										for(int k=0; k < rArr.length;k++){
											if(rArr[k].equals(check)){
												checkNum=1;
												 %> class="myButtonR m1 w50" value="R.<%=check%>"><% 
											}
										}
									}
								if( s != null && checkNum==0 ){
										for(int k=0; k < sArr.length;k++){
											if(sArr[k].equals(check)){
												checkNum=1;
												 %> class="myButtonS m1 w50" value="S.<%=check%>"><% 
											}
										}
									}
								if( a != null && checkNum==0 ){
										for(int k=0; k < aArr.length;k++){
											if(aArr[k].equals(check)){
												checkNum=1;
												 %> class="myButtonA m1 w50" value="A.<%=check%>"><% 
											}
										}
									}
								if( b != null && checkNum==0 ){
										for(int k=0; k < bArr.length;k++){
											if(bArr[k].equals(check)){
												checkNum=1;
												 %> class="myButtonA m1 w50" value="B.<%=check%>"><% 
											}
										}
									}
								
								if(checkNum==0) {
									%> class="myButtonNO m1 w40" value="<%=check%>" disabled>
							<% }
								
					}
							%><br> <%
				}%>
						<div class="col-md-12 h21"></div>
						</div> 
									

						
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">	
							<span>VIPseat:</span><input type="text" name="VIPseat" class="form-control" value="${vo.getVIP_seat()}" disabled>
							<span>Rseat:</span><input type="text" name="Rseat" class="form-control"  value="${vo.getR_seat()}" disabled>
							<span>Sseat:</span><input type="text" name="Sseat" class="form-control"  value="${vo.getS_seat()}" disabled>
							<span>Aseat:</span><input type="text" name="Aseat" class="form-control"  value="${vo.getA_seat()}" disabled>
							<span>Bseat:</span><input type="text" name="Bseat" class="form-control"  value="${vo.getB_seat()}" disabled>
							</div>
						</div>
					</div>
					<span style="display: none; color: red;" id="seatError">필수입력입니다.</span>
						<div class="col-md-12 h21"></div>



					<div class="form-group text-center">
						<button type="button" class="btn btn-info"  onclick="window.history.back();">
							목록<i class="fa fa-check spaceLeft"></i>
						</button>
					</div>
			
		</div>
	<div class="col-md-1"></div>
</div>




</body>
</html>