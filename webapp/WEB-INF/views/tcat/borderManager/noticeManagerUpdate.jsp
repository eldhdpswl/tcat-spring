<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$("#noticeupdateall").click(function(){
	var formData = new FormData();
	if(!$("input[name=noticeboard_Image_up]")[0].files[0]){
		alert("이미지를 넣어주세요");
		$("input[name=noticeboard_Image_up]").focus();
	}else if(!$("input[name=noticeTitle_up]").val()){
		alert("제목을 작성해주세요!");
		$("input[name=noticeTitle_up]").focus();
	}else{
		formData.append("notice_num",${notice_num});
		formData.append("noticeTitle_up",$("input[name=noticeTitle_up]").val());
		formData.append("hostId",$("input[name=hostId]").val());
		formData.append("noticeContent_up",$("textarea[name=noticeContent_up]").val());
		formData.append("noticeboard_Image_up",$("input[name=noticeboard_Image_up]")[0].files[0]);
		$.ajax({
			url : 'noticeManagerListUpdatePro',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
			}
		});	
	}
});

 
</script>
</head>
<body>

	<form action="" id="noticeupdateForm" name="noticeupdateForm" onsubmit="return false">
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<h1><center>공지사항 게시글 수정</center></h1>
		<hr><br>
		<table class="table table-hover table-bordered table-condensed c fs12">
			<tr>
				<td class="bg-primary"><b>작성자</b></td> <!--  style="width: 50%" -->
				<td style="width: 50%">
					tcat관리자
					<input type="hidden" name="hostId" value="tcat관리자">
					
				</td>
				<td class="bg-primary"><b>이미지 파일</b></td>
				<td>
					<input type="file" name="noticeboard_Image_up"><!-- style="width: 100%" -->
				</td>
			</tr>
			
			<tr>	
				<td class="bg-primary"><b>제목</b></td>
				<td colspan=3>
					<input class="w100p" type="text" name="noticeTitle_up"><!-- style="width:270px" -->
				</td><!-- .w50 -->
			</tr>
	
			<tr>
				<td class="bg-primary"><b>질문내용</b></td>
				<td colspan=3>
					<textarea class="w100p h300"  name="noticeContent_up"></textarea><!-- style="width:270px -->
				</td><!-- rows="10" cols="40" -->
			</tr>
			
			
		</table>
		<hr>
		<div>
			<center>
			 	<input type="submit" id="noticeupdateall" value="작성" 
			 		class="btn btn-primary btn-sm btn btn-info">
			 	<input type="reset" value="취소" 
			 	    class="btn btn-primary btn-sm btn btn-info">
			 	<input type="button" value="목록보기" onclick="load('noticeManager');"
			 		class="btn btn-primary btn-sm btn btn-info">
			 		
			</center>
		</div>
		<br><br>
	</div>

	<div class="col-md-1"></div>
	</form>
	
	
</body>
</html>