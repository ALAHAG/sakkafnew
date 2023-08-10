<?php echo $header ?>
        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo $category_title;?></h2>
                </div>
            </div>
        </div>
        <section id="content">
            <div class="container">
                <div class="row">
                   <div class="col-md-3">

                    <?php echo $packagesfilter; ?>

                    </div>
                    <div id="main" class="col-md-9">
                               <h4 class="search-results-title">نتائج البحث :<b><?php




                               echo $total_packages;  if($total_packages>10){ echo " برنامج سياحي الى ماليزيا";}else if($total_packages>0 && $total_packages <11){echo " برامج سياحيه الى ماليزيا";} else if($total_packages==0){echo " لايوجد برنامج مقارب لبحثك .صمم برنامجك بنفسك من هنا <br/><a class='btn btn-primary btn-large' href='booking'>طلب حجز</a>";}?></b> <i class="icon-search"></i></h4>

                      <section>

                          <div class="row image-box style1 add-clearfix">

                                <?php foreach ($packages as $package): ?>
                                <div class="col-sms-6 col-sm-6 col-md-4">
                                    <article class="box package" itemscope itemtype="http://schema.org/Product" itemref="footer">
                                        <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1">
                                            <a itemprop="url" href="<?php echo $server.$package['slug'] ?>" title="<?php echo $package['itinerary_title'] ?> - ماليزيا - عروض ماليزيا - فنادق ماليزيا" class="hover-effect">
                                                    <img src="<?php echo $server.'image/'.$package['itinerary_image'] ?>" alt="<?php echo $package['itinerary_title'] ?> - ماليزيا - عروض ماليزيا - فنادق ماليزيا"  /><span class="discount"><span class="discount-text">عرض جديد</span></span></a>
                                            <meta itemprop="image" content="<?php echo $server.'image/'.$package['itinerary_image'] ?>">
                                        </figure>
                                        <div class="details">

                                            <h2 class="box-title qtitle white-color"><a href="<?php echo $server.$package['slug'] ?>"><span itemprop="name"><?php echo $package['itinerary_title'] ?></span></a></h2>

                                            <span class="review price" itemprop="description">  عدد الليالي : <?php echo $package['night'] ?><small><?php if($package['night']>10){echo ' ليله و'; }else{ echo ' ليالي و';}?> </small>  <?php echo ($package['night']+1) ?><small><?php if($package['night']+1>10){echo ' يوم'; }else{ echo ' ايام';}?> </small></span>
                                            <div class="feedback">
                                                <span class="review price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><span itemprop="priceCurrency" content="RM"></span><span itemprop="price" content="<?php echo $package['customer_price'] ?>"> السعر: <?php echo $package['customer_price'] ?><small> رنجت</small><?php if($package['entry_num_passengers']==2) {echo '[لشخصين]';} else{ echo '[ل'.$package['entry_num_passengers'].' أشخاص]'; }?></span></span>
                                            </div>
                                                  <div class="feedback">
                                                    <span class="review price"> كود البرنامج: B<?php echo $package['itinerary_id'] ?><small> </small></span>
                                                </div>

                                        </div>
                                    </article>
                                </div>
                                <?php endforeach ?>
                          </div>
                      </section>


                    </div>
</div></div></section>
                     <div class="pager center-block">
                            <?php echo isset($pagination) ? $pagination : ''; ?>
                    </div><!-- /pager -->


<?php  echo $footer ?>
