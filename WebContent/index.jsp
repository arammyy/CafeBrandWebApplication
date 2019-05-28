<%@ page contentType="text/html; charset=UTF-8"%>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<%@ include file="/inc/css-head.jsp" %>
		
		<!-- Site Title -->
		<title>Coffee</title>
		</head>
		<body>
			  <!-- #header -->
			<%@ include file="/inc/header.jsp" %>
			<!-- start banner Area -->
			<section class="banner-area" id="home">	
				<div class="container">
					<div class="row fullscreen d-flex align-items-center justify-content-start">
						<div class="banner-content col-lg-7">
							<h6 class="text-white text-uppercase">Now you can feel the Energy</h6>
							<h1>
								Start your day with <br>
								a black Coffee				
							</h1>
							<a href="/client/point/getPage" class="primary-btn text-uppercase">Buy Now</a>
						</div>											
					</div>
				</div>
			</section>
			<!-- End banner Area -->	

			<!-- Start gallery Area -->
			<section class="gallery-area section-gap" id="gallery">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h1 class="mb-10">What kind of Coffee we serve for you</h1>
								<p>Who are in extremely love with eco friendly system.</p>
							</div>
						</div>
					</div>						
					<div class="row">
						<div class="col-lg-4">
							<a href="img/g1.jpg" class="img-pop-home">
								<img class="img-fluid" src="img/g1.jpg" alt="">
							</a>	
							<a href="img/g2.jpg" class="img-pop-home">
								<img class="img-fluid" src="img/g2.jpg" alt="">
							</a>	
						</div>
						<div class="col-lg-8">
							<a href="img/g3.jpg" class="img-pop-home">
								<img class="img-fluid" src="img/g3.jpg" alt="">
							</a>	
							<div class="row">
								<div class="col-lg-6">
									<a href="img/g4.jpg" class="img-pop-home">
										<img class="img-fluid" src="img/g4.jpg" alt="">
									</a>	
								</div>
								<div class="col-lg-6">
									<a href="img/g5.jpg" class="img-pop-home">
										<img class="img-fluid" src="img/g5.jpg" alt="">
									</a>	
								</div>
							</div>
						</div>
					</div>
				</div>	
			</section>
			<!-- End gallery Area -->
			
		
			
			<!-- Start blog Area -->
			<section class="blog-area section-gap" id="blog">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-60 col-lg-10">
							<div class="title text-center">
								<h1 class="mb-10">Introducing our CEOs </h1>
								<p>Who are in extremely love with coffee.</p>
							</div>
						</div>
					</div>						
					<div class="row" style="text-align:center">
						<div class="col-lg-6 col-md-6 single-blog">
							<img class="img-fluid" src="img/ar.jpg" alt="" style="width:350px; height:400px; border-radius: 50%" href=>
							<ul class="post-tags">
								<li><a href="img/ar.jpg" class="img-pop-home">더보기</a></li>
								
							</ul>
							<a href="#"><h4>Lee A Ram</h4></a>
							<p>
								"커피가 좋아서 이 일을 시작하게 되었어요"
							</p>
							<p class="post-date">
								18th September, 1994
							</p>
						</div>
						<div class="col-lg-6 col-md-6 single-blog">
							<img class="img-fluid" src="img/mh.jpg" style="width:350px; height:400px; border-radius: 50%" alt="" href=>
							<ul class="post-tags">
								<li><a href="img/mh.jpg" class="img-pop-home">더보기</a></li>
								
							</ul>
							<a href="#"><h4>Lee Min Hyung</h4></a>
							<p>
								"항상 최고의 맛과 품질을 위해 노력하겠습니다"
							</p>
							<p class="post-date">
								3rd August, 1994
							</p>
						</div>						
					</div>
				</div>	
			</section>
			<!-- End blog Area -->
			<%@ include file="/inc/footer.jsp" %>
			<!-- End footer Area -->	
	</body>
</html>



