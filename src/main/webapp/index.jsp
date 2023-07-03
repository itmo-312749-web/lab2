<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="static/styles/content.css">
	<link rel="stylesheet" href="static/styles/plot.css">

	<link rel="icon" href="static/img/java-icon.svg">
	<title>Home</title>
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
					<a class="nav-link active text-decoration-underline" href="index.jsp" disabled>
						Home
					</a>
					<a class="nav-link" href="results.jsp">
						Results
					</a>
				</div>
			</div>
		</div>
	</nav>
	<div id="content-wrapper" class="container m-auto bg-white  ">
		<div class="row flex-wrap justify-content-center">
			<div id="plot-half" class="col container-half">
				<svg id="plot" height="400px" width="400px">
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
				</svg>
			</div>

			<div id="form-half" class="col container-half">
				<form action="controller" method="POST" id="user-data-form" class="m-auto">
					<div class="row g-3">
						<div class="col-md-12">
							<label class="form-label">X:</label>
							<div id="x-input-group" class="row input-group justify-content-around">
								<label for="x-input-1" class="col-1">
									<input type="radio" id="x-input-1" class="x-radio-input" name="x-radio" value="-2">
									-2
								</label>
								<label for="x-input-2" class="col-1">
									<input type="radio" id="x-input-2" class="x-radio-input" name="x-radio" value="-1.5">
									-1.5
								</label>
								<label for="x-input-3" class="col-1">
									<input type="radio" id="x-input-3" class="x-radio-input" name="x-radio" value="-1">
									-1
								</label>
								<label for="x-input-4" class="col-1">
									<input type="radio" id="x-input-4" class="x-radio-input" name="x-radio" value="-0.5">
									-0.5
								</label>
								<label for="x-input-5" class="col-1">
									<input type="radio" id="x-input-5" class="x-radio-input" name="x-radio" value="0">
									0
								</label>
								<label for="x-input-6" class="col-1">
									<input type="radio" id="x-input-6" class="x-radio-input" name="x-radio" value="0.5">
									0.5
								</label>
								<label for="x-input-7" class="col-1">
									<input type="radio" id="x-input-7" class="x-radio-input" name="x-radio" value="1">
									1
								</label>
								<label for="x-input-8" class="col-1">
									<input type="radio" id="x-input-8" class="x-radio-input" name="x-radio" value="1.5">
									1.5
								</label>
								<label for="x-input-9" class="col-1">
									<input type="radio" id="x-input-9" class="x-radio-input" name="x-radio" value="2">
									2
								</label>
							</div>
							<input type="hidden" id="x-actual-value" name="x" value="">
						</div>

						<div class="col-md-12">
							<label for="y-input" class="form-label">Y:</label>
							<input type="text" id="y-input" class="form-control" placeholder="[-5 ; 5]">
							<input type="hidden" id="y-actual-value" name="y" value="">
						</div>

						<div class="col-md-12">
							<label class="form-label">R:</label>
							<div class="row input-group justify-content-around">
								<label for="r-input-1" class="col-1">
									<input type="checkbox" id="r-input-1" class="r-checkbox-input" value="1">
									1
								</label>
								<label for="r-input-2" class="col-1">
									<input type="checkbox" id="r-input-2" class="r-checkbox-input" value="2">
									2
								</label>
								<label for="r-input-3" class="col-1">
									<input type="checkbox" id="r-input-3" class="r-checkbox-input" value="3">
									3
								</label>
								<label for="r-input-4" class="col-1">
									<input type="checkbox" id="r-input-4" class="r-checkbox-input" value="4">
									4
								</label>
								<label for="r-input-5" class="col-1">
									<input type="checkbox" id="r-input-5" class="r-checkbox-input" value="5">
									5
								</label>
							</div>
							<input type="hidden" id="r-actual-value" name="r" value="">
						</div>

						<div class="col-md-12 d-flex justify-content-end">
							<input type="button" id="clear-btn"
								   class="btn btn-danger m-2 col-md-3" value="Clear">
							<input type="submit" id="submit-btn"
								   class="btn btn-success m-2 col-md-3" value="Submit">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="static/bootstrap/bootstrap.js"></script>
	<script src="static/scripts/userData.js"></script>
	<script src="static/scripts/plot.js"></script>
</body>
</html>