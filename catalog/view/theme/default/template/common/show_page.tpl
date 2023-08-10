<?php echo $header ?>

<!-- MAIN CONTENT ================================================== -->
<div class="container">

    <div class="row">
        <br>
        <br>

    </div><!-- /row -->

    <div class="row">
        <!-- SIDEBAR ================================================== -->
        <div class="col-sm-3">
            <div class="vacationFilterContainer">
                <strong class="text-center">تعرف إيضا على</strong> 
                <div class="offers">
                    <?php foreach ($pages as $page): ?>
                    <a href="<?php echo $page['slug'] ?>" class="item no-side-margin">
                        <img src="<?php echo $page['thumb'] ?>" alt="<?php echo $page['title'] ?>">
                        <span><?php echo $page['title'] ?></span>
                    </a>
                    <?php endforeach ?>
                </div>
            </div><!-- /vacationFilterContainer -->
        </div><!-- /col -->
        <!-- VACATIONS ================================================== -->
        <div class="col-sm-9 semi-white-bg">
            <div class="list-title row"><h2> <?php echo  $title ?></h2></div>
            <br>
            <div class="row">
                <div class="pRev">
                    <ul id="detailSlider">
                        <?php foreach ($page_images as $image): ?>
                            <li><img src="<?php echo $image['image'] ?>" alt="" /></li>
                        <?php endforeach ?>
                    </ul><!-- /mainSlider -->
                    <div class="detailSliderNav"></div>
                </div>
            </div>

            <div> 
                <article class="well hotel-details white-bg">
                    <?php echo html_entity_decode($content); ?>
                </article>
            </div><!-- /col -->
        </div><!-- /row -->
    </div>

</div><!-- /container -->

<?php  echo $footer ?>

