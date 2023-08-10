<?php echo $header ?>


	<section class="parallax-window" data-parallax="scroll" data-image-src="<?php echo $page_images['covera']; ?>" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-2">
			<div class="container">
				<div class="row">
					<div class="col-md-8">

						<h1><?php echo $title; ?></h1>
						<span><?php echo $hotel_address ?> </span>
					</div>
					<!-- <div class="col-md-4">
						<div id="price_single_main" class="hotel">
							from/per night <span><sup>$</sup>95</span>
						</div>
					</div> -->
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

					<!-- <p class="d-none d-md-block d-block d-lg-none"><a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>
					</p> -->
					<!-- Map button for tablets/mobiles -->
					<div id="Img_carousel" class="slider-pro">
						<div class="sp-slides">
              <?php foreach ($page_images as $image): ?>

							<div class="sp-slide">
								<img alt="Image" class="sp-image" src="<?php echo $image['image'] ?>" data-src="<?php echo $image['image'] ?>" data-small="<?php echo $image['image'] ?>" data-medium="<?php echo $image['image'] ?>" data-large="<?php echo $image['image'] ?>" data-retina="<?php echo $image['image'] ?>">
							</div>
            <?php endforeach ?>


						</div>
						<div class="sp-thumbnails">
              <?php foreach ($page_images as $image): ?>

							<img alt="Image" class="sp-thumbnail" src="<?php echo $image['image'] ?>">
            <?php endforeach ?>

						</div>
					</div>

					<hr>

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
            <?php foreach ($pages as $page): ?>
            <a href="<?php echo $page['slug'] ?>" class="item no-side-margin">
                <img src="<?php echo $page['thumb'] ?>" alt="<?php echo $page['title'] ?>">
                <span><?php echo $page['title'] ?></span>
            </a>
            <?php endforeach ?>
          </div>

					<!--/box_style_1 -->

          <div class="box_style_4">
						<i class="icon_set_1_icon-89"></i>
            <h4><span> احجز </span> بواسطة الاتصال او الوتس اب </h4>
						<span ><a href="https://api.whatsapp.com/send?phone=60187770018" class="phone"> <i class="soap-icon-phone circle"></i>  +60 18 777 0018  <br/> <br/><img src="image/whatsapp.png"></a></span></address>
						<strong>على مدار الاسبوع 24/7</strong>
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


	<!-- Date and time pickers -->
	<script src="catalog/view/js/jquery.sliderPro.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function ($) {
			$('#Img_carousel').sliderPro({
				width: 960,
				height: 500,
				fade: true,
				arrows: true,
				buttons: false,
				fullScreen: false,
				smallSize: 500,
				startSlide: 0,
				mediumSize: 1000,
				largeSize: 3000,
				thumbnailArrows: true,
				autoplay: false
			});
		});
	</script>



	<!-- Carousel -->
	<script>
		$('.carousel-thumbs-2').owlCarousel({
		loop:false,
		margin:5,
		responsiveClass:true,
		nav:false,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4,
				nav:false
			}
		}
	});
	</script>

	<!--Review modal validation -->


</body>

</html>
