<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
					<br>
					<h4><b>탈퇴 회원 복구</b></h4>
					<hr>
			           <table class="table table-hover table-bordered table-condensed c fs10">
                           <tr class="bg-primary">
                              <td><b>아이디</b></td>
                              <td><b>이름</b></td>
                              <td><b>생년월일</b></td>
                              <td><b>성별</b></td>
                              <td><b>연락처</b></td>
                              <td><b>이메일</b></td>
                              <td><b>등급</b></td>
                              <td><b>가입일자</b></td>
                              <td><b>관리</b></td>
                           </tr>
                           <c:forEach var="vo" items="${dtos}"> 
                              <tr>
                                  <td>${vo.member_id}</td>
                                <td>${vo.member_name}</td>
                                 <td>${vo.member_birth}</td>
                                 <td>
                                 <c:if test="${vo.member_gender==1}">남자</c:if>
                                 <c:if test="${vo.member_gender==2}">여자</c:if>
                                 </td>
                                 <td>${vo.member_hp}</td>
                                 <td>${vo.member_email}</td>
                                 <td>${vo.getRating()}</td>
                                 <td>${vo.member_joindate}</td>  
                                  <td>
                                 <input type="button" onclick="load('sleepMemberPro?member_id=${vo.member_id}&reUrl=retireMemberRecuvery&Hcnt=3')" value="회원복구">
                                 </td>  
                              </tr>
                           </c:forEach>
                        </table>
                
     		              <!--검색  -->
							
                         
                        
                             
                           <!--카테고리  -->
		
		
			
	</div>
	<div class="col-md-1"></div>
	   <div class="row">
                 <div class="col-md-5"></div>
                 <div class="col-md-1">
                 <table class="c" style="width: 1000px" align="center">
						<tr>
						<th><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a onclick="load('retireMemberRecuvery');">[◀◀]</a>
							<a onclick="load('retireMemberRecuvery?pageNum=${startPage - pageBlock}');">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('retireMemberRecuvery?pageNum=${i}');">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('retireMemberRecuvery?pageNum=${startPage + pageBlock}');">[▶]</a>
							<a onclick="load('retireMemberRecuvery?pageNum=${pageCount}');">[▶▶]</a>
						</c:if>
					</c:if></th>
					</tr>
				</table>
		<br>
		<br>
		<br>
				
				</div>
				 <div class="col-md-5">
				 	    <form class="navbar-form navbar-right" role="search" id="ajaxSubmitForm">
				 	   <input type="hidden" name="Hcnt" value="3">
				 	   <input type="hidden" name="reUrl" value="retireMemberRecuvery">
				 	   <input type="hidden" name="search" value="1">
                             <select class="m10 p5" name="sCnt">
                            	 <option value="1">아이디</option>
                            	 <option value="2">이름</option>
                            	 <option value="3">이메일</option>
                            	 <option value="4">성별</option>
                            	 <option value="5">생년월일</option>
                            	 <option value="6">연락처</option>
                            	 <option value="7">등급</option>
                          	</select>
                            <div class="form-group">
                                 <input type="text" class="form-control" placeholder="Search" name="keyword">
                             </div>
                              <button type="button" class="btn btn-default" onclick="ajaxSubmit('retireMemberRecuvery')">검색</button>
                         </form>
				 </div> 
				</div>
		<div class="col-md-12 h400"></div>
	</div>
</body>
</html>