<?php echo $header ?>
<div class="page-title-container">
  <div class="container">
    <div class="page-title pull-left">
      <h2 class="entry-title">الفنادق</h2>
    </div>
  </div>
</div>
<section id="content">
  <div class="container">
    <div class="row">
      <div id="main" class="col-md-9">
       <?php //print_r($hotels);exit();?>
       <div class="hotel-list">
        <div class="row image-box hotel listing-style1">
          <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>

          <?php foreach ($hotels as $hotel): ?>

            <div class="col-sm-6 col-md-4">
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
                 <p class="description"> <?php
                        $str=preg_replace('/[^أ-ي ]/ui', '',$hotel['hotel_content']);
                        $arr = explode(" ", str_replace(",", ", ", $str));
                        for ($index = 0; $index < 20; $index++) {
                          echo $arr[$index]. " ";
                        } ?>..</p>
                 <div class="action">
                  <a class="button btn-small sgafbtn" href="<?php echo $server.$hotel['slug'] ?>">عرض المزيد</a>
                </div>
              </div>
            </article>
          </div>
        <?php endforeach ?>

      </div>
    </div>
       <!--                <section>
                          <div class="row image-box style1 add-clearfix">
                          <?php // foreach ($hotels as $hotel): ?>
                              <div class="col-sms-6 col-sm-6 col-md-3">
                                  <article class="box">
                                      <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1">
                                          <a href="<?php // echo $server.$hotel['slug'] ?>" title="" class="hover-effect">
                                          <img src="<?php // echo $hotel['thumb'] ?>" alt="" width="270" height="160" /></a>
                                      </figure>
                                      <div class="details">
                                          <h4 class="box-title text-center"><a href="<?php // echo $server.$hotel['slug'] ?>"><?php // echo $hotel['hotel_name'] ?></a></h4>
                                      </div>
                                  </article>
                              </div>
                          <?php // endforeach ?>
                          </div>
                        </secion> -->


                      </div>
                      <div class="col-md-3 col-sm-4 ">

                       
                        <?php echo $hotelsfilter ?>

                        
                      </div>
                    </section>
                    <div class="pager center-block">
                      <?php echo isset($pagination) ? $pagination : ''; ?>
                    </div><!-- /pager -->

                    <?php  echo $footer ?>

