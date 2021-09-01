<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-1"></div>
	
	<div class="col-sm-10 col-md-10">
		<hr>
		<div><span>공지사항 게시판 상세정보</span></div>
		<div><span>'${dto.notice_title}'의 상세정보</span></div>
		<hr><br>
		<div class="thumbnail c" >
			<div class="disInline ">						
				<h6 class="floatL mr20 ml15"><label>번호 : </label> ${dto.notice_num}</h6>
				<h6 class="floatL mr20"><label>제목 : </label> ${dto.notice_title}</h6>
				<h6 class="floatL mr20"><label>작성자 : </label> ${dto.member_id}</h6>
				<h6 class="floatL mr20"><label>작성일 : </label> ${dto.writeDate}</h6>
			</div>
			<hr>				
			<img src="${image}Boarder/${dto.notice_image}" class="img-responsive ">
			<div class="caption">
				<h6 class="floatL"><label>내용 : </label> ${dto.contents}</h6>
				
			</div><br>
			<hr>
	   </div>
	   <div class="navbar-form navbar-right">
	   		 <input type="button" onclick="noticeManagerDel(${dto.notice_num});"
			       value="삭제"  class="btn btn-primary btn-sm btn btn-info"><!-- ,'noticeManager' -->
			 <input type="button" onclick="noticeManagerUpdate(${dto.notice_num});"
			        value="수정"  class="btn btn-primary btn-sm btn btn-info">
	         <input type="button" value="목록보기" onclick="load('noticeManager');"
			 		class="btn btn-primary btn-sm btn btn-info">
	   
			
	   </div>
	   <br><br><br>
	</div>
	
	<div class="col-md-1"></div>
  	
</body>
</html>