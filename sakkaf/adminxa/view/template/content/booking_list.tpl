<?php echo $header; ?><?php echo $column_left; ?>

    <div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div id="notifications">
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if ($text_success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $text_success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-model"><?php echo $entry_booking_id; ?></label>
                <div class="input-group">
                  <span class="input-group-addon" id="basic-addon1"><?php echo BOOKING_PREFIX ?></span>
                  <input type="text" name="filter_id" value="<?php echo $filter_id; ?>" placeholder=" <?php echo $entry_booking_id; ?>" id="input-code" class="form-control" />
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"> <?php echo $entry_customer_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_customer_name; ?>" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">

              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>

          <div class="table-responsive">
            <table id="images" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $entry_booking_id; ?></td>
                  <td class="text-left"><?php echo $entry_customer_name; ?></td>
                  <td class="text-left">Time</td>
                  <td class="text-left"><?php echo $entry_action; ?></td>
              </thead>
              <tbody>
                <?php foreach ($bookings as $booking) { ?>
                <tr>
                  <td class="text-left">
                    <?php echo BOOKING_PREFIX.$booking['booking_id'] ?>
                  </td>

                  <td class="text-left">
                    <?php echo $booking['customer_name_ar'] ?>
                  </td>
                   <td class="text-left">
                    <?php echo $booking['time_added'] ?>
                  </td>
                  <td class="text-right">
                      <a href="<?php echo $booking['edit'] ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                      <a href="<?php echo $booking['delete'] ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick=' if (!confirm("Are You Sure! You Want To Delete <?php echo $booking['customer_name_ar'] ?> Category?!!")) return false ;'><i class="fa fa-trash-o"></i></a>
                  </td>
                <?php } ?>
              </tbody>
            </table>

          </div>
          <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
          </div>

      </div>
    </div>
  </div>
</div>

  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  var url = '<?php echo $filter ?>';

  var filter_name = $('input[name=\'filter_name\']').val();

  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_id = $('input[name=\'filter_id\']').val();

  if (filter_id) {
    url += '&filter_id=' + encodeURIComponent(filter_id);
  }

  // var filter_status = $('select[name=\'filter_status\']').val();

  // if (filter_status != '*') {
  //   url += '&filter_status=' + encodeURIComponent(filter_status);
  // }

  location = url;
});
//--></script>
<?php echo $footer; ?>
