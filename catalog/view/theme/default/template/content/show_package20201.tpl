<?php echo $header ?>
<script type="application/ld+json">
{
"@context": "http://schema.org/",
  "@type": "Product",
  "id":"<?php echo 'https://alsakkaftravel.net'.$_SERVER['REQUEST_URI']; ?>",
  "name": "<?php echo $itinerary_title; ?> الى ماليزيا",
   "sku": "1",
  "image": "<?php echo HTTPS_IMAGE.$itinerary_image ?>",
  "description": "<?php echo $itinerary_title; ?> الى ماليزيا  عدد الليالي : <?php echo $nights ?><?php if($nights>10){echo ' ليله و'; }else{ echo ' ليالي و ';}?> <?php echo ($nights+1) ?><?php if($nights+1>10){echo ' يوم'; }else{ echo ' ايام';}?> .",
"brand": {
  "@type": "Thing",
  "name": "السقاف للسياحة والسفر"
  },
"aggregateRating": {
  "@type": "AggregateRating",
  "ratingValue": "4.9",
  "reviewCount": "<?php echo $itinerary_id%5*103+31 ?>"
 },
"offers": {
  "@type": "Offer",
  "priceCurrency": "MYR",
  "price": "<?php echo $customer_price ?>",
  "url":"<?php echo 'https://alsakkaftravel.net'.$_SERVER['REQUEST_URI']; ?>",
  "validFrom": "2019-09-20",
  "priceValidUntil": "2020-11-29",
  "itemCondition": "http://schema.org/NewCondition",
  "availability": "http://schema.org/InStock"
  },
"review": {
  "@type": "Review",
  "author": "بركات القرني",
  "datePublished": "2019-07-23",
  "description": "انا توي وصلت جدة و الحمد لله فحبيت أشكركم على كل ما قدمتموه لي في هذه الرحلة السياحية الأكثر من رائعة من استقبال و مواصلات و فنادق و توديع و الشكر موصول لكل الاخوة السواقين وعلى رأسهم الاخوة السوريين اللي أسعدت بالتعرف عليهم و لكم جزيل الشكر و التقدير.",
  "name": "ممتاز!",
 "reviewRating": {
  "@type": "Rating",
  "bestRating": "5",
  "ratingValue": "5",
  "worstRating": "1"
  }
 }
}
</script>
<div class="page-title-container">
    <div class="container">
        <div class="page-title pull-left">
            <h1 class="entry-title" itemprop="name" ><?php echo $itinerary_title; ?></h1>
        </div>
    </div>
</div>
<section id="content" class="gray-area" >
    <div class="container car-detail-page" id="<?php echo $_SERVER['REQUEST_URI']; ?>"  >
        <div class="row">
            <div id="main" class="col-md-9">
                <div class="featured-image box">
                    <!-- <meta itemprop="name" content="<?php echo $itinerary_title; ?>"> -->
                    <img src="<?php echo HTTPS_IMAGE.$itinerary_image ?>" alt="<?php echo $itinerary_title; ?>" />
                    <!-- <meta itemprop="image" content="<?php echo HTTPS_IMAGE.$itinerary_image ?>"> -->

                    <div class="a"> <span><h2> السعر الاجمالي للبرنامج <br/> <div class="price"><span  content="<?php echo $customer_price ?>"><?php echo $customer_price ?> رنجت </span></div> <center><?php if($entry_num_passengers==2) {echo '[لشخصين]';} else{ echo '['.$entry_num_passengers.' أشخاص]'; }?></center></h2>  </span><span class="review price" ><span class="hidden"><?php echo $itinerary_title; ?></span>  عدد الليالي : <?php echo $nights ?><small><?php if($nights>10){echo ' ليله و'; }else{ echo ' ليالي و';}?> </small>  <?php echo ($nights+1) ?><small><?php if($nights+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </small></span> </div>
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
                            <a href="#transportation" data-toggle="tab">المواصلات</a>
                        </li>
                        <li>
                            <a href="#tours" data-toggle="tab">الجولات</a>
                        </li>
                        <li>
                            <a href="#book" data-toggle="tab">إستمارة طلب الحجز</a>
                        </li>
                    </ul>
                    <div class="tab-content package">
                        <div class="tab-pane fade in active" id="package">
                            <div class="hotels">

                                <?php if ($package_rooms): ?>
                                    <h2 class="package_title heading-orange"><i class="soap-icon-longarrow-bottom"></i> المدن و الفنادق <i class="soap-icon-hotel-3"></i></h2>
                                    <div class="car-list listing-style3 car">
                                     <?php foreach ($package_rooms as $room): ?>
                                        <article class="heading-orange">
                                        <div class="">
                                            <div class="col-xs-12 col-sm-3">
                                                <figure class="">
                                                    <span><img alt="" src="<?php echo HTTPS_IMAGE.$room['image'] ?>" width="200"></span>
                                                </figure>
                                            </div>
                                            <div class="details col-xs-12 col-sm-1 clearfix">
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="clearfix">
                                                        <h4 class="box-title white-color"><a href="<?php echo $server.$room['slug'] ?>" class=""><span class="skin-color">الفندق: </span><?php echo $room['hotel_name'] ?><small class="white-color"> <?php echo $room['hotel_english_name'] ?></small></a></h4>
                                                    </div>
                                                    <div class="clearfix">
                                                        <h5 class="box-title"><?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?></h5>
                                                    </div>
                                                    <div class="clearfix">
                                                        <?php echo htmlentities($room['room_content'], ENT_QUOTES, 'utf-8') ?>
                                                    </div>
                                                </div>
                                                <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>
                                                <div class="col-xs-12 col-sm-3 character">
                                                    <dl class="">
                                                        <dt class="skin-color">عدد الليالي</dt><dd><?php echo $room['num_of_nights'] ?></dd>
                                                        <dt class="skin-color">مستوى الفندق </dt><dd>                                        <div title="<?php echo $room['star_rate'];?> نجوم"" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$room['star_rate']] ?>-stars" style="width: 80%;"></span></div></dd>
                                                        <dt class="skin-color">المدينة</dt><dd><?php echo $room['city_ar_name'] ?></dd>
                                                    </dl>
                                                </div>
                                                <div class="action col-xs-12 col-sm-1">
                                                    <div class="amenities">
                                                        <ul>
                                                            <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                                        </ul>
                                                    </div>
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
                                <h2 class="package_title transportation">المواصلات والتنقلات الداخلية  <i class="soap-icon-pickanddrop"></i> <i class="soap-icon-plane"></i> <i class="soap-icon-cruise-3"></i></h2>
                                <div class="car-list listing-style3 car">
                                    <?php foreach ($package_transportations as $transportation): ?>
                                   <article class="heading-orange col-md-12">
                                            <div>
                                                <div class="col-xs-12 col-sm-3">

                                                    <figure class="">
                                                        <span><img class="col-md-12" alt="" src="<?php echo HTTPS_IMAGE.$transportation['transportation_image'] ?>"></span>
                                                    </figure>
                                                 </div>
                                             <div class="details col-xs-12 col-sm-1 clearfix">
                                                <div class="col-sm-11 character">
                                                    <div class="clearfix">
                                                        <h4 class="box-title "><?php echo $transportation['transportation_title_ar'] ?></h4>
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
                                            </div>
                                        </article>
                                <?php endforeach ?>
                            <?php endif ?>
                        </div>
                    </div>
                    <div class="">
                        <?php if ($package_tours): ?>
                            <h2 class="package_title tours">الجولات السياحية والخدمات الاضافية <i class="soap-icon-beach"></i></h2>
                            <div class="car-list listing-style3 car ">
                                <?php foreach ($package_tours as $package_tour): ?>

             <article class="heading-orange">
             <div>
              <div class="col-xs-12 col-sm-3">

                <figure class="">
                    <span><img class="col-md-12" alt="" src="<?php echo HTTPS_IMAGE.$package_tour['tour_image'] ?>"></span>
                </figure>
                </div>
                 <div class="details col-xs-12 col-sm-1 clearfix">
                    <div class="col-sm-11 character">
                        <div class="clearfix">
                            <h4 class="box-title "><?php echo $package_tour['tour_title_ar'] ?></h4>
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
                <h2 class="package_title heading-orange"><i class="soap-icon-longarrow-bottom"></i> الفنادق <i class="soap-icon-hotel-3"></i></h2>
                <div class="car-list listing-style3 car">
                    <!--  -->                                    <?php foreach ($package_rooms as $room): ?>
                       <article class="heading-orange">
                                        <div class="">
                                            <div class="col-xs-12 col-sm-3">
                                                <figure class="">
                                                    <span><img alt="" src="<?php echo HTTPS_IMAGE.$room['image'] ?>"></span>
                                                </figure>
                                            </div>
                                            <div class="details col-xs-12 col-sm-1 clearfix">
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="clearfix">
                                                        <h4 class="box-title white-color"><a href="<?php echo $server.$room['slug'] ?>" class=""><span class="skin-color"> الفندق: </span><?php echo $room['hotel_name'] ?><small class="white-color"> <?php echo $room['hotel_english_name'] ?></small></a></h4>
                                                    </div>
                                                    <div class="clearfix">
                                                        <h5 class="box-title"><?php echo $room['room_name'] ?> | <?php echo $room['room_english_name'] ?></h5>
                                                    </div>
                                                    <div class="clearfix">
                                                        <?php echo htmlentities($room['room_content'], ENT_QUOTES, 'utf-8') ?>
                                                    </div>
                                                </div>
                                                <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>
                                                <div class="col-xs-12 col-sm-3 character">
                                                    <dl class="">
                                                        <dt class="skin-color">عدد الليالي</dt><dd><?php echo $room['num_of_nights'] ?></dd>
                                                        <dt class="skin-color">مستوى الفندق </dt><dd>                                        <div title="<?php echo $room['star_rate'];?> نجوم"" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$room['star_rate']] ?>-stars" style="width: 80%;"></span></div></dd>
                                                        <dt class="skin-color">المدينة</dt><dd><?php echo $room['city_ar_name'] ?></dd>
                                                    </dl>
                                                </div>
                                                <div class="action col-xs-12 col-sm-1">
                                                    <div class="amenities">
                                                        <ul>
                                                            <li><i class="soap-icon-user circle"></i><?php echo $room['occupancy'] ?></li>
                                                        </ul>
                                                    </div>
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
         <h2 class="package_title transportation">المواصلات والتنقلات الداخلية  <i class="soap-icon-pickanddrop"></i> <i class="soap-icon-plane"></i> <i class="soap-icon-cruise-3"></i></h2>
         <div class="car-list listing-style3 car">
            <?php foreach ($package_transportations as $transportation): ?>
             <article class="heading-orange col-md-12">
                <div>
                    <div class="col-xs-12 col-sm-3">

                        <figure class="">
                            <span><img class="col-md-12" alt="" src="<?php echo HTTPS_IMAGE.$transportation['transportation_image'] ?>"></span>
                        </figure>
                     </div>
                 <div class="details col-xs-12 col-sm-1 clearfix">
                    <div class="col-sm-11 character">
                        <div class="clearfix">
                            <h4 class="box-title "><?php echo $transportation['transportation_title_ar'] ?></h4>
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
                </div>
            </article>
        <?php endforeach ?>
        </div><?php } ?>
    </div>
    <div class="tab-pane fade in " id="tours">
        <?php if ($package_tours){ ?>
        <h2 class="package_title tours">الجولات السياحية والخدمات الاضافية <i class="soap-icon-beach"></i></h2>
        <div class="car-list listing-style3 car">
            <?php foreach ($package_tours as $package_tour): ?>

             <article class="heading-orange">
             <div>
              <div class="col-xs-12 col-sm-3">

                <figure class="">
                    <span><img class="col-md-12" alt="" src="<?php echo HTTPS_IMAGE.$package_tour['tour_image'] ?>"></span>
                </figure>
                </div>
                 <div class="details col-xs-12 col-sm-1 clearfix">
                    <div class="col-sm-11 character">
                        <div class="clearfix">
                            <h4 class="box-title "><?php echo $package_tour['tour_title_ar'] ?></h4>
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
                </div>
            </article>
        <?php endforeach ?>
    </div>
    <?php } ?>
</div>

</div>
    <h2  class="heading-orange heading-padding">بيانات الحجز</h2>

<div class="booking-section travelo-box tab-pane fade in " id="book">

    <form id="booking_form" class="cruise-booking-form" method="post">
        <small> البيانات الضروريه لحجز برنامجك وسهولة التواصل معك (*)</small><hr/>
      <div class="required">

        <div class="row">
            <div class="form-group col-md-6">
                <label>الإسم الثلاثي (*)</label>
                <input type="text" name="customer_name_ar" class="input-text full-width" value="" placeholder="" required />
                <input type="hidden" name="itinerary_id" value="<?php echo $itinerary_id ?>" />
            </div>
        <!-- </div>
        <div class="row"> -->
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
      <hr/><small>البيانات الاختيارية ان وجدت (اختياري)</small><hr/>
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


<!--         <div class="row">
            <div class="form-group col-md-12">
                <label class="white-color">نوع البرنامج المطلوب</label>
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
        </div> -->
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
</div>

<article class="detailed-logo note heading-orange">

    <h2 class="box-title white-color"> طريقة الحجز </h2>
    <ul>
        <br/> <li>يمكنك حجز البرنامج عن طريق خدمة الواتس اب مع احد الأرقام الآتية او الاتصال مباشره .اضغط على الرقم ادناه:</li><br/>
        <!--  <li style="direction: ltr;"> +6018 777 0018</li>
         <li style="direction: ltr;"> +6018 777 0057</li><br/> -->
          <li class="phone" style="text-align: center;">
            واتس اب مباشر
            <br/><span class="contact-phone"  ><a href="https://wa.me/60187770018?text=' طلب برنامج - كود البرنامج  : B<?php echo $itinerary_id ?> '">0060187770018<img src="image/whatsapp.png"></a></span><br/>
            <span class="contact-phone"><a href="https://wa.me/60187770057?text=' طلب برنامج - كود البرنامج : B<?php echo $itinerary_id ?>'">0060187770057<img src="image/whatsapp.png"></a></span><br/>
            <div>
              اواتصال <br/>
                    <span  class="phone"><i class="soap-icon-phone"></i><a href="tel:+60187770018" style="direction: ltr;text-decoration: underline;">
            0060187770018</a></span>
            </div>

            <div>
                    <span  class="phone"><i class="soap-icon-phone"></i> <a href="tel:+60187770057" style="direction: ltr;text-decoration: underline;">
             0060187770057 </a></span>
            </div><br/>




         </li>
        <li> او عن طريق تعبئة استمارة طلب الحجز اعلاه ونرجو ارسال صورة التذاكر الدولية وصور الجوازات لعمل الحجوزات.</li><br/>
        <h2 class="box-title white-color">طريقة الدفع</h2><br/>
</ul>
        <h4 class="white-color">يتم أرسال فاتورة للعميل بعد تاكيد الطلب لدفع العربون عبر الطرق الآتية:</h4>
        <ol>
             <li>1) التحويل المباشر إلى حساب الشركة . <li>
             <li>2) التحويل إلى حسابات أحد الوكلاء والمندوبين بدولتكم مثل بنك الراجحي والأهلي السعودي . <li>
             <li>3) الدفع عن طريق الجهاز "كريدت كارد" بطاقات الائتمان .<li>
             <li>4) التحويل عن طريق وسترن يونيون . <li>
       <br/>

    </ol>
</article>
</div>
<div class="sidebar col-md-3">
    <article class="detailed-logo">
        <div class="details">
            <!-- <h2 class="box-title"><?php echo $itinerary_title; ?></h2> -->
            <span class="price clearfix">
                <small class="pull-left">سعر البرنامج :</small>
                <span class="pull-right"><?php echo $customer_price ?> رنجت </span>
            </span>
           <div class="heading-orange">كود البرنامج : B<?php echo $itinerary_id ?></div>
        </div>

    </article>
    <div class="white-bg" >
<!--       <img src="http://localhost/travelator/image/notes.jpg">
-->
<article class="detailed-logo note heading-orange">

<h2 class="box-title white-color"> ملاحظات </h2>
<ul>
<br/> <li>1- العرض ساري على مدار السنة وقابل للزيادة في فترة الاجازة الصيفية بشكل بسيط.</li><br/>
<li>2- في حالة عدم توفر الفندق المذكور سيتم توفير فندق آخر بنفس المستوى او يتم توفير البديل المناسب,
وقد يكون هناك مبلغآ اضافيآ حسب مستوى الفندق البديل.</li><br/>
<li>3- مواعيد الدخول في جميع فنادق ماليزيا الساعة 2 ظهرآ وموعيد الخروج 12 ظهرآ.</li><br/>
<li>4- البرنامج قابل للتعديل حسب طلبك من حيث عدد اليالي وعدد الافراد مع فارق السعر.</li><br/>

</ul>
</article>
<article class="detailed-logo note heading-orange">

  <h2 class="box-title white-color" > البرنامج يشمل</h2>
 <br/> <?php echo html_entity_decode($package_notes); ?>
</article>

<article class="detailed-logo note heading-orange">

<h2 class="box-title white-color"> هدايا مجانية وتخفيضات </h2>
<ul>
 <br/><li>- شريحتين اتصال مجانآ.</li><br/>
 <li>- جولة سياحية مجانية.</li><br/>
 <li>- تخفيض مابين 300 الى 700 رنجت على كل عميل يشتري برنامج من طرفك.</li><br/>

</ul>
</article>
</div>
</div>

<!-- <div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://shrk-lsqf-llsyh-wlsfr.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script> -->
<!-- <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>*/ -->

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
<script type="text/javascript">


    $('.booking').click(function () {
        var divID = '#book';
        $('html, body').animate({
            scrollTop: $(divID).offset().top
        }, 2000);
    });






</script>
<script id="dsq-count-scr" src="//shrk-lsqf-llsyh-wlsfr.disqus.com/count.js" async></script>
<?php  echo $footer ?>
