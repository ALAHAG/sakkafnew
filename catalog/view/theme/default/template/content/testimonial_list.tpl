<?php echo $header ?>
<style type="text/css" media="screen">
  .chat
{
    list-style: none;
    margin: 0;
    padding: 0;
}
span.chat-img{
    padding-left: 7px;
    border-left: 4px solid #b71d79;
    border-left-style: double;
}

.chat li
{
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 2px dotted #8b246c;
}
.chat li:last-child
{
    margin-bottom: 10px;
    padding-bottom: 5px;
    border-bottom: none;
}

.chat li.left .chat-body
{
    margin-left: 60px;
}

.chat li.right .chat-body
{
    margin-right: 88px;
}


.chat li .chat-body p
{
    margin: 0;
    color: #777777;
}

.panel .slidedown .glyphicon, .chat .glyphicon
{
    margin-right: 5px;
}

.mtest > .panel-body
{
    overflow-y: scroll;
    height: 1000px;
}

::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}
</style>
<div class="page-title-container">
  <div class="container">
    <div class="page-title pull-left">
      <h2 class="entry-title">أراء العملاء لدى شركة السقاف للسياحة والسفر </h2>
    </div>
  </div>
</div>
<section id="content">
  <div class="container">
    <div class="row">
<!-- <?php echo $total;?> -->
      <div id="main" class="col-md-9">
        <div class="col-md-12">
            <div class="panel panel-primary mtest">
                <div class=" panel-body">
                    <ul class="chat">
                 
           <?php if(!$err): ?>
        <div class="row video">
            <?php foreach ($video_testimonials as $video): ?>
            <a href="<?php echo $video['testimonial_body'] ?>" class="item no-side-margin col-sm-4 center-block video-testimonial fancybox-media">
                <img src="image/<?php echo $video['image'] ?>" width="100%" height="200" alt="<?php echo $video['name'] ?>">
                <span> <?php echo $video['name'] ?> من <?php echo $video['country'] ?> <i class="fa fa-play"></i>  <?php echo $video['phone'] ? '<br><center>  رقم الجوال :  '. $video['phone'].'</center>' : '' ?></span>
            </a>
            <?php endforeach ?>
        </div>
        <p><br><br><br></p>
    <?php foreach ($text_testimonials as $key => $value) { ?>
                        <li class="right clearfix"> <span class="chat-img pull-left">
                            <img src="image/<?php echo $value['image'] ?>" alt="اراء العملاء عن شركة السقاف" alt="" width="74" height="74" class="img-circle" />
                        </span>  
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font"> <?php echo $value['name'] ?> <span class="glyphicon glyphicon-flag"></span> <?php echo $value['country'] ?> </strong> <small class="pull-right text-muted "> <span class="glyphicon glyphicon-thumbs-up"></span> <i><?php echo $value['company_rate'] ?>/10</i>
                                      <span class="glyphicon glyphicon-time text-orange"></span> <?php echo $value['date_added'] ?> </small>
                                </div>
                                <p>
                                    <?php echo $value['testimonial_body'] ?>.
                                </p>
                            </div>
                        </li>
                          <?php }?> 
        <div class="row">

   <!--      <?php foreach ($text_testimonials as $text): ?>
            <div class="text-testimonial col-sm-12 clearfix">
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
                          <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font"> <?php echo $text['name'] ?> <span class="glyphicon glyphicon-flag"></span> <?php echo $text['country'] ?> </strong> <small class="pull-right text-muted "> <span class="glyphicon glyphicon-thumbs-up"></span> <i><?php echo $text['company_rate'] ?>/10</i>
                                      <span class="glyphicon glyphicon-time text-orange"></span> <?php echo $text['date_added'] ?> </small>
                                </div>
                                <p>
                                    <?php echo $value['testimonial_body'] ?>.
                                </p>
                            </div>
                <h6><?php echo $text['name'] ?> <?php echo $text['country'] ? ' من '. $text['country'] : '' ?> <?php echo $text['phone'] ? ' ، رقم الجوال :  '. $text['phone'] : '' ?> </h6>
            </div>
        <?php endforeach ?> -->
        </div>
        <?php endif;?>
                       <!--  <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>15 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>date_added
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </div>
        </div>
 

      <!--   <section id="content" class="gray-area">
          <div class="shortcode">
            <div class="testimonial style2 box">
           
              <?php foreach ($testimonials as $key => $value) { ?>
              
              <div class="slides testimonial col-md-6">
                <p class="description"><?php echo $value['testimonial_body'] ?></p>
                <div class="author clearfix">
                  <a href="#"><img src="<?php echo $value['thumb'] ?>" alt="" width="74" height="74" /></a>
                  <h5 class="name"><?php echo $value['name'] ?><small><?php echo $value['name'] ?></small></h5>

                </div> 
              </div>    
              <?php }?>                    
            </div>

          </div>
        </section> -->


          
      </div>
      <div class="col-md-3">
        <?php echo $testimonial_form; ?>

      </div></div></div></section>
                      <div class="pager center-block">
                            <?php echo isset($pagination) ? $pagination : ''; ?>
                    </div><!-- /pager -->
<script src="catalog/view/javascript/fancybox/jquery.fancybox.js?v=2.1.5"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
        <script src="catalog/view/javascript/fancybox/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

        <link href="catalog/view/javascript/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet">
        <link href="catalog/view/javascript/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet">
        <link href="catalog/view/javascript/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" rel="stylesheet">
    
        <script type="text/javascript">

            // $('#image').on('change', function() {
            // var file_data = $('#image').prop('files')[0];   
            // var form_data = new FormData();                  
            // form_data.append('file', file_data);

            // $.ajax({
            //             url: 'index.php?route=tool/upload/img', 
            //             dataType: 'json',
            //             cache: false,
            //             contentType: false,
            //             processData: false,
            //             data: form_data,                         
            //             type: 'POST',
            //             success: function(res){
            //                 if( !res.error ){
            //                     $('#thumb').attr("src","image/catalog/testimonials/"+res.filename);
            //                     $('#image').hide();
            //                     $('#cu_image').val("catalog/testimonials/"+res.filename);
            //                 }
            //             }
            //  });
            // });

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

