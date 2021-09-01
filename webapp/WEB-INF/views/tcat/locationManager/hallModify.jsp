<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
    $('#ajaxSubmitForm').keydown(function(e) {
         if (e.keyCode == 13) {
           ajaxSubmit('hallModify');
         }
          });
 });
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
					<br>
					<h4><b>공연장 수정</b></h4>
					<hr>
			           <table class="table table-hover table-bordered table-condensed c fs10">
                           <tr class="bg-primary">
                              <td><b>공연장코드</b></td>
                              <td><b>공연장명</b></td>
                              <td><b>시/도</b></td>
                              <td><b>시/군/구</b></td>
                              <td><b>상세주소</b></td>
                              <td><b>관리</b></td>
                           </tr>
                           <c:forEach var="vo" items="${dtos}"> 
                              <tr>
                                  <td>${vo.hall_id}</td>
                                  <td>${vo.hall_name}</td>
                                <td>${vo.province}</td>
                                 <td>${vo.city}</td>
                                 <td>${vo.address}</td>
                                 <td>
                                 <input type="button" onclick="load('hallModifyDB?hall_id=${vo.hall_id}')" value="공연장수정">
                                 </td>  
                              </tr>
                           </c:forEach>
                        </table>         
			
	</div>
	<div class="col-md-1"></div>
	
	   <div class="row">
                 <div class="col-md-5"></div>
                 <div class="col-md-1">
                 <c:if test="${serch!=1}">
                 <table class="c" style="width: 1000px" align="center">
						<tr>
						<th><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a onclick="load('hallModify');">[◀◀]</a>
							<a onclick="load('hallModify?pageNum=${startPage - pageBlock}');">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('hallModify?pageNum=${i}');">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('hallModify?pageNum=${startPage + pageBlock}');">[▶]</a>
							<a onclick="load('hallModify?pageNum=${pageCount}');">[▶▶]</a>
						</c:if>
					</c:if></th>
					</tr>
				</table>
		<br>
		<br>
		<br>
			</c:if>				
				</div>
				 <div class="col-md-5">
				 	   <form class="navbar-form navbar-right" role="search" id="ajaxSubmitForm" onsubmit="return false">
				 	   <input type="hidden" name="search" value="1">
                             <select class="m10 p5" name="sCnt">
                            	 <option value="1">공연장이름</option>
                            	 <option value="2">공연장코드</option>
                            	 <option value="3">광역시/도</option>
                            	 <option value="4">시/군/구</option>
                            	 <option value="5">상세주소</option>
                          	</select>
                            <div class="form-group">
                                 <input type="text" class="form-control" placeholder="Search" name="keyword">
                             </div>
                              <button type="button" class="btn btn-default" onclick="ajaxSubmit('hallModify')">검색</button>
                         </form>
				 </div> 
				 <div class="col-md-12 h400"></div>
				</div>
		
	</div>

</body>
</html>