<?php
/**
 * The template for displaying Comments.
 */

if ( post_password_required() )
	return;
?>

<div id="comments" class="kode-comments-area">
<?php if(have_comments()){ ?>
	<h3 class="comments-title">
		<?php 
			if( get_comments_number() <= 1 ){
				echo esc_attr(get_comments_number()) . ' ' . esc_attr__('Response', 'kode_forest'); 
			}else{
				echo esc_attr(get_comments_number()) . ' ' . esc_attr__('Responses', 'kode_forest'); 
			}
		?>
	</h3>

	<ul class="commentlist">
		<?php wp_list_comments(array('callback' => 'kode_comment_list', 'style' => 'ul')); ?>
	</ul><!-- .commentlist -->

	<?php if (get_comment_pages_count() > 1 && get_option('page_comments')){ ?>
		<nav id="comment-nav-below" class="navigation" role="navigation">
			<h1 class="assistive-text section-heading"><?php echo esc_attr__( 'Comment navigation', 'kode_forest' ); ?></h1>
			<div class="nav-previous"><?php previous_comments_link( esc_attr__( '&larr; Older Comments', 'kode_forest' ) ); ?></div>
			<div class="nav-next"><?php next_comments_link( esc_attr__( 'Newer Comments &rarr;', 'kode_forest' ) ); ?></div>
		</nav>
	<?php } ?>

<?php } ?>

<?php 
	$commenter = wp_get_current_commenter();
	$req = get_option( 'require_name_email' );
	$aria_req = ($req ? " aria-required='true'" : '');
	
	$args = array(
		'id_form'           => 'commentform',
		'id_submit'         => 'submit',
		'title_reply'       => __('Leave a Reply', 'kode_forest'),
		'title_reply_to'    => __('Leave a Reply to %s', 'kode_forest'),
		'cancel_reply_link' => __('Cancel Reply', 'kode_forest'),
		'label_submit'      => __('Post Comment', 'kode_forest'),
		'comment_notes_before' => '',
		'comment_notes_after' => '',

		'must_log_in' => '<p class="must-log-in">' .
			sprintf( __('You must be <a href="%s">logged in</a> to post a comment.', 'kode_forest'),
			esc_url(wp_login_url(apply_filters( 'the_permalink', get_permalink()))) ) . '</p>',
		'logged_in_as' => '<p class="logged-in-as">' .
			sprintf( __('Logged in as <a href="%1$s">%2$s</a>. <a href="%3$s" title="Log out of this account">Log out?</a>', 'kode_forest'),
			esc_url(admin_url('profile.php')), $user_identity, esc_url(wp_logout_url(apply_filters('the_permalink', get_permalink( )))) ) . '</p>',

		'fields' => apply_filters('comment_form_default_fields', array(
			'author' =>
				'<p><input id="author" name="author" type="text" placeholder="Name:" value="' . esc_attr( $commenter['comment_author'] ) .
				'" data-default="' . esc_attr(__('Name*', 'kode_forest')) . '" size="30"' . esc_attr($aria_req) . ' /></p>',
			'email' => 
				'<p><input id="email" name="email" type="text" placeholder="Email:" value="' . esc_attr(  $commenter['comment_author_email'] ) .
				'" data-default="' . esc_attr(__('Email*', 'kode_forest')) . '" size="30"' . esc_attr($aria_req) . ' /></p>',
			'url' =>
				'<p class="full-width-kode"><input id="url" name="url" type="text" placeholder="Website URL" value="' . esc_attr($commenter['comment_author_url']) .
				'" data-default="' . esc_attr(__('Website', 'kode_forest')) . '" size="30" /></p>'
		)),
		'comment_field' =>  '<p class="kode-textarea">' .
			'<textarea id="comment" name="comment" placeholder="Comments" cols="45" rows="8" aria-required="true">' .
			'</textarea></p>'
		
	);
	comment_form($args); 

?>
</div><!-- kode-comment-area -->