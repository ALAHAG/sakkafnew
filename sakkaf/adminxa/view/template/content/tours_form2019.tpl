<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
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
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3> - <span><?php echo $title_en; ?></span>
        </div>
        <div class="panel-body">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
            <div class="tab-content">
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-title_en">Tour Name English</label>
                <div class="col-sm-10">
                  <input type="text" name="title_en" value="<?php echo isset($title_en) ? $title_en : ''; ?>" placeholder="Enter title tour" id="input-title_en" class="form-control" />
                  <?php if (isset($error_title_en)) { ?>
                  <div class="text-danger"><?php echo $error_title_en; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-title_en">Price (RM)</label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?php echo isset($price) ? $price : ''; ?>" placeholder="Price " id="input-price" class="form-control" />
                  <?php if (isset($error_price)) { ?>
                  <div class="text-danger"><?php echo $error_price; ?></div>
                  <?php } ?>
                </div>
              </div>
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
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>">Tour Name Arabic</label>
                    <div class="col-sm-10">
                      <input type="text" name="title_ar" value="<?php echo isset($title_ar) ? $title_ar : ''; ?>" placeholder="اسم الجولة / المواصلات" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>">Description arabic</label>
                    <div class="col-sm-10">
                      <textarea name="description_ar" placeholder="وصف الجوله / المواصلات" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($description_ar) ? $description_ar : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>">Description English</label>
                    <div class="col-sm-10">
                      <textarea name="description_en"  placeholder="Tour / Transportation Description" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($description_en) ? $description_en : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>

              </div>


              <div class="form-group ">
                <label class="col-sm-12"> <div class="panel-heading">
                  <h3 class="panel-title"><i class="fa fa-pencil"></i> Tour Image</h3></div>
                </div>
                <div class="col-md-12">
                  <div class="row">
                    <div id="images">
                      <?php if ($image): ?>
                          <div id="<?php echo $key ?>" class="col-sm-3">
                            <img src="../../image/<?php echo $image ?>" width="100%" >
                            <div class="form-group">
                              <input type="hidden" class="cover" name="image" value="<?php echo $image ?>" >

                              <div class="col-sm-4">
                                <button type="button" data-toggle="tooltip" onclick="$('#<?php echo $key ?>').remove(); $('.tooltip').remove();" class="btn btn-danger delete" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
                              </div>
                            </div>
                          </div>
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
                <input type="hidden" id="cname" name="city_name" value="<?php echo $city_name; ?>"/>
              </div>
            </div>


            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status">Type</label>
              <div class="col-sm-10">
                <select name="cat_id" id="input-status" class="form-control">
                  <?php if ($status) { ?>
                  <option value="2" selected="selected">Transportations</option>
                  <option value="1">Tours</option>
                  <?php } else { ?>
                  <option value="2">Transportations</option>
                  <option value="1" selected="selected">Tours</option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="slug" id="slug"  value="<?php echo $slug; ?>"  placeholder="<?php echo $entry_keyword; ?>" class="form-control " />
                <?php if (isset($error_keyword) && $error_keyword) { ?>
                <div class="text-danger"><?php echo $error_keyword; ?></div>
                <?php } ?>
              </div>
            </div>


        </div>
          <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary center-block"><i class="fa fa-save"></i> Save</button>
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

  <script type="text/javascript"><!--

    var counter = <?php echo isset($key) ? $key+1 : 0; ?>;
    var directory = "catalog/hotels";

    var uploader = new plupload.Uploader({
      runtimes : 'html5,flash,silverlight,html4',
      unique_names : true,
      max_file_size : '1000mb',

        max_file_count: 20, // user can add no more then 20 files at a time
        chunk_size : '1mb',
        rename : true,
        multiple_queues : true,
        
  browse_button : 'pickfiles', // you can pass in id...
  container: document.getElementById('files'), // ... or DOM Element itself
  url : '<?php echo $uploader;?>',
  flash_swf_url : '../js/Moxie.swf',
  silverlight_xap_url : '../js/Moxie.xap',
  multipart_params : {
    "directory" : directory
  },

  filters : {
    max_file_size : '100mb',
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
      +'<img src="../../image/'+directory+'/'+response.fileName+'" width="100%" >'
      +'<div class="form-group">'
      +'<input type="hidden" class="cover" name="image" value="'+directory+'/'+response.fileName+'" >'
      +'<label class="col-sm-6 control-label" for="input-cover">'
      +'<input type="checkbox" class="cover" name="image" value="1" ></input><?php echo $entry_cover; ?>'
      +'</label>'
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


$('#language a:first').tab('show');

$('.nav-lang a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
$('.nav-tabs li:first').addClass('active');
$('.room-nav-tabs li:first').addClass('active');
$('.tab-content div:first').addClass('active');
$('.room-tab-content div:first').addClass('active');


function editRoom (room_id) {
  $('#room_short'+room_id).hide();
  $('#room_edit'+room_id).fadeIn(500);
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
  $('#cname').val($("#city option:selected").text());

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
        $('#cname').val(city_name);

        $('#new_city_ar_name').val('');
      }else{
        alert('Error')
      }
    }
  });
})




$('#slug').focus(function  () {
  if (this.value == '') {
    $(this).val(getSlug($('[name="title_en"]').val()));
    updateSlug();
  };
})

$('#slug').keyup(function  () {
  $(this).val(getSlug(this.value));
  updateSlug()

})
$('#slug').change(function () {
  $('#slug').val($('#slug').val());
})


//-->
//--></script>
</div>
<?php echo $footer; ?>
