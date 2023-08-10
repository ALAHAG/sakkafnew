<?php echo $header ?>


	<section class="parallax-window" data-parallax="scroll" data-image-src="img/hotels_bg.jpg" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-2">
			<div class="container">
				<div class="row">
					<div class="col-md-8">

						<h1><?php echo $title; ?></h1>
						<span><?php echo $hotel_address ?> </span>
					</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End section -->

	<main>
		<div id="position">
			<div class="container">
				<ul>
					<li>افضل عروض فنادق ماليزيا عن طريق شركة السقاف للسياحة والسفر</li>
				</ul>
			</div>
		</div>
		<!-- End Position -->


		<div class="container margin_60">
			<div class="row hotel">
				<div class="col-lg-8" id="single_tour_desc">



					<div class="row">

						<div class="col-lg-12">
							<p class="rooms">
                <?php echo html_entity_decode($content); ?>
              </p>

							<!-- End row  -->
						</div>
						<!-- End col-md-9  -->
					</div>
					<!-- End row  -->

					<hr>



				</div>
				<!--End  single_tour_desc-->

				<aside class="col-lg-4">
					<!-- <p class="d-none d-xl-block d-lg-block d-xl-none">
						<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>
					</p> -->
          <div class="box_style_2">
            <?php echo $right_sidebar; ?>

          </div>



				</aside>
			</div>
			<!--End row -->
		</div>
		<!--End container -->

        <div id="overlay"></div>
		<!-- Mask on input focus -->

	</main>
	<!-- End main -->

  <?php echo $footer; ?>


</body>

</html>
