<?php echo $header ?>
    <!-- MAIN CONTENT ================================================== -->
    <div class="container semi-white-bg">
        
        <div class="row">
            <div class="col-sm-12">
            <div class="list-title row"><h2>آراء العملاء</h2></div>
            <br>
            </div><!-- /col -->
        </div><!-- /row -->
        <?php 

        if($done): 

        echo '<div class="list-title row"><h2>شكرا لاضافة رأيك عنا .. تم إستقبال رسالتك و سيتم مراجعتها في أقرب وقت ..</h2></div>';

        else: 

        if(!$err): ?>
        <div class="row">
            <?php foreach ($video_testimonials as $video): ?>
            <a href="<?php echo $video['testimonial_body'] ?>" class="item no-side-margin col-sm-4 center-block video-testimonial fancybox-media">
                <img src="image/<?php echo $video['image'] ?>" width="100%" alt="<?php echo $video['name'] ?>">
                <span> <?php echo $video['name'] ?> من <?php echo $video['country'] ?> <i class="fa fa-play"></i>  <?php echo $video['phone'] ? '<br><center>  رقم الجوال :  '. $video['phone'].'</center>' : '' ?></span>
            </a>
            <?php endforeach ?>
        </div>
        <p><br><br><br></p>

        <div class="row">

        <?php foreach ($text_testimonials as $text): ?>
            <div class="text-testimonial col-sm-6 clearfix">
                <div class="clearfix white-bg">
                    <div class="col-sm-4 padding-0">
                        <img src="image/<?php echo $text['image'] ?>"  width="100%">
                    </div>
                    <div class="col-sm-8">
                    <br>
                        <p><?php echo html_entity_decode($text['testimonial_body']) ?></p>
                    <br>
                    </div>
                </div>
                <h6><?php echo $text['name'] ?> <?php echo $text['country'] ? ' من '. $text['country'] : '' ?> <?php echo $text['phone'] ? ' ، رقم الجوال :  '. $text['phone'] : '' ?> </h6>
            </div>
        <?php endforeach ?>
        </div>
        <?php endif;?>
        <p><br><br><br></p>
        <?php if($err){ ?><div class="alert alert-danger">الرجاء التأكد من البيانات المدخلة</div>    <?php }?>
        <div class="formOK" style="display:none;"> <center><div class="alert alert-success"><h4> تم إستقبال رسالتك و سيتم مراجعتها في أقرب وقت ..</h4> </div></center></div>   
        <form  class="generalForm"  action="" method="POST" enctype="multipart/form-data">
            <div class="row">
                <div class="innerTitle"><h2>أضف رأيك</h2></div>
                <div class="col-sm-4">
                    <br>
                    <input <?php if(isset($err['name'])) echo 'class="alert alert-danger"'?> type="text" name="name" placeholder="الإسم" required  value="<?php echo isset($form['name']) ? $form['name'] : '' ?>" />
                    <input <?php if(isset($err['country'])) echo 'class="alert alert-danger"'?> type="text" name="country" placeholder="الدولة"  value="<?php echo isset($form['country']) ? $form['country'] : '' ?>" required/>
                    <input class="phone" type="text" name="phone" value="<?php echo isset($form['phone']) ? $form['phone'] : '' ?>" placeholder="رقم الهاتف - إختياري" />
                </div><!-- /col -->
                <div class="col-sm-3">
                    <img id="thumb" src="<?php echo isset($form['image']) && $form['image'] ? $form['image'] : 'image/no-one.png' ?>" width="150px"> 
                    <label>صورة شخصية                  
                    <input id="image" type="file" /></label> 
                    <input id="cu_image" type="hidden" name="image"  value="<?php echo isset($form['image']) ? $form['image'] : '' ?>" />
                </div>
                <div class="col-sm-5">
                    <textarea name="testimonial_body" <?php if(isset($err['testimonial_body'])) echo 'class="alert alert-danger"'?> placeholder="إكتب رأيك" required><?php echo isset($form['testimonial_body']) ? $form['testimonial_body'] : '' ?></textarea>
                    <input type="submit" value="إرسل" name="send" />
                </div><!-- /col -->
            </div><!-- /row -->
        </form>
        <div class="loaderImg"></div>
        <?php endif;?>
    </div><!-- /container -->

        <script src="catalog/view/javascript/fancybox/jquery.fancybox.js?v=2.1.5"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

        <link href="catalog/view/javascript/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet">
        <link href="catalog/view/javascript/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet">
        <link href="catalog/view/javascript/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" rel="stylesheet">
    
        <script type="text/javascript">

            $('#image').on('change', function() {
            var file_data = $('#image').prop('files')[0];   
            var form_data = new FormData();                  
            form_data.append('file', file_data);

            $.ajax({
                        url: 'index.php?route=tool/upload/img', 
                        dataType: 'json',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,                         
                        type: 'POST',
                        success: function(res){
                            if( !res.error ){
                                $('#thumb').attr("src","image/catalog/testimonials/"+res.filename);
                                $('#image').hide();
                                $('#cu_image').val("catalog/testimonials/"+res.filename);
                            }
                        }
             });
            });

            $('.fancybox-media')
                .attr('rel', 'media-gallery')
                .fancybox({
                    openEffect : 'none',
                    closeEffect : 'none',
                    prevEffect : 'none',
                    nextEffect : 'none',

                    arrows : false,
                    helpers : {
                        media : {},
                        buttons : {}
                    }
                });

    </script>

<?php  echo $footer ?>
