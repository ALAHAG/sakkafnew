<?php echo $header; ?>
<!-- <?php //echo $slider; ?> -->
<img src="<?php echo "https://alsakkaftravel.net/image/catalog/slider/travel_".$country_name.".jpg"?>" width="100%" height="450"alt="<?php echo $country?>">

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
                      <a class="button left btn-small sgafbtn" href="<?php echo $server.'packages?category='. $category['category_id'].'&country='.$country_id;?>" title=" في ماليزيا <?php echo $category['title'] ?> ">المزيد من   <strong ><?php echo $category['title'] ?> </strong> الى <b>ماليزيا</b> اضغط هنا
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


  </section>
</div>
<?php if ($hotels): ?>

  <div class="container">
    <section>
      <h2 class="heading-orange heading-padding"><i class="soap-icon-beach"></i> اهم الفنادق بماليزيا</h2>
      <div class="hotel-list">
        <div class="row image-box hotel listing-style1">
          <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>

          <?php foreach ($hotels as $hotel): ?>

            <div class="col-sm-6 col-md-3">
              <article class="box">
                <figure>
                  <a href="<?php echo $server.$hotel['slug'] ?>" class="hover-effect popup-gallerys"><img width="270" height="160" alt="" src="<?php echo $hotel['thumb'] ?>"></a>
                </figure>
                <div class="details">
                  <h4 class="box-title sagaf"><?php echo $hotel['hotel_name'] ?><small></small></h4>
                  <div class="feedback ">
                    <div title="<?php echo $hotel['star_rate'];?> نجوم" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$hotel['star_rate']] ?>-stars" style="width: 80%;"></span></div>
                    <span class="review">مستوى الفندق</span>
                  </div>

                  <p class="description">
                    <?php
                    $str=preg_replace('/[^أ-ي ]/ui', '',$hotel['hotel_content']);
                    $arr = explode(" ", str_replace(",", ", ", $str));
                    for ($index = 0; $index < 20; $index++) {
                      echo $arr[$index]. " ";
                    } ?>..<a class="button" href="<?php echo $server.$hotel['slug'] ?>">المزيد</a></p>
                    <!--    <div class="action">

                  </div>
                -->                                            </div>
              </article>
            </div>
          <?php endforeach ?>
          <div class="left margin-1">
            <a class="button left btn-small sgafbtn" href="<?php echo $server.'hotels-in-malaysia';?>">عرض المزيد من الفنادق</a></div>
          </div>
        </div>
      </section>
    </div>
  <?php endif ?>

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


<?php echo $footer; ?>
