<div class=" container">

    <!-- hidden-mobile -->
    <address class="contact-details">
        <span class="contact-phone"><a href="https://api.whatsapp.com/send?phone=60187770018"> <i class="soap-icon-phone circle"></i>  0060187770018  <img src="image/whatsapp.png"></a></span></address>
    <ul class="social-icons  style2 clearfix">
        <!-- hidden-mobile -->
        <li class="twitter"><a title="تويتر" href="https://twitter.com/alsakkaftravel1" data-toggle="tooltip"><i class="soap-icon-twitter"></i></a></li>
        <li class="googleplus"><a title="قوقل بلس" href="https://plus.google.com/+AlsakkaftravelNetMalaysia" data-toggle="tooltip"><i class="soap-icon-googleplus"></i></a></li>
        <li class="facebook"><a title="فيس بوك" href="https://www.facebook.com/Sakkaftravel/" data-toggle="tooltip"><i class="soap-icon-facebook"></i></a></li>
        <li class="instagram"><a title="انستجرام" href="https://www.instagram.com/alsakkaf_travel" data-toggle="tooltip"><i class="soap-icon-instagram"></i></a></li>
        <li class="facebook"><a title="فيس بوك عمان" href="https://www.facebook.com/Sakkafoman/" data-toggle="tooltip"><i class="soap-icon-facebook"></i></a></li>
    </ul>

</div>
<?php define("count2",2); ?>

<div class="container">
    <h1 class="logo navbar-brand">
        <?php if ($logo) { ?>
        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" id="_logo5" itemprop="logo" width="240" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
        <?php } else { ?>
        <h1>
            <a href="<?php echo $home; ?>"><?php echo $name; ?></a>
        </h1>
        <?php } ?>
    </h1>
</div>
<a href="#mobile-menu-01" data-toggle="collapse" class="mobile-menu-toggle">Mobile Menu Toggle</a>
<?php $count=1; ?>
<div id="main-menu">
    <nav role="navigation" class="container">
        <ul class="menu">
            <?php foreach ($menu as $key => $value): ?>
            <?php if (isset($value['title'])): ?>

            <li <?php echo (isset($value[ 'children'])) ? 'class="menu-item-has-children"' : '' ?> >
                <a <?php echo $value[ 'slug'] ? 'href="'.$value[ 'slug'] . '"' : '' ?> ><?php echo $value['title'] ?></a>
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
            <li class="menu-item-has-children megamenu-menu">
                <a href="#">الاماكن والمدن السياحية </a>
                <div class="megamenu-wrapper container" data-items-per-column="8">
                    <div class="megamenu-holder">
                        <ul class="megamenu">
                            <li class="menu-item-has-children">
                                <a href="#">اهم المدن والاماكن السياحية في ماليزيا</a>
                                <ul class="clearfix">
                                    <?php foreach ($pages as $key => $value): ?>
                                    <li>
                                       <?php if (isset($value['slug']) && isset($value['title']) ){ ?>

                                        <a href="<?php echo $value['slug']; ?>">
                                            <?php echo $value['title']; ?>
                                        </a>
                                         <?php } ?>

                                    </li>
                                    <?php endforeach ?>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </li>
            <?php  endif;$count++;?>
            <?php endforeach ?>
        </ul>
    </nav>
</div>
<?php  $count2=1; ?>
<nav id="mobile-menu-01" class="mobile-menu collapse">
    <ul id="mobile-primary-menu" class="menu">
        <?php foreach ($menu as $key => $value): ?>
        <?php if (isset($value['title'])): ?>

        <li <?php echo (isset($value[ 'children'])) ? 'class="menu-item-has-children"' : '' ?> >
            <a <?php echo $value[ 'slug'] ? 'href="'.$value[ 'slug'] . '"' : '' ?> ><?php echo $value['title'] ?></a>
            <?php if (isset($value['children'])): ?>
            <ul>
                <?php foreach ($value['children'] as $id => $child): ?>
                <li><a <?php echo $child[ 'slug'] ? 'href="'.$child[ 'slug'] . '"' : '' ?>><?php echo $child['title'] ?></a></li>
                <?php endforeach ?>
            </ul>
            <?php endif ?>
        </li>
        <?php endif ?>

        <?php   if($count2==1): ?>
        <li class="menu-item-has-children">
            <a href="#">الاماكن والمدن السياحية </a>
            <ul>
                <?php foreach ($pages as $key => $value): ?>
                <li>
                    <a href="<?php echo $value['slug']; ?>">
                        <?php echo $value['title']; ?>
                    </a>
                </li>
                <?php endforeach ?>
            </ul>
        </li>
        <?php  endif;?>
        <?php $count2++;endforeach ?>
    </ul>
</nav>
</header>
