<?php echo $header ?>
        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo 'الحجز الفوري (طلب خاص)'; ?></h2>
                </div>
            </div>
        </div>
        <section id="content" class="gray-area">
            <div class="container car-detail-page">
                <div class="row">
                    <div id="main" class="col-md-8 tab-content package" >





    <form id="booking_form" class="cruise-booking-form" method="post">
      <div class="required"><br/>
               <b> البيانات الضروريه لحجز برنامجك وسهولة التواصل معك (*)</b><hr/>

        <div class="row">
            <div class="form-group col-md-6">
                <label>الإسم الثلاثي (*)</label>
                <input type="text" name="customer_name_ar" class="input-text full-width" value="" placeholder="" required />
                <input type="hidden" name="itinerary_id" value="<?php echo $itinerary_id ?>" />
            </div>
            <div class="form-group col-md-6">
                <label>رقم الهاتف <small>(**) </small></label>
                <input type="text" name="phone" class="input-text full-width" value="" placeholder="" required />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>تاريخ الوصول <small>(*)</small></label>
                <div class="datepicker-wrap ">
                    <input type="text" name="arrival_date" id="from" class="input-text  full-width" placeholder="31/01/2017" data-min-date="0"  >
                </div>
            </div>
            <div class="col-md-6">
                <label>تاريخ المغادرة <small>(*)</small></label>
                <div class="datepicker-wrap ">
                    <input type="text" name="departure_date" class="input-text  full-width" id="to" placeholder="07/02/2017" data-min-date="0" >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label>عدد البالغين<small>(*)</small></label>
                <input type="number" name="num_adults" class="input-text col-md-12" style="margin-left: 10px;" value="" placeholder="البالغين"  />
            </div>
            <div class="form-group col-md-6">
                <label>عدد الاطفال  <small>(*)</small></label>
                <input type="number" name="num_children" class="input-text col-md-12" value="" placeholder="الأطفال"  />
            </div>

        </div>
     </div> <!-- end of required -->
      <hr/><strong>البيانات الاختيارية ان وجدت (اختياري)</strong><hr/>
       <div class="row">
            <div class="form-group col-md-12">
                <label>البريد الإلكتروني <small>(اختياري )</small></label>
                <input type="email" name="email" class="input-text full-width" value="" placeholder=""  />
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label >الجنسية <small>(اختياري )</small></label>
                <input type="text" name="country" class="input-text full-width" value="" placeholder="الجنسية"  />
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label>عدد الحقائب تقريبا <small>(اختياري)</small></label>
                <input type="number" name="num_bags" class="input-text full-width" value="" placeholder="" />
            </div>
        </div>
         <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label class="">نوع البرنامج المطلوب</label>
                                                            <div class="selector">
                                                                <select class="full-width" name="booking_type">
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
            <div class="form-group col-md-12">
                <label>ملاحظات <small class="blue">(اختياري)</small></label>
                <textarea rows="6" name="notes" class="input-text full-width" placeholder="يرجى إرسال صور الجوازات عبر الإيميل لتأكيد الحجوزات مباشرة booking@alsakkaftravel.net او  عن طريق خدمة الواتس اب مع احد الأرقام الآتية :

 0060187770057
 0060187770018" /></textarea>
            </div>
        </div>
        <hr />
        <div class="form-group row">
            <div class="col-md-12">
                <button type="submit" class="full-width btn-large">إرسال الطلب</button>
            </div>
        </div>
    </form>
                    </div>
                    <div class="sidebar col-md-4">
                        <article class="detailed-logo">
                                                <?php echo $right_sidebar; ?>

                        </article>
                    </div>
                </div>
            </div>
        </section>
<script type="text/javascript">
         $('#booking_form').submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: 'post',
            url: '<?php echo $link_send_itinerary;?>' ,
            data: $('#booking_form').serialize(),
            success: function (data) {
                dataLayer.push({
                        'event':'AjaxOrderCompleted',
                        'virtualUrl':'/success/',
                        'orderid' : '12345'
                 });
                 alert("تم استلام طلبك بنجاح ");
                 $('#booking_form').get(0).reset();
                  window.open('<?php echo $link_send_success;?>');
            }

        });


    });
        </script>

<?php  echo $footer ?>
