<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary save" onclick="$('#form').submit();"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
        <h1><?php echo $heading_title; ?></h1>
        <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>  
          <?php } ?>
        </ul>
      </div>
    </div>
    <div class="container-fluid">
     <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title.' Description'; ?></h3> <span></span> 
      </div>
      <div class="panel-body">
        <div class="content">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
            <div id="tab-general">

              <ul class="nav nav-tabs nav-lang">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div id='content' class="-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"> <?php echo 'Title'; ?></label>
                        <div class="col-sm-10 col-md-10">

                         <input class="form-control" type="text" name="information_description[<?php echo $language['language_id']; ?>][gallery_category_title]" size="100" value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['gallery_category_title'] : ''; ?>" />
                         <?php if (isset($error_title[$language['language_id']])) { ?>
                         <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                         <?php } ?>
                       </div>
                     </div>
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                      <div class="col-sm-10">

                        <textarea class="form-control" rows="5" name="information_description[<?php echo $language['language_id']; ?>][gallery_category_description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['gallery_category_description'] : ''; ?></textarea>
                        <?php if (isset($error_description[$language['language_id']])) { ?>
                        <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                        <?php } ?></div>
                      </div>
                    </table>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group ">
            <div class="panel-heading col-md-12">
              <h3 class="panel-title"><i class="fa fa-pencil"></i> Gallery Photos</h3> <span></span> 
            </div>
            </div>

            <div style="clear:both;"></div>
            <p></p>

              <div class="form-group ">
 
                <div class="col-md-12">
                  <div class="row">
                    <div id="images">
                      <?php if ($information_images): ?>
                        <?php foreach ($information_images as $key => $image): ?>
                          <div id="<?php echo $key ?>" class="col-sm-3">
                            <img src="<?php echo $image['thumb'] ?>" width="100%" >
                            <div class="form-group">                        
                              <input type="hidden" class="cover" name="information_images[<?php echo $key ?>][image_file]" value="<?php echo $image['image_file'] ?>" >
    
                              <div class="col-sm-4">
                                <button type="button" data-toggle="tooltip" onclick="$('#<?php echo $key ?>').remove(); $('.tooltip').remove();" class="btn btn-danger delete" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
                              </div>
                            </div>
                          </div>
                        <?php endforeach ?>
                      <?php endif ?>
                    </div>

                  </div>
                  <div id="filelist">Your browser doesn't have Flash, Silverlight or HTML5 support.</div>
                  <div id="files" class="row">
                    <a id="pickfiles" class="btn btn-primary" href="javascript:;">Add Images</a> 
                  </div>
                  <hr>
                </div>
              </div>

            <div class="panel-heading">
              <h3 class="panel-title"><i class="fa fa-pencil"></i> Gallery video</h3> <span></span> 
            </div>
            <a class="button" ></a>

            <div class="my-form">
              <p class="text-box">
                <a class="add-box btn btn-primary" href="#">Add Video</a>

              </p>
            </div>

            <div id="information-images" style="disply:block;">
              <div id="file_container">
                <div id="filelist"></div>
              </div>



            </div>
            <?php $video_row = 0; ?>
            <?php 
            if ($information_videoes) {
                      // print_r( $information_video[$video_row]);exit();

              foreach ($information_videoes as $information_video) { ?>
              <div class="col-md-3" id="video-row<?php echo $video_row; ?>">
                <div class="image">
                  <?php
                  $ytarray=explode("/", $information_video['video_file']);
                  $ytendstring=end($ytarray);
                  $ytendarray=explode("?v=", $ytendstring);
                  $ytendstring=end($ytendarray);
                  $ytendarray=explode("&", $ytendstring);
                  $ytcode=$ytendarray[0];
                  echo "<iframe width=\"190\" height=\"170\" src=\"http://www.youtube.com/embed/$ytcode\" frameborder=\"0\" ?>allowfullscreen></iframe>" ?>
                  <input class="form-control" type="hidden" name="information_videoes[<?php echo $video_row; ?>][video_file]" value="<?php echo $information_video['video_file'];?>" id="#video-row ?>" /><br /></div>

                  <a onclick="$('#video-row<?php echo $video_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
                </div>
                <?php $video_row++; ?>
                <?php }
              }?>
            </div>
            <div style="clear:both;"></div>
            <p></p>
            <div id="tab-data">
                <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                   <div class="col-sm-10">
                    <select class="form-control " name="status">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select></div>
                </tr>
              </table>
            </div>
          </form>
        </div>

      </div>
    </div>
    <script type="text/javascript">
      var video_row = <?php echo $video_row; ?>;

      jQuery(document).ready(function($){
        $('.my-form .add-box').click(function(){
          var n = $('.text-box').length + 1;
          if( 5 < n ) {
            alert('Stop it!');
            return false;
          }
          var box_html = $('<p class="text-box"><label for="box' + n + '">URL <span class="box-number">' + video_row + '</span></label> <input type="text"class="form-control" name="information_videoes[' + video_row + '][video_file]" value="" id="box' + video_row + '" /> <a href="#" class="remove-box">Remove</a></p>');
          box_html.hide();
          $('.my-form p.text-box:last').after(box_html);
          box_html.fadeIn('slow'); 
          video_row++;

          return false;
        });
        $('.my-form').on('click', '.remove-box', function(){
          $(this).parent().css( 'background-color', '#FF6C6C' );
          $(this).parent().fadeOut("slow", function() {
            $(this).remove();
            $('.box-number').each(function(index){
              $(this).text( index + 1 );
            });
          });
          return false;
        });
      });
</script>

  <script type="text/javascript"><!--

    var counter = <?php echo isset($key) ? $key+1 : 0; ?>;
    var directory = "catalog/gallery";

    var uploader = new plupload.Uploader({
      runtimes : 'html5,flash,silverlight,html4',
      unique_names : true,
  browse_button : 'pickfiles', // you can pass in id...
  container: document.getElementById('files'), // ... or DOM Element itself
  url : '<?php echo $uploader;?>',
  flash_swf_url : '../js/Moxie.swf',
  silverlight_xap_url : '../js/Moxie.xap',
  multipart_params : {
    "directory" : directory
  },
  
  filters : {
    max_file_size : '10mb',
    mime_types: [
    {title : "Image files", extensions : "jpg,gif,png"},
    ]
  },

  init: {
    PostInit: function() {
      document.getElementById('filelist').innerHTML = '';
    },

    FilesAdded: function(up, files) {

     uploader.start();
   },

   UploadProgress: function(up, file) {
    $('body').append('<div id="modal"></div>');
    $('#modal').modal('show');
      // document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
    },

    Error: function(up, err) {
      // document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
    },
    FileUploaded: function(up, file,res) {
      var response = JSON.parse(res.response);
      image = '<div id="'+counter+'" class="col-sm-3">'
      +'<img src="../image/'+directory+'/'+response.fileName+'" width="100%" >'
      +'<div class="form-group">'
      +'<input type="hidden" class="cover" name="information_images['+counter+'][image_file]" value="'+directory+'/'+response.fileName+'" >'
      +'<div class="col-sm-4">'
      +'<button type="button" data-toggle="tooltip" onclick="$(\'#'+counter+'\').remove(); $(\'.tooltip\').remove();" class="btn btn-danger" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>'
      +'</div>'
      +'</div>'
      +'</div>';

      $('#images').append(image);
      counter++;

      $('#loading').remove();

      $('#modal').modal('hide');

      $('.cover').click(function () {
        element = this;
        $('.cover').each(function () {
          $(this).removeAttr("checked");
        })
        $(element).prop("checked","checked");
      })


    }
  }
});

uploader.init();



</script>

    <?php echo $footer; ?>