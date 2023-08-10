<?php echo $header ?>
     <?php $stars=array(1=>'one',2=>'two',3=>'three',4=>'four',5=>'five');  ?>

        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo $hotel_name ?></h2>
                </div>
            </div>
        </div>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div id="main" class="col-md-9">
                        <div class="tab-container style1" id="cruise-main-content">
                            <div class="tab-content">
                             <div id="photos-tab" class="tab-pane fade in active">
                                    <div class="a">          <div class="feedback clearfix">
                                    <div title="<?php echo $hotel_star;?> stars" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$hotel_star] ?>-stars" style="width: 80%;"></span></div>
                                </div></div>
                                <div class="photo-gallery style1" data-animation="slide" data-sync="#photos-tab .image-carousel">
                                    <ul class="slides">
                                    <?php foreach ($hotel_images as $image): ?>
                                        <li><img src="<?php echo $image['resized_image'] ?>" alt="" /></li>
                                    <?php endforeach ?>
                                    </ul>
                                </div>
<!--                                 <div class="image-carousel style1" data-animation="slide" data-item-width="70" data-item-margin="10" data-sync="#photos-tab .photo-gallery">
                                    <ul class="slides">
                                    <?php  //foreach ($hotel_images as $image): ?>
                                        <li><img src="<?php  //echo $image['thumb'] ?>" alt="" /></li>
                                    <?php //endforeach ?>
                                    </ul>
                                </div> -->
                            </div> 
                            <div class="long-description"><?php echo $hotel_content; ?></div>
                            </div>
                        </div>
                        <div id="cruise-features" class="tab-container">
                            <h1 class="heading-orange heading-padding"> الغرف</h1>

                            <div class="room-list listing-style3 hotel">
                            <?php foreach ($hotel_rooms as $room): ?>
                                <article class="box hotel">
                                    <figure class="col-sm-4 col-md-3">
                                        <img width="230" height="160" src="<?php echo $room['thumb'] ?>" alt="">
                                    </figure>
                                    <div class="details col-xs-12 col-sm-8 col-md-9">
                                        <div>
                                            <div>
                                                <div class="box-title">
                                                    <h4 class="title"><?php echo $room['room_name'] ?></h4>
                                                    <small><?php echo $room['room_english_name'] ?></small>
                                                </div>
<!--                                                 <div class="amenities">
                                                    <i class="soap-icon-wifi circle"></i>
                                                    <i class="soap-icon-fitnessfacility circle"></i>
                                                    <i class="soap-icon-fork circle"></i>
                                                    <i class="soap-icon-television circle"></i>
                                                </div>
 -->                                            </div>
                                            <div class="price-section">
                                                <dl class="description">
                                                    <dt>سعة الغرفة</dt>
                                                    <dd><?php echo $room['occupancy'] ?></dd>
                                                </dl>
                                           

                                            </div>
                                        </div>
                                        <div>
                                            <p><?php echo html_entity_decode($room['room_content']) ?></p>
                                            <div class="action-section">
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            <?php endforeach ?>
                            </div>
                            
                        </div>
                    </div>
                    <div class="sidebar col-md-3">
                        <article class="detailed-logo">
                            <div class="details">
                                <h2 class="box-title"><?php echo $hotel_english_name ?></h2>
                                <div class="feedback clearfix">
                                    <div title="<?php echo $hotel_star;?> stars" class="five-stars-container" data-toggle="tooltip" data-placement="bottom"><span class="<?php echo $stars[$hotel_star] ?>-stars" style="width: 80%;"></span></div>
                                </div>
                            </div>
                        </article>
                        <?php echo $right_sidebar; ?>                        
                    </div>
                </div>
            </div>
        </section>
<?php  echo $footer ?>

