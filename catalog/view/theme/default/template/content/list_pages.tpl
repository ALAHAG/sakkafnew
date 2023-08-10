<?php echo $header ?>


	<section class="parallax-window" data-parallax="scroll" data-image-src="img/hotels_bg.jpg" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1><?php echo  $category_title ?></h1>
				<p>افضل واشهر الفنادق السياحية في ماليزيا</p>
			</div>
		</div>
	</section>
	<!-- End section -->

	<main>
		<div id="position">
			<div class="container">
				<ul>
					<li>افضل فنادق ماليزيا واشهرها لعام 2018 -2019</li>
				</ul>
			</div>
		</div>
		<!-- Position -->


		<!-- End Map -->

		<div class="container margin_60">
			<div class="row hotel">
				<aside class="col-lg-3">



          <?php echo $pagesfilter; ?>

					<!--End filters col-->
					<div class="box_style_2">
						<i class="icon_set_1_icon-57"></i>
						<h4>Need <span>Help?</span></h4>
						<a href="tel://004542344599" class="phone">+45 423 445 99</a>
						<small>Monday to Friday 9.00am - 7.30pm</small>
					</div>
				</aside>
				<!--End aside -->

				<div class="col-lg-9">


					<!--End tools -->


					<div class="row">
            <?php foreach ($pages as $page): ?>

						<div class="col-md-4 wow zoomIn" data-wow-delay="0.1s">
							<div class="hotel_container">
								<div class="ribbon_3 popular"><span>2019</span>
								</div>
								<div class="img_container">
									<a href="<?php echo HTTP_SERVER.$page['slug'] ?>">
										<img src="<?php echo $page['thumb'] ?>" width="800" height="533" class="img-fluid" alt="Image">
										<div class="short_info hotel">
											 <!-- <span class="price"><sup>المدينه <?php echo $hotel['city_name'];?></sup></span> -->
										</div>
									</a>
								</div>
								<div class="hotel_title">
									<h3><strong><?php echo $page['title'] ?></strong> </h3>

									<!-- end rating -->
									<div class="wishlist">
										<a class="tooltip_flip tooltip-effect-1" href="<?php echo HTTP_SERVER.$page['slug'] ?>">+<span class="tooltip-content-flip"><span class="tooltip-back">للمزيد من التفاصيل</span></span></a>
									</div>
									<!-- End wish list-->
								</div>
							</div>
							<!-- End box tour -->
						</div>
          <?php endforeach ?>

						<!-- End col-md-6 -->


					</div>
					<!-- End row -->


					<hr>

					<nav aria-label="Page navigation">
            <?php echo isset($pagination) ? $pagination : ''; ?>

					</nav>
					<!-- end pagination-->

				</div>
				<!-- End col lg 9 -->
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</main>
	<!-- End main -->
  <?php  echo $footer ?>


	<!-- Check box and radio style iCheck -->
	<script>
		$('input').iCheck({
		   checkboxClass: 'icheckbox_square-grey',
		   radioClass: 'iradio_square-grey'
		 });
	</script>


</body>

</html>
