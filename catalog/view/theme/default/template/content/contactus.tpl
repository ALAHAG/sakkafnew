<?php echo $header ?>


	<main>
	<div id="map_contact" class="contact_2"></div>
	<!-- end map-->
	<div id="directions">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 travelo-google-map">
					<!-- <form action="http://maps.google.com/maps" method="get" target="_blank">
						<div class="input-group">
							<input type="text" name="saddr" placeholder=" من " class="form-control style-2" />
							<input type="hidden" name="daddr" value="شركة السقاف للسياحة والسفر ماليزيا" />
							<span class="input-group-btn">
								<button class="btn" type="submit" value="Get directions" style="margin-left:0;">GET DIRECTIONS</button>
							</span>
						</div>
					</form> -->
				</div>
			</div>
		</div>
	</div>

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
			<div class="row text-right dir_rtl">
				<div class="col-md-8">
					<div class="form_title">
						<h3><strong><i class="icon-pencil"></i></strong>تواصل معنا - املاء الاستماره ادناه</h3>
						<p>
							خدمة العملاء سيقوم بالرد عليك حال استلام الرساله.
							</p>
					</div>
					<div class="step">

						<div id="message-contact"></div>
						<form method="post" action="assets/contact.php" id="contactform">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label>الاسم</label>
										<input type="text" class="form-control" id="name_contact" name="name" placeholder="ادخل الاسم">
									</div>
								</div>
								<!-- <div class="col-sm-6">
									<div class="form-group">
										<label>Last Name</label>
										<input type="text" class="form-control" id="lastname_contact" name="lastname_contact" placeholder="Enter Last Name">
									</div>
								</div> -->
							</div>
							<!-- End row -->
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>الايميل</label>
										<input type="email" id="email_contact" name="email" class="form-control" placeholder="ادخل الايميل">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>العنوان</label>
										<input type="text" id="phone_contact" name="subject" class="form-control" placeholder="ادخل العنوان">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label>الرساله</label>
										<textarea rows="5" id="message_contact" name="message" class="form-control" placeholder="اكتب الرساله" style="height:200px;"></textarea>
									</div>
								</div>
							</div>
              <div class="row">
                <div class="col-sm-6">
                  <input type="submit" value="إرسال" class="btn_1" id="submit-contact">
                </div>
              </div>
						</form>
					</div>
				</div>
				<!-- End col-md-8 -->

				<div class="col-md-4">
					<div class="box_style_1">
						<span class="tape"></span>
						<h4>العنوان <span><i class="icon-pin pull-right"></i></span></h4>
						<p>
 							Unit 17-02, Plaza 138, Jalan Ampang, 50450 Kuala Lumpur, Malaysia						</p>
						<hr>
						<h4>تلفون المكتب <span><i class="icon-help pull-right"></i></span></h4>
						<p>
					  	فريق خدمة العملاء سيقدم لكم كافة النصائح ويستقبل الاقتراحات والشكاوي والطلبات <br/>
						السقاف رفيقكم الدائم
						</p>
						<ul id="contact-info">
							<li style="direction:ltr">006-03 21815444</li>
							<li><a href="#">marketing@alsakkaftravel.com</a>
							</li>
						</ul>
					</div>
					<div class="box_style_4">
						<i class="icon_set_1_icon-89"></i>
						<h4><span> تواصل معنا </span> عبر الواتس اب </h4>
						<span ><a href="https://api.whatsapp.com/send?phone=60187770018" class="phone"> <i class="soap-icon-phone circle"></i>  +60 18 777 0018  <br/> <br/><img src="image/whatsapp.png"></a></span></address>
						<strong>على مدار الاسبوع 24/7</strong>
					</div>
				</div>
				<!-- End col-md-4 -->
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</main>
	<!-- End main -->
  <?php echo $footer ?>

	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="catalog/view/js/map_contact.js"></script>
	<script src="catalog/view/js/infobox.js"></script>
	<script type="text/javascript">
					 $('#contact_form').submit(function (e) {
					e.preventDefault();
					$.ajax({
							type: 'post',
							url: '<?php echo $link_send_contact;?>' ,
							data: $('#contact_form').serialize(),
							success: function (data) {
									 // alert("تم استلام طلبك بنجاح ");
									 $('#contact_form').get(0).reset();
							}

					});


			});
					</script>

</body>

</html>
