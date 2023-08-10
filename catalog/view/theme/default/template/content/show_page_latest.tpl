<?php echo $header ?>

        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo $title ?></h2>
                </div>
            </div>
        </div>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div id="main" class="col-sm-8 col-md-9">
                        <div class="tab-container style1" id="cruise-main-content">
                            <div class="tab-content">
                                <div class="photo-gallery style1" data-animation="slide" data-sync="#photos-tab .image-carousel">
                                    <ul class="slides">
                        <?php foreach ($page_images as $image): ?>
                            <li><img src="<?php echo $image['image'] ?>" alt="" /></li>
                        <?php endforeach ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                                  <article class="well hotel-details white-bg">
                    <?php echo html_entity_decode($content); ?>
                </article> 
                    </div>
                    <div class="sidebar col-sm-4 col-md-3">
                     <strong class="text-center">المزيد</strong> <hr/>
                            <div class="offers col-md-12 col-sm-12">
                                <?php foreach ($pages as $page): ?>
                                <a href="<?php echo $page['slug'] ?>" class="item no-side-margin">
                                    <img src="<?php echo $page['thumb'] ?>" alt="<?php echo $page['title'] ?>">
                                    <span><?php echo $page['title'] ?></span>
                                </a>
                                <?php endforeach ?>
                            </div> 
                   </div>
                </div>
            </div>
        </section>

<?php  echo $footer ?>

