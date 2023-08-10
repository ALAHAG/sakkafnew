<?php echo $header ?>
  <!-- MAIN CONTENT ================================================== -->
  <div class="container">
    
    <div class="row">
    <br>
    <br>
    </div><!-- /row -->
    
    <div class="row">
      <!-- SIDEBAR ================================================== -->
      <div class="col-sm-3 hidden-xs">
        <?php echo $pagesfilter ?>
      </div>

      <!-- VACATIONS ================================================== -->
      <div class="col-sm-9 semi-white-bg">
      <div class="list-title row"><h2> <?php echo  $category_title ?></h2></div>

        <div class="featuredOffers offers offersGrid clearfix">
        <?php foreach ($pages as $page): ?>
          <div class="col-sm-4">
            <a href="<?php echo HTTP_SERVER.$page['slug'] ?>" class="item">
              <img src="<?php echo $page['thumb'] ?>" alt="<?php echo $page['title'] ?>">
<!--              <div class="offerInfo">
                 <div class="reviews clearfix">
                  <div class="ratingDisabled" data-average="3" data-id="1"></div>
                  <em>12 Reviews</em>
                </div>

               <p>Lorem ipsum dolor sit saelas met, consas ec tur ads ipi deese cing elit mauris fring illa...</p>
              </div>
 -->
               <span><?php echo $page['title'] ?></span>
            </a>
          </div><!-- /col -->
        <?php endforeach ?>
        </div><!-- /featuredOffers -->
        
        <div class="pager center-block">
          <?php echo isset($pagination) ? $pagination : ''; ?>
        </div><!-- /pager -->
      </div><!-- /col -->
    </div><!-- /row -->
    
  </div><!-- /container -->
  
<?php  echo $footer ?>

