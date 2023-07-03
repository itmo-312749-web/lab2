<%--
  Created by IntelliJ IDEA.
  User: kharl
  Date: 28.06.2023
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="static/styles/content.css">
	<link rel="stylesheet" href="static/styles/plot.css">

	<link rel="icon" href="static/img/java-icon.svg">
	<title>Invalid Parameters</title>
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				Navigation
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="index.jsp" disabled>
						Home
					</a>
					<a class="nav-link" href="results.jsp">
						Results
					</a>
				</div>
			</div>
		</div>
	</nav>

	<div id="content-wrapper" class="container row m-auto flex-wrap bg-white  justify-content-between">
		<h1>This is <span style="color: crimson;">Invalid Parameters</span> page</h1>
	</div>

	<script src="static/bootstrap/bootstrap.js"></script>

</body>
</html>
