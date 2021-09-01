<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.project.tcat.VO.TcatPerformanceVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){  //onload랑 비슷함
	 
	
	if($("input[name='seat_type']")!=0){
		
		var seat_type=$("input[name='seat_type']").val(); //
		var seat_type=seat_type.split(",");

		for(var i=0;i<seat_type.length;i++){
			var a=seat_type[i].split(".");
			var seat="#"+a[1];
			$(seat).addClass("active");  //버튼을 눌렀을때를 나타냄
			$(seat).addClass("selected"); //active상태를 유지시켜줌
		}
	}	  

    $('.checkButton').click(function(e){
    	var id="#";
        id +=e.target.getAttribute('id');
        if ( ( id != '') && (id != null))  
    	var active = $(id).hasClass("active");
     	if(active){
    		 $(id).removeClass("active");
    		 $(id).removeClass("selected");
    		 var idvalue=$("input[name='seat_type']").val();
    		 var idArr=idvalue.split(",");   
    		 var onClickId=$(id).val();
    		 var onClickIdArr=onClickId.split(".");
    		 if(idArr.length==1){
    			 $("input[name='seat_type']").val("0");
    			 $("input[name='price']").val(0);
    			 $("input[name='totalPrice']").val(0);
    			 
    		 }else{
    	   	idvalue="";
    	   	var idclick=$(id).val();
     	   	 for(var i=0;i<idArr.length;i++){
    	   		 if(idArr[i]!=idclick){
    	   			if(idvalue==""){
       	    		 idvalue=idArr[i];
       	    		 }else{
       	    			 idvalue+=","+idArr[i];
       	    		 } 	
    	   		 }else{
    	   			 price=$("input[name='price']").val();
    	   			if(onClickIdArr[0]=="VIP"){
        		 		price=(price*1)-($("input[name='vipprice']").val()*1);
        		 	}else if(onClickIdArr[0]=="R"){
        		 		price=(price*1)-($("input[name='rprice']").val()*1);
        		 	}else if(onClickIdArr[0]=="S"){
        		 		price=(price*1)-($("input[name='sprice']").val()*1);
        		 	}else if(onClickIdArr[0]=="A"){
        		 		price=(price*1)-($("input[name='aprice']").val()*1);
        		 	}else if(onClickIdArr[0]=="B"){
        		 		price=(price*1)-($("input[name='bprice']").val()*1);
        		 	}
    	   		 }
    		 } 
    	   	 $("input[name='seat_type']").val("");
    		 $("input[name='seat_type']").val(idvalue);
    		 $("input[name='price']").val(price);
    		 
    		 
    		 var a=$("input[name='delpay']").val();
    		 var b=$("input[name='price']").val();
    		 var total=(a*1)+(b*1);
    		 $("input[name='totalPrice']").val(total);
    		 }
    	}else{
    		 $(id).addClass("active");
    		 $(id).addClass("selected");
    		 var idvalue=$("input[name='seat_type']").val();
    		 var onClickId=$(id).val();
    		 var onClickIdArr=onClickId.split(".");
    		 var price=0;
    		 if(idvalue==0){
    		 idvalue=$(id).val();
    		 	if(onClickIdArr[0]=="VIP"){
    		 		price=$("input[name='vipprice']").val();
    		 	}else if(onClickIdArr[0]=="R"){
    		 		price=$("input[name='rprice']").val();
    		 	}else if(onClickIdArr[0]=="S"){
    		 		price=$("input[name='sprice']").val();
    		 	}else if(onClickIdArr[0]=="A"){
    		 		price=$("input[name='aprice']").val();
    		 	}else if(onClickIdArr[0]=="B"){
    		 		price=$("input[name='bprice']").val();
    		 	}
    		 
    		 }else{
    			 price=(1*$("input[name='price']").val());
    			 idvalue=$("input[name='seat_type']").val();
    			 idvalue+=","+$(id).val();
     		 	if(onClickIdArr[0]=="VIP"){
    		 		price=(price*1)+($("input[name='vipprice']").val()*1);
    		 	}else if(onClickIdArr[0]=="R"){
    		 		price=(price*1)+($("input[name='rprice']").val()*1);
    		 	}else if(onClickIdArr[0]=="S"){
    		 		price=(price*1)+($("input[name='sprice']").val()*1);
    		 	}else if(onClickIdArr[0]=="A"){
    		 		price=(price*1)+($("input[name='aprice']").val()*1);
    		 	}else if(onClickIdArr[0]=="B"){
    		 		price=(price*1)+($("input[name='bprice']").val()*1);
    		 	}
    		 } 		
    		 $("input[name='seat_type']").val(idvalue);
    		 $("input[name='price']").val(price);
    		 
    		 var a=$("input[name='delpay']").val();
    		 var b=$("input[name='price']").val();
    		 var total=(a*1)+(b*1);
    		 $("input[name='totalPrice']").val(total);//위의 Ajax부분으로 토스
    	}  
    
    });
});






</script>
</head>
<body>

	<div class="row bf5f5f5">
	<div class="h25"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h4>좌석확인</h4>
			<hr>
		</div>
	
	</div>
	 <div class="row bf5f5f5">
	<div class="col-md-12 c pt30 thumbnail ">
	<%
	
	    ArrayList<TcatPerformanceVO> dtos=null;
	    dtos=(ArrayList<TcatPerformanceVO>)request.getAttribute("dtos"); //전체공연장정보
	    ArrayList<TcatPerformanceVO> dtos2=null;
	    dtos2=(ArrayList<TcatPerformanceVO>)request.getAttribute("dtos2"); //예매된정보
		String seat_line=dtos.get(0).getSeat_line();
		String[] seat_lineArr=seat_line.split("_");
		int seatRow=Integer.parseInt(seat_lineArr[0]);
		int seatColumn=Integer.parseInt(seat_lineArr[1]);
		Map<String,Object> map=new HashMap<String,Object>();
		
		String vip=null;
		String r=null;
		String s=null;
		String a=null;
		String b=null;
		vip=dtos.get(0).getVIP_seat();  //get(0)에서 0을 준이유는 처음시작이라는것을 강제성으로 줌
		r=dtos.get(0).getR_seat();
		s=dtos.get(0).getS_seat();
		a=dtos.get(0).getA_seat();
		b=dtos.get(0).getB_seat();
		int vipPrice=dtos.get(0).getVIP_seatPrice();
		int rPrice=dtos.get(0).getR_seatPrice();
		int sPrice=dtos.get(0).getS_seatPrice();
		int aPrice=dtos.get(0).getA_seatPrice();
		int bPrice=dtos.get(0).getB_seatPrice();
		%>
		<input type="hidden" name="vipprice" value="<%=vipPrice %>"> 		
		<input type="hidden" name="rprice" value="<%=rPrice %>"> 		
		<input type="hidden" name="sprice" value="<%=sPrice %>"> 		
		<input type="hidden" name="aprice" value="<%=aPrice %>"> 		
		<input type="hidden" name="bprice" value="<%=bPrice %>"> 		
		<% 
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
		if(dtos2!=null){
		for(int q=0;q<dtos2.size();q++){
			map.put(dtos2.get(q).getSeat_num(),dtos2.get(q).getSeat_type());
		}
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
								 if(dtos2!=null && map.containsValue("VIP") && map.containsKey(vipArr[k])){
								 %> class="myButtonVIP m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonVIP m1 w50 checkButton" id="<%=check%>" value="VIP.<%=check%>"><% 									 
								 }
							}
						}
					}
				if( r != null && checkNum==0 ){
						for(int k=0; k < rArr.length;k++){
							if(rArr[k].equals(check)){
								checkNum=1;
								 if(dtos2!=null && map.containsValue("R") && map.containsKey(rArr[k])){
									 %> class="myButtonR m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
									 }else{
									 %> class="myButtonR m1 w50 checkButton" id="<%=check%>" value="R.<%=check%>"><% 
							
									 }
							}
						}
					}
				if( s != null && checkNum==0 ){
						for(int k=0; k < sArr.length;k++){
							if(sArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("S") && map.containsKey(sArr[k])){
								 %> class="myButtonS m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonS m1 w50 checkButton" id="<%=check%>" value="S.<%=check%>"><% 
							}
						}
					}
				}
				if( a != null && checkNum==0 ){
						for(int k=0; k < aArr.length;k++){
							if(aArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("A") && map.containsKey(aArr[k])){
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="A.<%=check%>"><% 
							}
						}
					}
				}
				if( b != null && checkNum==0 ){
						for(int k=0; k < bArr.length;k++){
							if(bArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("B") && map.containsKey(bArr[k])){
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="B.<%=check%>"><% 
							}
						}
					}
				}
				if(checkNum==0) {
					%> class="myButtonNO m1 w50 checkButton" id="<%=check%>" value="<%=check%>" disabled>
			<% }
				
		}
			%><br> <%
	}
%>
		</div> 
	</div>



</body>
</html>