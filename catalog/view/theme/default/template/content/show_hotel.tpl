<?php echo $header ?>


	<section class="parallax-window" data-parallax="scroll" data-image-src="<?php echo HTTP_IMAGE.$hotel_image_cover ?>" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-2">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<span class="rating">
              <?php if($hotel_star == 5 ){ ?>
                <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i></span>
              <?php } if($hotel_star == 4 ){ ?>
                <i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star voted"></i>              <i class=" icon-star-empty"></i></span>
              <?php }  ?>
						<h1><?php echo $hotel_name ?><br><?php echo $hotel_english_name ?></h1>
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

		<!-- <div class="collapse" id="collapseMap">
			<div id="map" class="map"></div>
		</div> -->
		<!-- End Map -->
    <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>

		<div class="container margin_60">
			<div class="row hotel">
				<div class="col-lg-8" id="single_tour_desc">
					<div id="single_tour_feat">
						<ul>
							<li><i class="icon_set_2_icon-116"></i>شاشه تلفاز</li>
							<li><i class="icon_set_1_icon-86"></i>واي فاي </li>
							<li><i class="icon_set_2_icon-110"></i>مسبح</li>
							<li><i class="icon_set_1_icon-59"></i>افطار</li>
							<li><i class="icon_set_1_icon-22"></i>لايسمح للحيوانات</li>
							<li><i class="icon_set_1_icon-13"></i>خاصه</li>
							<li><i class="icon_set_1_icon-27"></i>مواقف </li>
						</ul>
					</div>
					<!-- <p class="d-none d-md-block d-block d-lg-none"><a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>
					</p> -->
					<!-- Map button for tablets/mobiles -->
					<div id="Img_carousel" class="slider-pro">
						<div class="sp-slides">
              <?php foreach ($hotel_images as $image): ?>

							<div class="sp-slide">
								<img alt="Image" class="sp-image" src="<?php echo $image['resized_image'] ?>" data-src="<?php echo $image['resized_image'] ?>" data-small="<?php echo $image['resized_image'] ?>" data-medium="<?php echo $image['resized_image'] ?>" data-large="<?php echo $image['resized_image'] ?>" data-retina="<?php echo $image['resized_image'] ?>">
							</div>
            <?php endforeach ?>


						</div>
						<div class="sp-thumbnails">
              <?php foreach ($hotel_images as $image): ?>

							<img alt="Image" class="sp-thumbnail" src="<?php echo $image['resized_image'] ?>">
            <?php endforeach ?>

						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-lg-3">
							<h3>التفاصيل</h3>
						</div>
						<div class="col-lg-9">
							<p class="rooms">
                <?php echo $hotel_content; ?>
              </p>

							<!-- End row  -->
						</div>
						<!-- End col-md-9  -->
					</div>
					<!-- End row  -->

					<hr>

					<div class="row">
						<div class="col-lg-3">
							<h3>انواع الغرف </h3>
						</div>
						<div class="col-lg-9">
              <?php foreach ($hotel_rooms as $room): ?>

							<h4><?php echo $room['room_name'] ?> - <?php echo $room['room_english_name'] ?></h4>
							<p class="rooms">
                <?php echo html_entity_decode($room['room_content']) ; ?>							</p>

							<div class="row">
								<div class="col-md-6">
									<ul class="list_icons">
										<li><i class="icon_set_1_icon-86"></i> انترنت</li>
										<li><i class="icon_set_2_icon-116"></i> تلفاز</li>
										<li><i class="icon_set_2_icon-106"></i>  الخزنه</li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="list_ok">
										<li> <h5> سعة الغرفة <sup> <strong> <?php echo $room['occupancy'] ?></strong> </sup> </h5> </li>

									</ul>
								</div>
							</div>
							<!-- End row  -->
							<div class="owl-carousel owl-theme carousel-thumbs-2 magnific-gallery">
								<div class="item">
									<a href="<?php echo $room['thumb'] ?> " data-effect="mfp-zoom-in"><img src="<?php echo $room['thumb'] ?>" alt="Image">
									</a>
								</div>

							</div>
							<!-- End photo carousel  -->

							<hr>
            <?php endforeach ?>

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

	<!-- Date and time pickers -->
	<script>
		$('input.date-pick').datepicker('setDate', 'today');
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
