<%@ page import="com.itmo.web.lab2.point.Point" %>
<%@ page import="com.itmo.web.lab2.point.PointService" %><%--
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="static/styles/content.css">
	<link rel="stylesheet" href="static/styles/plot.css">

	<link rel="icon" href="static/img/java-icon.svg">
	<title>Results</title>
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				Navigation
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon" ></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="index.jsp" disabled>
						Home
					</a>
					<a class="nav-link active text-decoration-underline" href="results.jsp" disabled>
						Results
					</a>
				</div>
			</div>
		</div>
	</nav>

	<div id="content-wrapper" class="container row m-auto flex-wrap bg-white  justify-content-between">
		<div id="plot-row" class="col-md-12">
			<svg id="plot" class="d-block m-auto" height="400px" width="400px">
				<defs>
					<marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
						<polygon points="0 0, 10 3.5, 0 7"></polygon>
					</marker>
				</defs>
				<rect class="shape" x="50" y="50" width="150" height="150"></rect>
				<polygon class="shape" points="125 200, 200 200, 200 275"></polygon>
				<path class="shape" d="M 200 50 A 150 150, 0, 0, 1, 350 200 L 200 200 Z"></path>
				<line x1="10" y1="200" x2="380" y2="200" stroke="#000" stroke-width="1"
					  marker-end="url(#arrowhead)"></line>
				<line x1="200" y1="390" x2="200" y2="20" stroke="#000" stroke-width="1"
					  marker-end="url(#arrowhead)"></line>

				<circle cx="200" cy="200" r="3" fill="blue"></circle>

				<circle cx="200" cy="50" r="3"></circle>
				<text class="plot-label" text-anchor="end" alignment-baseline="middle" x="190" y="50">R</text>
				<circle cx="200" cy="125" r="3"></circle>
				<text class="plot-label" text-anchor="end" alignment-baseline="middle" x="190" y="125">R/2</text>
				<circle cx="200" cy="275" r="3"></circle>
				<text class="plot-label" alignment-baseline="middle" x="210" y="275">-R/2</text>
				<circle cx="200" cy="350" r="3"></circle>
				<text class="plot-label" alignment-baseline="middle" x="210" y="350">-R</text>

				<circle cx="50" cy="200" r="3"></circle>
				<text class="plot-label" text-anchor="middle" alignment-baseline="baseline" x="350" y="190">R</text>
				<circle cx="125" cy="200" r="3"></circle>
				<text class="plot-label" text-anchor="middle" alignment-baseline="baseline" x="275" y="190">R/2</text>
				<circle cx="275" cy="200" r="3"></circle>
				<text class="plot-label" text-anchor="middle" alignment-baseline="hanging" x="125" y="210">-R/2</text>
				<circle cx="350" cy="200" r="3"></circle>
				<text class="plot-label" text-anchor="middle" alignment-baseline="hanging" x="50" y="210">-R</text>

				<c:if test="${pointService.getLastPoint() != null}">
					<text class="plot-label" x="10" y="20">
						R=${pointService.getLastPoint().r}
					</text>
					<circle cx="${(pointService.getLastPoint().x * 150 / pointService.getLastPoint().r) + 200}"
							cy="${-(pointService.getLastPoint().y * 150 / pointService.getLastPoint().r) + 200}"
							r="3" fill="${pointService.getLastPoint().hit ? "limegreen" : "crimson"}"></circle>
				</c:if>
			</svg>
		</div>

		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">x</th>
					<th scope="col">y</th>
					<th scope="col">r</th>
					<th scope="col">Entry</th>
					<th scope="col">Execution time</th>
					<th scope="col">Timestamp</th>
				</tr>
				</thead>
				<tbody>
				<% int i = 1; %>
				<c:forEach items="${pointService.pointList}" var="point">
					<tr>
						<td><%= i %>
						</td>
						<td>${point.x}</td>
						<td>${point.y}</td>
						<td>${point.r}</td>
						<td>${point.hit ? "Yes" : "No"}</td>
						<td>${point.executionTime / 1e6} (ms)</td>
						<td>${point.getHumanReadableTimestamp()}</td>
					</tr>
					<% ++i; %>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script src="static/bootstrap/bootstrap.js"></script>
</body>
</html>
