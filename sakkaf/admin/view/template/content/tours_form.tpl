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
                              <!-- <label class="col-sm-6 control-label" for="input-cover">
                                <input type="checkbox" class="cover" name="image" <?php echo $image ? 'checked' : ''?> value="1" ></input><?php echo $entry_cover; ?>
                              </label> -->
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

              <!-- <div class="form-group ">
                <label class="col-sm-12"> <div class="panel-heading">
                  <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo "Hotel Information"; ?></h3></div>
                </div>
                <div class="form-group ">
                  <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo isset($email) ? $email : ''; ?>" placeholder="<?php echo $entry_email; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                    <?php if (isset($error_email[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group ">
                  <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_address; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address" value="<?php echo isset($address) ? $address : ''; ?>" placeholder="<?php echo $entry_address; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                    <?php if (isset($error_address[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>


                <div class="form-group ">

                  <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_phone; ?></label>
                  <div class="col-sm-4">
                    <input type="text" name="phone" value="<?php echo isset($phone) ? $phone : ''; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                    <?php if (isset($error_phone[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                  <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_fax; ?></label>
                  <div class="col-sm-4">
                    <input type="text" name="fax" value="<?php echo isset($fax) ? $fax : ''; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                    <?php if (isset($error_fax[$language['language_id']])) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>

                </div>
-                   <div class="form-group ">
                    <label class="col-sm-2 control-label"><?php echo "hotel_facilities"; ?></label>
                    <div id="tab-hotel-facilities " class="col-sm-10">
                     <input data-role="tagsinput" placeholder="<?php echo $hotel_facilities; ?>" name="hotel_facilities" type="text" value="<?php echo $hotel_facilities;?>" >
                   </div>
                 </div>
                               <div class="form-group ">
               <label class="col-sm-2 control-label"><?php echo $entry_website_url; ?></label>

               <div class="col-sm-10">
                 <input class="form-control" type="text" name="website_url" size="100" value="<?php echo isset($website_url) ? $website_url : ''; ?>" />
               </div>
             </div> -->

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

            <!-- <div class="form-group ">

              <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_rate; ?></label>
              <div class="col-sm-4 required">
                <select name="star_rating" id="input-type" class="form-control">
                  <optgroup label="Choose">
                    <?php  if(isset($rate) ){ ?>
                    <option value="<?php echo $rate;?>"><?php echo $rate;?> Stars</option>
                    <?php }else{?>
                    <option value="select">Select</option>
                    <?php } ?>
                    <option value="5">5 Stars</option>
                    <option value="4">4 Stars</option>
                    <option value="3">3 Stars</option>
                    <option value="2">2 Stars</option>
                    <option value="1">1 Star</option>

                  </optgroup>

                </select>
              </div>
              <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_map; ?></label>
              <div class="col-sm-4">
                <input type="text" data-role="tagsinput" name="map" value="<?php echo isset($map) ? $map : ''; ?>" placeholder="<?php echo $entry_map; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                <?php if (isset($error_fax[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
            </div>-->
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

  <!--          <div class="form-group ">
              <label class="col-sm-12"> <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Hotel Rooms</h3></div>
              </div>

              <div id="rooms">
                <?php if ($hotel_rooms) { $room_row = 1; ?>
                <?php foreach ($hotel_rooms as $room) { ?>
                <div class="row well" id="image-row<?php echo $room_row; ?>">
                  <div class="col-md-3 col-lg-2">
                    <a href="" id="thumb-image<?php echo $room_row; ?>" data-toggle="image" class="img-thumbnail">
                      <img width="100%" src="<?php echo HTTP_IMAGE.$room['image']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                    </a>
                    <input type="hidden" name="hotel_room[<?php echo $room_row; ?>][image]" value="<?php echo $room['image']; ?>" id="input-image<?php echo $room_row; ?>" />
                  </div>
                  <div class="col-md-9 col-lg-10">
                    <div class="row" >
                      <div class="form-group required col-sm-7">
                        <label class="col-sm-4 control-label" > Room English Name</label>
                        <div class="col-sm-8 input-group">
                          <input type="text" name="hotel_room[<?php echo $room_row; ?>][room_english_name]"  value="<?php echo $room['room_english_name'] ?>"  placeholder="Room English Name" class="form-control " />
                          <input type="hidden" name="hotel_room[<?php echo $room_row; ?>][room_id]"  value="<?php echo $room['room_id'] ?>" />
                          <?php if (isset($error_room_english_name) && $error_room_english_name) { ?>
                          <div class="text-danger"><?php echo $error_room_english_name; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required col-sm-5">
                        <label class="col-sm-3 control-label" > Max Occupancy</label>
                        <div class="col-sm-9 input-group">
                          <input type="text" name="hotel_room[<?php echo $room_row; ?>][occupancy]"  value="<?php echo $room['occupancy'] ?>"  placeholder="Room Occupancy" class="form-control " />
                          <?php if (isset($error_room_english_name) && $error_room_english_name) { ?>
                          <div class="text-danger"><?php echo $error_room_english_name; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                        <label class="col-sm-2 control-label" > defualt Price</label>
                        <div class="col-sm-3 input-group">
                          <input type="text" name="hotel_room[<?php echo $room_row; ?>][price]"  value="<?php echo $room['price'] ?>"  placeholder="Room Price" class="form-control " />
                          <?php if (isset($error_room_english_name) && $error_room_english_name) { ?>
                          <div class="text-danger"><?php echo $error_room_english_name; ?></div>
                          <?php } ?>
                        </div>
                      </div>


                    <div class="row">
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
                      <div class="col-md-12">


                        <?php foreach ($languages as $language) {?>
                        <div class="tab-pane active" id="language<?php echo $language['language_id']; ?>">
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>">Room Name [Ar]</label>
                            <div class="col-sm-10">
                              <input type="text" name="hotel_room[<?php echo $room_row; ?>][hotel_room_description][<?php echo $language['language_id']; ?>][room_name]" value="<?php echo isset($room) ? $room['hotel_room_description'][$language['language_id']]['room_name'] : ''; ?>" placeholder="Room Name [Ar]" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                              <?php if (isset($error_room_name[$language['language_id']])) { ?>
                              <div class="text-danger"><?php echo $error_room_name[$language['language_id']]; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                          <div class="form-group required ">
                            <label class="col-sm-2 control-label" for="input-content">Room Description</label>
                            <div class="col-sm-10">
                              <textarea name="hotel_room[<?php echo $room_row; ?>][hotel_room_description][<?php echo $language['language_id']; ?>][room_description]" placeholder=" Room Description" id="input-content<?php echo $language['language_id']; ?>" class="form-control editor"><?php echo isset($room) ? $room['hotel_room_description'][$language['language_id']]['room_description'] : ''; ?></textarea>
                              <?php if (isset($error_content[$language['language_id']])) { ?>
                              <div class="text-danger"><?php echo $error_content[$language['language_id']]; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                        <hr>
                      </div>
                    </div>
                  </div>
                </div>

                <div style="clear:both"></div>

                <?php $room_row++; ?>
                <?php }
              }?>
              <hr>
            </div>
            <div id="new_rooms"></div>

            <div style="clear:both"></div>

            <a  onclick="addRoom();" class="button btn btn-primary" data-toggle="tooltip" data-original-title="Add New"><i class="fa fa-plus"></i>Add Room</a>
          </div> -->
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

var room_row = <?php echo isset($room_row) ? $room_row: 1; ?>;

function addRoom () {
  var room = '<div class="row well" id="image-row'+room_row+'">'
  +'<div class="col-md-3 col-lg-2">'
  +'<a href="" id="thumb-image'+room_row+'" data-toggle="image" class="img-thumbnail">'
  +'<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />'
  +'</a>'
  +'<input type="hidden" name="hotel_room['+room_row+'][image]" value="" id="input-image'+room_row+'" />'
  +'</div>'
  +'<div class="col-md-9 col-lg-10">'
  +'<div class="row" >'
  +'<div class="form-group required col-sm-7">'
  +'<label class="col-sm-4 control-label" > Room English Name</label>'
  +'<div class="col-sm-8 input-group">'
  +'<input type="text" name="hotel_room['+room_row+'][room_english_name]"  value=""  placeholder="Room English Name" class="form-control " />'
  +'<?php if (isset($error_room_english_name) && $error_room_english_name) { ?>'
  +'<div class="text-danger"><?php echo $error_room_english_name; ?></div>'
  +'<?php } ?>'
  +'</div>'
  +'</div>'
  +'<div class="form-group required col-sm-5">'
  +'<label class="col-sm-3 control-label" > Max Occupancy</label>'
  +'<div class="col-sm-9 input-group">'
  +'<input type="text" name="hotel_room['+room_row+'][occupancy]"  value=""  placeholder="Occupancy" class="form-control " />'
  +'<?php if (isset($error_room_english_name) && $error_room_english_name) { ?>'
  +'<div class="text-danger"><?php echo $error_room_english_name; ?></div>'
  +'<?php } ?>'
  +'</div>'
  +'</div>'
  +'<div class="form-group required col-sm-12">'
  +'<label class="col-sm-2 control-label" > Max price</label>'
  +'<div class="col-sm-4 input-group">'
  +'<input type="text" name="hotel_room['+room_row+'][price]"  value=""  placeholder="price" class="form-control " />'
  +'<?php if (isset($error_room_english_name) && $error_room_english_name) { ?>'
  +'<div class="text-danger"><?php echo $error_room_english_name; ?></div>'
  +'<?php } ?>'
  +'</div>'
  +'</div>'
  +'</div>'
  +'<div class="row">'
  +'<ul class="nav nav-tabs" id="language">'
  +'<?php foreach ($languages as $language) { ?>'
  +'<li>'
  +'<a href="#language<?php echo $language["language_id"]; ?>" data-toggle="tab">'
  +'<?php if (sizeof($languages) > 1): ?>'
  +'<img src="view/image/flags/<?php echo $language["image"]; ?>" title="<?php echo $language["name"]; ?>" /> <?php echo $language["name"]; ?>'
  +'<?php endif ?>'
  +'</a>'
  +'</li>'
  +'<?php } ?>'
  +'</ul>'
  +'<div class="col-md-12">'
  +'<?php foreach ($languages as $language) { ?>'
  +'<div class="tab-pane active" id="language<?php echo $language["language_id"]; ?>">'
  +'<div class="form-group required">'
  +'<label class="col-sm-2 control-label" for="input-title<?php echo $language["language_id"]; ?>">Room Name [Ar]</label>'
  +'<div class="col-sm-10">'
  +'<input type="text" name="hotel_room['+room_row+'][hotel_room_description][<?php echo $language["language_id"]; ?>][room_name]" value="" placeholder="Room Name [Ar]" id="input-title<?php echo $language["language_id"]; ?>" class="form-control" />'
  +'<?php if (isset($error_room_name[$language["language_id"]])) { ?>'
  +'<div class="text-danger"><?php echo $error_room_name[$language["language_id"]]; ?></div>'
  +'<?php } ?>'
  +'</div>'
  +'</div>'
  +'<div class="form-group required ">'
  +'<label class="col-sm-2 control-label" for="input-content">Room Description</label>'
  +'<div class="col-sm-10">'
  +'<textarea name="hotel_room['+room_row+'][hotel_room_description][<?php echo $language["language_id"]; ?>][room_description]" placeholder=" Room Description" id="input-content<?php echo $language["language_id"]; ?>" class="form-control editor"></textarea>'
  +'<?php if (isset($error_content[$language["language_id"]])) { ?>'
  +'<div class="text-danger"><?php echo $error_content[$language["language_id"]]; ?></div>'
  +'<?php } ?>'
  +'</div>'
  +'</div>'
  +'</div>'
  +'<?php } ?>'
  +'<hr>'
  +'</div>'
  +'</div>'
  +'</div>'
  +'</div><hr>';

  $('#new_rooms').append(room);
  room_row++;
}


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
