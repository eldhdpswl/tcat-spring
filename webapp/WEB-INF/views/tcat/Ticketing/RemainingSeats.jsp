<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li style="margin:2px 5px;padding:8px 10px;background-color:#eeeeee">VIP석 : ${vo2.getVIP_seatPrice()}원 (잔여:${RemainingSeatsVIP}석)</li>
		<li style="margin:2px 5px;padding:8px 10px;background-color:#eeeeee">R석 : ${vo2.getR_seatPrice()}원 (잔여:${RemainingSeatsR}석)</li>
		<li style="margin:2px 5px;padding:8px 10px;background-color:#eeeeee">S석 : ${vo2.getS_seatPrice()}원 (잔여:${RemainingSeatsS}석)</li>
		<li style="margin:2px 5px;padding:8px 10px;background-color:#eeeeee">A석 : ${vo2.getA_seatPrice()}원 (잔여:${RemainingSeatsA}석)</li>
		<li style="margin:2px 5px;padding:8px 10px;background-color:#eeeeee">B석 : ${vo2.getB_seatPrice()}원 (잔여:${RemainingSeatsB}석)</li>
	</ul>

</body>
</html>