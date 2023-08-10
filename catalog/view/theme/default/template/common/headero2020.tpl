<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <!-- Page Title -->
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>

<meta name="robots" content="index, follow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="language" content="Arabic">
<meta name="revisit-after" content="5 days">
<meta name="author" content="شركة السقاف للسياحة والسفر ماليزيا">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:locale" content="ar_AR" />
<meta property="og:type" content="website" />
<meta property="og:image" content="https://alsakkaftravel.net/image/catalog/slider/slider1-compressor.png" />
<meta property="og:title" content="<?php echo $title; ?>">
<meta property="og:description" content="<?php echo $description; ?>   ">
<meta property="og:url" content="<?php echo 'https://alsakkaftravel.net'.$_SERVER['REQUEST_URI']; ?>">
<meta property="og:site_name" content="شركة السقاف للسياحة والسفر ماليزيا" />
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:description" content="<?php echo $description; ?>" />
<meta name="twitter:title" content="<?php echo $title; ?>" />
<meta name="twitter:site" content="@Alsakkaftravel2" />

    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <link rel="alternate" hreflang="ar" href="<?php echo $base; ?>" />

    <?php } ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-site-verification" content="sJo4xxgcHdOHlKh4j8Z3QB18DZSFuz0swr45rvBidx4" />
    <!-- Theme Styles -->
    <!-- <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/bootstrapb.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/font-awesome.css"> -->
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/bfscr.css">

    <!-- <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/animate.min.css"> -->
    <!-- Current Page Styles -->
     <link rel="stylesheet" type="text/css" href="catalog/view/javascript/revolution_slider/css/settings.css" media="screen" />
    <!-- <link rel="stylesheet" type="text/css" href="catalog/view/javascript/revolution_slider/css/style.css" media="screen" /> -->
  <!--  <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery.bxslider/jquery.bxslider.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/flexslider/flexslider.css" media="screen" /> -->
    <!-- Main Style -->
    <link id="main-style" rel="stylesheet" href="catalog/view/theme/default/stylesheet/style-purpulesn.css">
    <!-- Custom Styles -->
    <!-- <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/customsns.css"> -->
    <!-- Updated Styles -->
    <!-- <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/updates.css"> -->

    <!-- Responsive Styles -->
    <!-- <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/responsive.css"> -->
    <!-- CSS for IE -->
    <!--[if lte IE 9]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie.css" />
<![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
  <script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <script type='text/javascript' src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
<![endif]-->
    <!-- <script type="text/javascript" src="catalog/view/javascript/jquery-1.11.1.min.js"></script> -->
    <script src="catalog/view/javascript/jquery-3.0.0.js"></script>

    <script type="text/javascript"> tjq = $ ;</script>

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <!-- Google Tag Manager -->
    <!-- <script>
        (function(w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({
                'gtm.start': new Date().getTime(),
                event: 'gtm.js'
            });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s),
                dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-MPDP8ML');
    </script> -->
    <!-- End Google Tag Manager -->

</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <!-- <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MPDP8ML" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript> -->
    <!-- End Google Tag Manager (noscript) -->
    <span >
    <div id="page-wrapper">
        <!-- <img src="image/ramHead.png" height="40" width="100%"/> -->
        <header id="header" class="navbar-static-top style1">
            <?php echo $menu; ?>
</header>
