<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $$itinerary_class ?></h1>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $$itinerary_class ?> <?php echo $text_editor; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter" class="form-horizontal">
          <div class="row">
            <div class="col-md-8">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="itinerary_title"><?php echo $entry_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="itinerary_title" value="<?php echo $itinerary_title; ?>" placeholder="<?php echo $entry_title; ?>" id="itinerary_title" class="form-control" />
                  <?php echo isset($id) ? '<input type="hidden" name="id" value="'.$id.'" >' : '' ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_categories; ?></label>
                <div class="col-sm-10">
                <?php foreach ($categories as $value): ?>
                  <label class="col-sm-2 control-label"><input type="checkbox" name="itinerary_category[]" value="<?php echo $value['category_id'] ?>"
                  <?php echo in_array($value['category_id'], $itinerary_category) ? 'checked' : ''; ?>
                  > 
                    <?php echo $value['category_name'] ?>
                  </label>
                <?php endforeach ?>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <a href="" id="thumb-image100200" data-toggle="image" class="img-thumbnail">
              <img  width="200" src="<?php echo HTTP_IMAGE; ?><?php echo $itinerary_image; ?>" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />
              </a>
              <input type="hidden" name="itinerary_image" value="<?php echo isset($itinerary_image) ? $itinerary_image : ''; ?>" id="input-image100200" />

            </div>
          </div>
          <hr>
          <div class="col-sm-12">
          <div id="itinerary_canvas" class="tasks_block sortable">
            <?php $counter = 0;?>
            <?php if (isset($itinerary)): ?>              
              <?php foreach ($itinerary as $key => $element):?>
                <div id="itinerary_element<?php echo $counter ?>" class="itinerary_element row">
                  <?php if ($element['type'] == 'hotel'): ?>
                    <div class="col-lg-12">
                      <div class="row">
                        <div class="form-group col-lg-4">
                          <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_hotel_name; ?></label>
                          <div class="col-sm-8">
                            <select id="<?php echo $counter ?>" name="room[<?php echo $counter ?>][hotel_id]" class="hotels full-width">
                              <option value="<?php echo $element['hotel_id'] ?>" selected><?php echo $element['hotel_english_name'] ?></option>
                              <?php foreach ($hotels as $hotel): ?>
                                <option value="<?php echo $hotel['hotel_id'] ?>"><?php echo $hotel['hotel_english_name'] ?></option>
                              <?php endforeach ?>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-lg-4">
                          <label class="col-sm-4 control-label" for="room"><?php echo $entry_room_name; ?></label>
                          <div class="col-sm-8">
                            <select id="room<?php echo $counter; ?>" name="room[<?php echo $counter ?>][room_id]" class="form-control">
                              <option value="<?php echo $element['room_id'] ?>" selected><?php echo $element['room_english_name'] ?></option>
                              <?php foreach ($element['hotel_rooms'] as $room): ?>
                                <option value="<?php echo $room['room_id'] ?>"><?php echo $room['room_english_name'] ?></option>
                              <?php endforeach ?>
                            </select>
                          </div>
                        </div>
                        <?php if ($itinerary_class == 'confirmation'): ?>
                        <div class="form-group col-lg-4">
                          <label class="col-sm-4 control-label" for="booking_reference"><?php echo $entry_booking_reference; ?></label>
                          <div class="col-sm-8">
                            <input name="room[<?php echo $counter ?>][booking_reference]" value="<?php echo $element['booking_reference'] ?>" class="form-control">
                          </div>
                        </div>
                      <?php else : ?>
                        <input type="hidden" name="booking_reference" value="0" >
                      <?php endif ?>
                      </div>
                      <div class="form-group col-lg-3 col-sm-6">
                        <label class="col-sm-6 control-label" for="num_of_rooms"><?php echo $entry_num_of_rooms; ?></label>
                        <div class="col-sm-6">
                          <input name="room[<?php echo $counter ?>][num_of_rooms]" value="<?php echo $element['num_of_rooms'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-sm-6">
                        <label class="col-sm-6 control-label" for="num_of_breakfast"><?php echo $entry_num_of_breakfast; ?></label>
                        <div class="col-sm-6">
                          <input name="room[<?php echo $counter ?>][num_of_breakfast]" value="<?php echo $element['num_of_breakfast'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-sm-6">
                        <label class="col-sm-6 control-label" for="num_of_nights"><?php echo $entry_num_of_nights; ?></label>
                        <div class="col-sm-6">
                          <input name="room[<?php echo $counter ?>][num_of_nights]" value="<?php echo $element['num_of_nights'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-sm-6">
                        <label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>
                        <div class="col-sm-6">
                          <input name="room[<?php echo $counter ?>][start_day]" value="<?php echo $element['start_day'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-3 col-sm-6">
                        <label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>
                        <div class="col-sm-6">
                          <input name="room[<?php echo $counter ?>][price]" value="<?php echo $element['price'] ?>" class="price form-control">
                          <input name="room[<?php echo $counter ?>][order]" id="sort_order_<?php echo $counter;?>" type="hidden" value="<?php echo $counter; ?>">
                        </div>
                      </div>
                    </div>
                  <?php endif ?>
                  <?php if ($element['type'] == 'transportation'): ?>
                    <div class="col-md-2"> 
                      <a href="" id="thumb-image<?php echo $counter ?>" data-toggle="image" class="img-thumbnail">
                      <img  width="100" src="<?php echo HTTP_IMAGE; ?><?php echo $element['transportation_image']; ?>" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />
                      </a>
                      <input type="hidden" name="transportation[<?php echo $counter ?>][image]" value="<?php echo $element['transportation_image']; ?>" id="input-image<?php echo $counter ?>" />
                    </div>
                    <div class="col-md-10">
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_title_ar; ?></label>
                        <div class="col-sm-8">
                          <input name="transportation[<?php echo $counter ?>][transportation_title_ar]" value="<?php echo $element['transportation_title_ar'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_description_en; ?></label>
                        <div class="col-sm-8">
                          <textarea name="transportation[<?php echo $counter ?>][transportation_description_en]"  class="form-control"><?php echo $element['transportation_description_en'] ?></textarea>
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_title_en; ?></label>
                        <div class="col-sm-8">
                          <input name="transportation[<?php echo $counter ?>][transportation_title_en]" value="<?php echo $element['transportation_title_en'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_description_ar; ?></label>
                        <div class="col-sm-8">
                          <textarea name="transportation[<?php echo $counter ?>][transportation_description_ar]"  class="form-control"><?php echo $element['transportation_description_ar'] ?></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-md-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="num_of_transportations"><?php echo $entry_num_of_transportations; ?></label>
                        <div class="col-sm-6">
                          <input name="transportation[<?php echo $counter ?>][num_of_transportations]" value="<?php echo $element['num_of_transportations'] ?>" class="form-control">
                        </div>
                      </div>
                      <?php if ($itinerary_class == 'confirmation'): ?>
                      <div class="form-group col-md-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="time"><?php echo $entry_time; ?></label>
                        <div class="col-sm-6">
                          <input name="transportation[<?php echo $counter ?>][time]" value="<?php echo $element['time'] ?>" class="form-control">
                        </div>
                      </div>
                      <?php endif ?>
                      <div class="form-group col-md-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>
                        <div class="col-sm-6">
                          <input name="transportation[<?php echo $counter ?>][start_day]" value="<?php echo $element['start_day'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-md-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>
                        <div class="col-sm-6">
                          <input name="transportation[<?php echo $counter ?>][price]" value="<?php echo $element['price'] ?>" class="price form-control">
                          <input name="transportation[<?php echo $counter ?>][order]" id="sort_order_<?php echo $counter;?>" type="hidden" value="<?php echo $counter; ?>">
                        </div>
                      </div>
                    </div>
                  <?php endif ?>
                  <?php if ($element['type'] == 'tour'): ?>
                    <div class="col-lg-2">
                      <a href="" id="thumb-image<?php echo $counter ?>" data-toggle="image" class="img-thumbnail">
                      <img  width="100" src="<?php echo HTTP_IMAGE; ?><?php echo $element['tour_image']; ?>" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />
                      </a>
                      <input type="hidden" name="tour[<?php echo $counter ?>][image]" value="<?php echo $element['tour_image']; ?>" id="input-image<?php echo $counter ?>" />
                    </div>
                    <div class="col-lg-10">
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_tour_title_ar; ?></label>
                        <div class="col-sm-8">
                          <input name="tour[<?php echo $counter ?>][tour_title_ar]" value="<?php echo $element['tour_title_ar'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_tour_description_en; ?></label>
                        <div class="col-sm-8">
                          <textarea name="tour[<?php echo $counter ?>][tour_description_en]"  class="form-control"><?php echo $element['tour_description_en'] ?></textarea>
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_tour_title_en; ?></label>
                        <div class="col-sm-8">
                          <input name="tour[<?php echo $counter ?>][tour_title_en]" value="<?php echo $element['tour_title_en'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-6">
                        <label class="col-sm-4 control-label" for="hotel"><?php echo $entry_tour_description_ar; ?></label>
                        <div class="col-sm-8">
                          <textarea name="tour[<?php echo $counter ?>][tour_description_ar]"  class="form-control"><?php echo $element['tour_description_ar'] ?></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <?php if ($itinerary_class == 'confirmation'): ?>
                      <div class="form-group col-lg-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="time"><?php echo $entry_time; ?></label>
                        <div class="col-sm-6">
                          <input name="tour[<?php echo $counter ?>][time]" value="<?php echo $element['time'] ?>" class="form-control">
                        </div>
                      </div>
                      <?php endif ?>
                      <div class="form-group col-lg-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>
                        <div class="col-sm-6">
                          <input name="tour[<?php echo $counter ?>][start_day]" value="<?php echo $element['start_day'] ?>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group col-lg-4 col-sm-6">
                        <label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>
                        <div class="col-sm-6">
                          <input name="tour[<?php echo $counter ?>][price]" value="<?php echo $element['price'] ?>" class="price form-control">
                          <input name="tour[<?php echo $counter ?>][order]" id="sort_order_<?php echo $counter;?>" type="hidden" value="<?php echo $counter; ?>">
                        </div>
                      </div>
                    </div>
                  <?php endif ?>
                  <a class="btn btn-xs btn-danger pull-right" onclick="$('#itinerary_element<?php echo $counter ?>').remove();">Remove</a>
                </div>
                <?php $counter++;?>
              <?php endforeach ?>
            <?php endif ?>
          </div>
          </div>
          <div class="row">
            <div class="btn-group col-md-12" role="group">
              <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-plus-circle"></i> Add
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a class="link" id="addHotel">Hotel</a></li>
                <li><a class="link" id="addTransportation">Transportation</a></li>
                <li><a class="link" id="addTour">Tour</a></li>
              </ul>
            </div>
          </div>
          <?php if ($itinerary_class == 'package'): ?>
          <div class="row">
            <div class="form-group">
              <label class="col-md-2 col-sm-4 col-xs-6 control-label" for="hotel"><?php echo $entry_status; ?></label>
              <div class="col-md-10 col-sm-8 col-xs-6 ">
                <select  name="status" class="form-control">
                  <option value="1" <?php echo $status ? 'selected' : '' ?> >Active</option>
                  <option value="0" <?php echo !$status ? 'selected' : '' ?> >Unactive</option>
                </select>
              </div>
            </div>
          <?php else : ?>
                <input type="hidden" name="status" value="1" >
          <?php endif ?>
          </div>
          <div class="row">
            <div class="form-group col-md-4">
              <label class="col-sm-6 control-label" for="total_price"><?php echo $entry_total_price; ?></label>
              <div class="col-sm-6">
                <input id="total_price" name="total_price" value="<?php echo isset($total_price) ? $total_price : 0 ?>" class="form-control">
              </div>
            </div>
            <div class="form-group col-md-4">
              <label class="col-sm-6 control-label" for="markup"><?php echo $entry_profit_percentage; ?></label>
              <div class="col-sm-6">
                <input id="markup" name="markup" value="<?php echo isset($markup) ? $markup : 0 ?>" class="form-control">
              </div>
            </div>
            <div class="form-group col-md-4">
              <label class="col-sm-6 control-label" for="customer_price"><?php echo $entry_customer_price; ?></label>
              <div class="col-sm-6">
                <input id="customer_price" name="customer_price" value="<?php echo isset($customer_price) ? $customer_price : 0 ?>" class="form-control">
              </div>
            </div>
            <?php if ($itinerary_class == 'package'): ?>
            <div class="form-group col-md-12">
              <label class="col-sm-2 control-label" for="customer_price"><?php echo $entry_package_url; ?></label>
              <div class="col-sm-10">
                <input id="slug" name="slug" value="<?php echo isset($slug) ? $slug : '' ?>" class="form-control">
              </div>
            </div>
            <?php endif ?>
          </div>
          <div class="col-md-2 col-md-offset-5"><button class="btn btn-success center">Save</button></div>

        </form>
      </div>
    </div>
  </div>
  </div>
  <script type="text/javascript">
  $( document ).ready(function() {
        sorting();

        counter= <?php echo $counter;?>;

        $('.price').change(function () {
          checkTotalPrice();
        })

        $('#customer_price').keyup(function () {
          var total_price = parseFloat($('#total_price').val());
          var markup = (100 / total_price) *(this.value - total_price);
          $('#markup').val(markup);
        })

        $('#markup').keyup(function () {
          checkTotalPrice();
        })


        $('#addHotel').click(function () {
          var hotel = '<div id="itinerary_element'+counter+'" class="itinerary_element row">'
                          +'<div class="col-lg-12">'
                            +'<div class="row">'
                              +'<div class="form-group col-lg-4">'
                                +'<label class="col-sm-4 control-label" for="hotel"><?php echo $entry_hotel_name; ?></label>'
                                +'<div class="col-sm-8">'
                                  +'<select id="'+counter+'" name="room['+counter+'][hotel_id]" class="hotels full-width">'
                                    +'<option><?php echo $entry_select_hotel; ?></option>';
                                    <?php foreach ($hotels as $hotel): ?>
                hotel +=             '<option value="<?php echo $hotel['hotel_id'] ?>"><?php echo $hotel['hotel_english_name'] ?></option>';
                                    <?php endforeach ?>
                hotel +=          '</select>'
                                +'</div>'
                              +'</div>'
                              +'<div class="form-group col-lg-4">'
                                +'<label class="col-sm-4 control-label" for="room"><?php echo $entry_room_name; ?></label>'
                                +'<div class="col-sm-8">'
                                  +'<select id="room'+counter+'" name="room['+counter+'][room_id]" class="form-control">'
                                    +'<option><?php echo $entry_select_hotel; ?></option>'
                                  +'</select>'
                                +'</div>'
                              +'</div>';
                        <?php if ($itinerary_class == 'confirmation'): ?>
                hotel += '<div class="form-group col-lg-4">'
                          +'<label class="col-sm-4 control-label" for="booking_reference"><?php echo $entry_booking_reference; ?></label>'
                          +'<div class="col-sm-8">'
                            +'<input name="room['+counter+'][booking_reference]" value="" class="form-control">'
                          +'</div>'
                        +'</div>'
                      <?php else : ?>
                hotel += '<input type="hidden" name="booking_reference" value="0" >';
                        <?php endif ?>
                hotel +=  '</div>'
                            +'<div class="form-group col-lg-3 col-md-6">'
                              +'<label class="col-sm-6 control-label" for="num_of_rooms"><?php echo $entry_num_of_rooms; ?></label>'
                              +'<div class="col-sm-6">'
                                +'<input name="room['+counter+'][num_of_rooms]" value="1" class="form-control">'
                              +'</div>'
                            +'</div>'
                            +'<div class="form-group col-lg-3 col-sm-6">'
                              +'<label class="col-sm-6 control-label" for="num_of_breakfast"><?php echo $entry_num_of_breakfast; ?></label>'
                              +'<div class="col-sm-6">'
                                  +'<input name="room['+counter+'][num_of_breakfast]" value="" class="form-control">'
                              +'</div>'
                            +'</div>'
                            +'<div class="form-group col-lg-3 col-md-6">'
                              +'<label class="col-sm-6 control-label" for="num_of_nights"><?php echo $entry_num_of_nights; ?></label>'
                              +'<div class="col-sm-6">'
                                +'<input name="room['+counter+'][num_of_nights]" value="0" class="form-control">'
                              +'</div>'
                            +'</div>'
                            +'<div class="form-group col-lg-3 col-md-6">'
                              +'<label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>'
                              +'<div class="col-sm-6">'
                                +'<input name="room['+counter+'][start_day]" value="" class="form-control">'
                              +'</div>'
                            +'</div>'
                            +'<div class="form-group col-lg-3 col-md-6">'
                              +'<label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>'
                              +'<div class="col-sm-6">'
                                +'<input name="room['+counter+'][price]" value="" class="price form-control">'
                                +'<input name="room['+counter+'][order]" id="sort_order_'+counter+'" type="hidden" value="'+counter+'">'
                              +'</div>'
                            +'</div>'
                          +'</div>'
                          +'<a class="btn btn-xs btn-danger pull-right" onclick="$(\'#itinerary_element'+counter+'\').remove();">Remove</a>'
                      +'</div> ';
          $('#itinerary_canvas').append(hotel);
          sorting();
          $('#'+counter).select2();
          counter++;


          $('.hotels').change(function () {
            var room_element = '#room'+this.id;
            $.ajax({
              url : '<?php echo $get_hotel_rooms ?>',
              data: {hotel_id:this.value},
              method: 'post',
              success: function  (json) {
                var options = '';
                $.each(JSON.parse(json),function(i,e){
                  options += '<option value="'+e.room_id+'">'+e.room_english_name+'</option>';
                })
                $(room_element).html(options);
              }
            })
          })
        })
              

        $('#addTransportation').click(function () {
          var transportation = '<div id="itinerary_element'+counter+'" class="itinerary_element row">'
                        +'<div class="col-lg-2">'
                          +'<a href="" id="thumb-image'+counter+'" data-toggle="image" class="img-thumbnail">'
                          +'<img width="100" src="<?php echo HTTP_IMAGE; ?>no_image.png" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />'
                          +'</a>'
                          +'<input type="hidden" name="transportation['+counter+'][image]" value="" id="input-image'+counter+'" />'
                        +'</div>'
                        +'<div class="col-lg-10">'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_title_ar; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<input name="transportation['+counter+'][transportation_title_ar]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_description_en; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<textarea name="transportation['+counter+'][transportation_description_en]"  class="form-control"></textarea>'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_title_en; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<input name="transportation['+counter+'][transportation_title_en]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="hotel"><?php echo $entry_transportation_description_ar; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<textarea name="transportation['+counter+'][transportation_description_ar]"  class="form-control"></textarea>'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-md-4 col-sm-6">'
                            +'<label class="col-sm-6 control-label" for="num_of_transportations"><?php echo $entry_num_of_transportations; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="transportation['+counter+'][num_of_transportations]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                        <?php if ($itinerary_class == 'confirmation'): ?>
        transportation += '<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="time"><?php echo $entry_time; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="transportation['+counter+'][time]" value="" class="form-control">'
                            +'</div>'
                          +'</div>';
                        <?php endif ?>
         transportation += '<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="transportation['+counter+'][start_day]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="transportation['+counter+'][price]" value="" class="price form-control">'
                              +'<input name="transportation['+counter+'][order]" id="sort_order_'+counter+'" type="hidden" value="'+counter+'">'
                            +'</div>'
                          +'</div>'
                        +'</div>'
                        +'<a class="btn btn-xs btn-danger pull-right" onclick="$(\'#itinerary_element'+counter+'\').remove();">Remove</a>'
                    +'</div> ';
          $('#itinerary_canvas').append(transportation);
          sorting();
          counter++;
        })


        $('#addTour').click(function () {
          var tour = '<div id="itinerary_element'+counter+'" class="itinerary_element row">'
                      +'<div class="col-lg-2">'
                        +'<a href="" id="thumb-image'+counter+'" data-toggle="image" class="img-thumbnail">'
                        +'<img width="100" src="<?php echo HTTP_IMAGE; ?>no_image.png" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />'
                        +'</a>'
                        +'<input type="hidden" name="tour['+counter+'][image]" value="" id="input-image'+counter+'" />'
                      +'</div>'
                        +'<div class="col-lg-10">'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="tour"><?php echo $entry_tour_title_ar; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<input name="tour['+counter+'][tour_title_ar]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="tour"><?php echo $entry_tour_description_en; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<textarea name="tour['+counter+'][tour_description_en]"  class="form-control"></textarea>'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="tour"><?php echo $entry_tour_title_en; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<input name="tour['+counter+'][tour_title_en]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-6">'
                            +'<label class="col-sm-4 control-label" for="tour"><?php echo $entry_tour_description_ar; ?></label>'
                            +'<div class="col-sm-8">'
                              +'<textarea name="tour['+counter+'][tour_description_ar]"  class="form-control"></textarea>'
                            +'</div>'
                          +'</div>';
                        <?php if ($itinerary_class == 'confirmation'): ?>
               tour +=     '<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="time"><?php echo $entry_time; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="tour['+counter+'][time]" value="" class="form-control">'
                            +'</div>'
                          +'</div>';
                        <?php endif ?>
               tour += '<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="start_day"><?php echo $entry_start_day; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="tour['+counter+'][start_day]" value="" class="form-control">'
                            +'</div>'
                          +'</div>'
                          +'<div class="form-group col-lg-4">'
                            +'<label class="col-sm-6 control-label" for="price"><?php echo $entry_price; ?></label>'
                            +'<div class="col-sm-6">'
                              +'<input name="tour['+counter+'][price]" value="" class="price form-control">'
                              +'<input name="tour['+counter+'][order]" id="sort_order_'+counter+'" type="hidden" value="'+counter+'">'
                            +'</div>'
                          +'</div>'
                        +'</div>'
                        +'<a class="btn btn-xs btn-danger pull-right" onclick="$(\'#itinerary_element'+counter+'\').remove();">Remove</a>'
                    +'</div> ';
          $('#itinerary_canvas').append(tour);
          sorting();
          counter++;
        })
    });

    function sorting () {
        $('#itinerary_canvas').sortable({
          onStartDrag: function() {},
          onEndDrag: function() {},
          onChangeOrder: function() {}
      }).bind('sortupdate', function() {
        $("[id^='sort_order']").each(function(idx) {
          $(this).val(idx);

         });
      });
    }

    function checkTotalPrice () {
      var total_price = 0;
      var customer_price = 0;
      $('.price').each(function () {
        total_price += parseFloat(this.value);
      })
      $('#total_price').val(total_price);

      markup = parseFloat($('#markup').val());

      customer_price = total_price + (total_price * markup / 100);

      $('#customer_price').val(customer_price);

    }

    $('form').on("keyup keypress", function(e) {
      var code = e.keyCode || e.which; 
      if (code  == 13) {
        if(e.target.id != 'customer_price'){
           checkTotalPrice();               
        }
        e.preventDefault();
        return false;
      }
    });

    $('#slug').focus(function  () {
      if (this.value == '') {
        $(this).val(getSlug($('#itinerary_title').val()));
      };
    })

    $('#slug').change(function  () {
        $(this).val(getSlug(this.value));
    })

    $('.hotels').select2();
    $('.hotels').change(function () {
        var room_element = '#room'+this.id;
        $.ajax({
          url : '<?php echo $get_hotel_rooms ?>',
          data: {hotel_id:this.value},
          method: 'post',
          success: function  (json) {
            var options = '';
            $.each(JSON.parse(json),function(i,e){
              options += '<option value="'+e.room_id+'">'+e.room_english_name+'</option>';
            })
            $(room_element).html(options);
          }
        })
    })

  </script>
<?php echo $footer; ?> 