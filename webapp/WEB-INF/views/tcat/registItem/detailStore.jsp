<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
    padding: 20px;
    font-family: 'Open Sans', sans-serif;
    background-color: #f7f7f7;
}

.lib-panel {
    margin-bottom: 20Px;
}
.lib-panel img {
    width: 100%;
    background-color: transparent;
}

.lib-panel .row,
.lib-panel .col-md-6 {
    padding: 0;
    background-color: #FFFFFF;
}


.lib-panel .lib-row {
    padding: 0 20px 0 20px;
}

.lib-panel .lib-row.lib-header {
    background-color: #FFFFFF;
    font-size: 20px;
    padding: 10px 20px 0 20px;
}

.lib-panel .lib-row.lib-header .lib-header-seperator {
    height: 2px;
    width: 26px;
    background-color: #d9d9d9;
    margin: 7px 0 7px 0;
}

.lib-panel .lib-row.lib-desc {
    position: relative;
    height: 100%;
    display: block;
    font-size: 13px;
}
.lib-panel .lib-row.lib-desc a{
    position: absolute;
    width: 100%;
    bottom: 10px;
    left: 20px;
}

.row-margin-bottom {
    margin-bottom: 20px;
}

.box-shadow {
    -webkit-box-shadow: 0 0 10px 0 rgba(0,0,0,.10);
    box-shadow: 0 0 10px 0 rgba(0,0,0,.10);
}

.no-padding {
    padding: 0;
}
.myButton {
	-moz-box-shadow:inset 0px 0px 26px -10px #ffffff;
	-webkit-box-shadow:inset 0px 0px 26px -10px #ffffff;
	box-shadow:inset 0px 0px 26px -10px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e3e3e3), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #e3e3e3 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #e3e3e3 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #e3e3e3 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #e3e3e3 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #e3e3e3 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e3e3e3', endColorstr='#f6f6f6',GradientType=0);
	background-color:#e3e3e3;
	-moz-border-radius:24px;
	-webkit-border-radius:24px;
	border-radius:24px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:8px 13px;
	text-decoration:none;
	text-shadow:0px 0px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #e3e3e3));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #e3e3e3 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #e3e3e3 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #e3e3e3 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #e3e3e3 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #e3e3e3 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#e3e3e3',GradientType=0);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}


</style>
<script type="text/javascript">
//로그인 모달 by명훈
		$("#image").click(
		function() {
			$("#modal_result").load("${pageContext.request.contextPath}/imageView?detail_image=${dto.detail_image}");
		});

</script>
<body>
<div class="container">
	<div class="row">
		<h4><b>공연 상세 수정 페이지</b><input data-toggle="modal" data-target="#myModal" type="button"style="margin-left:20px;" class="myButton" value="image"></h4>
	</div>
    <hr>
    <form action="updateDetailStore" method="post" enctype="multipart/form-data">
        <div class="row-margin-bottom">

            <div class="no-padding lib-item" data-category="ui">
                <div class="lib-panel">
                    <div class="row box-shadow">
                        
                        <div >
                            <div class="lib-row lib-header">
                                	상품설명
                                <div class="lib-header-seperator"></div>
                            </div>
                            <div class="lib-row lib-desc">
								<textarea rows="19" cols="162" name="per_ex" style="width:100%;margin-bottom:20px;">${dto.per_ex}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    <div class="row">
    	<input type="hidden" name="detail_num" value="${dto.detail_num}">
    	<span style="float:left">추가 이미지 : </span> <input type="file" name="Detail_Image" style="margin-left:10px;float:left;width:210px">
		<input type="submit"class="myButton" value="수정">
	</div>
        
   </form>


</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:700px;">
    <div class="modal-content">
    	<img src="${image}/store/${dto.detail_image}">
    </div>
  </div>
</div>
</body>
</html>