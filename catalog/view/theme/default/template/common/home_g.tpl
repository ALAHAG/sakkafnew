<?php echo $header; ?>
<?php echo $slider; ?>
<section id="content">
  <div class="search-box-wrapper">
    <div class="search-box container">
      <ul class="search-tabs clearfix">
        <?php $active = 1 ?>
        <?php foreach ($package_categories as $category): ?>
          <li <?php echo $active == 1 ? 'class="active"' : '' ?> >
            <a href="#tab-<?php echo $category['category_id'] ?>" data-toggle="tab"><?php echo $category['title'] ?></a>
          </li>
          <?php $active = 0;?>
        <?php endforeach ?>
      </ul>
      <div class="visible-mobile">
        <ul id="mobile-search-tabs" class="search-tabs clearfix">
          <?php $active = 1 ?>
          <?php foreach ($package_categories as $category): ?>
            <li <?php echo $active == 1 ? 'class="active"' : '' ?> >
              <a href="#tab-<?php echo $category['category_id'] ?>" data-toggle="tab"><?php echo $category['title'] ?></a>
            </li>
            <?php $active = 0;?>
          <?php endforeach ?>
        </ul>
      </div>
      <div class="search-tab-content">
        <?php $active = 1 ?>
        <?php foreach ($package_categories as $category): ?>
          <div class="tab-pane fade <?php echo $active == 1 ? 'active' : '' ?> in" id="tab-<?php echo $category['category_id'] ?>">
           <div class="destinations section">
            <div class="container">
              <!--   <h2><?php// echo $category['title'] ?></h2> -->
              <div class="row image-box style1 add-clearfix">
                <?php //print_r($package_categories);exit(); ?>
                <?php foreach ($category['packages'] as $package): ?>
                  <div class="col-sms-6 col-sm-6 col-md-3">
                    <article class="box package">
                      <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1">
                        <a href="<?php echo $server.$package['slug'] ?>" title="" class="hover-effect">
                          <img src="<?php echo $package['image_thumb'] ?>" alt=""  /></a>
                        </figure>
                        <div class="details">
                          <!-- <span class="price"><?php echo $package['customer_price'] ?><small>رنجت</small></span> -->
                          <h4 class="box-title qtitle"><a href="<?php echo $server.$package['slug'] ?>"><?php echo $package['itinerary_title'] ?></a></h4>

                          <span class="review price">
                            عدد الليالي: <?php echo $package['night'] ?><small><?php if($package['night']>10){echo ' ليله و'; }else{ echo ' ليالي و';}?> </small>  <?php echo ($package['night']+1) ?><small><?php if($package['night']+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </small></span>
                            <div class="feedback">                                 
                              <span class="review price"> السعر: <?php echo $package['customer_price'] ?><small> رنجت</small></span>
                            </div>

                          </div>
                        </article>
                      </div>
                    <?php endforeach ?>
                    <div class="left">
                      <a class="button left btn-small sgafbtn" href="<?php echo $server.'packages?category='. $category['category_id'];?>">عرض المزيد</a></div>
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
    <div class="global-map-area section parallax" data-stellar-background-ratio="0.5">
      <h1 class="text-center white-color"></h1>


      <div class="container">
        <section>
         <div class="row image-box style1 add-clearfix"> 
          <div class="col-sms-6 col-sm-6 col-md-8"> <h3 class="heading-orange heading-padding"><i class="soap-icon-couples"></i> <?php echo $package_categories_2[222]['title']; ?></h3>


            <!--   <h2><?php// echo $category['title'] ?></h2> -->
            <div class="row image-box style1 add-clearfix">
              <?php //print_r($package_categories_2);exit(); ?>
              <?php foreach ($package_categories_2[222]['packages'] as $package): ?>
                <div class="col-sms-12 col-sm-12 col-md-6">
                  <article class="box package">
                    <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1">
                      <a href="<?php echo $server.$package['slug'] ?>" title="" class="hover-effect">
                        <img src="<?php echo $package['image_thumb'] ?>" alt=""  /></a>
                      </figure>
                      <div class="details">
                        <!-- <span class="price"><?php echo $package['customer_price'] ?><small>رنجت</small></span> -->
                        <h4 class="box-title qtitle"><a href="<?php echo $server.$package['slug'] ?>"><?php echo $package['itinerary_title'] ?></a></h4>
                        <div class="feedback">                                 
                         <span class="review price">
                          عدد الليالي: <?php echo $package['night'] ?><small><?php if($package['night']>10){echo ' ليله و'; }else{ echo ' ليالي و';}?> </small>  <?php echo ($package['night']+1) ?><small><?php if($package['night']+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </small></span>

                          <div class="feedback">                                 
                            <span class="review price"> السعر: <?php echo $package['customer_price'] ?><small> رنجت</small></span>
                          </div>

                        </div>
                      </article>
                    </div>
                  <?php endforeach ?>
                </div>
              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 box">
               <h3 class="heading-orange heading-padding"><i class="soap-icon-support"></i> اخر الحجوزات</h3>
               <div class="vticker col-sms-12 col-sm-12 col-md-12">
                <ul>
                  <?php foreach ($bookings as $key => $value) {?>


                  <li><i class="soap-icon-triangle-left"></i> طلب حجز من :<?php echo ($value['customer_name_ar'])?$value['customer_name_ar']:'';?>  <?php echo ($value['customer_country'])?'<i class="soap-icon-passed"></i> الجنسية '.$value['customer_country']:'';?></li><?php } ?>
                   <!-- <li>طلب برنامج 5 نجوم من سليم : عمان</li>
                     <li>طلب شهر عسل مميز ( رحلة العمر ) من علي احمد - السعودية</li>
                    <li>طلب شهر عسل مميز ( رحلة العمر ) من علي احمد - السعودية</li>
                    <li>طلب شهر عسل مميز ( رحلة العمر ) من علي احمد - السعودية</li>
                    <li class="ww">طلب شهر عسل مميز ( رحلة العمر ) 12 يوم 13 ليلة من علي احمد - السعودية </li>-->
                  </ul> 
                </div>

              </div>
            </section>
          </div>
        </div>
        <div class="container">
          <section>
            <div class="row image-box style1 add-clearfix">
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="http://alsakkaftravel.net/book-now-and-pay-later" class=" "><i class=" float-right soap-icon-stories"></i> احجز الان وادفع لاحقا</a>

              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="http://alsakkaftravel.net/packages-in-malaysian" class=" "><i class=" float-right soap-icon-beach"></i> احدث العروض السياحية </a>

              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="http://alsakkaftravel.net/hotels-in-malaysia" class=""><i class=" float-right soap-icon-hotel-1"></i> اهم الفنادق بماليزيا</a>

              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="http://localhost/travelator/transportation-and-tours-in-kualalumpur" class=" "><i class=" float-right soap-icon-car-2"></i> سيارات VIP</a>

              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="#" class=" "><i class=" float-right soap-icon-cruise-3"></i> الجولات البحرية</a>

              </div>
              <div class="col-sms-6 col-sm-6 col-md-4 sgaf ">

                <a href="#" class=" "><i class=" float-right soap-icon-card"></i> تذاكر الاماكن السياحية</a>

              </div>
            </div>
          </section>
        </div>
        <div class="container">
          <section>
            <h3 class="heading-orange heading-padding"><i class="soap-icon-hotel-2"></i> اهم الفنادق بماليزيا</h3>
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
                                  <?php if ($page_categories): ?>
                                    <?php foreach ($page_categories as $page_category): ?>
                                      <div class="offers section">
                                        <div class="container">
                                          <h2 class="heading-orange heading-padding"><i class="soap-icon-beach"></i> <?php echo $page_category['title'] ?> </h2>
                                          <div class="row image-box style2">
                                            <?php foreach ($page_category['pages'] as $page): ?>
                                              <div class="col-md-6">
                                                <article class="box">
                                                  <figure class="animated" data-animation-type="fadeInLeft" data-animation-duration="1">
                                                   <a href="<?php echo $page['slug']; ?>" title="<?php echo $page['title'] ?>">
                                                    <img src="<?php echo $page['image_thumb'] ?>" alt="<?php echo $page['title'] ?> -ماليزيا"  /></a>
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
                                                <a class="button left btn-small sgafbtn" href="<?php echo $server.'pages';?>">المزيد من الاماكن السياحية</a></div>
                                              </div>
                                            </div>
                                          </div>            
                                        <?php endforeach ?>
                                      <?php endif ?>
                                      <div class="global-map-area section parallax" data-stellar-background-ratio="0.5">
                                        <div class="container">
                                          <h1 class="text-center white-color">قالوا عنا</h1>
                                          <div class="testimonial style3">
                                            <ul class="slides ">
                                              <?php foreach ($testimonials as $testimonial) {?>

                                              <li>
                                                <div class="author"><a href="#"><img src="<?php echo $testimonial['image_thumb'] ?>" alt=""  /></a></div>
                                                <blockquote class="description font_medium"><?php echo $testimonial['testimonial_body'] ?>.</blockquote>
                                                <h2 class="name font_medium"><?php echo $testimonial['firstname'] ?>  | <?php echo $testimonial['name'] ?></h2>
                                              </li>
                                              <?php }?>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>

                                      <style>
                                        .vticker{
                                          border: 1px solid rgba(225, 225, 225, 0.63);
                                          height: 400px !important;
                                        }
                                        .vticker ul{
                                          padding: 0;
                                        }
                                        .vticker li{
                                          list-style: none;
                                          border-bottom: 1px solid rgba(144, 34, 110, 0.62);
                                          padding: 10px;
                                        }
                                        .et-run{
                                          background: red;
                                        }
                                      </style>
                                      <script type="text/javascript">
                                        $(document).ready(function(){

                                          var dd = $('.vticker').easyTicker({
                                            direction: 'down',
                                            easing: 'easeInOutBack',
                                            speed: 'slow',
                                            interval: 2000,
                                            height: 'auto',
                                            visible: 4,
                                            mousePause: 1,
                                            controls: {
                                              up: '.up',
                                              down: '.down',
                                              toggle: '.toggle',
                                              stopText: 'Stop !!!'
                                            }
                                          }).data('easyTicker');

  // cc = 1;
  // $('.aa').click(function(){
  //   $('.vticker ul').append('<li>' + cc + ' Triangles can be made easily using CSS also without any images. This trick requires only div tags and some</li>');
  //   cc++;
  // });

  // $('.vis').click(function(){
  //   dd.options['visible'] = 3;

  // });

  // $('.visall').click(function(){
  //   dd.stop();
  //   dd.options['visible'] = 0 ;
  //   dd.start();
  // });

});
</script>


<?php echo $footer; ?>