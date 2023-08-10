	<?php global $theme_option; ?>
	<div class="clear" ></div>
	</div><!-- content wrapper -->
	
	<?php 
	if($theme_option['show-footer'] == 'enable'){ 
		if($theme_option['footer-layout'] <> 1){ ?>
		<footer id="footer-widget">
			<div class="container">
				<div class="row">
					<?php dynamic_sidebar('Footer'); ?>
				</div>
			</div>
		</footer>
		<?php }
	}
	?>
	<div id="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<?php if($theme_option['show-copyright'] == 'enable'){ ?>
						<?php echo kode_esc_html($theme_option['copyright-text']);?>
					<?php }?>
				</div>
				<div class="col-md-6">
				<?php 
				// Menu parameters		
				$defaults = array(
					'theme_location'  => 'footer_menu',
					'menu'            => '', 
					'container'       => 'nav', 
					'container_class' => 'footer-nav', 
					'container_id'    => 'footer-navbar',
					'menu_class'      => 'inner-footer-nav', 
					'menu_id'         => 'nav',
					'echo'            => true,
					'fallback_cb'     => '',
					'before'          => '',
					'after'           => '',
					'link_before'     => '',
					'link_after'      => '',
					'items_wrap'      => '<ul id="%1$s" class="%2$s">%3$s</ul>',
					'depth'           => 0,
					'walker'          => '',
				);				
				if(has_nav_menu('footer_menu')){
					wp_nav_menu( $defaults);
				}?>
				</div>
			</div>
		</div>
	</div>

	<div class="clear clearfix"></div>
</div> <!-- body-wrapper -->
<?php wp_footer(); ?>
</body>
</html>