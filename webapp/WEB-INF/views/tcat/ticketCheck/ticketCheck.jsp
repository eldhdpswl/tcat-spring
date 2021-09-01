<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.ticket {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: 700px;
	margin: 20px auto;
}

.ticket .stub, .ticket .check {
	box-sizing: border-box;
}

.stub {
	background: #ef5658;
	height: 250px;
	width: 250px;
	color: white;
	padding: 20px;
	position: relative;
	border-right: 2px dashed grey;
}

.check {
	background: #fff;
	height: 250px;
	width: 450px;
	padding: 30px;
	position: relative;
	border: 1px solid #d0d0d0;
}

.check .big {
	font-size: 30px;
	font-weight: 900;
	line-height: .8em;
}

.check .number {
	position: absolute;
	top: 30px;
	right: 50px;
	color: #ef5658;
	font-size: 30px;
}

.check .info {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: start;
	-ms-flex-pack: start;
	justify-content: flex-start;
	font-size: 12px;
	margin-top: 20px;
	width: 100%;
}

.check .info section {
	width: 25%;
	margin: 0;
}

.check .info section:before {
	content: '';
	background: #ef5658;
	display: block;
	width: 40px;
	height: 3px;
	margin-bottom: 5px;
}

.check .info section .title {
	font-size: 10px;
	text-transform: uppercase;
}

.darkness {
	position: absolute;
	top: 0;
	left: 0;
	width: inherit;
	height: inherit;
	background: #000000;
	/* 추가된 부분 */
	opacity: 0;
	transition: all .6s linear;
}

/* 추가된 부분 */
.stub:hover .darkness {
	opacity: 0.4;
}

.btn-plus {
	margin: 100px 80px;
	top: 0;
	left: 0;
	position: absolute;
	text-align: center;
	/* 추가된 부분 */
	opacity: 0;
}
/* 추가된 부분 */
.stub:hover .btn-plus {
	opacity: 1;
	transform: scale(1);
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.btn-filter').change(function() {
			var $target = $(this).val();
			if ($target != 'all') {
				$('.tic').css('display', 'none');
				$('.tic[data-status="' + $target + '"]').fadeIn('slow');
			} else {
				$('.tic').css('display', 'none').fadeIn('slow');
			}
		});

		$(".ticCancel").click(function() {
			var del_num = $(this).attr("name");
			var bool = confirm("예매취소 하시겠습니까?");
			if (bool) {//결제취소
				load("ticStepUpdate?del_num=" + del_num + "&ticket_step=6");
			}
		});
	});
</script>
</head>
<!--공백  -->
<div class="col-md-12 h50"></div>

<!--지금 예매한 영화 -->
<div class="col-md-12">
	<div class="col-md-12">
		<div class="col-md-2"></div>
		<div class="col-md-8 h50">
			<div class="col-md-12 c fs18 pt17">
				<b>예매 중인 공연</b>
			</div>
		</div>
		<div class="col-md-2"></div>

	</div>
	<!--미래 티켓 갯수대로 출력  -->
	<c:if test="${futureTicket_num == null}">
		현재 예매하신 공연이 없습니다.
	</c:if>
	<c:if test="${futureTicket_num != null }">
		<c:forEach var="index" items="${futureTicket_num }">
			<div class="ticket">
				<c:forEach var="ft" items="${futureTicket.get(index)}">
					<c:set var="ticket" value="${ft}" />
				</c:forEach>
				<div class="stub c"
					style="background-image:url('${image}performance/${ticket.perf_Image}');  background-size: 100%;">
					<div class="darkness"></div>
					<div class="btn-plus">
						<input type="button" class="btn btn-warning w80p ticCancel"
							value="예매취소" name="${index}">
					</div>
				</div>
				<div class="check">
					<div class="big w70p" style="text-overflow:ellipsis; overflow:hidden; height:30px ">
						 <nobr>${ticket.perf_title}</nobr>
					</div>
					<div class="big">
						<br>
						<fmt:formatDate
							value="${ticket.ticet_date}"
							pattern="yyyy년 MM월 dd일" />
						${ticket.remain_round.split(",")[ticket.round-1]}
					</div>
					<div class="number">${futureTicket.get(index).size()}매</div>
					<div class="info">
						<section>
						<div class="title" style="text-overflow:ellipsis; overflow:hidden"><nobr>회차정보</nobr></div>
						<div>
						${ticket.remain_round.split(",")[ticket.round-1]}
						</div>
						</section>
						<br>
						<section>
						<div class="title">장소</div>
						<div>${ticket.hall_name}</div>
						</section>
						<section>
						<div class="title">티켓번호</div>
						<div>${ticket.ticket_num}</div>
						</section>
						<section>
						<div class="title">좌석</div>
						<div style="text-overflow:ellipsis; overflow:scroll; max-height: 60px; s" >
							<c:forEach var="tic" items="${futureTicket.get(index)}">
							${tic.seat_type} - ${tic.seat_num}<br>
							</c:forEach>
						</div>
						</section>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

</div>

<!--과거 예매 영화 -->
<div class="col-md-12" style="background-color: #d4d3c9">
	<div class="col-md-12">
		<div class="col-md-2"></div>
		<div class="col-md-8 h50">
			<div class="col-md-12 c fs18 pt17">
				<b>내가 본 공연</b>
			</div>
		</div>
		<div class="col-md-2"></div>

	</div>
	<div class="col-md-12">
		<hr>
		<div class="col-md-2"></div>
		<div class="col-md-8 h50">

			<div class="col-md-10 fs18">
				<i class="glyphicon glyphicon-play "></i> 관람하신 공연
				${pastTicket.size()}개
			</div>
			<div class="col-md-2">
				<select class="w100p btn-filter form-control">
					<option value="all">전체</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
				</select>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<c:if test="${pastTicket.size()==null}">
		<div class="col-md-12">
			<div class="col-md-2"></div>
			<div class="col-md-8 c">
				과거 기록이 없습니다.<br>
			</div>
			<div class="col-md-2"></div>
		</div>
	</c:if>
	<c:if test="${pastTicket.size()!=null}">
		<c:forEach var="index" items="${past_nums }">
			<c:forEach var="pt" items="${pastTicket.get(index)}">
					<c:set var="pTicket" value="${pt}" />
			</c:forEach>
			<div class="ticket tic"
				data-status="<fmt:formatDate value="${pTicket.ticet_date}" pattern="yyyy" />">
				<div class="stub c"
					style="background-image:url('${image}performance/${pTicket.perf_Image}');  background-size: 100%;">
				</div>
				<div class="check">
					<div class="big">${pTicket.perf_title}</div>
					<div class="big">
						<br>
						<fmt:formatDate value="${pTicket.ticet_date}"
							pattern="yyyy년 MM월 dd일" />
						${pTicket.remain_round.split(",")[ticket.round-1]}
					</div>
					<div class="number">${pastTicket.get(index).size()}매</div>
					<div class="info">
						<section>
						<div class="title">회차정보</div>
						<div>${pTicket.remain_round.split(",")[pTicket.round-1]}</div>
						</section>
						<br>
						<section>
						<div class="title">장소</div>
						<div>${pTicket.hall_name}</div>
						</section>
						<section>
						<div class="title">티켓번호</div>
						<div>${pTicket.ticket_num}</div>
						</section>
						<section>
						<div class="title">좌석</div>
						<div>
							<c:forEach var="tic" items="${pastTicket.get(index)}">
						${tic.seat_type} - ${tic.seat_num}<br>
							</c:forEach>

						</div>
						</section>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>


	<!--더보기 -->
</div>


</html>