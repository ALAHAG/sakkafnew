<?php echo $header ?>
<div class="page-title-container">
    <div class="container">
        <div class="page-title pull-left">
            <h2 class="entry-title"><?php echo $itinerary_title; ?></h2>
        </div>
    </div>
</div>
<section id="content" class="gray-area">
    <div class="container car-detail-page">
        <div class="row">
            <div id="main" class="col-md-9">
                <div class="featured-image box">
                    <img src="<?php echo HTTP_IMAGE.$itinerary_image ?>" alt="" />
                    <div class="a"><h2> السعر الاجمالي للبرنامج <div class="price"><?php echo $customer_price ?>رنجت</div> </h2> </div>
                </div>
                <div class="tab-container ">
                    <ul class="tabs">
                        <li class="active">
                            <a href="#package" data-toggle="tab">البرنامج السياحي كامل</a>
                        </li>
                        <li>
                            <a href="#hotels" data-toggle="tab">الفنادق</a>
                        </li>
                        <li>
                            <a href="#transportation" data-toggle="tab">التنقلات الداخلية والعباره</a>
                        </li>
                        <li>
                            <a href="#tours" data-toggle="tab">الجولات السياحية</a>
                        </li>
                        <li>
                            <a href="#book" data-toggle="tab">الحجز</a>
                        </li>
                    </ul>
                    <div class="tab-content package">
                        <div class="tab-pane fade in active" id="package">
                            <div class="hotels">

                                <?php if ($package_rooms): ?>
                                    <h2 class="package_title"><i class="soap-icon-longarrow-bottom"></i> الفنادق <i class="soap-icon-hotel-3"></i></h2>
                                    <div class="car-list listing-style3 car">
                                     <?php foreach ($package_rooms as $room): ?>
                                        <article class="box">
                                            <figure class="col-xs-3">
                                                <span><img alt="" src="<?php echo HTTP_IMAGE.$room['image'] ?>"></span>
                                            </figure>
                                            <div class="details col-xs-9 clearfix">
                                                <div class="col-sm-8">
                                                    <div class="clearfix">
                                                        <h4 class="box-title"><a href="<?php echo $server.$room['slug'] ?>" class=""><span class="skin-color">الفندق: </span><?php echo $room['hotel_name'] ?><small> <?php echo $room['hotel_english_name'] ?></small></a></h4>
                                                    </div>
                                                    <div class="clearfix">
                                                        <h5 class="box-title"><?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?></h5>
                                                    </div>
                                                    <div class="clearfix">
                                                        <?php echo htmlentities($room['room_content'], ENT_QUOTES, 'utf-8') ?>
                                                    </div>
                                                </div>
                                                <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>
                                                <div class="col-xs-6 col-sm-3 character">
                                                    <dl class="">
                                                        <dt class="skin-color">عدد الليالي</dt><dd><?php echo $room['num_of_nights'] ?></dd>
                                                        <dt class="skin-color">مستوى الفندق </dt><dd>                                        <div title="<?php echo $room['star_rate'];?> stars" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$room['star_rate']] ?>-stars" style="width: 80%;"></span></div></dd>
                                                        <dt class="skin-color">المدينة</dt><dd><?php echo $room['city_ar_name'] ?></dd>
                                                    </dl>
                                                </div>
                                                <div class="action col-xs-3 col-sm-1">
                                                    <div class="amenities">
                                                        <ul>
                                                            <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    <?php endforeach ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="">
                            <?php if ($package_transportations): ?>
                                <h2 class="package_title transportation">التنقلات الداخلية والعباره <i class="soap-icon-pickanddrop"></i> <i class="soap-icon-plane"></i> <i class="soap-icon-cruise-3"></i></h2>
                                <div class="car-list listing-style3 car">
                                    <?php foreach ($package_transportations as $transportation): ?>
                                     <article class="box transportation">
                                        <figure class="col-xs-3">
                                            <span><img class="col-md-12" alt="" src="<?php echo HTTP_IMAGE.$transportation['transportation_image'] ?>"></span>
                                        </figure>
                                        <div class="details col-xs-9 clearfix">
                                            <div class="col-sm-11 character">
                                                <div class="clearfix">
                                                    <h4 class="box-title transportation"><?php echo $transportation['transportation_title_ar'] ?></h4>
                                                </div>
                                                <div class="clearfix">
                                                    <?php echo htmlentities($transportation['transportation_description_ar'], ENT_QUOTES, 'utf-8') ?>
                                                </div>
                                            </div>
                                            <div class="action col-xs-3 col-sm-1">
                                                <div class="amenities">
                                                    <ul>
                                                        <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                <?php endforeach ?>
                            <?php endif ?>
                        </div>
                    </div>
                    <div class="">
                        <?php if ($package_tours): ?>
                            <h2 class="package_title tours">الجولات السياحية  <i class="soap-icon-beach"></i></h2>
                            <div class="car-list listing-style3 car ">
                                <?php foreach ($package_tours as $package_tour): ?>
                                 <article class="box tours">
                                    <figure class="col-xs-3">
                                        <span><img class="col-md-12" alt="" src="<?php echo HTTP_IMAGE.$package_tour['tour_image'] ?>"></span>
                                    </figure>
                                    <div class="details col-xs-9 clearfix">
                                        <div class="col-sm-11 character">
                                            <div class="clearfix">
                                                <h4 class="box-title tours"><?php echo $package_tour['tour_title_ar'] ?></h4>
                                            </div>
                                            <div class="clearfix">
                                                <?php echo htmlentities($package_tour['tour_description_ar'], ENT_QUOTES, 'utf-8') ?>
                                            </div>
                                        </div>
                                        <div class="action col-xs-3 col-sm-1">
                                            <div class="amenities">
                                                <ul>
                                                    <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            <?php endforeach ?>
                    </div>    
                    <?php endif ?>

                </div>
            </div>
            <div class="tab-pane fade in " id="book">
            </div>
            <div class="tab-pane fade in " id="hotels">
                <?php if ($package_rooms){ ?>
                <h2 class="package_title"><i class="soap-icon-longarrow-bottom"></i> الفنادق <i class="soap-icon-hotel-3"></i></h2>
                <div class="car-list listing-style3 car">
                    <!--  -->                                    <?php foreach ($package_rooms as $room): ?>
                    <article class="box">
                        <figure class="col-xs-3">
                            <span><img alt="" src="<?php echo HTTP_IMAGE.$room['image'] ?>"></span>
                        </figure>
                        <div class="details col-xs-9 clearfix">
                            <div class="col-sm-8">
                                <div class="clearfix">
                                    <h4 class="box-title"><a href="<?php echo $server.$room['slug'] ?>" class=""><span class="skin-color">الفندق: </span><?php echo $room['hotel_name'] ?><small> <?php echo $room['hotel_english_name'] ?></small></a></h4>
                                </div>
                                <div class="clearfix">
                                    <h5 class="box-title"><?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?></h5>
                                </div>
                                <div class="clearfix">
                                    <?php echo htmlentities($room['room_content'], ENT_QUOTES, 'utf-8') ?>
                                </div>
                            </div>
                            <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>
                            <div class="col-xs-6 col-sm-3 character">
                                <dl class="">
                                    <dt class="skin-color">عدد الليالي</dt><dd><?php echo $room['num_of_nights'] ?></dd>
                                    <dt class="skin-color">مستوى الفندق </dt><dd>                                        <div title="<?php echo $room['star_rate'];?> stars" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$room['star_rate']] ?>-stars" style="width: 80%;"></span></div></dd>
                                    <dt class="skin-color">المدينة</dt><dd><?php echo $room['city_ar_name'] ?></dd>
                                </dl>
                            </div>
                            <div class="action col-xs-3 col-sm-1">
                                <div class="amenities">
                                    <ul>
                                        <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </article>
                <?php endforeach ?>
            </div>
            <?php } ?>
        </div>
        <div class="tab-pane fade in " id="transportation">
         <?php if ($package_transportations){ ?>
         <h2 class="package_title transportation">التنقلات الداخلية والعباره  <i class="soap-icon-pickanddrop"></i> <i class="soap-icon-plane"></i> <i class="soap-icon-cruise-3"></i></h2>
         <div class="car-list listing-style3 car">
            <?php foreach ($package_transportations as $transportation): ?>
             <article class="box transportation">
                <figure class="col-xs-3">
                    <span><img class="col-md-12" alt="" src="<?php echo HTTP_IMAGE.$transportation['transportation_image'] ?>"></span>
                </figure>
                <div class="details col-xs-9 clearfix">
                    <div class="col-sm-11 character">
                        <div class="clearfix">
                            <h4 class="box-title transportation"><?php echo $transportation['transportation_title_ar'] ?></h4>
                        </div>
                        <div class="clearfix">
                            <?php echo htmlentities($transportation['transportation_description_ar'], ENT_QUOTES, 'utf-8') ?>
                        </div>
                    </div>
                    <div class="action col-xs-3 col-sm-1">
                        <div class="amenities">
                            <ul>
                                <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </article>
        <?php endforeach ?>
        </div><?php } ?>
    </div>
    <div class="tab-pane fade in " id="tours">
        <?php if ($package_tours){ ?>
        <h2 class="package_title tours">الجولات السياحية <i class="soap-icon-beach"></i></h2>
        <div class="car-list listing-style3 car">
            <?php foreach ($package_tours as $package_tour): ?>
             <article class="box tours">
                <figure class="col-xs-3">
                    <span><img class="col-md-12" alt="" src="<?php echo HTTP_IMAGE.$package_tour['tour_image'] ?>"></span>
                </figure>
                <div class="details col-xs-9 clearfix">
                    <div class="col-sm-11 character">
                        <div class="clearfix">
                            <h4 class="box-title tours"><?php echo $package_tour['tour_title_ar'] ?></h4>
                        </div>
                        <div class="clearfix">
                            <?php echo htmlentities($package_tour['tour_description_ar'], ENT_QUOTES, 'utf-8') ?>
                        </div>
                    </div>
                    <div class="action col-xs-3 col-sm-1">
                        <div class="amenities">
                            <ul>
                                <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </article>
        <?php endforeach ?>
    </div>
    <?php } ?>
</div>

</div>    

<div class="booking-section travelo-box tab-pane fade in " id="book">
    <h2  class="package_title">بيانات الحجز</h2>

    <form id="booking_form" class="cruise-booking-form" method="post">
        <div class="row">
            <div class="form-group col-md-12">
                <label>الإسم الثلاثي</label>
                <input type="text" name="customer_name_ar" class="input-text full-width" value="" placeholder="" required />
                <input type="hidden" name="itinerary_id" value="<?php echo $itinerary_id ?>" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label >الجنسية</label>
                <input type="text" name="country" class="input-text full-width" value="" placeholder="الجنسية" required />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label>البريد الإلكتروني</label>
                <input type="email" name="email" class="input-text full-width" value="" placeholder="" required />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label>رقم الهاتف</label>
                <input type="text" name="phone" class="input-text full-width" value="" placeholder="" required />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <label>تاريخ الوصول</label>
                <div class="datepicker-wrap">
                    <input type="text" name="arrival_date" class="input-text full-width" placeholder="mm/dd/yy" data-min-date="01/01/2015"required >
                </div>
            </div>
            <div class="col-xs-6">
                <label>تاريخ المغادرة</label>
                <div class="datepicker-wrap">
                    <input type="text" name="departure_date" class="input-text full-width" placeholder="mm/dd/yy" data-min-date="01/01/2015"required >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label>عدد الأشخاص</label>
                <input type="number" name="num_adults" class="input-text col-md-5" style="margin-left: 10px;" value="" placeholder="البالغين" required /> 
                <input type="number" name="num_children" class="input-text col-md-5" value="" placeholder="الأطفال" required />
            </div>
            <div class="form-group col-md-6">
                <label>عدد الحقائب</label>
                <input type="number" name="num_bags" class="input-text full-width" value="" placeholder="" />
            </div>
       </div>
        <div class="row">
            <div class="form-group col-md-12">
                
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label>يرجى إرسال صور الجوازات عبر الإيميل لتأكيد الحجوزات مباشرة booking@alsakkaftravel.net</label>
                <textarea name="notes" class="input-text full-width" placeholder="ملاحظات" /></textarea> 
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
</div>
</div>
<div class="sidebar col-md-3">
    <article class="detailed-logo">
        <div class="details">
            <h2 class="box-title"><?php echo $itinerary_title; ?></h2>
            <span class="price clearfix">
                <small class="pull-left">سعر البرنامج</small>
                <span class="pull-right"><?php echo $customer_price ?></span>
            </span>
            <a class="button yellow full-width uppercase btn-small" href="#book"   class="booking" data-toggle="tab">طلب البرنامج</a>
        </div>

    </article>
    <div class="white-bg" >  
<!--       <img src="http://localhost/travelator/image/notes.jpg">
-->                <article class="detailed-logo notes">

<h4 class="box-title"> ملاحظات </h4>
<ul>
  <li>1) يرجى الاخذ بعين الاعتبار بان اباسعار قابله للتغيير بشكل بسيط نسبيأ وخاصه اسعار اذاكر الطيران.</li><br/>
  <li>2) في حالة عدم توفر الفندق او نوع الغرفه فاننا سنوفر البديل المناسب , قد يكون هناك مبلغ اضافي .</li><br/>
  <li>3) مواعيد الدخول في جميع فنادق ماليزيا الساعه 2 ظهرا والخروج الساعه 12 ظهرا.</li><br/> 
</ul>                 
</article>
<article class="detailed-logo notes">

  <h4 class="box-title"> البرنامج يشمل</h4>
  <?php echo html_entity_decode($package_notes); ?>
</article>
</div >       

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
                alert('تم استلام طلبك -سيتم الرد عليك خلال 8 ساعات ');
            }
        });
    });
</script>
<script type="text/javascript">

    $('.booking').click(function () {
        var divID = '#book';
        $('html, body').animate({
            scrollTop: $(divID).offset().top
        }, 2000);
    });
</script>

<?php  echo $footer ?>

