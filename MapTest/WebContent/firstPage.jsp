<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Map My Choice:Home</title>
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
				<img style="width: 50%" src="images/newLogo2.png" />
				<div id="form" style="margin-top: -70px; margin-left: 385px;">
					<table>
						<tr>
							<td><select required><option value="">--Select
										Country--</option>
									<option value="US">United States</option></select></td>
							<td><select id="stateSelect" required>
							</select></td>
						</tr>
					</table>
					<table style="width: 442px; margin-top: 11px;">
						<tr>
							<td colspan="2"><button id="homeButton">map it!</button></td>
						</tr>
					</table>
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
		src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAPDUET0Qt7p2VcSk6JNU1sBSM5jMcmVqUpI7aqV44cW1cEECiThQYkcZUPRJn9vy_TWxWvuLoOfSFBw"
		type="text/javascript"></script>
	<script src="themes/js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/jquery.scrollTo-1.4.3.1-min.js"
		type="text/javascript"></script>
	<script src="themes/js/jquery.easing-1.3.min.js"></script>
	<script src="themes/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="themes/js/jquery.prettyPhoto.js"></script>
	<script src="themes/js/custom.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/firstPage.js"></script>

	<script type="text/javascript">
		var statesJSON = '{"states":["Alabama","Alaska","Arizona","Arkansas","California","Colorado","'
				+ 'Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","'
				+ 'Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","'
				+ 'Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","'
				+ 'New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","'
				+ 'Pennsylvania","Rhode Island"," South Carolina"," South Dakota"," Tennessee"," Texas"," Utah","'
				+ 'Vermont"," Virginia"," Washington"," West Virginia"," Wisconsin"," Wyoming"]}';
		var parsedJson = $.parseJSON(statesJSON);
		var states = parsedJson.states;
		html = "<option value=''>--Select State--</option>";
		for (var i = 0; i < states.length; i++) {
			html += "<option>" + states[i] + "<\/option>";
		}

		$('#stateSelect').html(html);

		$('#homeButton').click(function() {
			location.href = "home.jsp";

		});
	</script>
</body>

</html>


