<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div class="row">
    	<div class="col-md-12 h20"></div>    	
    	<div class="col-md-12 h20">
    	<div class="col-md-2"></div>    	
    	
    	<span class="ffffff trgothic fs15">공연영상</span>
    	
    	</div>    	
    	<div class="col-md-12 h20"></div>    	
    	<div class="col-md-3"></div>
    	<div class="col-md-6">
				<div class="thumbnail c" >
					<div class="embed-responsive embed-responsive-16by9">
 					 <iframe  width="816" height="459" class="embed-responsive-item" src="${movie_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>
			</div><!-- md2 -->
        <div class="col-md-3"></div>
    	<div class="col-md-12 h60"></div>    	
	</div><!-- md12 -->


</body>
</html>