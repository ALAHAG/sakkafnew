<?php echo $header ?>


	<section class="parallax-window" data-parallax="scroll" data-image-src="<?php echo HTTP_IMAGE.$itinerary_image ?>" data-natural-width="1400" data-natural-height="470">
		<meta itemprop="image" content="<?php echo HTTP_IMAGE.$itinerary_image ?>">

		<div class="parallax-content-2">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h1><?php echo $itinerary_title; ?> - <?php if($entry_num_passengers==2) {echo '[لشخصين]';} else{ echo '['.$entry_num_passengers.' أشخاص]'; }?></h1>
						<!-- <span>Champ de Mars, 5 Avenue Anatole, 75007 Paris.</span> -->
						<span class="rating"><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><small></small></span>
					</div>
					<div class="col-md-4">
						<div id="price_single_main">
							 السعر الاجمالي للبرنامج <span itemprop="offers" itemscope itemtype="http://schema.org/Offer"><sup>رنجت</sup><?php echo $customer_price ?> </span>
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
					<li>السقاف للسياحة والسفر ماليزيا</li>
				</ul>
			</div>
		</div>
		<!-- End Position

		<div class="collapse" id="collapseMap">
			<div id="map" class="map"></div>
		</div>
 End Map -->

		<div class="container margin_30 tours">
			<div class="row">
				<div class="col-lg-8" id="single_tour_desc">
					<?php if ($package_rooms): ?>

					<div id="single_tour_feat">
						<ul class="title">
							<li><i class="icon_set_1_icon-6"></i> تفاصيل الفنادق والمدن </li>
						</ul>
					</div>

					<!-- <p class="d-none d-md-block d-block d-lg-none"><a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a></p> -->
					<!-- Map button for tablets/mobiles -->
						<?php foreach ($package_rooms as $room): ?>

          					<div class="strip_all_tour_list wow fadeIn" data-wow-delay="0.1s">
          						<div class="row">
          							<div class="col-lg-4 col-md-4">
          								<div class="ribbon_3 popular"><span></span>
          								</div>
          								<div class="wishlist">
          									<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>
          								</div>
          								<div class="img_list">
          									<a href="<?php echo $server.$room['slug'] ?>"><img src="<?php echo HTTP_IMAGE.$room['image'] ?>" width="200" alt="Image">
          										<div class="short_info"></div>
          									</a>
          								</div>
          							</div>
          							<div class="col-lg-6 col-md-6">
          								<div class="tour_list_desc">
														<?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>

          									<div class="score">نجوم<span><?php echo $room['star_rate'];?></span>
          									</div>
														<?php if($room['star_rate']==5){ ?>
															<div class="rating"><i class="icon-star voted"></i><i class="icon-star  voted"></i><i class="icon-star  voted"></i><i class="icon-star  voted"></i><i class="icon-star voted"></i>
															</div>
														<?php	} ?>
														<?php if($room['star_rate']==4){ ?>
															<div class="rating"><i class="icon-star voted"></i><i class="icon-star  voted"></i><i class="icon-star  voted"></i><i class="icon-star  voted"></i><i class="icon-star-empty"></i>
															</div>
														<?php	} ?>
          									<h3>الفندق : <strong><?php echo $room['hotel_name'] ?> </strong> <small> <br/> <?php echo $room['hotel_english_name'] ?></small></h3>
          									<!-- <p>نوع الغرفة : <?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?><br/>
												         المدينه : <?php echo $room['city_ar_name'] ?> <br/> -->
													<table class="table table-bordered hotel">

                            <tbody>

                              <tr>
                                <td>نوع الغرفه </td>
                                <td><?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?></td>
                              </tr>

															<tr>
																<td>المدينه</td>
																<td><?php echo $room['city_ar_name'] ?></td>

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
          									<div><sup>عدد الليالي</sup><?php echo $room['num_of_nights'] ?><span class="normal_price_list"></span><small></small>
          										<p><a href="<?php echo $server.$room['slug'] ?>" class="btn_1">تفاصيل الفندق</a>
          										</p>
          									</div>
          								</div>
          							</div>
          						</div>
          					</div>
									<?php endforeach ?>
								<?php endif ?>


          <div class="row" >
						<?php if ($package_transportations): ?>

						<div class="col-lg-12">
                    <div id="single_tour_feat">
											<ul class="title">

                        <li><i class="icon_set_1_icon-21"></i>الرحلات والتنقلات الداخلية</li>
												<li><i class="icon-plane"></i></li>
                      </ul>
                    </div>
										<?php foreach ($package_transportations as $transportation): ?>

                    <div class="strip_all_tour_list wow fadeIn transport" data-wow-delay="0.1s">
          						<div class="row">
          							<div class="col-lg-4 col-md-4">
          								<div class="ribbon_3 popular"><span>Popular</span>
          								</div>
          								<div class="wishlist">
          									<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>
          								</div>
          								<div class="img_list">
          									<a href="single_transfer.html"><img src="<?php echo HTTP_IMAGE.$transportation['transportation_image'] ?>" alt="Image">
          										<div class="short_info"></div>
          									</a>
          								</div>
          							</div>
          							<div class="col-lg-6 col-md-6">
          								<div class="tour_list_desc">
          									<div class="rating"><i class="icon-smile voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile"></i><small>(75)</small>
          									</div>
          									<h3><strong><?php echo $transportation['transportation_title_ar'] ?></strong> </h3>
          									<p>   <?php echo htmlentities($transportation['transportation_description_ar'], ENT_QUOTES, 'utf-8') ?></p>
														<ul class="add_info">
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-70"></i></span>
																	<div class="tooltip-content">
																		<h4>المسافرين</h4> <?php echo $room['occupancy'] ?>  .
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-6"></i></span>
																	<div class="tooltip-content">
																		<h4>التوصيل </h4> التوصيل من والى الفندق حسب الوصف
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-13"></i></span>
																	<div class="tooltip-content">
																		<h4>دراجات الاطفال</h4>
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-22"></i></span>
																	<div class="tooltip-content">
																		<h4>الحيوانات الاليفه</h4> لايسمح لها بالدخول في معظم الفنادق
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-33"></i></span>
																	<div class="tooltip-content">
																		<h4>الحقائب</h4> المسموح به من الوزن
																	</div>
																</div>
															</li>
														</ul>
          								</div>
          							</div>
          							<div class="col-lg-2 col-md-2">
          								<div class="price_list">
          									 <div><sup>المسافرين</sup><?php echo $room['occupancy'] ?><!--<span class="normal_price_list">$99</span><small>*From/Per person</small> -->
          										<!-- <p><a href="single_transfer.html" class="btn_1">Details</a> -->
          										</p>
          									</div>

          								</div>
          							</div>
          						</div>
          					</div>
          					<!--End strip -->
									<?php endforeach ?>
									</div>
								<?php endif ?>

          </div>
					<div class="row" >
						<?php if ($package_tours): ?>

						<div class="col-lg-12">
										<div id="single_tour_feat">
											<ul class="title">
												<li><i class="icon_set_1_icon-21"></i>الجولات السياحية والخدمات الاضافية</li>
											</ul>
										</div>
										<?php foreach ($package_tours as $package_tour): ?>

										<div class="strip_all_tour_list wow fadeIn transport" data-wow-delay="0.1s">
											<div class="row">
												<div class="col-lg-4 col-md-4">
													<div class="ribbon_3 popular"><span>Popular</span>
													</div>
													<div class="wishlist">
														<a class="tooltip_flip tooltip-effect-1" href="javascript:void(0);">+<span class="tooltip-content-flip"><span class="tooltip-back">Add to wishlist</span></span></a>
													</div>
													<div class="img_list">
														<a href="single_transfer.html"><img src="<?php echo HTTP_IMAGE.$package_tour['tour_image'] ?>" alt="Image">
															<div class="short_info"></div>
														</a>
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="tour_list_desc">
														<div class="rating"><i class="icon-smile voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile  voted"></i><i class="icon-smile voted"></i><!--<small>(<?php echo $itinerary_id*3 ?>)</small> -->
														</div>
														<h3><strong><?php echo $package_tour['tour_title_ar'] ?></strong> </h3>
														<p>   <?php echo htmlentities($package_tour['tour_description_ar'], ENT_QUOTES, 'utf-8') ?></p>
														<ul class="add_info">
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-70"></i></span>
																	<div class="tooltip-content">
																		<h4>المسافرين</h4> <?php echo $room['occupancy'] ?>  .
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-6"></i></span>
																	<div class="tooltip-content">
																		<h4>التوصيل </h4> التوصيل من والى الفندق حسب الوصف
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-13"></i></span>
																	<div class="tooltip-content">
																		<h4>دراجات الاطفال</h4>
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-22"></i></span>
																	<div class="tooltip-content">
																		<h4>الحيوانات الاليفه</h4> لايسمح لها بالدخول في معظم الفنادق
																	</div>
																</div>
															</li>
															<li>
																<div class="tooltip_styled tooltip-effect-4">
																	<span class="tooltip-item"><i class="icon_set_1_icon-33"></i></span>
																	<div class="tooltip-content">
																		<h4>الحقائب</h4> المسموح به من الوزن
																	</div>
																</div>
															</li>
														</ul>
													</div>
												</div>
												<div class="col-lg-2 col-md-2">
													<div class="price_list">
														 <div><sup>المسافرين</sup><?php echo $room['occupancy'] ?><!--<span class="normal_price_list">$99</span><small>*From/Per person</small> -->
															<!-- <p><a href="single_transfer.html" class="btn_1">Details</a> -->
															</p>
														</div>

													</div>
												</div>
											</div>
										</div>
										<!--End strip -->
									<?php endforeach ?>
									</div>
								<?php endif ?>

					</div>
					<hr/>

						<div class="row">
						<div class="col-lg-3">
							<h3>ملاحظات</h3>
						</div>
						<div class="col-lg-9">
							<ul class="list_ok text-right">
								<li>العرض ساري على مدار السنة وقابل للزيادة في فترة الاجازة الصيفية بشكل بسيط.</li>
								<li> في حالة عدم توفر الفندق المذكور سيتم توفير فندق آخر بنفس المستوى او يتم توفير البديل المناسب,
								وقد يكون هناك مبلغآ اضافيآ حسب مستوى الفندق البديل.</li>
								<li>مواعيد الدخول في جميع فنادق ماليزيا الساعة 2 ظهرآ وموعيد الخروج 12 ظهرآ.</li>
								<li>البرنامج قابل للتعديل حسب طلبك من حيث عدد اليالي وعدد الافراد مع فارق السعر.</li>

							</ul>

						</div>
					</div>
					<hr>

						 <div class="row">
				 		<div class="col-lg-3">
				 			<h3>هدايا مجانية وتخفيضات</h3>
				 		</div>
						<div class="col-lg-9">
								<ul class="list_ok text-right ">
									<li>شريحتين اتصال مجانآ.</li>
									<li>جولة سياحية مجانية.</li>
									<li>تخفيض مابين 300 الى 700 رنجت على كل عميل يشتري برنامج من طرفك.</li>
								</ul>

						</div>
					</div>
					<hr>

					<div class="row">
 				<div class="col-lg-3">
 					<h3>البرنامج يشمل </h3>
 				</div>
 				<div class="col-lg-9">

					 					<?php echo html_entity_decode($package_notes); ?>
					</div>

							</div>
							<!-- End row  -->


					<hr>

					<div class="row">
						<div class="col-lg-3">
							<h3>طريقة الدفع  </h3>
						</div>
						<div class="col-lg-9">

					</ul>
					        <h3 class="text-right">يتم أرسال فاتورة للعميل بعد تاكيد الطلب لدفع العربون عبر الطرق الآتية:</h3>
					        <ul class="list_ok text-right ">
					             <li>1) التحويل المباشر إلى حساب الشركة . </li>
					             <li>2) التحويل إلى حسابات أحد الوكلاء والمندوبين بدولتكم مثل بنك الراجحي والأهلي السعودي . </li>
					             <li>3) الدفع عن طريق الجهاز "كريدت كارد" بطاقات الائتمان .</li>
					             <li>4) التحويل عن طريق وسترن يونيون . </li>
					       <br/>

					    </ul>
						</div>
					</div>

					<hr>


				</div>
				<!--End  single_tour_desc-->

				<aside class="col-lg-4">
					<!-- <p class="d-none d-xl-block d-lg-block d-xl-none">
						<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>
					</p> -->
					<div class="box_style_1 expose">
						<h3 class="inner">- بيانات الحجز -</h3>
						<form id="booking_form" class="cruise-booking-form" method="post">

            <div class="row">
              <div class="col-sm-12">
                <div class="form-group">
                  <label>الاسم </label>
                  <input type="text" class="form-control" id="firstname_booking" name="customer_name_ar" required>
									<input type="hidden" name="itinerary_id" value="<?php echo $itinerary_id ?>" />

                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-12">
                <div class="form-group">
                  <label>رقم التلفون</label>
                  <input type="text" id="telephone_booking" name="phone" class="form-control" value="" placeholder="" required>
                </div>
              </div>
            </div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label><i class="icon-calendar-7"></i> تاريخ الوصول</label>
									<input class="date-pick form-control" data-date-format="M d, D" type="text" id="from" name="arrival_date" data-min-date="0" >

								</div>
							</div>
              <div class="col-sm-6">
								<div class="form-group">
									<label><i class="icon-calendar-7"></i> تاريخ المغادرة</label>
									<input class="date-pick form-control" data-date-format="M d, D" type="text" name="departure_date" id="to" data-min-date="0">

								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>البالغين</label>
									<div class="numbers-row">
										<input type="text" value="1" id="adults" class="qty2 form-control" name="num_adults">

									</div>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>الاطفال</label>
									<div class="numbers-row">
										<input type="text" value="0" id="children" class="qty2 form-control" name="num_children">

									</div>
								</div>
							</div>
						</div>
						<br>
            <div class="row">
        <div class="col-sm-12">
          <div class="form-group">
            <label>الجنسيه</label>
            <input type="text" class="form-control" id="nationality" name="country">
          </div>
        </div>

      </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="form-group">
            <label>الايميل</label>
            <input type="email" id="email_booking" name="email" class="form-control">
          </div>
        </div>

      </div>
						<table class="table table_summary">
							<tbody>
								 <tr>
									<td>
										رقم العرض
									</td>
									<td class="text-right">
										B<?php echo $itinerary_id ?>
									</td>
								</tr>

								<tr class="total">
									<td>
										السعر الاجمالي للعرض
									</td>
									<td class="text-right">
									RM	<?php echo $customer_price ?> <small> (رنجت ماليزي) </small>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- <a class="btn_full" href="cart.html"> إرسال الطلب</a> -->
						<button type="submit" class="btn_full">إرسال الطلب</button>

						<!-- <a class="btn_full_outline" href="#"><i class=" icon-heart"></i> Add to whislist</a> -->
					</form>
					</div>
					<!--/box_style_1 -->

					<div class="box_style_4">
						<i class="icon_set_1_icon-89"></i>
						<h4><span>احجز البرنامج </span> عبر الواتس اب </h4>
						<span ><a href="https://api.whatsapp.com/send?phone=60187770018&text=' طلب برنامج - كود البرنامج  : B<?php echo $itinerary_id ?> '" class="phone"> <i class="soap-icon-phone circle"></i>  +60 18 777 0018  <br/> <br/><img src="image/whatsapp.png"></a></span></address>

						<!-- <a href="tel://004542344599" class="phone">+60 18 777 0018</a> -->
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

	<!-- Common scripts -->
	<!-- <script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/common_scripts_min.js"></script>
	<script src="js/functions.js"></script> -->

	<!-- Date and time pickers -->
	<script>
		$('input.date-pick').datepicker('setDate', 'today');
		$('input.time-pick').timepicker({
			minuteStep: 15,
			showInpunts: false
		})
	</script>

	<!--Review modal validation -->
	<!-- <script src="assets/validate.js"></script> -->

	<script type="text/javascript">

	    $('#booking_form').submit(function (e) {
	        e.preventDefault();
	        $.ajax({
	            type: 'post',
	            url: '<?php echo $link_send_itinerary;?>' ,
	            data: $('#booking_form').serialize(),
	            success: function (data) {
	                // dataLayer.push({
	                //         'event':'AjaxOrderCompleted',
	                //         'virtualUrl':'/success/',
	                //         'orderid' : '12345'
	                //  });
	                 alert("تم استلام طلبك بنجاح ");
	                 $('#booking_form').get(0).reset();
	                  window.open('<?php echo $link_send_success;?>');



	            }

	        });


	    });


	</script>


</body>

</html>
