        <div id="slideshow">
            <div class="fullwidthbanner-container">
                <div class="revolution-slider" style="height: 0; overflow: hidden;">
                    <ul>    <!-- SLIDE  -->
                        <?php foreach ($slides as $slide): ?>                           
                        <li data-transition="zoomout" data-slotamount="7" data-masterspeed="1500">
                            <!-- MAIN IMAGE -->
                            <?php if ($slide['url']): ?>                               
                            <a href="<?php echo $slide['url'] ?>">
                            <?php endif ?>
                            <img src="<?php echo HTTP_IMAGE.htmlentities($slide['image'], ENT_QUOTES, 'utf-8') ?>" alt="">
                            <?php if ($slide['url']): ?>                               
                            </a>
                            <?php endif ?>
                        </li>
                        <?php endforeach ?>
                        
                    </ul>
                </div>
            </div>
        </div>
