<?php echo $header; ?>
<?php echo $slider; ?>
<section id="content">
    <div class="search-box-wrapper">
        <div class="search-box">
            <ul class="search-tabs clearfix">
                <?php $active = 1 ?>
                <?php foreach ($package_categories as $category): ?>
                <li <?php echo $active==1 ? 'class="active"' : '' ?> >
                    <a href="#tab-<?php echo $category['category_id'] ?>" data-toggle="tab" title="<?php echo $category['title'] ?>">
                        <?php echo $category['title'] ?>
                    </a>
                </li>
                <?php $active = 0;?>
                <?php endforeach ?>
            </ul>
            <div class="visible-mobile">
                <ul id="mobile-search-tabs" class="search-tabs clearfix">
                    <?php $active = 1 ?>
                    <?php foreach ($package_categories as $category): ?>
                    <li <?php echo $active==1 ? 'class="active"' : '' ?> >
                        <a href="#tab-<?php echo $category['category_id'] ?>" data-toggle="tab">
                            <?php echo $category['title'] ?>
                        </a>
                    </li>
                    <?php $active = 0;?>
                    <?php endforeach ?>
                </ul>
            </div>
            <div class="search-tab-content">
                <?php $active = 1 ;$c = 1;?>
                <?php foreach ($package_categories as $category): ?>
                <div class="tab-pane fade <?php echo $active == 1 ? 'active' : '' ?> in" id="tab-<?php echo $category['category_id'] ?>">
                    <div class="destinations section">
                        <div class="container">
                            <div class="row image-box style1 add-clearfix">
                                <?php foreach ($category['packages'] as $package): ?>
                                <div class="col-sms-6 col-sm-6 col-md-3">
                                    <article class="box package" id="<?php echo $server.$package['slug'] ?>" itemscope itemtype="https://schema.org/Product" >
                                        <figure class="" data-animation-type="fadeInDown" data-animation-duration="1">
                                            <a itemprop="url"  href="<?php echo $server.$package['slug'] ?>" title="<?php echo $package['itinerary_title'] ?> - ماليزيا - عروض ماليزيا - فنادق ماليزيا" class="hover-effect">
                                                    <img src="<?php echo $package['image_thumb'] ?>"  title="<?php echo $package['itinerary_title'] ?>" alt="<?php echo $package['itinerary_title'] ?> - ماليزيا - عروض ماليزيا - فنادق ماليزيا"  /><span class="discount"><span class="discount-text">2019/2020</span></span></a>
                                            <meta itemprop="image" content="<?php echo $package['image_thumb'] ?>">
                                        </figure>
                                        <div class="details">

                                            <h2 class="box-title qtitle white-color"><a href="<?php echo $server.$package['slug'] ?>" title="<?php echo $package['itinerary_title'] ?>"><span itemprop="name"><?php echo $package['itinerary_title'] ?></span></a></h2>

                                            <span class="review price" itemprop="description"><span class="hidden"><?php echo $package['itinerary_title'] ?></span>  عدد الليالي : <?php echo $package['night'] ?><?php if($package['night']>10){echo ' ليله و'; }else{ echo ' ليالي و';}?>   <?php echo ($package['night']+1) ?><?php if($package['night']+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </span>
                                            <div class="feedback">
                                                <span class="review price" itemprop="offers" itemscope itemtype="https://schema.org/Offer"><span itemprop="priceCurrency" content="SAR"></span><span itemprop="price" content="<?php echo $package['customer_price'] ?>"> السعر: <?php echo $package['customer_price'] ?> رنجت <?php if($package['entry_num_passengers']==2) {echo '[لشخصين]';} else{ echo '['.$package['entry_num_passengers'].' أشخاص]'; }?>
                                                  <meta itemprop="url" content="<?php echo $server.$package['slug'] ?>">
                                                  <meta itemprop="priceValidUntil" content="20/12/2020">
                                                    <link itemprop="availability" href="http://schema.org/InStock" />
                                                 </span></span>
                                            </div>
                                              <div class="feedback">
                                                    <span class="review price"> كود البرنامج: B<?php echo $package['itinerary_id'] ?></span>
                                                </div>
                                                <div class="hidden" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                                                   <span itemprop="ratingValue">5</span> <span itemprop="reviewCount">357</span> reviews
                                                 </div>
                                        </div>
                                    </article>

                                </div>
                                <?php endforeach ?>
                        <div class="left">
                      <a class="button left btn-small sgafbtn" href="<?php echo $server.'packages?category='. $category['category_id'];?>" title=" في ماليزيا <?php echo $category['title'] ?> ">المزيد من   <strong ><?php echo $category['title'] ?> </strong> الى <b>ماليزيا</b> اضغط هنا
</a></div>

                            </div>
                        </div>
                    </div>
                </div>
                <?php $active = 0;?>
                <?php endforeach ?>
            </div>
        </div>
    </div>
</section>
<div class="container">
  <section>
    <div class="row image-box style1 add-clearfix">
      <div class="col-sms-12 col-sm-12 col-md-12 sgaf ">
        <a href="https://api.whatsapp.com/send?phone=60187770018" class=" " title="واتس اب شركة السقاف للسياحة والسفر"><i class=" float-right soap-icon-stories"></i>   للتواصل السريع مع مدير قسم الحجوزات عبر الواتس اب (<img src="image/whatsapp.png" title="alsakkaf travel" alt= "alsakkaf travel and Tours Malaysia"> 0060187770018) على مدار 24 ساعه</a>
      </div>
      <div class="col-sms-12 col-sm-12 col-md-12 sgafs">
      <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">
        <a href="/tours" class=" " title="المواصلات والجولات السياحية ماليزيا"><i class=" float-right soap-icon-car-2"></i> المواصلات والجولات السياحية ماليزيا</a>
      </div>
      <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">
        <a href="/packages-in-malaysia" class=" " title="افضل العروض والبكجات السياحية في ماليزيا 2020"><i class=" float-right soap-icon-cruise-3"></i>افضل العروض السياحية الى ماليزيا 2020</a>
      </div>
      <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">
        <a href="/packages" class=" " title="عروض بكجات شهر العسل والبكجات العائلية الى ماليزيا"><i class=" float-right soap-icon-card"></i> عروض شهر العسل والعائلية ماليزيا</a>
      </div>
    </div>
    </div>
  </section>
</div>
<div class="features section global-map-area parallax" data-stellar-background-ratio="0.5" style="background-position: 50% 50.2656px;">
للتواصل المباشر عبر الواتس اب اضغط هنا
            </div>
<div class="global-map-area section parallax" data-stellar-background-ratio="0.5">
    <div class="container">
        <section>
            <div class="row image-box style1 add-clearfix">
                <div class="col-md-8">
                    <h3 class="heading-orange heading-padding"><i class="soap-icon-couples"></i>
                      أراء العملاء - تعرف على خدماتنا
                    </h3>
                    <div class=" image-box style1 add-clearfix">
                            <div class="containerx">
                              <div class="vid-container">
                                <div id="vid_frames" class="youtube" data-embed="VvXd2LRNxoE">
                                    <!-- (2) the "play" button -->
                                    <div class="play-button"></div>
                                </div>
                                <!-- <iframe id="vid_frame" data-src="https://www.youtube.com/embed/VvXd2LRNxoE?rel=0&showinfo=0&autohide=1" frameborder="0" width="500" height="200"></iframe> -->
                            </div>
                            <div class="vid-list-container">
                                  <div class="vid-list">
                                      <div class="vid-item" onClick="document.getElementById('vid_frame').src='https://youtube.com/embed/Vwb2xFKpuyQ?autoplay=1&rel=0&showinfo=0&autohide=1'">
                                        <div class="thumb"><img src="/image/youtube/1.jpg" width="128" height="96" alt="تقرير رحلتي في ماليزيا >الاستاذ أحمد الثقفي من السعودية" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">الاستاذ أحمد الثقفي من السعودية</div>
                                      </div>
                                      <div class="vid-item" onClick="document.getElementById('vid_frame').src='https://youtube.com/embed/mbSK5ZT1NSs?autoplay=1&rel=0&showinfo=0&autohide=1'">
                                        <div class="thumb"><img src="/image/youtube/0.jpg" width="128" height="96" alt="تفاصيل سفري الى ماليزيا >انور الينبعاوي من السعودية " title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">انور الينبعاوي من السعودية </div>
                                      </div>
                                      <div class="vid-item" onClick="document.getElementById('vid_frame').src='https://youtube.com/embed/M_-ybmbWKls?autoplay=1&rel=0&showinfo=0&autohide=1'">
                                        <div class="thumb"><img src="/image/youtube/2.jpg" width="128" height="96" alt="رأي العميل عن برنامج رحلته الى ماليزيا >محمد متولي من مصر" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">محمد متولي من مصر</div>
                                      </div>
                                      <div class="vid-item" onClick="document.getElementById('vid_frame').src='https://youtube.com/embed/8qYeETLUBxs?autoplay=1&rel=0&showinfo=0&autohide=1'">
                                        <div class="thumb"><img src="/image/youtube/4.jpg" width="128" height="96" alt="قالو عن شركة السقاف للسياحة والسفر ماليزيا" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">علي البطراني من عمان</div>
                                      </div>
                                      <div class="vid-item" onClick="document.getElementById('vid_frame').src='https://youtube.com/embed/Luqjr7UCYI8?autoplay=1&rel=0&showinfo=0&autohide=1'">
                                        <div class="thumb"><img src="/image/youtube/3.jpg" width="128" height="96" alt="قالو عن شركة السقاف للسياحة والسفر ماليزيا" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">منيف الشمري من السعودية</div>
                                      </div>
                                      <div class="vid-item" >
                                        <a href="https://alsakkaftravel.net/testimonial" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا">
                                        <div class="thumb"><img src="/image/youtube/5.jpg" width="128" height="96" alt="قالو عن شركة السقاف للسياحة والسفر ماليزيا" title="قالو عن شركة السقاف للسياحة والسفر ماليزيا"></div>
                                        <div class="desc">شاهد مزيد من اراء العملاء </div></a>
                                      </div>
                                </div>
                                </div>
                                <!-- LEFT AND RIGHT ARROWS -->
                                <div class="arrows">
                                  <div class="arrow-left"><i class="fa fa-chevron-left fa-lg"></i></div>
                                  <div class="arrow-right"><i class="fa fa-chevron-right fa-lg"></i></div>
                                </div>
                                <!-- JS FOR SCROLLING THE ROW OF THUMBNAILS -->
                                </div>
                        </div>
                    </div>
                    <div class="col-md-4 heading-orange">
                        <h3 class="heading-orange heading-padding"><i class="soap-icon-support"></i> اخر الحجوزات</h3>
                        <div class="vticker col-sms-12 col-sm-12 col-md-12">
                            <ul>
                                <?php foreach ($bookings as $key => $value) {?>
                                <li><i class="soap-icon-triangle-left"></i><span class="n"> طلب حجز من </span> :
                                    <span class="nameC"><?php echo ($value['customer_name_ar'])?$value['customer_name_ar']:'';?>  </span><span class="nationality"><?php echo ($value['customer_country'])?'<i class="soap-icon-passed"></i> الجنسية '.$value['customer_country']:'';?></li><?php } ?></span>
                            </ul>
                        </div>
                    </div>
        </section>
        </div>
        </div>
    </div>
    </section>
</div>
<?php if ($page_categories): ?>
  <?php foreach ($page_categories as $page_category): ?>
    <div class="offers section">
      <h2 class="heading-orange heading-padding"><i class="soap-icon-beach"></i> <?php echo $page_category['title'] ?> </h2>

      <div class="container">
        <div class="row image-box style2">
          <?php foreach ($page_category['pages'] as $page): ?>
            <div class="col-md-6">
              <article class="box">
                <figure class="" data-animation-type="fadeInLeft" data-animation-duration="1">
                 <a href="<?php echo $page['slug']; ?>" title="<?php echo $page['title'] ?>">
                  <img src="<?php echo $page['image_thumb'] ?>" alt="<?php echo $page['title'] ?> -ماليزيا" title="<?php echo $page['title'] ?>" /></a>
                </figure>
                <div class="details">
                  <h4><?php echo $page['title'] ?></h4>
                  <p>  <?php   $str=strip_tags(preg_replace('/[^أ-ي ]/ui', '',$page['content']));
                    $string = preg_replace('/\s\s+/', ' ', $str);
                    $arr = explode(" ", str_replace(",", ", ", $string));
                    for ($index = 0; $index < 20; $index++) {
                      echo $arr[$index]. " ";
                    } ?>...</p>
                    <a href="<?php echo $page['slug']; ?>" title="<?php echo $page['title'] ?>" class="button">المزيد</a>
                  </div>
                </article>
              </div>
            <?php endforeach ?>
            <div class="left">
              <a class="button left btn-small sgafbtn" href="<?php echo $server.'pages';?>">المزيد من الاماكن السياحية في ماليزيا</a></div>
            </div>
          </div>
        </div>
      <?php endforeach ?>
    <?php endif ?>
<!-- <div class="global-map-area section parallax" >
   <div class="container">
        <h2 class="text-center white-color heading-orange heading-padding">قالوا عن شركة السقاف للسياحة والسفر</h2>
        <div class="testimonial style3">
            <ul class="slides ">
                <?php foreach ($testimonials as $testimonial) {?>
                <li>
                    <div class="author"><a href="#"><img src="<?php echo $testimonial['image_thumb'] ?>" alt="رأي العميل <?php echo $testimonial['name'] ?> عن شركة السقاف للسياحة والسفر"  /></a></div>
                    <blockquote class="description font_medium">
                        <?php echo $testimonial['testimonial_body'] ?>.</blockquote>
                    <div class="name font_medium">
                        <?php echo $testimonial['name'] ?> <span class="glyphicon glyphicon-flag"></span>
                        <?php echo $testimonial['country'] ?><br>
                        <span class="glyphicon glyphicon-thumbs-up"></span> <i><?php echo $testimonial['company_rate'] ?>/10</i><br/>
                        <span class="glyphicon glyphicon-time"></span> <?php echo $testimonial['date_added'] ?>
                    </div>
                </li>
                <?php }?>
            </ul>
        </div>
        <a class="button left btn-small sgafbtn" href="<?php echo $server.'testimonials';?>">عرض المزيد من اراء عملائنا</a>
    </div>
</div> -->

<div class="global-map-area section parallax" ><!-- data-stellar-background-ratio="0.5" -->
  <h2 class="text-center white-color heading-orange heading-padding">قالوا عن شركة السقاف للسياحة والسفر</h2>

    <section id="testimonial">
        <div class="container">


          <!-- <div class="hidden" itemprop="aggregateRating"
               itemscope id="footer1" itemtype="http://schema.org/AggregateRating">
              <span itemprop="ratingValue">4.9</span>/5
               <span itemprop="reviewCount">37235</span>
            </div> -->
                <div class="row">

                    <div id="carousel" class="carousel slide">

                        <ol class="carousel-indicators" style="display:none;">
                            <li data-target="#carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel" data-slide-to="1"></li>
                            <li data-target="#carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                      <?php $count=0; foreach ($testimonials as $testimonial) {?>
                        <?php if($count==0 || $count%3==0) { if($count==0){?>
                         <div class="item active">
                         <?php }else{?>
                         <div class="item">
                         <?php }?>

                           <div class="row text-center">
                           <?php }?>

                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bgtestimonial">
                                     <img class="img-circle" src="<?php echo $testimonial['image_thumb'] ?>" style="width: 150px;height:150px;" alt="تفاصيل رحلتي السياحية الى ماليزيا - العميل <?php echo $testimonial['name'].' '; ?>">

                                     <blockquote >

                                           <p itemprop="description"><i class="fa fa-quote-right"></i><?php echo $testimonial['testimonial_body'] ?>. </p>
                                           <footer class="blockquote-footer">  <span > <span ><?php echo $testimonial['name'].' '; ?> </span></span>--  <span class="glyphicon glyphicon-flag"> </span>
                                                <?php echo $testimonial['country'] ?><br>
                                                <span class="glyphicon glyphicon-thumbs-up"></span> <i  ><span ><?php echo $testimonial['company_rate'] ?></span>/<span >10</span></i><br/>
                                                <span class="glyphicon glyphicon-time"></span> <span ><?php echo $testimonial['date_added'] ?></span></footer>

                                    </blockquote>
                             </div>


                             <?php if(($count+1) %3==0 && $count !=0) {?>

                           </div>
                        </div>
                      <?php }?>


                      <?php $count++;}?>
                    </div>   <!-- Carousel-inner-->

                        <a data-slide="prev" href="#carousel" class="left carousel-control">‹</a>
                        <a data-slide="next" href="#carousel" class="right carousel-control">›</a>

                    </div>  <!-- Carousel-->
                </div>

        </div>
    </section>
    <a class="button left btn-small sgafbtn" href="<?php echo $server.'testimonials';?>">عرض المزيد من اراء عملائنا</a>

</div>
<?php echo $footer; ?>
