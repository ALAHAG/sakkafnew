<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-information" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
          <div class="tab-content">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li>
                <a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab">
                <?php if (sizeof($languages) > 1): ?>
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
                <?php endif ?>
                </a>
                </li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="page_content[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($page_content[$language['language_id']]) ? $page_content[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required ">
                    <label class="col-sm-2 control-label" for="input-content"><?php echo $entry_page_content; ?></label>
                    <div class="col-sm-10">
                      <textarea name="page_content[<?php echo $language['language_id']; ?>][content]" placeholder="<?php echo $entry_content; ?>" id="input-content<?php echo $language['language_id']; ?>" class="form-control editor"><?php echo isset($page_content[$language['language_id']]) ? $page_content[$language['language_id']]['content'] : ''; ?></textarea>
                      <?php if (isset($error_content[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_content[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group has-content">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="page_content[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($page_content[$language['language_id']]) ? $page_content[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
                <hr>
              </div>
            <?php if ($city_related): ?>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="zone"><?php echo $entry_state; ?></label>
                <div class="col-sm-10">
                  <select name="zone_id" id="zone" class="form-control">
                  <option value=""><?php echo $entry_select ?> <?php echo $entry_state; ?></option>
                  <?php foreach ($zones as $zone): ?>
                    <option value="<?php echo $zone['zone_id']; ?>" <?php echo $zone_id == $zone['zone_id'] ?"selected" : '' ?> ><?php echo $zone['name']; ?></option>                   
                  <?php endforeach ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="cities"><?php echo $entry_city; ?></label>
                <div class="col-sm-10">
                  <select name="city_id" id="city" class="form-control">
                  <option><?php echo $entry_select ?> <?php echo $entry_city; ?></option>
                  <?php foreach ($cities as $city): ?>
                    <option value="<?php echo $city['city_id']; ?>" <?php echo $city_id == $city['city_id'] ?"selected" : '' ?> ><?php echo $city['city_name']; ?></option>                   
                  <?php endforeach ?>
                  <option value="add"><?php echo $entry_add_city ?></option>
                  </select>
                </div>
              </div>
            <?php endif ?>
              <div class="col-md-12">
              <div class="row">
                <h3>  <?php echo $entry_images; ?></h3>
                <div id="images">

                  <?php foreach ($page_images as $key => $image): ?>
                    <div id="<?php echo $key ?>" class="col-sm-3">
                      <img src="../image/<?php echo $image['image'] ?>" width="100%" >
                      <div class="form-group">                        
                          <input type="hidden" class="cover" name="page_images[<?php echo $key ?>][image]" value="<?php echo $image['image'] ?>" >
                        <label class="col-sm-6 control-label" for="input-cover">
                            <input type="checkbox" class="cover" name="page_images[<?php echo $key ?>][cover]" <?php echo $image['cover'] ? 'checked' : ''?> value="1" ></input><?php echo $entry_cover; ?>
                        </label>
                        <div class="col-sm-4">
                          <button type="button" data-toggle="tooltip" onclick="$('#<?php echo $key ?>').remove();$('.tooltip').remove();" class="btn btn-danger delete" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
                        </div>
                      </div>
                    </div>
                  <?php endforeach ?>
                </div>

              </div>
              <div id="filelist">Your browser doesn't have Flash, Silverlight or HTML5 support.</div>
              <div id="files" class="row">
                  <a id="pickfiles" class="btn btn-primary" href="javascript:;">Add Images</a> 
              </div>
              <hr>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10 input-group">
                  <input type="hidden" name="keyword" id="keyword" value="<?php echo $slug ?>">
                  <!-- <span class="input-group-addon" id="preslug">/</span>  -->
                  <input type="text" id="slug"  value="<?php $slug = explode('/',$slug); echo end($slug); ?>" aria-describedby="preslug" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control " />
                  <?php if (isset($error_keyword) && $error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <input type="hidden" name="page_id" value="<?php echo $page_id; ?>" />
                <input type="hidden" name="category_id" value="<?php echo $category_id; ?>" />
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="center-block"> <input type="submit" value="Save" class="center-block btn btn-primary"> </div>
          </div>
        </form>
      </div>
    </div>
  </div>

<div class="modal fade" id="addCity" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h4 class="modal-title" id="myModalLabel"><?php echo $entry_add_city ?></h4>
            </div>
            <div class="modal-body">
              <div class="form-group  row">
                <label class="col-sm-4 control-label" for="input-keyword"><?php echo $entry_state; ?></label>
                <div class="col-sm-6 input-group">
                  <span id="modal_state"></span>
                </div>
              </div>

              <div class="form-group required row">
                <label class="col-sm-4 control-label" for="input-keyword"> <?php echo $new_city_name; ?> </label>
                <div class="col-sm-6 input-group">
                  <input type="text" id="new_city_name" placeholder="<?php echo $new_city_name; ?>" class="form-control " />
                </div>
              </div>

              <div class="form-group required row">
                <label class="col-sm-4 control-label" for="input-keyword"> <?php echo $new_city_ar_name; ?> </label>
                <div class="col-sm-6 input-group">
                  <input type="text" id="new_city_ar_name" placeholder="<?php echo $new_city_ar_name; ?>" class="form-control " />
                </div>
              </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="addNewCity" class="btn btn-primary">Save</button>
        </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#addCity').modal({
  'show' : false
});
$('.editor').summernote();
var counter = <?php echo isset($key) ? $key+1 : 0; ?>;
var directory = "pages";

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

      // document.getElementById('uploadfiles').onclick = function() {
      //   uploader.start();
      //   return false;
      // };
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
                        +'<input type="hidden" class="cover" name="page_images['+counter+'][image]" value="'+directory+'/'+response.fileName+'" >'
                      +'<label class="col-sm-6 control-label" for="input-cover">'
                          +'<input type="checkbox" class="cover" name="page_images['+counter+'][cover]" ></input><?php echo $entry_cover; ?>'
                      +'</label>'
                      +'<div class="col-sm-4">'
                        +'<button type="button" data-toggle="tooltip" onclick="$(\'#'+counter+'\').remove();$(".tooltip").remove();" class="btn btn-danger" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>'
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

  $('.cover').click(function () {
    element = this;
    $('.cover').each(function () {
      $(this).removeAttr("checked");
    })
    $(element).prop("checked","checked");
  }) 
$('#language a:first').tab('show');


 $('#slug').focus(function  () {
  if (this.value == '') {
    $(this).val(getSlug($('[name="page_content[1][title]"]').val()));
    updateSlug();
  };
})

$('#slug').keyup(function  () {
    $(this).val(getSlug(this.value));
    updateSlug()

})
$('#slug').change(function () {
    updateSlug();
})
    updateSlug();

function updateSlug () {
  // var slug = getSlug($('#region :selected').text())+'/'+getSlug($('#categories :selected').text())+'/';
  // $('#preslug').html(slug);
  $('#keyword').val($('#slug').val());

}


$('#zone').change(function () {
  $('#modal_state').html($('#zone :selected').text());
    $.ajax({
      url: 'index.php?route=localisation/zone/citiesByZoneId&token=<?php echo $token; ?>',
      data: {zone_id : this.value},
      method: 'post',
      dataType: 'json',
      success: function(json) {
        // console.log(json);
        var optgroup = '<option>Please Select City</option>';
        $.each(json, function(index) {
          optgroup += '<option value="'+json[index].city_id+'">'+json[index].city_name+'</option>'
        });
        optgroup += '<option value="add">Add City</option>';
        $('#city').html(optgroup);
      }
    });
})

$('#city').change(function () {
  if(this.value == 'add'){
    if($('#zone').val() == ""){
      alert('Please Select State First !!!');

    }else{
      $('#addCity').modal('show');
    }
  }
})
$('#addNewCity').click(function () {
    var zone_id = $('#zone').val();
    var city_name = $('#new_city_name').val();
    var city_ar_name = $('#new_city_ar_name').val();
    $.ajax({
      url: 'index.php?route=localisation/zone/addCity&token=<?php echo $token; ?>',
      data: {zone_id : zone_id ,city_name:city_name,city_ar_name:city_ar_name},
      method: 'post',
      success: function(data) {
        console.log(data);
        if(data){
          $('<option value="'+data+'" selected>'+city_name+'</option>').insertBefore('option[value="add"]');
          $('#addCity').modal('hide');
          $('#new_city_name').val('');
          $('#new_city_ar_name').val('');
        }else{
          alert('Error')
        }
      }
    });
  })

</script>
<?php echo $footer; ?>