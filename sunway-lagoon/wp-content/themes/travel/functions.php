<?php
	/*	
	*	Kodeforest Function File
	*	---------------------------------------------------------------------
	*	This file include all of important function and features of the theme
	*	---------------------------------------------------------------------
	*/
	
	//Define Theme Name
	define('WP_THEME_KEY', 'kodeforest');
	define('KODE_FULL_NAME', 'KodeTravel');
	define('KODE_SMALL_TITLE', 'kodetravel');
	define('KODE_SLUG', 'travel');	
	
	//WP Customizer
	include_once('framework/include/kode_meta/wp_customizer.php');
	
	//Responsive Menu
	include_once( 'framework/include/kode_front_func/kf_responsive_menu.php');
	
	// Framework
	include_once( 'framework/kf_framework.php' );
	include_once( 'framework/script-handler.php' );
	include_once( 'framework/include/kode_front_func/kode_header.php' );
	
	
	//Custom Widgets
	include_once( 'framework/include/custom_widgets/recent-comment.php');
	include_once( 'framework/include/custom_widgets/recent-post-widget.php');
	include_once( 'framework/include/custom_widgets/recent-package-widget.php');
	include_once( 'framework/include/custom_widgets/popular-post-widget.php');
	include_once( 'framework/include/custom_widgets/flickr-widget.php');
	include_once( 'framework/include/custom_widgets/contact-widget.php');
	include_once( 'framework/include/custom_widgets/tab-widget.php');
	include_once( 'framework/include/custom_widgets/travel-widget.php');
	
	
	// plugin support	
	include_once( 'framework/include/tgm_library/kode-activation.php');

	global $theme_option;
	//Load Fonts
	if( empty($theme_option['upload-font']) ){ $theme_option['upload-font'] = ''; }
	$kode_font_controller = new kode_font_loader( json_decode($theme_option['upload-font'], true) );	
	
	//Deregister the WooCommerce Style File
	add_action('wp_enqueue_scripts','kode_deregister_scripts');
	function kode_deregister_scripts(){
		// WooCommerce Style
		wp_deregister_style('woocommerce-general');
	}
	
	add_theme_support( 'woocommerce' );
	
	// add action to enqueue woocommerce style
	add_filter('kode_enqueue_scripts', 'kode_regiser_woo_style');
	if( !function_exists('kode_regiser_woo_style') ){
		function kode_regiser_woo_style($array){	
			global $woocommerce;
			if( !empty($woocommerce) ){
				$array['style']['kode-woo-style'] = KODE_PATH . '/framework/assets/default/css/kode-woocommerce.css';
			}
			return $array;
		}
	}
	
	//Title Hook
	function kode_wp_title( $title, $sep ) {
		global $paged, $page;

		if ( is_feed() ) {
			return $title;
		}

		// Add the site name.
		$title .= get_bloginfo( 'name' );

		// Add the site description for the home/front page.
		$site_description = get_bloginfo( 'description', 'display' );
		if ( $site_description && ( is_home() || is_front_page() ) ) {
			$title = "$title $sep $site_description";
		}

		// Add a page number if necessary.
		if ( $paged >= 2 || $page >= 2 ) {
			$title = "$title $sep " . sprintf( esc_html__( 'Page %s', 'kodeforest' ), max( $paged, $page ) );
		}

		return $title;
	}
	//add_filter( 'wp_title', 'kode_wp_title', 10, 2 );
	
	// a comment callback function to create comment list
	if ( !function_exists('kode_comment_list') ){
		function kode_comment_list( $comment, $args, $depth ){
			$GLOBALS['comment'] = $comment;
			switch ( $comment->comment_type ){
				case 'pingback' :
				case 'trackback' :
				?>	
				<li <?php comment_class(); ?> id="comment-<?php comment_ID(); ?>">
					<p><?php _e( 'Pingback :', 'KodeForest' ); ?> <?php comment_author_link(); ?> <?php edit_comment_link( __( '(Edit)', 'KodeForest' ), '<span class="edit-link">', '</span>' ); ?></p>
				<?php break; ?>

				<?php default : global $post; ?>
				<li <?php comment_class(); ?> id="li-comment-<?php comment_ID(); ?>">
					<div class="thumblist">
						<figure><?php echo get_avatar( $comment, 60 ); ?></figure>
						<div class="text">
							<?php echo get_comment_author_link(); ?>
							<time datetime="<?php echo esc_attr(get_comment_time('c')); ?>"><?php echo esc_attr(get_comment_date()) . ' ' . esc_attr__('at', 'KodeForest') . ' ' . esc_attr(get_comment_time()); ?></time>
							<?php comment_text(); ?>
							<?php edit_comment_link( esc_attr__( 'Edit', 'KodeForest' ), '<p class="edit-link">', '</p>' ); ?>
										<?php if( '0' == $comment->comment_approved ){ ?>
									<p class="comment-awaiting-moderation"><?php echo esc_attr__( 'Your comment is awaiting moderation.', 'KodeForest' ); ?></p>
								<?php } ?>
							<?php comment_reply_link( array_merge($args, array('before' => ' ', 'reply_text' => esc_attr__('Reply', 'KodeForest'), 'depth' => $depth, 'max_depth' => $args['max_depth'])) ); ?>
						</div>
					</div>
				<?php
				break;
			}
		}
	}	
	
	
	