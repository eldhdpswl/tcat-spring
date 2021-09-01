<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관람/상품 후기 게시판</title>
</script>
</head>
<body>
<div class="col-md-12 h50"></div>
<div class="col-md-1"></div>
<div class="col-md-10">
	<h4 class="trgothic">관람/상품 후기 관리 게시판</h4>
<hr>
</div>
<div class="col-md-12 h25"></div>
<c:if test="${commentManagerCate=='공연'}">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="danger">
						<td width="100px"><b>후기번호</b></td>
						<td width="200px"><b>공연제목</b></td>
						<td width="700px"><b>내용</b></td>
						<td width="400px"><b>작성자</b></td>
						<td width="200px"><b>작성일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.perf_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>	
							<td><input type="button" onclick="commentDelete(${dto.notice_num},'commentManger');"value="삭제"></td>					
						</tr>
					</c:forEach>
				</table>
			<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
			
			<div class="col-md-1"></div>
		<br>
	<!-- 페이지 컨트롤 -->
	<div class="col-md-5"></div>
		<div class="col-md-6">
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table></div>
		 <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">   
               <input type="hidden" name="commentManagerCate" value=${commentManagerCate}>
               
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">후기번호</option>
                  <option value="2">작성자</option>
                  <option value="3">제목</option>
                  <option value="4">내용</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('commentManager')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
		</c:if>
		
		<c:if test="${commentManagerCate=='스토어'}">
 		
		<div class="row">
			<div class="col-md-1"></div>
				<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="warning">
						<td width="100px"><b>후기번호</b></td>
						<td width="200px"> <b>상품명</b></td>
						<td width="700px"><b>내용</b></td>
						<td width="400px"><b>작성자</b></td>
						<td width="200px"><b>작성일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.disc_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>	
							<td><input type="button" onclick="commentDelete(${dto.notice_num},'commentManger');"value="삭제"></td>					
						</tr>
					</c:forEach>
				</table>
			<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
			
			<div class="col-md-1"></div>
		<br>
	<!-- 페이지 컨트롤 -->
	<div class="col-md-5"></div>
		<div class="col-md-6">
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('commentManager?commentManagerCate=${commentManagerCate}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table></div>
		<form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="commentManagerCate" value=${commentManagerCate}>
            
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">후기번호</option>
                  <option value="2">작성자</option>
                  <option value="3">제목</option>
                  <option value="4">내용</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('commentManager')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
		</c:if>
	
			<div class="col-md-1"></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>