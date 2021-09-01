<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body onload="window.location='guestPage';">
<h1>
	Hello world!
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="hostPage">hostPage</a>
<a href="guestPage">guestPage</a>
<a href="myPage">myPage</a>
</body>
</html>
