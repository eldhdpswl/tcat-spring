<%@page import="spring.project.tcat.VO.SelectHellInfoVO"%>
<%@page import="spring.project.tcat.VO.CategoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${script}jquery-1.12.4.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$("#perfomence").click(function() {
			var formData = new FormData();
			if(!$("input[name=perf_title]").val()){
				alert("공연제목을 입력해주세요!");
				$("input[name=perf_title]").focus();
			}else if($("select[name=cateNum]").val()==0){
				alert("카테고리를 선택해주세요!");
				$("select[name=cateNum]").focus();
			}else if(!$("input[name=perf_Image]")[0].files[0]){			
				alert("공연이미지를 입력해주세요!");
				$("input[name=perf_Image]").focus();
			}else if(!$("input[name=startDate]").val()){			
				alert("공연시작일자를 선택해주세요!");
				$("input[name=startDate]").focus();
			}else if(!$("input[name=endDate]").val()){			
				alert("공연종료일자를 선택해주세요!");
				$("input[name=endDate]").focus();
			}else if($("select[name=hall_id]").val()==0){			
				alert("공연장을 선택해주세요!");
				$("select[name=hall_id]").focus();
			}else if($("select[name=first_grade]").val()==0){			
				alert("우선순위를 선택해주세요!");
				$("select[name=first_grade]").focus();
			}else if(!$("input[name=remain_round]").val()){			
				alert("회차를 선택해주세요!");
				$("input[name=remain_round]").focus();
			}else if(!$("input[name=possible_age]").val()){			
				alert("관람가능 연령을 선택해주세요!");
				$("input[name=possible_age]").focus();
			}else if(!$("input[name=seatPrice]").val()){			
				alert("좌석정보를 선택해주세요!");
				$("input[name=seatPrice]").focus();
			}else{
				formData.append("perf_title", $("input[name=perf_title]").val());
				formData.append("cateNum",$("select[name=cateNum]").val());
				formData.append("perf_Image",$("input[name=perf_Image]")[0].files[0]);
				formData.append("startDate", $("input[name=startDate]").val());
				formData.append("endDate", $("input[name=endDate]").val());
				formData.append("hall_id",$("select[name=hall_id]").val());
				formData.append("first_grade", $("select[name=first_grade]").val());
				formData.append("remain_round", $("input[name=remain_round]").val());
				formData.append("possible_age", $("input[name=possible_age]").val());
				formData.append("VIP_seatPrice", $("input[name=VIP_seatPrice]").val());
				formData.append("R_seatPrice", $("input[name=R_seatPrice]").val());
				formData.append("S_seatPrice", $("input[name=S_seatPrice]").val());
				formData.append("A_seatPrice", $("input[name=A_seatPrice]").val());
				formData.append("B_seatPrice", $("input[name=B_seatPrice]").val());
				
				$.ajax({
					url : 'insertPerformance',
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
	});

	$(function() {
		$("#store").click(function() {
			var formData = new FormData();
			if(!$("input[name=disc_title]").val()){
				alert("상품이름을 입력해주세요!");		
				$("input[name=disc_title]").focus();
			}else if(!$("input[name=disc_price]").val()){
				alert("상품가격을 입력해주세요!");
				$("input[name=disc_price]").focus();
			}else if(!$("input[name=disc_image]")[0].files[0]){
				alert("상품이미지를 넣어주세요!");				
				$("input[name=disc_image]").focus();
			}else if(!$("input[name=disc_con]").val()){
				alert("상품설명을 입력해주세요!");			
				$("input[name=disc_con]").focus();
			}else if($("select[name=cateNum]").val()==0){
				alert("카테고리를 선택해주세요!");	
				$("select[name=cateNum]").focus();
			}else if($("select[name=first_grade]").val()==0){
				alert("상품 우선순위를 선택해주세요!");	
				$("select[name=first_grade]").focus();
			}else if(!$("input[name=disc_count]").val()){
				alert("상품수량을 입력해주세요!");				
				$("input[name=disc_count]").focus();
			}else{
				formData.append("disc_title", $("input[name=disc_title]").val());
				formData.append("disc_price", $("input[name=disc_price]").val());
				formData.append("disc_image", $("input[name=disc_image]")[0].files[0]);
				formData.append("disc_con", $("input[name=disc_con]").val());
				formData.append("cateNum",$("select[name=cateNum]").val());
				formData.append("first_grade", $("select[name=first_grade]").val());
				formData.append("disc_count", $("input[name=disc_count]").val());
				$.ajax({
					url : 'insertStore',
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
	});

	function page(url) {
		$("#result").load("${pageContext.request.contextPath}/" + url);
	}
	function page(url, pageNum) {
		$("#result").load(
				"${pageContext.request.contextPath}/" + url + "?pageNum="
						+ pageNum);
	}
	function seatPrice(title,hall_name,vip,r,s,a,b){
		var url="seatPrice?title="+title+"&hall_name="+hall_name+"&vip="+vip+"&r="+r+"&s="+s+"&a="+a+"&b="+b;
		window.open(url, "confirm", "menubar=no, width=500, height=330");
	}
	
	function cheackSeatPrice(){
		window.open("cheackSeatPrice", "confirm", "menubar=no, width=500, height=330");
	}
	function detailPer(detail_num){
		window.open("detailPer?detail_num="+detail_num, "confirm", "menubar=no, width=950, height=630");
	}
	function detailStore(detail_num){
		window.open("detailStore?detail_num="+detail_num, "confirm", "menubar=no, width=950, height=630");
	}
</script>
</head>
<body>
	<script>
		/* 0111 현석 */
		$(function() {
			$("#d1").datepicker();
			$("#d2").datepicker();
		});
		/* 0111 현석끝 */
	</script>
	<c:if test="${error==1}">
		<script type="text/javascript">
			alert("추가 실패! 빠진건 없는지 확인하세요!");
		</script>
	</c:if>
	<c:if test="${error1==1}">
		<script type="text/javascript">
			alert("추가 실패! 빠진건 없는지 확인하세요!");
		</script>
	</c:if>
	
	<div class="col-md-12 bffffff">
		<c:if test="${item!=1}">
			<div class="row">
				
				<div class="col-md-12 h25"></div>
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<form action="insertPerformance" id="registItemForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="per_step" value="1">
						<h4 class="trgothic">공연정보 추가</h4>
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th>공연제목</th>
								<th>카테고리</th>
								<th style="width: 15%">공연이미지</th>
								<th style="width: 10%">시작날짜</th>
								<th style="width: 10%">종료날짜</th>
								<th>공연장</th>
								<th>좌석별 가격 설정</th>
								<th>우선순위</th>
								<th>회차(하루간 공연회차)</th>
								<th style="width: 8%">관람가능연령</th>
								<th style="width: 4%"></th>
							</tr>
							
							<tr>
								<td><input type="text" name="perf_title"
									style="width: 100%"></td>
								<td><select name="cateNum" style="width: 100%">
										<option value="0"></option>
										<%
											ArrayList<CategoryVO> SDtos = (ArrayList<CategoryVO>) request.getAttribute("SDtos");
												for (int i = 0; i < SDtos.size(); i++) {
													int cateNum = SDtos.get(i).getCateNum();
													String category = SDtos.get(i).getCategory();
													String mDev = SDtos.get(i).getmDev();
													String sDev = SDtos.get(i).getsDev();
										%>
										<option value="<%=cateNum%>"><%=cateNum%>[
											<%=mDev%>-
											<%=sDev%>]
										</option>
										<%
											}
										%>

								</select></td>
								<td><input type="file" name="perf_Image"
									style="width: 100%"></td>
								<td><input type="text" name="startDate" style="width: 100%"
									id="d1" readonly></td>
								<td><input type="text" name="endDate" style="width: 100%"
									id="d2" readonly></td>
								<td><select name="hall_id" style="width: 100%">
										<option value="0"></option>
										<%
											ArrayList<SelectHellInfoVO> HDtos = (ArrayList<SelectHellInfoVO>) request.getAttribute("HDtos");
												for (int j = 0; j < HDtos.size(); j++) {
													int hall_id = HDtos.get(j).getHall_id();
													String hall_name = HDtos.get(j).getHall_name();
										%>
										<option value="<%=hall_id%>"><%=hall_name%></option>
										<%
											}
										%>
								</select></td>
								<td><input type="text" name="seatPrice" onclick="cheackSeatPrice();">
									<input type="hidden" name="VIP_seatPrice" value="0">
									<input type="hidden" name="R_seatPrice" value="0">
									<input type="hidden" name="S_seatPrice" value="0">
									<input type="hidden" name="A_seatPrice" value="0">
									<input type="hidden" name="B_seatPrice" value="0">
								</td>
								<td><select name="first_grade" style="width: 100%">
										<option value="0"></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
								</select></td>
								<td><input type="text" name="remain_round"
									onclick="round();" style="width: 100%" readonly></td>
								<td><input type="text" name="possible_age"
									style="width: 100%"></td>
								<td><button type="button" id="perfomence"
										style="border: 2px solid #cccccc;">추가</button></td>
							</tr>
						</table>
					</form>

					<h4 class="trgothic c">공연정보 리스트</h4>
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<td><b>번호</b></td>
							<td><b>공연제목</b></td>
							<td><b>카테고리</b></td>
							<td><b>공연이미지</b></td>
							<td><b>공연날짜</b></td>
							<td><b>공연장</b></td>
							<td><b>좌석별 가격확인</b></td>
							<td><b>우선순위</b></td>
							<td><b>공연스텝</b></td>
							<td><b>회차(하루간 공연회차)</b></td>
							<td><b>관람가능연령</b></td>
							<td><b>상세페이지 수정</b></td>
						</tr>
						<c:if test="${cnt>0}">
							<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									<td>${number}<c:set var="number" value="${number-1}" />
									</td>
									<td>${dto.perf_title}</td>
									<td>${dto.category}&nbsp${dto.mDev}&nbsp${sDev}</td>
								<td><img
										src="/tcat/resources/image/performance/${dto.perf_Image}"
										style="width: 50px; height: 50px;"></td>
									<td>${dto.startDate}~${dto.endDate}</td>
									<td>${dto.hall_name}</td>
									<td><input type="button" class="btn" value="가격" onclick="seatPrice('${dto.perf_title}','${dto.hall_name}','${dto.getVIP_seatPrice()}','${dto.getR_seatPrice()}','${dto.getS_seatPrice()}','${dto.getA_seatPrice()}','${dto.getB_seatPrice()}');"></td>
									<td>${dto.first_grade}</td>
									<td>${dto.per_step}</td>
									<td>${dto.remain_round}</td>
									<td>${dto.possible_age}</td>
									<td><input type="button" value="상세페이지수정" onclick="detailPer('${dto.detail_num}')">
								</tr>
							</c:forEach> 
						</c:if>
						<!-- 회원이 없으면 -->
						<c:if test="${cnt==0}">
							<tr>
								<td colspan="9" align="center">회원이 없습니다.</td>
							</tr>
						</c:if>
					</table>
					<!-- 페이지 컨트롤 -->
					<div class="col-md-5"></div>
					<div class="col-md-6">
					<table style="width: 1000px" align="center">
						<th align="center"><c:if test="${cnt>0}">
								<!-- 처음[◀◀]/이전블록[◀] 특수문자 :ㅁ한자키 -->
								<ul class="pagination">
   								 <li>
								<c:if test="${startPage>pageBlock}">
									<a onclick="page('registItem')"class="btn-group" role="group">[◀◀]</a>
									<a onclick="page('registItem','${startPage-pageBlock}')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i==currentPage}">
										<span><b>${i}</b></span>
									</c:if>
									<c:if test="${i!=currentPage}">
										<a onclick="page('registItem','${i}')">${i}</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶]/끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="page('registItem','${startPage+pageBlock}')"aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
									<a onclick="page('registItem','${pageCount}')">[▶▶]</a>
								</c:if>
							</c:if>
							</nav>
						</th>
					</table>
					</div>
				<div class="col-md-1"></div>
				</div>
				
			</div>
		</c:if>

		<c:if test="${item==1}">
			<div class="row">			
				<div class="col-md-12 h25"></div>
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form action="insertStore" name="StoreForm" method="post"
						enctype="multipart/form-data">
						<h4 class="trgothic">스토어 상품 추가</h4>
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th>상품이름</th>
								<th style="width: 10%">가격</th>
								<th style="width: 16%">이미지</th>
								<th>상품설명</th>
								<th>카테고리</th>
								<th>상품우선순위</th>
								<th>상품수량</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="disc_title"
									style="width: 100%"></td>
								<td><input type="text" name="disc_price"
									style="width: 100%"></td>
								<td><input type="file" name="disc_image"
									style="width: 100%"></td>
								<td><input type="text" name="disc_con" style="width: 100%"></td>
								<td><select name="cateNum" style="width: 100%">
										<option value="0"></option>
										<%
											ArrayList<CategoryVO> SDtos = (ArrayList<CategoryVO>) request.getAttribute("SDtos");
												for (int i = 0; i < SDtos.size(); i++) {
													int cateNum = SDtos.get(i).getCateNum();
													String category = SDtos.get(i).getCategory();
													String mDev = SDtos.get(i).getmDev();
													String sDev = SDtos.get(i).getsDev();
										%>
										<option value="<%=cateNum%>"><%=cateNum%>[
											<%=mDev%>-
											<%=sDev%>]
										</option>
										<%
											}
										%>

								</select></td>
								<td><select name="first_grade" style="width: 100%">
										<option value="0"></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
								</select></td>
								<td><input type="text" name="disc_count"></td>
								<td><button type="button" id="store" style="border: 2px solid #cccccc;">추가</button></td>
							</tr>
						</table>

					</form>
					<h4 class="trgothic c">스토어 상품 리스트</h4>
					
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<th>번호</th>
							<th>상품코드</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>이미지</th>
							<th>상품설명</th>
							<th>카테고리</th>
							<th>상품우선순위</th>
							<th>상품수량</th>
							<th>상세페이지 수정</th>
						</tr>
						<c:if test="${cnt>0}">
							<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									<td>${number}<c:set var="number" value="${number-1}" /></td>
									<td>${dto.disc_code}</td>
									<td>${dto.disc_title}</td>
									<td>${dto.disc_price}</td>
									<td><img
										src="/tcat/resources/image/store/${dto.disc_image}"
										style="width: 50px; height: 50px;"></td>
									<td>${dto.disc_con}</td>
									<td>${dto.mDev}&nbsp${dto.sDev}</td>
									<td>${dto.first_grade}</td>
									<td>${dto.disc_count}</td>
									<td><input type="button" value="상세페이지 수정" onclick="detailStore('${dto.detail_num}');"> 
								</tr>
							</c:forEach>
						</c:if>
						<!-- 회원이 없으면 -->
						<c:if test="${cnt==0}">
							<tr>
								<td colspan="9" align="center">회원이 없습니다.</td>
							</tr>
						</c:if>
					</table>
					<!-- 페이지 컨트롤 -->
					<div class="col-md-5"></div>
					<div class="col-md-6">
					<table style="width: 1000px" align="center">
						<th align="center"><c:if test="${cnt>0}">
								<!-- 처음[◀◀]/이전블록[◀] 특수문자 :ㅁ한자키 -->
								<ul class="pagination">
   								 <li>
								<c:if test="${startPage>pageBlock}">
									<a onclick="page('storeItem')"class="btn-group" role="group">[◀◀]</a>
									<a onclick="page('storeItem','${startPage-pageBlock}')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i==currentPage}">
										<span><b>${i}</b></span>
									</c:if>
									<c:if test="${i!=currentPage}">
										<a onclick="page('storeItem','${i}')">${i}</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶]/끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="page('storeItem','${startPage+pageBlock}')"aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
									<a onclick="page('storeItem','${pageCount}')">[▶▶]</a>
								</c:if>
							</c:if>
							</nav>
						</th>
					</table>
					</div>
				<div class="col-md-1"></div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</c:if>
	</div>

</body>

</html>