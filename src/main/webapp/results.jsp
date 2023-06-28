<%--
  Created by IntelliJ IDEA.
  User: kharl
  Date: 28.06.2023
  Time: 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Results</title>
</head>
<body>
	<h1>This is <span style="color: limegreen;">Results</span> page</h1>

	<ul>
		<c:forEach items="${pointService.pointList}" var="point">
			<li>${point}</li>
		</c:forEach>
	</ul>

</body>
</html>
