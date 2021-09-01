<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row baaaaaa">
	
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h4>좌석확인</h4>
			<hr>
		</div>
	
	</div>
	 <div class="row bf5f5f5">
	<div class="col-md-12 c pt30 thumbnail ">
	<%
		int seatRow=Integer.parseInt(request.getParameter("row"));
		int seatColumn=Integer.parseInt(request.getParameter("column"));
		String vip=null;
		String r=null;
		String s=null;
		String a=null;
		String b=null;
		vip=request.getParameter("vip");
		r=request.getParameter("r");
		s=request.getParameter("s");
		a=request.getParameter("a");
		b=request.getParameter("b");
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
		</div> 
	</div>

</body>
</html>