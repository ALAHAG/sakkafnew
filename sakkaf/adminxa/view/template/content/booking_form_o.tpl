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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
          <div class="tab-content">
              <div class="row">
              <?php if ($booking_id): ?>
                <div class="form-group col-md-4">
                  <label class="col-sm-6 control-label" > <?php echo $entry_booking_id; ?> </label>
                  <div class="col-sm-6">
                    <div class="input-group">
                      <span class="input-group-addon" id="basic-addon1"><?php echo BOOKING_PREFIX.$booking_id ?></span>
                    </div>
                  </div>
                </div>
              <?php endif ?>
                <div class="form-group col-md-4">
                  <label class="col-sm-6 control-label" > <?php echo $entry_package_id; ?> </label>
                  <div class="col-sm-6">
                    <div class="input-group">
                      <span class="input-group-addon" id="basic-addon1"><?php echo PACKAGE_PREFIX ?></span>
                      <input type="text" name="itinerary_id" value="<?php echo $itinerary_id; ?>" placeholder="<?php echo $entry_package_id; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
              <?php if ($booking_id): ?>
                <div class="form-group col-md-4">
                  <label class="col-sm-6 control-label" > <?php echo $entry_time_added; ?> </label>
                  <div class="col-sm-6">
                    <div class="input-group">
                      <span class="input-group-addon" id="basic-addon1"><?php echo $time_added ?></span>
                    </div>
                  </div>
                </div>
              <?php endif ?>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" > <?php echo $entry_customer_name_ar; ?> </label>
                <div class="col-sm-10">
                  <input type="text" name="customer_name_ar" value="<?php echo $customer_name_ar; ?>" placeholder="<?php echo $entry_customer_name_ar; ?>" class="form-control" />
                  <?php if (isset($error_customer_name_ar) && $error_customer_name_ar) { ?>
                  <div class="text-danger"><?php echo $error_customer_name_ar; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" > <?php echo $entry_customer_name_en; ?> </label>
                <div class="col-sm-10">
                  <input type="text" name="customer_name_en" value="<?php echo $customer_name_en; ?>" placeholder="<?php echo $entry_customer_name_en; ?>" class="form-control" />
                  <?php if (isset($error_customer_name_en) && $error_customer_name_en) { ?>
                  <div class="text-danger"><?php echo $error_customer_name_en; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" > <?php echo $entry_customer_country; ?> </label>
                <div class="col-sm-10">
                  <input type="text" name="customer_country" value="<?php echo $customer_country; ?>" placeholder="<?php echo $entry_customer_country; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" > <?php echo $entry_phone; ?> </label>
                <div class="col-sm-10">
                  <input type="text" name="phone" value="<?php echo $phone; ?>" placeholder="<?php echo $entry_phone; ?>" class="form-control" />
                  <?php if (isset($error_phone) && $error_phone) { ?>
                  <div class="text-danger"><?php echo $error_phone; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" > <?php echo $entry_email; ?> </label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" class="form-control" />
                  <?php if (isset($error_email) && $error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required col-sm-6">
                <label class="col-sm-6 control-label" > <?php echo $entry_arrival_date; ?> </label>
                <div class="col-sm-6">
                  <input type="text" name="arrival_date" value="<?php echo $arrival_date; ?>" placeholder="<?php echo $entry_arrival_date; ?>" class="form-control" />
                  <?php if (isset($error_arrival_date) && $error_arrival_date) { ?>
                  <div class="text-danger"><?php echo $error_arrival_date; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required col-sm-6">
                <label class="col-sm-6 control-label" > <?php echo $entry_departure_date; ?> </label>
                <div class="col-sm-6">
                  <input type="text" name="departure_date" value="<?php echo $departure_date; ?>" placeholder="<?php echo $entry_departure_date; ?>" class="form-control" />
                  <?php if (isset($error_departure_date) && $error_departure_date) { ?>
                  <div class="text-danger"><?php echo $error_departure_date; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" > <?php echo $entry_booking_type; ?> </label>
                <div class="col-sm-10">
                  <select name="booking_type"  class="form-control">
                    <option value="1" <?php echo $booking_type == 1 ? 'selected' :'' ?>>برنامج كامل (طيران دولي وداخلي -فنادق-جولات-مواصلات )</option>
                    <option value="2" <?php echo $booking_type == 2 ? 'selected' :'' ?>>فنادق -طيران داخلي-مواصلات -جولات سياحية</option>
                    <option value="3" <?php echo $booking_type == 3 ? 'selected' :'' ?>>فنادق -طيران داخلي- و مواصلات فقط</option>   
                    <option value="4" <?php echo $booking_type == 4 ? 'selected' :'' ?>>مواصلات و جولات سياحية فقط</option>   
                    <option value="5" <?php echo $booking_type == 5 ? 'selected' :'' ?>>مواصلات  فقط</option>
                    <option value="6" <?php echo $booking_type == 6 ? 'selected' :'' ?>>جولات سياحية فقط</option>
                    <option value="7" <?php echo $booking_type == 7 ? 'selected' :'' ?>>طيران داخلي فقط</option>
                  </select>
                  <?php if (isset($error_booking_type) && $error_booking_type) { ?>
                  <div class="text-danger"><?php echo $error_booking_type; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required col-sm-4">
                <label class="col-sm-6 control-label" > <?php echo $entry_num_adults; ?> </label>
                <div class="col-sm-6">
                  <input type="text" name="num_adults" value="<?php echo $num_adults; ?>" placeholder="<?php echo $entry_num_adults; ?>" class="form-control" />
                  <?php if (isset($error_num_adults) && $error_num_adults) { ?>
                  <div class="text-danger"><?php echo $error_num_adults; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required col-sm-4">
                <label class="col-sm-6 control-label" > <?php echo $entry_num_children; ?> </label>
                <div class="col-sm-6">
                  <input type="text" name="num_children" value="<?php echo $num_children; ?>" placeholder="<?php echo $entry_num_children; ?>" class="form-control" />
                  <?php if (isset($error_num_children) && $error_num_children) { ?>
                  <div class="text-danger"><?php echo $error_num_children; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group col-sm-4">
                <label class="col-sm-6 control-label" > <?php echo $entry_num_bags; ?> </label>
                <div class="col-sm-6">
                  <input type="text" name="num_bags" value="<?php echo $num_bags; ?>" placeholder="<?php echo $entry_num_bags; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group col-sm-12">
                <label class="col-sm-2 control-label" > <?php echo $entry_notes; ?> </label>
                <div class="col-sm-10">
                  <textarea  name="notes"  placeholder="<?php echo $entry_notes; ?>" class="form-control" ><?php echo $notes; ?></textarea>
                </div>
              </div>


             <div class="form-group">
                <input type="hidden" name="booking_id" value="<?php echo $booking_id; ?>" />
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
        <hr>
        <div class="col-md-12">
          <div class="col-md-6"> <a href="<?php echo $create_quotation; ?>" class="btn btn-primary" > <?php echo $text_create_quotation ?> </a> </div>
          <!-- <div class="col-md-6"> <a href="<?php // echo $create_confirmation; ?>" class="btn btn-primary" > Create Confirmation </a> </div> -->
        </div>
        <?php if (isset($booking_history) && $booking_history ): ?>
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_quotations_confirmations ?></h3>
        </div>
          <table class="table">
            <tr>
              <td>ID </td>
              <td>Title </td>
              <td>Price </td>
              <td>Modify Quotation </td>
              <td>Create Confirmation </td>
              <td>View Itinerary </td>
            </tr>
            <?php foreach ($booking_history as $history): ?>
            <tr <?php echo ($history['itinerary_class'] == 3 )? 'style="background:#f2f2f2;"' : ''?>>
              <td><?php echo $history['itinerary_class'] == 2 ? QUOTATION_PREFIX : CONFIRMATION_PREFIX; echo $history['itinerary_id']  ?></td>
              <td><?php echo $history['itinerary_title'] ?> </td>
              <td><?php echo $history['customer_price'] ?> </td>
              <td>
                <?php if ($history['itinerary_class'] == 2 ): ?>
                <a href="<?php echo $link_modify_quotation.'&itinerary_id='.$history['itinerary_id'] ?>" class="btn btn-primary" > Modify Quotation </a>
                <?php elseif ($history['itinerary_class'] == 3 ): ?>
                  <a  href="<?php echo $link_view_itinerary.'&itinerary_id='.$history['itinerary_id'] ?>" class="btn btn-primary itinerary fancybox.ajax" > View  Vouchers</a>
                <?php endif ?>
              </td>
              <td>
                <?php if ($history['itinerary_class'] == 2 ): ?>
                <a href="<?php echo $link_create_confirmation.'&itinerary_id='.$history['itinerary_id'] ?>" class="btn btn-primary" > Create Confirmation </a>
                <?php elseif ($history['itinerary_class'] == 3 ): ?>
                <!-- Single button -->
                <div class="btn-group">
                  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Summery & Invoice <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li>
                      <a  href="<?php echo $link_view_summery.'&itinerary_id='.$history['itinerary_id'] ?>" class="itinerary fancybox.ajax" > View Summery </a>
                    </li>
                    <li>
                      <a  href="<?php echo $link_pdf_summery.'&itinerary_id='.$history['itinerary_id'] ?>" > Download Summery </a>
                    </li>
                    <li>
                      <a  href="<?php echo $link_view_invoice.'&itinerary_id='.$history['itinerary_id'] ?>" class="itinerary fancybox.ajax" > View invoice </a>
                    </li>
                    <li>
                      <a  href="<?php echo $link_pdf_invoice.'&itinerary_id='.$history['itinerary_id'] ?>" > Download invoice </a>
                    </li>
                  </ul>
                </div>
                  
                <?php endif ?>
              </td>
              <td>
                <div class="btn-group">
                  <a  href="<?php echo $link_view_itinerary.'&itinerary_id='.$history['itinerary_id'] ?>" class="btn btn-primary itinerary fancybox.ajax" > View Itinerary </a>
                  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li>
                      <a href="<?php echo $link_pdf_itinerary.'&itinerary_id='.$history['itinerary_id'] ?>"  > Download Itinerary </a>
                    </li>
                    <li>
                      <a style="cursor:pointer;" class="send" id="<?php echo $history['itinerary_id'] ?>" > Send Itinerary </a>
                    </li>
                  </ul>
                </div>
              </td>
            </tr>
            <?php endforeach ?>
          </table>

        <?php endif ?>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--
  $(".itinerary").fancybox({
    maxWidth  : 1000,
    fitToView : false,
    width   : '90%',
    height    : '100%',
    autoSize  : false,
    closeClick  : false,
    openEffect  : 'none',
    closeEffect : 'none'
  });

  $('.send').click(function () {
    var id = this.id;
    $.ajax({
      url: '<?php echo $link_send_itinerary; ?>&itinerary_id='+id,
      method: 'post',
      beforeSend: function() {
          // setting a timeout
          $('body').append('<div id="loading" style="width: 100%;height: 300%;overflow: hidden;background: rgba(0,0,0,0.5);position: absolute;top: 0px;z-index: 1000;"><i class="fa-li fa fa-spinner fa-spin" style="color: #fff;margin: 270px 0px 0px 710px;font-size: 2em;"></i></li></div>');

      },
      complete: function() {
        $('#loading').remove();
      },
      success: function (res) {
        alert("Sent")
      }
    })

  })

</script>
<?php echo $footer; ?>