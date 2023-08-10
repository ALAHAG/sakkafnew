<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7 ltie8 ltie9" <?php language_attributes(); ?>><![endif]-->
<!--[if IE 8]><html class="ie ie8 ltie9" <?php language_attributes(); ?>><![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->

<head>
	<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/droid-arabic-kufi" type="text/css"/>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
	
	<?php 
		global $theme_option, $kode_post_option;
		if( !empty($kode_post_option) ){ $kode_post_option = json_decode($kode_post_option, true); }
		$mega_menu = get_option('mega_main_menu_options');
		$menu_class = '';		
		if(is_array($mega_menu)){
			if(in_array('main_menu',$mega_menu['mega_menu_locations'])){
				$menu_class = 'kode_mega_menu';
			}
		}
		$header_class = '';
		$header_sticky = '';
		if(isset($theme_option['enable-sticky-menu'])){
			if($theme_option['enable-sticky-menu'] == 'enable'){
					$header_sticky = 'header-sticky';
			}
		}
		
		$nicescroll = '';
		if(isset($theme_option['enable-nice-scroll'])){
			if($theme_option['enable-nice-scroll'] == 'enable'){
				$nicescroll = 'nicescroll';
			}else{
				$nicescroll = '';
			}
		}
		
		$header_class = $header_sticky.' ' .$menu_class.' '.$nicescroll;
		wp_head(); 
		
	?>
</head>
<?php

?>
<body id="home" <?php body_class($header_class); ?>>
<div class="body-wrapper" data-home="<?php echo esc_url(home_url()); ?>" >
	<?php $theme_option['kode-header-style'] = 'header-style-1'; ?>
	<?php kode_get_header($theme_option);?>
	<?php get_template_part( 'header', 'title' ); ?>
	<div class="clearfix clear"></div>
	<div class="content-wrapper">