<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//검색할때
function noticeBoardSearch() {
	var cDev=document.all.cDev.value;
	var keyword=document.all.keyword.value;
	var url="noticeBoard?cDev="+cDev+"&keyword="+keyword; 
	
	$( "#result2" ).load( "${pageContext.request.contextPath}/"+url);	

} 

//글쓰기
function qnawrite(){
	
	$( "#result2" ).load( "${pageContext.request.contextPath}/"+url);
}

</script>

</head>
<body>
	<div ><!--  class="col-md-9 " thumbnail mr15 h300 -->
			<div>
				<br>
				<h4 class="trgothic">공지사항 게시판
				</h4>
				<hr>
				<b>공지사항 게시판입니다.</b><br>
				<b>자유롭게 토론하거나 공개하기 곤란한 질문이나 자주하는 질문은 Q&A게시판이나 1:1게시판을 이용해주세요!</b>
				<hr>
				<br>
				<!-- <div class="navbar-form navbar-right">
					<button type="button" class="btn btn-primary btn-sm btn btn-info">글쓰기</button>
					 <input type="button" value="글쓰기" class="btn btn-primary btn-sm btn btn-info" 
					        onclick="checkid('qnaWriteForm');">
				</div> -->
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="bg-primary">
						<td><b>번호</b></td>
						<td style="width: 15%"><b>제목<b></td>
						<td style="width: 20%"><b>이미지</b></td>
						<td style="width: 15%"><b>내용</b></td>
						<td><b>조회수</b></td>
						<td><b>날짜</b></td>
						
						
					</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.notice_num}</td>
								<td><a onclick="loadBoard('noticeContent?notice_num=${dto.notice_num}');">${dto.notice_title}</a></td>
							    <td>
							    <div class="w200 h170 overflow">
								<img src="/tcat/resources/image/Boarder/${dto.notice_image}" 
								     style="width: 100%;">
								</div>
							    </td>
								
								<%-- 
								<td>
									<c:if test="${dto.notice_div==1}">
									 	공지사항
									 </c:if>
									 <c:if test="${dto.notice_div==2}">
									 	영상컨텐츠 게시판
									 </c:if>
									 <c:if test="${dto.notice_div==3}">
									 	사진컨텐츠 게시판
									 </c:if> 
								</td>--%>
								<%-- <td><a onclick="loadBoard('noticeContent?notice_num=${dto.notice_num}');">${dto.notice_title}</a></td> --%>
								<td>${dto.contents}</td>
								<td>
									${dto.refNum}
								</td>
								<td>${dto.writeDate}</td>
								
								
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="row c">
					<div class="disInline">
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<c:if test="${cnt > 0}">
								<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
								<c:if test="${startPage > pageBlock}">
									<a onclick="loadBoard('noticeBoard?cDev=${cDev}&keyword=${keyword}');">[◀◀]</a>
									<a onclick="loadBoard('noticeBoard?pageNum=${startPage - pageBlock}&cDev=${cDev}&keyword=${keyword}');">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>

									</c:if>

									<c:if test="${i != currentPage}">
										<a onclick="loadBoard('noticeBoard?pageNum=${i}&cDev=${cDev}&keyword=${keyword}');">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="loadBoard('noticeBoard?pageNum=${startPage + pageBlock}&cDev=${cDev}&keyword=${keyword}');">[▶]</a>
									<a onclick="loadBoard('noticeBoard?pageNum=${pageCount}&cDev=${cDev}&keyword=${keyword}');">[▶▶]</a>
								</c:if>
							</c:if>
						</table>
					</div>
				</div> 
				<!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
				<!--검색  -->
				<form class="navbar-form navbar-right" role="search"
					id="ajaxSubmitForm" onsubmit="return false">
					<!--카테고리  -->
					<select id="cDev" name="cDev" class="m10 p5">
						<!-- <option value="0">분류</option> -->
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">번호</option>
						
					</select>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="noticeBoardSearch();">검색</button>
					<!-- stocksearch(); -->
					
				</form>

			</div>
			
			</div>
		
			<!-- <div class="col-md-2 thumbnail">
			</div> -->
</body>
</html>