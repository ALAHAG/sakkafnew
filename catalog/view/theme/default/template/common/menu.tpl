<div class="container">
    <div class="row">
        <div class="col-3">
            <div id="logo_home">
              <h1><a href="<?php echo $home; ?>" title="السقاف للسياحةوالسفر ماليزيا">السقاف للسياحة والسفر ماليزيا</a></h1>
            </div>
        </div>
        <?php  define("count2",2);  ?>
        <nav class="col-9">
            <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>
            <?php $count=1; ?>
            <div class="main-menu">
                <div id="header_menu">
                    <img src="/sakkafnew/img/logo_sticky.png" width="160" height="34" alt="<?php echo $home; ?>" data-retina="true">
                </div>
                <a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
                <ul>
                  <?php foreach ($menu as $key => $value): ?>
                  <?php if (isset($value['title'])): ?>
                    <li <?php echo (isset($value[ 'children'])) ? 'class="submenu"' : '' ?>>
                        <a href="javascript:void(0);" class="show-submenu"><?php echo $value['title'] ?> <i class="icon-down-open-mini"></i></a>
                        <?php if (isset($value['children'])): ?>
                          <ul>
                            <?php foreach ($value['children'] as $id => $child): ?>
                                <li><a <?php echo $child[ 'slug'] ? 'href="'.$child[ 'slug'] . '"' : '' ?>><?php echo $child['title'] ?></a></li>
                            <?php endforeach ?>
                            </ul>
                          <?php endif ?>
                    </li>
                  <?php endif ?>
                  <?php   if($count==1): ?>
                    <li class="megamenu submenu">
                        <a href="javascript:void(0);" class="show-submenu-mega">الاماكن والمدن السياحية<i class="icon-down-open-mini"></i></a>
                        <div class="menu-wrapper">
                          <div class="row">
                          <?php $submenu = 0; ?>
                          <?php if(submenu==0){?>
                          <div class="col-lg-4">
                          <?php } ?>
                            <!-- <h3>اهم المدن والاماكن السياحية</h3> -->
                            <?php foreach ($pages as $key => $value): ?>

                            <ul>
                              <li>
                              <?php if (isset($value['slug']) && isset($value['title']) ){ ?>
                                <a href="<?php echo $value['slug']; ?>"><?php echo $value['title']; ?></a>
                              <?php } ?>

                            </li>
                            <ul>
                              <?php $submenu++;
                              if($submenu % 8==0){
                               ?>
                             </div>
                             <div class="col-lg-4">

                            <?php }; endforeach ?>

                          </div>
                        </div>
                      </div>

                 <!-- <li><a href="general_page.html">General page</a></li>
                <li><a href="tourist_guide.html">Tourist guide</a></li>
                 <li><a href="wishlist.html">Wishlist page</a></li>
                 <li><a href="faq.html">Faq</a></li>
                 <li><a href="faq_2.html">Faq smooth scroll</a></li>
                 <li><a href="pricing_tables.html">Pricing tables</a></li>
                 <li><a href="gallery_3_columns.html">Gallery 3 columns</a></li>
                <li><a href="gallery_4_columns.html">Gallery 4 columns</a></li>
                <li><a href="grid_gallery_1.html">Grid gallery</a></li>
                <li><a href="grid_gallery_2.html">Grid gallery with filters</a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h3>Pages</h3>
              <ul>
                <li><a href="contact_us_1.html">Contact us 1</a></li>
                <li><a href="contact_us_2.html">Contact us 2</a></li>
                 <li><a href="blog_right_sidebar.html">Blog</a></li>
                <li><a href="blog.html">Blog left sidebar</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="register.html">Register</a></li>
                <li><a href="invoice.html" target="_blank">Invoice</a></li>
                <li><a href="404.html">404 Error page</a></li>
                <li><a href="site_launch/index.html">Site launch / Coming soon</a></li>
                <li><a href="timeline.html">Tour timeline</a></li>
                <li><a href="page_with_map.html"><i class="icon-map"></i>  Full screen map</a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h3>Elements</h3>
              <ul>
                <li><a href="footer_2.html"><i class="icon-columns"></i> Footer with working newsletter</a></li>
                <li><a href="footer_5.html"><i class="icon-columns"></i> Footer with Twitter feed</a></li>
                <li><a href="icon_pack_1.html"><i class="icon-inbox-alt"></i> Icon pack 1 (1900)</a></li>
                <li><a href="icon_pack_2.html"><i class="icon-inbox-alt"></i> Icon pack 2 (100)</a></li>
                <li><a href="icon_pack_3.html"><i class="icon-inbox-alt"></i> Icon pack 3 (30)</a></li>
                <li><a href="icon_pack_4.html"><i class="icon-inbox-alt"></i> Icon pack 4 (200)</a></li>
                <li><a href="icon_pack_5.html"><i class="icon-inbox-alt"></i> Icon pack 5 (360)</a></li>
                <li><a href="shortcodes.html"><i class="icon-tools"></i> Shortcodes</a></li>
                <li><a href="newsletter_template/newsletter.html" target="blank"><i class=" icon-mail"></i> Responsive email template</a></li>
                <li><a href="admin.html"><i class="icon-cog-1"></i>  Admin area</a></li>
                <li><a href="general_page.html"><i class="icon-light-up"></i>  Weather Forecast</a></li>
              </ul>
            </div>
          </div> End row \
          </div>\ End menu-wrapper \
                    </li>
                </ul>
            </div>\End main-menu -->
            <!-- <ul id="top_tools">
                <li>
                    <a href="javascript:void(0);" class="search-overlay-menu-btn"><i class="icon_search"></i></a>
                </li>
                <li>
                    <div class="dropdown dropdown-cart">
                        <a href="#" data-toggle="dropdown" class="cart_bt"><i class="icon_bag_alt"></i><strong>3</strong></a>
                        <ul class="dropdown-menu" id="cart_items">
                            <li>
                                <div class="image"><img src="img/thumb_cart_1.jpg" alt="image"></div>
                                <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                                <a href="#" class="action"><i class="icon-trash"></i></a>
                            </li>
                            <li>
                                <div class="image"><img src="img/thumb_cart_2.jpg" alt="image"></div>
                                <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                                <a href="#" class="action"><i class="icon-trash"></i></a>
                            </li>
                            <li>
                                <div class="image"><img src="img/thumb_cart_3.jpg" alt="image"></div>
                                <strong><a href="#">Versailles tour</a>1x $36.00 </strong>
                                <a href="#" class="action"><i class="icon-trash"></i></a>
                            </li>
                            <li>
                                <div>Total: <span>$120.00</span></div>
                                <a href="cart.html" class="button_drop">Go to cart</a>
                                <a href="payment.html" class="button_drop outline">Check out</a>
                            </li>
                        </ul>
                    </div> End dropdown-cart-->
                </li>
              <?php  endif;$count++;?>
              <?php endforeach ?>
          </ul>
        </nav>
    </div>
</div><!-- container -->
