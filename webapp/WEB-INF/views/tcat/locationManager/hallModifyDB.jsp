<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">


  //ajax
    function hallSubmit(url){   /* AJAX submit */  
       var result = document.getElementById("result");
       var formData = $("#hallAddForm").serialize();
     
       if (!document.hallAddForm.hall_name.value) {
			alert("홀이름을  입력해주세요!");
			return false;
		} else if (!document.hallAddForm.postNum.value) {
			alert("우편번호를 입력해주세요!");
			return false;
		} else if (!document.hallAddForm.addr.value){ 
			alert("주소를 입력해주세요!");
			return false;		
		} else if (!document.hallAddForm.detailAddr.value){ 
			alert("상세주소를 입력해주세요!");
			return false;		
		} else if (!document.hallAddForm.seatrow.value){ 
			alert("공연장 행을 입력해주세요!");
			return false;		
		} else if (!document.hallAddForm.seatcolumn.value){ 
			alert("공연장 열을 입력해주세요!");
			return false;		
		}
       $.ajax({
                   type : "POST",
                   url : url,
                   cache : false,
                   data : formData,
                   success :  function(msg) {
                      $('#result').html(msg);
                   }, 
                   error : onError
       });
       function onError(data, status){alert("error");}
    }

</script>
<script>
	$(function() {
		var hall_name=$('#hall_name');
		var postNum=$('#postNum');
		var addr=$('#addr');
		var detailAddr=$('#detailAddr');
		var seatcolumn=$('#seatcolumn');
		var seatrow=$('#seatrow');


		hall_name.blur(function() {
			if (!hall_name.val()) {
				$("#hallError").css('display', 'inline');
			}else{
				$("#hallError").css('display', 'none');
			}
		});

		postNum.blur(function() {
			if (!postNum.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});
		addr.blur(function() {
			if (!addr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
		detailAddr.blur(function() {
			if (!detailAddr.val()) {
				$("#addrError").css('display', 'inline');
			} else{
				$("#addrError").css('display', 'none');
			}
		});		
		seatrow.blur(function() {
			if (!seatrow.val()) {
				$("#seatError").css('display', 'inline');
			} else{
				$("#seatError").css('display', 'none');
			}
		});		
		seatcolumn.blur(function() {
			if (!seatcolumn.val()) {
				$("#seatError").css('display', 'inline');
			} else{
				$("#seatError").css('display', 'none');
			}
		});		
	});
	
</script>
</head>
<body>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("공연장 수정 성공하였습니다.");
			 $( "#result" ).load( "${pageContext.request.contextPath}/hallModify" );
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("공연장 수정 실패!");
		</script>
	</c:if> 
	
<div class="row">	
	<div class="col-md-1"></div>
		<div class="col-md-10 c">		
			<div class="page-header">
				<h3>
				공연장 수정
				</h3>
			</div>
				<form action="" role="form" method="post" id="hallAddForm"
					name="hallAddForm">
					<!-- 공연장이름 -------------------------------------------------------------------------------- -->
					<input type="hidden" name="hall_id" value="${vo.hall_id}">
					<input type="hidden" name="place_num" value="${vo.place_num}">
					<div class="form-group">
						<label for="hall_name"><span style="color:red;">*</span> 공연장 이름 </label>
						<div>
							<input type="text" class="form-control" id="hall_name" name="hall_name"
								value="${vo.hall_name }">
						</div>
						<div style="display:inline">
							<span style="display: none; color: red;" id="hallError">필수입력입니다.</span>
						</div>
					</div>
					<!-- 공연장이름 -------------------------------------------------------------------------------- -->

						<!-- 주소검색 -------------------------------------------------------------------------------- -->
						<label for="sample6_postcode"><span style="color:red;">*</span> 주소 </label>
						<div class="form-group">
						<div class="input-group">
						<input type="text" class="form-control" id="sample6_postcode" name="postNum" 	value="${vo.postNum }">
						<span class="input-group-btn">
						<input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</span>
						</div>
						<input type="text" class="form-control" id="sample6_address" name="addr" value="${vo.province } ${vo.city}">
						<input type="text" class="form-control" id="sample6_address2" name="detailAddr" value="${vo.address}">
						</div>
						<span style="display: none; color: red;" id="addrError">필수입력입니다.</span>
				
					<!-- 주소검색 -------------------------------------------------------------------------------- -->
					<div class="form-group c">
					<label for="seatrow"><span style="color:red;">*</span> 좌석생성 </label><br>
							<c:set var="seatArr" value="${fn:split(vo.seat_line,'_') }"/>
						행 : <input type="number" name="seatrow" id="seatrow" value="${seatArr[0]}">
						열 : <input type="number" name="seatcolumn" id="seatcolumn" value="${seatArr[1]}">
						<div class="w100p h1"></div>
						<input type="button" class="btn" value="좌석생성" onclick="seatMake();">
						<input type="button" class="btn" value="좌석확인" onclick="divSeatload();">
						<div class="w100p h1"></div>
					
					<div class="c">

							<div id="seat_result1"></div>

					</div>
						
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">	
							<span>VIPseat:</span><input type="text" name="VIPseat" class="form-control" value="${vo.getVIP_seat()}">
							<span>Rseat:</span><input type="text" name="Rseat" class="form-control"  value="${vo.getR_seat()}">
							<span>Sseat:</span><input type="text" name="Sseat" class="form-control"  value="${vo.getS_seat()}">
							<span>Aseat:</span><input type="text" name="Aseat" class="form-control"  value="${vo.getA_seat()}">
							<span>Bseat:</span><input type="text" name="Bseat" class="form-control"  value="${vo.getB_seat()}">
							</div>
						</div>
					</div>
					<span style="display: none; color: red;" id="seatError">필수입력입니다.</span>
					



					<div class="form-group text-center">
						<button type="button" class="btn btn-info" id="Imember" onclick="return hallSubmit('hallModifyUpdate');">
							공연장수정<i class="fa fa-check spaceLeft"></i>
						</button>
						<button type="button" class="btn btn-warning" onclick="load('hallModify');">
							수정취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</form>
			
		</div>
	<div class="col-md-1"></div>
</div>




</body>
</html>