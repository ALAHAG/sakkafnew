<!DOCTYPE html>
<html lang="<?php echo $lang; ?>" >

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <meta name="author" content="السقاف للسياحه والسفر ماليزيا">
    <meta name="robots" content="index, follow">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="language" content="Arabic">
    <meta name="revisit-after" content="5 days">
    <meta name="author" content="شركة السقاف للسياحة والسفر ماليزيا">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta property="og:locale" content="ar_AR" />
    <meta property="og:type" content="object">
    <meta property="og:title" content="<?php echo $title; ?>">
    <meta property="og:description" content="<?php echo $description; ?>   ">
    <meta property="og:url" content="<?php echo 'https://alsakkaftravel.net'.$_SERVER['REQUEST_URI']; ?>">
    <meta property="og:site_name" content="شركة السقاف للسياحة والسفر ماليزيا" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:description" content="<?php echo $description; ?>" />
    <meta name="twitter:title" content="<?php echo $title; ?>" />
    <meta name="twitter:site" content="@alsakkaftravel1" />
    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

    <!-- COMMON CSS -->
	<link href="catalog/view/theme/default/css/bootstrap.min.css" rel="stylesheet">
  <link href="catalog/view/theme/default/css/style.css" rel="stylesheet">
	<link href="catalog/view/theme/default/css/vendors.css" rel="stylesheet">

	<!-- CUSTOM CSS -->
	<link href="catalog/view/theme/default/css/custom.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link href="catalog/view/theme/default/rs-plugin/css/settings.css" rel="stylesheet">
    <link href="catalog/view/theme/default/css/extralayers.css" rel="stylesheet">


    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php if($script=="catalog/view/javascript/jquery-1.11.1.min.js") { ?>
      <script type="text/javascript">
          $(document).ready(function() {
            var $ = jQuery;
              var dd = $('.vticker').easyTicker({
                  direction: 'down',
                  easing: 'easeInOutBack',
                  speed: 'slow',
                  interval: 2000,
                  height: '277',
                  visible: 4,
                  mousePause: 1,
                  controls: {
                      up: '.up',
                      down: '.down',
                      toggle: '.toggle',
                      stopText: 'Stop !!!'
                  }
              }).data('easyTicker');

          });
      </script>

    <?php }} ?>



</head>

<body>

    <!-- <div id="preloader">
        <div class="sk-spinner sk-spinner-wave">
            <div class="sk-rect1"></div>
            <div class="sk-rect2"></div>
            <div class="sk-rect3"></div>
            <div class="sk-rect4"></div>
            <div class="sk-rect5"></div>
        </div>
    </div> -->
    <!-- End Preload -->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <!-- Header================================================== -->
    <header id="plain">
        <div id="top_line">
            <div class="container">
                <div class="row">
                    <div class="col-6"><i class="icon-phone"></i><strong>0060 18 777 0018</strong></div>
                    <div class="col-6">
                        <ul id="top_links">
                            <li><a href="#sign-in-dialog" id="access_link">للتواصل واتس اب او اتصال </a></li>
                            <!-- <li><a href="wishlist.html" id="wishlist_link">Wishlist</a></li> --> 
                            <!-- <li><a href="http://themeforest.net/item/citytours-city-tours-tour-tickets-and-guides/10715647?ref=ansonika">Purchase this template</a></li> -->
                        </ul>
                    </div>
                </div><!-- End row -->
            </div><!-- End container-->
        </div><!-- End top line-->

        <!-- Menu  -->
        <?php echo $menu; ?>

            </header><!-- End Header -->
