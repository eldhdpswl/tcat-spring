<%@page import="spring.project.tcat.VO.TcatPerformanceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리별 우선순위변경</title>

</head>
<body>
<%-- 
<fmt:formatDate var="newFormattedDateString" value="${startDate}" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="newFormattedDateString" value="${endDate}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="parsedDate" value="${startDate}" pattern="dd-MM-yyyy HH:mm:ss"/>
<fmt:parseDate var="parsedDate" value="${endDate}" pattern="dd-MM-yyyy HH:mm:ss"/> --%>
​<div class="row">
	<div class="col-md-12 h21"></div>
	<div class="col-md-1"></div>
	<div class="col-md-11 h21"><div><h4 class="trgothic">카테고리별 상품진열관리</h4></div></div>
	<div class="col-md-12 h21"></div>

</div>

	<!--  18.01.11 태성!!  -->
	<!-- 	<h3 align="center">카테고리별 상품 나열 및 우선순위</h3> -->
	<br>
	<hr>
	<div class="catagory" align="center">
		<button type="button" class="btn btn-primary"
			onclick="load('categoryList?category=뮤지컬');">뮤지컬</button>
		<button type="button" class="btn btn-primary"
			onclick="load('categoryList?category=연극');">연극</button>
		<button type="button" class="btn btn-danger"
			onclick="load('categoryList?category=콘서트');">콘서트</button>
		<button type="button" class="btn btn-danger"
			onclick="load('categoryList?category=클래식');">클래식/국악</button>
		<button type="button" class="btn btn-success"
			onclick="load('categoryList?category=무용');">무용/발레</button>
		<button type="button" class="btn btn-warning"
			onclick="load('categoryList?category=스토어');">스토어</button>
	<div class="col-md-1"></div>
	</div>
	<br>
	<div class="col-md-12 h25"></div>
	<c:if test="${category=='뮤지컬'}">
		<!-- 뮤지컬 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-hover table-bordered table-condensed c fs11">
					<tr class="bg-primary">
						<td><b>공연번호(뮤지컬)</b></td>
						<td><b>제목</b></td>
						<td><b>시작일</b></td>
						<td><b>종료일</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>공연스텝</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td><fmt:formatDate value="${dto.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${dto.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.category}</td>
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							

							<td><select class="input" name="first_grade"
								onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
							
							<td><select class="input" name="Cstep"
								onchange="Cstep('Cstep','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.per_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		</div>
		<div class="col-md-1"></div>
		  <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="category" value=${category}>
            
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">공연번호</option>
                  <option value="2">제목</option>
                  <option value="3">스텝</option>
                  <option value="4">소분류</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>

	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='연극'}">
		<!-- 연극 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-hover table-bordered table-condensed c fs11">
					<tr class="bg-primary">
						<td><b>공연번호(연극)</b></td>
						<td><b>제목</b></td>
						<td><b>시작일</b></td>
						<td><b>종료일</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>공연스텝</b></td>
			
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
						<td><fmt:formatDate value="${dto.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${dto.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.category}</td>
								<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>

							<td><select class="input" name="first_grade"
								onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
								<td><select class="input" name="Cstep"
								onchange="Cstep('Cstep','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.per_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		</div>
		 <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
                <input type="hidden" name="category" value=${category}>
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">공연번호</option>
                  <option value="2">제목</option>
                    <option value="3">스텝</option>
                    <option value="4">소분류</option>
                
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>
	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='콘서트'}">
	
		<!-- 콘서트 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="danger">
						<td><b>공연번호(콘서트)</b></td>
						<td><b>제목</b></td>
						<td><b>시작일</b></td>
						<td><b>종료일</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>공연스텝</b></td>

					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td><fmt:formatDate value="${dto.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${dto.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.category}</td>
								<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><select class="input" name="first_grade"
								onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
								<td><select class="input" name="Cstep"
								onchange="Cstep('Cstep','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.per_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</div>
	 <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
                <input type="hidden" name="category" value=${category}>
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">공연번호</option>
                  <option value="2">제목</option>
                    <option value="3">스텝</option>
                    <option value="4">소분류</option>
                
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		<c:if test="${category=='클래식'}">
		<!-- 콘서트 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="danger">
						<td><b>공연번호(클래식)</b></td>
						<td><b>제목</b></td>
						<td><b>시작일</b></td>
						<td><b>종료일</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>공연스텝</b></td>

					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td><fmt:formatDate value="${dto.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${dto.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.category}</td>
								<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><select class="input" name="first_grade"
								onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
								<td><select class="input" name="Cstep"
								onchange="Cstep('Cstep','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.per_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</div>
	 <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
                <input type="hidden" name="category" value=${category}>
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">공연번호</option>
                  <option value="2">제목</option>
                    <option value="3">스텝</option>
                    <option value="4">소분류</option>
                
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			<c:if test="${category=='무용'}">
		<!-- 콘서트 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					<tr class="success">
						<td><b>공연번호(무용)</b></td>
						<td><b>제목</b></td>
						<td><b>시작일</b></td>
						<td><b>종료일</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>공연스텝</b></td>

					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td><fmt:formatDate value="${dto.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${dto.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.category}</td>
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><select class="input" name="first_grade"
								onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
								<td><select class="input" name="Cstep"
								onchange="Cstep('Cstep','${category}','${dto.per_id}',this.value)">
									<option value="0">${dto.per_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</div>
	 <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
                <input type="hidden" name="category" value=${category}>
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">공연번호</option>
                  <option value="2">제목</option>
                    <option value="3">스텝</option>
                    <option value="4">소분류</option>
                
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
            <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
			
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='스토어'}">
	
		<!-- 스토어 -->
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs11">
					
					<tr class="warning">
						<td><b>상품코드</b></td>
						<td><b>상품이름</b></td>
						<td><b>상품가격</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>우선순위</b></td>
						<td><b>상품스텝</b></td>
					</tr>
					
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.disc_code}</td>
							<td>${dto.disc_title}</td>
							<td>${dto.disc_price}</td>
							<td>${dto.cateNum}</td>
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><select class="input" name="first_grade"
								onchange="Sfirst_grade('Sfirst_grade','${category}','${dto.disc_code}',this.value)">
									<option value="0">${dto.first_grade}</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
							</select></td>
							
								<td><select class="input" name="Sstep"
								onchange="Sstep('Sstep','${category}','${dto.disc_code}',this.value)">
									<option value="0">${dto.disc_step}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select></td>
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
				<!-- 처음[◀◀] / 이전 블록[◀] -->
				<c:if test="${startPage > pageBlock}">
						  <%--   <a onclick="categoryload('categoryList','${category}','${sDev}','${keyword}');">[◀◀]</a> --%>
							<a onclick="load('categoryList?category=${category}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>
							<%-- <a onclick="categoryload0('categoryList','${category}','${startPage - pageBlock}','${sDev}','${keyword}');">[◀]</a> --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('categoryList?category=${category}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('categoryList?category=${category}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('categoryList?category=${category}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		</div>
		 <!--검색  -->
            <form class="navbar-form navbar-right" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
                <input type="hidden" name="category" value=${category}>
             
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">상품코드</option>
                  <option value="2">상품이름</option>
                  <option value="3">스텝</option>
                  <option value="4">소분류</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('categoryList')">검색</button>
               <!-- stocksearch(); -->
            </form>
              <div class="col-md-1"></div>
            </div></div>
            <br><br><br><br><br><br>
	</c:if>
</body>
</html>