<?php echo $header ?>

<!--
	<section class="parallax-window" data-parallax="scroll" data-image-src="<?php echo HTTP_IMAGE.$itinerary_image ?>" data-natural-width="1400" data-natural-height="470">
		<meta itemprop="image" content="<?php echo HTTP_IMAGE.$itinerary_image ?>">

		<div class="parallax-content-2">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h1></h1>
						<span class="rating"><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><i class="icon-smile voted"></i><small></small></span>
					</div>

				</div>
			</div>
		</div>
	</section> -->
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
				<div class="col-lg-8 box_style_1 expose text-right" id="single_tour_desc">
          <h3 class="inner">              البيانات الضروريه لحجز برنامجك وسهولة التواصل معك (*)</h3>
          <form id="booking_form" class="cruise-booking-form" method="post">

          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label>الإسم الثلاثي (*)</label>
                <input type="text" class="form-control" id="firstname_booking" name="customer_name_ar" required>
                <input type="hidden" name="itinerary_id" value="<?php echo $itinerary_id ?>" />

              </div>
            </div>

            <div class="col-sm-6">
              <div class="form-group">
                <label>رقم الهاتف <small>(**) </small></label>
                <input type="text" id="telephone_booking" name="phone" class="form-control" value="" placeholder="" required>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label><i class="icon-calendar-7"></i> تاريخ الوصول <small>(*)</small></label>
                <input class="date-pick form-control" data-date-format="M d, D" type="text" id="from" name="arrival_date" data-min-date="0" >

              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label><i class="icon-calendar-7"></i> تاريخ المغادرة <small>(*)</small></label>
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
          <hr/><strong>البيانات الاختيارية ان وجدت (اختياري)</strong><hr/>
          <div class="row">
          <div class="col-sm-12">
          <div class="form-group">
          <label>الجنسيه <small>(اختياري )</small></label>
          <input type="text" class="form-control" id="nationality" name="country">
          </div>
          </div>

          </div>
          <div class="row">
          <div class="col-sm-6">
          <div class="form-group">
          <label>الايميل<small>(اختياري )</small></label>
          <input type="email" id="email_booking" name="email" class="form-control">
          </div>
          </div>


          <div class="col-sm-6">
          <div class="form-group">
            <label>عدد الحقائب تقريبا <small>(اختياري)</small></label>
          <input type="number" id="num_bags" name="num_bags" class="form-control">
          </div>
          </div>

          </div>
          <div class="row">
             <div class="col-sm-12">
               <div class="form-group">
                 <label class="">نوع البرنامج المطلوب</label>
                     <select class="form-control" name="booking_type">
                         <option value="1">برنامج كامل(طيران دولي وداخلي -فنادق-جولات-مواصلات)</option>
                         <option value="2">فنادق -طيران داخلي-مواصلات -جولات سياحية</option>
                         <option value="3">فنادق -طيران داخلي- و مواصلات فقط</option>
                         <option value="4">مواصلات و جولات سياحية فقط</option>
                         <option value="5">مواصلات  فقط</option>
                         <option value="6"> جولات سياحية فقط</option>
                         <option value="7">طيران داخلي فقط</option>

                     </select>
                 </div>
             </div>
         </div>
         <div class="row">
             <div class="col-sm-12">
               <div class="form-group">

                 <label>ملاحظات <small class="blue">(اختياري)</small></label>
                 <textarea rows="6" name="notes" class="form-control" placeholder="يرجى إرسال صور الجوازات عبر الإيميل لتأكيد الحجوزات مباشرة booking@alsakkaftravel.net او  عن طريق خدمة الواتس اب مع احد الأرقام الآتية :

  0060187770057
  0060187770018" /></textarea>
             </div>
         </div>
       </div>
          <!-- <a class="btn_full" href="cart.html"> إرسال الطلب</a> -->
          <button type="submit" class="btn_full">إرسال الطلب</button>

          <!-- <a class="btn_full_outline" href="#"><i class=" icon-heart"></i> Add to whislist</a> -->
          </form>

				</div>
				<!--End  single_tour_desc-->

				<aside class="col-lg-4">

					<!--/box_style_1 -->

					<div class="box_style_4">
						<i class="icon_set_1_icon-89"></i>
						<h4><span>احجز البرنامج </span> عبر الواتس اب </h4>
						<span ><a href="https://api.whatsapp.com/send?phone=60187770018" class="phone"> <i class="soap-icon-phone circle"></i>  +60 18 777 0018  <br/> <br/><img src="image/whatsapp.png"></a></span></address>

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
