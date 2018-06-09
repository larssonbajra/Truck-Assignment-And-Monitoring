<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Truck_Assignment_And_Monitoring.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Truck Assignment and Monitoring</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="" />
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!--//meta tags ends here--<h6 class="caption"> Contact Us</h6>>

	<!--booststrap-->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<!--//booststrap end-->
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons -->
	<!--stylesheets-->
	<link href="css/style.css" rel='stylesheet' type='text/css' media="all">
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<!-- banner text slider-->
	<!--//style sheet end here-->
	<!-- //lightbox files -->
	<link rel="stylesheet" href="css/lightbox.css">
	<!-- //lightbox files -->
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-1.9.0.js"></script>
    


</head>
<body>
    <form id="form1" runat="server">
   <div class="banner-w3">

		<div class="w3-agile-logo">
			<div class="container">
				<div class=" head-wl">
					<div class="headder-w3">
						<h1><a href="index.aspx">TAM</a></h1>
                        
					</div>
                    <div class="w3-header-top-right-text">
						

                    </div>
				
     
                     <div>
                         
                         <asp:Button ID="SignIn" runat="server" Text="SignIn" class="btn btn-lg btn-primary" OnClick="SignIn_Click"/>

                         
                   
                    </div>
                    <div>  &nbsp;&nbsp;&nbsp;&nbsp;</div>
                     <div>
                        
                          <asp:Button ID="SignUp" runat="server" Text="SignUp" class="btn btn-lg btn-primary" OnClick="SignUp_Click"/>
                       
                    </div>

					<div class="clearfix"> </div>
				</div>
			</div>
				
		</div>
          
       <div class="top-nav">
                  
		<nav class="navbar navbar-default navbar-fixed-top">
	
	<!-- //header -->
	<div class="container">
      
			<div class="navbar-header">

	   			 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
                </button>
              </div>

				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="index.aspx">Home</a></li>
						<li><a href="#about" class="scroll">About</a></li>
						<li><a href="#services" class="scroll">Services</a></li>
						<li><a href="#team" class="scroll">Team</a></li>
						<li><a href="#gallery" class="scroll">Gallery</a></li>
						<li><a href="#contact" class="scroll">Contact</a></li>
					</ul>
				</div>
			
			</div>
			<div class="clearfix"> </div>
			</nav>	
		</div>
		<div class="container">
			<!-- header -->
			<header>

				<div class="flexslider-info">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<div class="w3l-info">
										<h4>Welcome To TAM</h4>
										<p>Our online Cargo Service</p>
										<div class="w3layouts_more-buttn">
											<a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
										</div>
									</div>
								</li>
								<li>
									<div class="w3l-info">
										<h4>All Around Korea</h4>
										<p>Our service available anytime </p>
										<div class="w3layouts_more-buttn">
											<a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
										</div>
									</div>
								</li>
								<li>
									<div class="w3l-info">
										<h4>The Best Cargo</h4>
										<p>Fast And Cheap</p>
										<div class="w3layouts_more-buttn">
											<a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</section>
				</div>
			</header>
		</div>
		<div class="clearfix"> </div>
	</div>

	<!-- //header -->
	<!-- banner-text -->

	<!-- modal -->
	<div class="modal about-modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">TAM</h4>
				</div>
				<div class="modal-body">
					<div class="out-info">
						<img src="images/g1.jpg" alt="" />
						<p>some data1</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //modal -->
	<!-- //banner-text end -->
	<!--about-->

	<div class="about" id="about">
		<div class="container">
					<h3 class="title"> ABOUT</h3>
			<div class="about-banner-grids ">
				<div class="col-md-4 left-of-about">
					<div class=" about-matter-left">
						<p>Write Something Here
						</p>

					</div>
					<div class="stats-cout agileits w3layouts">
						<div class="col-md-6 col-sm-6 col-xs-6 agileits w3layouts stats-grid stats-grid-1">
							<div class=" agileits-w3layouts counter">50000</div>
							<div class="stat-info-w3ls">
								<h4 class="agileits w3layouts">Clients</h4>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 agileits w3layouts stats-grid stats-grid-2">

							<div class=" agileits-w3layouts counter">2000</div>
							<div class="stat-info-w3ls">
								<h4 class="agileits w3layouts ">Transport</h4>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 stats-grid agileits w3layouts stats-grid-3">

							<div class=" agileits-w3layouts counter">51</div>
							<div class="stat-info-w3ls">
								<h4 class="agileits w3layouts ">Projects</h4>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 stats-grid agileits w3layouts stats-grid-4">

							<div class=" agileits-w3layouts counter">0</div>
							<div class="stat-info-w3ls">
								<h4 class="agileits w3layouts">Awards</h4>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
					<div class="col-md-4 about-pic">
				
					</div>
				<div class="col-md-4 right-of-about">
					<div class=" stats-info-right">
						<div class="stats-info-text">
							<h4>5</h4>
							<h5>years of</h5>
							<p>experience</p>
						</div>
					</div>

					<div class="about-matter-right">
						<p>write something here
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!--//about-->
	<!--services-section-->

	<div class="services" id="services">
		<div class="container">
			<h3 class="title clr">Services</h3>
			<div class="agileits-banner-grids text-center">
				<div class="banner-bottom-girds">
					<div class="col-md-3  col-sm-6 col-xs-6  agileits-banner-grid">
						<span class="fa fa-truck banner-icon" aria-hidden="true"></span>
						<h4>SINGLE TRANSPORT</h4>
						<p>Write here something</p>
					</div>
					<div class="col-md-3  col-sm-6 col-xs-6 agileits-banner-grid">
						<span class="fa fa-ship banner-icon" aria-hidden="true"></span>
						<h4>MIXED TRANSPORT</h4>
						<p>Write here something</p>
					</div>
					<div class="col-md-3  col-sm-6 col-xs-6  agileits-banner-grid">
						<span class="fa fa-plane banner-icon" aria-hidden="true"></span>
						<h4>ON DEMAND TRANSPORT</h4>
						<p>Write here something</p>
					</div>
					<div class="col-md-3  col-sm-6 col-xs-6  clr1 agileits-banner-grid">
						<span class="fa  fa-bus  banner-icon" aria-hidden="true"></span>
						<h4>DELIVERY UNLIMITED</h4>
						<p> Write here something</p>
					</div>
					<div class="clearfix"> </div>
				</div>

				<div class="service-top">

				
					<div class="col-md-8 services-matter">
						<p>Write here

						</p>
						<div class="w3_read-buttn ">
							<a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
						</div>
					</div>
						
					<div class="clearfix"> </div>

				</div>

			</div>
		</div>
	</div>
	<!--//service-->
	<!-- Team section -->
	<section class="team" id="team">
		<div class="container">
			<div class="about-head text-center ">
				<h3 class="title">Team</h3>
			</div>

			<div class="team-grid-top">
				<div class="col-md-3  team1">
					<div class="inner-team1">
						
						<h3>Kim1</h3>

						<div class="team-social">
							<a href="#"><span class="fa fa-twitter"></span ></a>
							<a href="#"><span  class="fa fa-linkedin"></span ></a>
							<a href="#"><span  class="fa fa-pinterest-p"></span ></a>
						</div>
						<img src="images/team1.jpg" alt="" />
					</div>
				</div>
				<div class="col-md-3 team1">
					<div class="inner-team1">
						
						<h3>Kim2</h3>

						<div class="team-social">
							<a href="#"><span  class="fa fa-twitter"></span ></a>
							<a href="#"><span  class="fa fa-linkedin"></span ></a>
							<a href="#"><span  class="fa fa-pinterest-p"></span ></a>
						</div>
						<img src="images/team2.jpg" alt="" />
					</div>
				</div>
				<div class="col-md-3 team1">
					<div class="inner-team1">
						
						<h3>Kim3</h3>

						<div class="team-social">
							<a href="#"><span  class="fa fa-twitter"></span ></a>
							<a href="#"><span  class="fa fa-linkedin"></span ></a>
							<a href="#"><span  class="fa fa-pinterest-p"></span ></a>
						</div>
						<img src="images/team3.jpg" alt="" />
					</div>
				</div>
				<div class="col-md-3 team1">
					<div class="inner-team1">
						
						<h3>Kim4</h3>

						<div class="team-social">
							<a href="#"><span class="fa fa-twitter"></span ></a>
							<a href="#"><span  class="fa fa-linkedin"></span ></a>
							<a href="#"><span  class="fa fa-pinterest-p"></span ></a>
						</div>
						<img src="images/team4.jpg" alt="" />
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			

		</div>
	</section>
	<!-- //Team section -->

	<!-- gallery -->
	<div class="gallery" id="gallery">
		<h3 class="title">Our Gallery</h3>
		<div class="gallery-grids-top">
			<div class="gallery-grids">
				<div class="col-md-6 col-sm-6 gallery-grid-top">
					<div class="gallery-grid-top-img">
						<a class="example-image-link" href="images/g1.jpg" data-lightbox="example-set" data-title=""><img class="example-image" src="images/g1.jpg" alt=""/></a>
					</div>
				</div>

				<div class="col-md-6 col-sm-6  gallery-right">
					<div class="gallery-right-grid">
						<div class="col-md-6 col-sm-6  gallery-grid-img">
							<a class="example-image-link" href="images/g2.jpg" data-lightbox="example-set" data-title=""><img class="example-image" src="images/g2.jpg" alt=""></a>
						</div>
						<div class="col-md-6 col-sm-6 gallery-grid-img">
							<a class="example-image-link" href="images/g3.jpg" data-lightbox="example-set" data-title=""><img class="example-image" src="images/g3.jpg" alt=""></a>
						</div>

					</div>
					<div class="gallery-right-grid gallery-right-top-grid">
						<div class="col-md-6 col-sm-6 gallery-grid-img">
							<a class="example-image-link" href="images/g4.jpg" data-lightbox="example-set" data-title=""><img class="example-image" src="images/g4.jpg" alt=""></a>
						</div>
						<div class="col-md-6 col-sm-6 gallery-grid-img">
							<a class="example-image-link" href="images/g5.jpg" data-lightbox="example-set" data-title=""><img class="example-image" src="images/g5.jpg" alt=""></a>
						</div>

					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--//gallery -->
	<!-- testimonials -->
	<div class="testimonials" id="testimonials">
		<div class="container">

			<h3 class="title">testimonials</h3>
			
				<div class="carousel slide" data-ride="carousel" id="quote-carousel">
					<!-- Bottom Carousel Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#quote-carousel" data-slide-to="0" class="active"><img class="img-responsive " src="images/t11.jpg" alt="">
						</li>
						<li data-target="#quote-carousel" data-slide-to="1"><img class="img-responsive" src="images/t22.jpg" alt="">
						</li>
						<li data-target="#quote-carousel" data-slide-to="2"><img class="img-responsive" src="images/t33.jpg" alt="">
						</li>
					</ol>

					<!-- Carousel Slides / Quotes -->
					<div class="carousel-inner text-center">

						<!-- Quote 1 -->
						<div class="item active">
							<blockquote>
								<div class="row">
									<div class=" left-matter">
										<p>write here


</p>
										<h5>larsson bajrachrya</h5>
									</div>
									
									
								</div>
							</blockquote>
						</div>
						<!-- Quote 2 -->
						<div class="item">
							<blockquote>
								<div class="row">
									<div class=" left-matter">

										<p>write here

</p>
										<h5>Katerina</h5>
									</div>
								</div>
							</blockquote>
						</div>
						<!-- Quote 3 -->
						<div class="item">
							<blockquote>
								<div class="row">
									<div class=" left-matter">

										<p>write here

 </p>
										<h5>Rojer</h5>
									</div>
								</div>
							</blockquote>
						</div>
					</div>

					<!-- Carousel Buttons Next/Prev 
					<a data-slide="prev" href="#quote-carousel" class="left carousel-control"><span class="fa fa-chevron-left"></span></a>
					<a data-slide="next" href="#quote-carousel" class="right carousel-control"><span class="fa fa-chevron-right"></span></a> -->
				</div>
		</div>
	</div>
	<!-- testimonials -->

	<!-- contact -->
        
	<div class="contact" id="contact">
	
	<div class=" contact-top">
		        <iframe src="https://www.google.com/maps/d/embed?mid=1XbrS_dhoIgOuEMn8tdpnD-2wYjYn4lvw" width="640" height="480"></iframe>
    </div>
         
        </div>



	<!--//contact-->
	<footer>
		<div class="container">
			<div class="col-md-3 header-side">
				<h2><a href="index.html">TAM</a></h2>
			</div>
			<div class="col-md-7 header-side">
				<p>©2018 Truck Assignment and Monitoring</p>
			</div>
			<div class="col-md-2 header-side">
				<div class="buttom-social-grids">

					<ul>
						<li><a href="#"><span class="fa fa-facebook"></span></a></li>
						<li><a href="#"><span class="fa fa-twitter"></span></a></li>
						<li><a href="#"><span class="fa fa-rss"></span></a></li>
						<li><a href="#"><span class="fa fa-vk"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!--js working-->
	<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
	<script src="js/bootstrap.js"></script>
	<!-- //js  working-->
	<!--FlexSlider banner-->

	<script defer="" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function () {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function (slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!--End-slider-script-->
	<!-- OnScroll-Number-Increase-JavaScript -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //OnScroll-Number-Increase-JavaScript -->
	<!-- light box gallery -->
	<script src="js/lightbox-plus-jquery.min.js"></script>
	<!-- //light box gallery -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function () {

			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
			};


			$().UItoTop({
				easingType: 'easeOutQuart'
			});

        });
       
	</script>
       
        
    </form>
</body>
</html>
