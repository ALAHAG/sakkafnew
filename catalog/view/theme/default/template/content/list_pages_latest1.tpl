<?php echo $header ?>
        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo  $category_title ?></h2>
                </div>
            </div>
        </div>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div id="main" class="col-md-9">
                      <section>
                          <div class="row image-box style1 add-clearfix">
                          <?php foreach ($pages as $page): ?>
                              <div class="col-sms-6 col-sm-6 col-md-4">
                                  <article class="box">
                                      <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1">
                                          <a href="<?php echo HTTP_SERVER.$page['slug'] ?>" title="" class="hover-effect">
                                          <img src="<?php echo $page['thumb'] ?>" alt="<?php echo $page['title'] ?>" width="270" height="160" /></a>
                                      </figure>
                                      <div class="details">
                                        <!--   <span class="price"><?php echo $package['customer_price'] ?><small>رنجت</small></span> -->
                                          <h4 class="box-title"><a href="<?php echo HTTPS_SERVER.$page['slug'] ?>"><?php echo $page['title'] ?></a></h4>
                                                                                    
                                      </div>
                                  </article>
                              </div>
                          <?php endforeach ?>
                          </div>
                      </section>


                    </div>
                    <div class="col-md-3">

                    <?php echo $pagesfilter; ?>
                        
                    </div></div></div></section>
                                          <div class="pager center-block">
                            <?php echo isset($pagination) ? $pagination : ''; ?>
                    </div><!-- /pager -->


<?php  echo $footer ?>

