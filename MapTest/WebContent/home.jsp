<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Map My Choice:Main</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css"
	type="text/css">
<link rel="stylesheet" href="themes/css/prettyPhoto.css" type="text/css">
<link rel="stylesheet/less" href="themes/css/main.less" />
<script src="themes/js/less.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="themes/font-awesome/css/font-awesome.min.css">
<link charset="utf-8"
	href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	media="screen" rel="stylesheet">
<link charset="utf-8"
	href="//fonts.googleapis.com/css?family=Roboto%20Condensed:400"
	media="screen" rel="stylesheet">
<script charset="utf-8"
	src="//www.gstatic.com/external_hosted/modernizr/modernizr.js"></script>
<style>
ul {
	list-style: none;
}
h1,h2,h3,h4,h5,h6
{
color:#1C1C1C;
}
fieldset,legend {
	style: none;
}

.nanButton {
	width: 125px;
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar">
	<section id="headerSection">


		<div id="menuSection" style="height: 57px; background: #A6C190;">
			<div class="container">
				<div class="navbar">
					<div class="container">
						<!--<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>-->
						<a class="brand" title="Map My Choice" href="#home"
							style="padding: 0px; border-width: 12px;"> &nbsp;<img
							style="width: 80%; margin-top: -13%;" class="pull-left"
							src="images/newLogo2.png"></a>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="bodySection">
		<div id="carouselSection" style="margin-top: -17px;">
			<div class="container">
				<div class="row">
					<div class="span7" style="margin-left: 11px;">
						<div id="myCarousel" style="width: 825px;">
							<div class="carousel-inner gallery">
								<div class="active item">
									<!--<img src="http://politic365.com/wp-content/blogs.dir/1/files/2012/12/Christmas-HQ-wallpapers-christmas-2768066-1600-1000.jpg"/>-->
									<div id="map" style="width: 825px; float: left; height: 500px;"></div>
									<div class="span5"
										style="margin-left: -1px; width: 868px; margin-top: -10px">
										<h4>
											Overwhelmed with too many options? Please enter the zip code
											to search: <input type="number"
												style="width: 100px; height: 15px;" /><button
												name="Map it!" style="margin-left: 1%;margin-top: -8px;" value="map it!" >map it!</button>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span5" style="width: 327px; margin-left: 180px;">
						<br>
						<h2>Map a place for your retail venture</h2>
						<h4>Over 200 cities covered and still exploring your
							opportunities</h4>
						<br>
						<button id="refreshButton">Refresh</button>

						<div id="side_bar"
							style="height: 201px; overflow-y: auto; overflow-x: hidden;">
							<h5>Please select the legend to filter</h5>
							<h5>
								<table>
									<tr>
										<td><input type="button" class="legend" id="redLegend"
											style="width: 37px; height: 40px; border-color: transparent; background-color: transparent; background-size: 40px; background-image: url(http://maps.google.com/mapfiles/kml/paddle/red-blank.png);"></td>
										<td>Less Populated Area</td>
									</tr>
									<tr>
										<td><input type="button" class="legend" id="yellowLegend"
											style="width: 37px; height: 40px; border-color: transparent; background-color: transparent; background-size: 40px; background-image: url(http://maps.google.com/mapfiles/kml/paddle/blu-blank.png);"></td>
										<td>Average Populated Area</td>
									</tr>
									<tr>
										<td><input type="button" class="legend" id="greenLegend"
											style="width: 37px; height: 40px; border-color: transparent; background-color: transparent; background-size: 40px; background-image: url(http://maps.google.com/mapfiles/kml/paddle/grn-blank.png);"></td>
										<td>More Populated Area</td>
									</tr>
								</table>
							</h5>
						</div>


						<div id="imageData" class="freeBtnWrapper">
							<h4>
								Click on the <input type="image" src="images/pie-chart-icon.png"
									id="moreButton" class='genLocationChart' alt="Generate Chart"
									style="width: 25%"> icon on the map to generate the
								relevant statistics
							</h4>

						</div>


					</div>
				</div>
			</div>
		</div>

	</section>

	<section id="footerSection"
		style="margin-top: -40px; background: #A6C190;">
		<footer style="height: 30px;">
			<div class="container" style="margin-top: -50px">
				<div class="row" style="float: right;">
					<div class="span4" style="float: right;">
						<div class="row" style="float: right;">
							<div class="span4" style="float: right;">
								<h3 class="followus" style="float: right;">
									Follow us <a href="https://www.facebook.com/MapMyChoice"
										target="_blank" title=""><i class="icon-facebook-sign"></i></a>
									<a href="#" target="_blank" title=""><i
										class="icon-twitter-sign"></i> </a> <a href="#" target="_blank"
										title=""><i class="icon-google-plus-sign"></i> </a> <a
										href="#" target="_blank" title=""><i
										class="icon-pinterest-sign"></i> </a> <a href="#" target="_blank"
										title=""><i class="icon-linkedin-sign"></i> </a> <br>
								</h3>

							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>
	</section>
	<a href="#" class="go-top" style="display: none;"><i
		class="icon-double-angle-up"></i></a>
	<script
		src="http://maps.google.com/maps?file=api&amp;v=3&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
		type="text/javascript"></script>
	<script src="themes/js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/jquery.scrollTo-1.4.3.1-min.js"
		type="text/javascript"></script>
	<script src="themes/js/jquery.easing-1.3.min.js"></script>
	<script src="themes/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="themes/js/jquery.prettyPhoto.js"></script>
	<script src="themes/js/custom.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/home.js"></script>
</html>
</body>