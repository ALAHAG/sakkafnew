<?php echo $header ?>

        <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title"><?php echo $title ?></h2>
                </div>
            </div>
        </div>

        <section id="content">
            <div class="container">
                <div class="row">
                    <div id="main" class="col-sm-8 col-md-9">
                    <?php echo html_entity_decode($content); ?>
                    </div>
                    <div class="sidebar col-sm-4 col-md-3">
                    <?php echo $right_sidebar; ?>
                    </div>
                </div>
            </div>
        </section>

<?php  echo $footer ?>

