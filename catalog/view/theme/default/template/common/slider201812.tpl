        <div id="slideshow">
            <div class="fullwidthbanner-container">
                <div class="revolution-slider" style="height: 0; overflow: hidden;">
                    <ul>    <!-- SLIDE  -->
                        <?php foreach ($slides as $slide): ?>
                        <li data-transition="zoomout" data-slotamount="7" data-masterspeed="1500">
                            <!-- MAIN IMAGE -->
                            <?php if ($slide['url']): ?>
                            <a class="sliderm" href="<?php echo $slide['url'] ?>"> المزيد
                            <?php endif ?> <?php if ($slide['url']): ?>
                            </a>
                            <?php endif ?>
                            <img src="<?php echo HTTP_IMAGE.htmlentities($slide['image'], ENT_QUOTES, 'utf-8') ?>" alt="السقاف للسياحة والسفر ماليزيا" title = "عروض ماليزيا - رحلات ماليزيا - السقاف للسياحة">

                        </li>
                        <?php endforeach ?>
                     <!--    <li data-transition="zoomin" data-slotamount="7" data-masterspeed="1500">
                            <img src="http://placehold.it/2080x646" alt="">
                        </li>

                        <li data-transition="zoomout" data-slotamount="7" data-masterspeed="1500">
                            <img src="http://placehold.it/2080x646" alt="">
                        </li>

                        <li data-transition="slidedown" data-slotamount="7" data-masterspeed="1500">
                            <img src="http://placehold.it/2080x646" alt="">
                        </li> -->

                    </ul>
                </div>
            </div>
        </div>
