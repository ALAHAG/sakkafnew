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
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3> <span></span> 
        </div>
        <div class="panel-body">
          <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
              <div id="tab-general">
                <div>
                  <div class="col-lg-12">
                   <div class="form-group">

                    <label class="col-md-2 col-sm-4 col-xs-6 control-label">Customer Name</label>
                    <div class="col-md-10 col-sm-8 col-xs-6 ">
                      <input class="form-control" type="text" name="name" size="100" value="<?php echo isset($name) ? $name : ''; ?>" />
                      <input type="hidden" name="testimonial_id" value="<?php echo isset($testimonial_id) ? $testimonial_id : ''; ?>" />
                    </div>
                  </div>
                  <div class="form-group">

                    <label class="col-md-2 col-sm-4 col-xs-6 control-label">Customer Phone</label>
                    <div class="col-md-10 col-sm-8 col-xs-6 ">

                      <input class="form-control" type="text" name="phone" size="100" value="<?php echo isset($phone) ? $phone : ''; ?>" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 col-sm-4 col-xs-6 control-label">Testemonial Type</label>
                    <div class="col-md-10 col-sm-8 col-xs-6 ">
                      <div class="col-sm-6">
                        <label><input type="radio" name="testimonial_type" value="1" <?php echo isset($testimonial_type) && $testimonial_type == 1 ? 'checked' : ''?> > Text</label>
                      </div>
                      <div class="col-sm-6">
                        <label><input type="radio" name="testimonial_type" value="2" <?php echo isset($testimonial_type) && $testimonial_type == 2 ? 'checked' : ''?> > Video</label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group" id="testimonial_body">
                    <label class="col-md-2 col-sm-4 col-xs-6 control-label">Testemonial</label>
                    <div class="col-md-10 col-sm-8 col-xs-6 ">
                    <textarea class="form-control"  name="testimonial_body" rows="4"><?php echo isset($testimonial_body) ? trim(preg_replace( "/\r|\n/", " ", $testimonial_body)) : ''; ?></textarea>'
                    </div>
                  </div>

                      <input type="hidden" name="company_rate" value="<?php echo isset($company_rate) ? $company_rate : '10'; ?>" />
<!--                  <div class="form-group">

                     <label class="col-md-2 col-sm-4 col-xs-6 control-label">Company Rate : </label>
                    <div class="col-md-10 col-sm-8 col-xs-6 ">
                    <select id="input-type" name='company_rate' class="form-control" >
                      <?php for ($i = 1; $i < 11 ; $i++): ?>
                        <option value="<?php echo $i?>" <?php if(isset($company_rate) && $company_rate == $i) echo 'selected="selected"';?>> <?php echo $i;?> / 10 </option>
                      <?php endfor ?>
                    </select>
                    </div>
                   </div>-->
                  <div class="form-group">
                   <label class="col-md-2 col-sm-4 col-xs-6 control-label">Customer Country : </label>
                   <div class="col-md-10 col-sm-8 col-xs-6 ">
                    <input class="form-control" type="text" name="country" size="100" value="<?php echo isset($country) ? $country : ''; ?>" />

                  </div>
                </div>
              </div>
              <div class="form-group">
              <label class="col-md-2 col-sm-4 col-xs-6 control-label">Customer Image : </label>
             <div class="col-md-4">
              <a href="" id="thumb-image100200" data-toggle="image" class="img-thumbnail">
              <img  width="200" src="<?php echo HTTP_IMAGE; ?><?php echo $customer_image; ?>" alt="" title="" data-placeholder="<?php echo HTTP_IMAGE; ?>no_image.png" />
              </a>
              <input type="hidden" name="customer_image" value="<?php echo isset($customer_image) ? $customer_image : ''; ?>" id="package_image" />

            </div>

              </div>
              <p></p>
            </div>
            <div style="clear:both;"></div>
            <p></p>
            <div class="col-lg-12">
              <div class="form-group"> 
                <label class="col-md-2 col-sm-4 col-xs-6 control-label"><?php echo $entry_status; ?></label>
                <div class="col-sm-6">
                  <select class="form-control" name="status">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected">published</option>
                    <option value="0">unpublished</option>
                    <?php } else { ?>
                    <option value="1">published</option>
                    <option value="0" selected="selected">unpublished</option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

<script type="text/javascript">
  function checkType () {
    testimonial_type = $('[name="testimonial_type"]:checked').val();
    if(testimonial_type == 1 ){
      $('#testimonial_body').html('<label class="col-md-2 col-sm-4 col-xs-6 control-label">Testemonial</label>'
                    +'<div class="col-md-10 col-sm-8 col-xs-6 ">'
                    +'<textarea class="form-control"  name="testimonial_body" rows="4"><?php echo isset($testimonial_body) ? trim(preg_replace( "/\r|\n/", " ", $testimonial_body)) : ''; ?></textarea>'
                    +'</div>');
    }else if(testimonial_type == 2){
      $('#testimonial_body').html('<label class="col-md-2 col-sm-4 col-xs-6 control-label">Testemonial Video Link</label>'
                    +'<div class="col-md-10 col-sm-8 col-xs-6 ">'
                    +'<input class="form-control"  name="testimonial_body" value="<?php echo isset($testimonial_body) ? trim(preg_replace( "/\r|\n/", " ", $testimonial_body)) : ''; ?>" >'
                    +'</div>');
    }
  }

  $(document).ready(function () {
    checkType();
    $('[name="testimonial_type"]').click(function () {
      checkType();
    })
  })

</script>

<?php echo $footer; ?>