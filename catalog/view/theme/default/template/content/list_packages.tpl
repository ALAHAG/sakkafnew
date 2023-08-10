<?php echo $header ?>



	<section class="parallax-window" data-parallax="scroll" data-image-src="img/home_bg_1.jpg" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Paris tours</h1>
				<p>Ridiculus sociosqu cursus neque cursus curae ante scelerisque vehicula.</p>
			</div>
		</div>
	</section>
	<!-- End section -->

	<main>
		<div id="position">
			<div class="container">
				<ul>
					<li><a href="#">Home</a>
					</li>
					<li><a href="#">Category</a>
					</li>
					<li>Page active</li>
				</ul>
			</div>
		</div>
		<!-- End Position -->

    <div class="container margin_60">

      <div class="row">

        <div class="col-lg-9">

          <!-- <div id="tools">
            <div class="row">
              <div class="col-md-3 col-sm-4 col-6">
                <div class="styled-select-filters">
                  <select name="sort_price" id="sort_price">
                    <option value="" selected>Sort by price</option>
                    <option value="lower">Lowest price</option>
                    <option value="higher">Highest price</option>
                  </select>
                </div>
              </div>
              <div class="col-md-3 col-sm-4 col-6">
                <div class="styled-select-filters">
                  <select name="sort_rating" id="sort_rating">
                    <option value="" selected>Sort by ranking</option>
                    <option value="lower">Lowest ranking</option>
                    <option value="higher">Highest ranking</option>
                  </select>
                </div>
              </div>
              <div class="col-md-6 col-sm-4 d-none d-sm-block text-right">
                <a href="all_tours_grid.html" class="bt_filters"><i class="icon-th"></i></a> <a href="#" class="bt_filters"><i class=" icon-list"></i></a>
              </div>

            </div>
          </div> -->
          <!--/tools -->
					<h4 class="search-results-title  text-right">نتائج البحث :<b><?php




					echo $total_packages;  if($total_packages>10){ echo " برنامج سياحي الى ماليزيا";}else if($total_packages>0 && $total_packages <11){echo " برامج سياحيه الى ماليزيا";} else if($total_packages==0){echo " لايوجد برنامج مقارب لبحثك .صمم برنامجك بنفسك من هنا <br/><a class='btn btn-primary btn-large' href='booking'>طلب حجز</a>";}?></b> <i class="icon-search"></i></h4>
					<hr/>
    <?php foreach ($packages as $package): ?>

                  <div class="strip_all_tour_list wow fadeIn" data-wow-delay="0.1s">
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="ribbon_3 popular"><span> عروض 2019</span>
                        </div>
                        <div class="wishlist">
                          <a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">افضل العروض</span></span></a>
                        </div>
                        <div class="img_list">
                          <a href="<?php echo $server.$package['slug'] ?>">   <meta itemprop="image" content="<?php echo $server.'image/'.$package['itinerary_image'] ?>">
<img src="<?php echo $server.'image/'.$package['itinerary_image'] ?>" width="200" alt="<?php echo $package['itinerary_title'] ?> - ماليزيا - عروض ماليزيا - فنادق ماليزيا">
                            <div class="short_info"></div>
                          </a>
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="tour_list_desc">

                          <div class="score">كود البرنامج <span>B<?php echo $package['itinerary_id'] ?></span></div>

                            <div class="rating"><i class="icon-smile voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile voted"></i>
                            </div>

                          <h3><strong><?php echo $package['itinerary_title'] ?> </strong> </h3>
                          <!-- <p>نوع الغرفة : <?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?><br/>
                               المدينه : <?php echo $room['city_ar_name'] ?> <br/> -->
                        <table class="table table-bordered hotel">

                          <tbody>

                            <tr>
                              <td> عدد الايام </td>
                              <td><?php echo $package['night'] ?><small><?php if($package['night']>10){echo ' ليله و'; }else{ echo ' ليالي و';}?> </small>  <?php echo ($package['night']+1) ?><small><?php if($package['night']+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </small></td>
                            </tr>

                            <tr>
                              <td>يشمل العرض</td>
                              <td><?php if($package['entry_num_passengers']==2) {echo '[لشخصين]';} else{ echo '[ل'.$package['entry_num_passengers'].' أشخاص]'; }?></td>

                          </tbody>
                        </table>
                            <!-- <dl class="">
                                <dt class="skin-color">المدينة</dt><dd><?php echo $room['num_of_nights'] ?></dd>
                            </dl> -->
                            <p>
                              <?php echo htmlentities($room['room_content'], ENT_QUOTES, 'utf-8') ?>
                          </p>
                          <ul class="add_info">
                            <li>
                              <a href="javascript:void(0);" class="tooltip-1" data-placement="top" title="انترنت مجاناً"><i class="icon_set_1_icon-86"></i></a>
                            </li>
                            <li>
                              <a href="javascript:void(0);" class="tooltip-1" data-placement="top" title="تلفزيون "><i class="icon_set_2_icon-116"></i></a>
                            </li>
                            <li>
                              <a href="javascript:void(0);" class="tooltip-1" data-placement="top" title="مسبح"><i class="icon_set_2_icon-110"></i></a>
                            </li>
                            <li>
                              <a href="javascript:void(0);" class="tooltip-1" data-placement="top" title="مركز التدريب"><i class="icon_set_2_icon-117"></i></a>
                            </li>
                            <li>
                              <a href="javascript:void(0);" class="tooltip-1" data-placement="top" title="مطعم"><i class="icon_set_1_icon-58"></i></a>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <div class="col-lg-2 col-md-2">
                        <div class="price_list">
                          <div><sup>السعر</sup><?php echo $package['customer_price'] ?> <span class="normal_price_list"></span><small>رنجت</small>
                            <p><a href="<?php echo $server.$package['slug'] ?>" class="btn_1">تفاصيل العرض</a>
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php endforeach ?>

          <hr>

					<nav aria-label="Page navigation ">

					<?php echo isset($pagination) ? $pagination : ''; ?>
				</nav>

        </div>
        <!-- End col lg-9 -->
        <aside class="col-lg-3">
          <!-- <p>
            <a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>
          </p> -->
					<?php echo $packagesfilter; ?>

					<div class="box_style_2">
						<i class="icon_set_1_icon-89"></i>
						<h4><span>احجز البرنامج </span> عبر الواتس اب </h4>
						<span ><a href="https://api.whatsapp.com/send?phone=60187770018" class="phone"> <i class="soap-icon-phone circle"></i>  +60 18 777 0018  <br/> <br/><img src="image/whatsapp.png"></a></span></address>

						<!-- <a href="tel://004542344599" class="phone">+60 18 777 0018</a> -->
						<strong>على مدار الاسبوع 24/7</strong>
					</div>

        </aside>
        <!--End aside -->
      </div>
      <!-- End row -->
    </div>
    <!-- End container -->
  </main>

	</main>
	<!-- End main -->

  <?php echo $footer; ?>


	<!-- Date and time pickers -->
	<script>
		$('input.date-pick').datepicker('setDate', 'today');
		$('input.time-pick').timepicker({
			minuteStep: 15,
			showInpunts: false
		})
	</script>




</body>

</html>
