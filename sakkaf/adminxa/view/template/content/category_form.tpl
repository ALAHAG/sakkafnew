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
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-category_name"><span data-toggle="tooltip" title="<?php echo $help_category_name; ?>"><?php echo $entry_english_category_name; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category_name" value="<?php echo $category_name; ?>" placeholder="<?php echo $entry_english_category_name; ?>" id="input-category_name" class="form-control" />
                  <?php if (isset($error_category_name) && $error_category_name) { ?>
                  <div class="text-danger"><?php echo $error_category_name; ?></div>
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
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="category_content[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($category_content[$language['language_id']]) ? $category_content[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_title) && $error_title) { ?>
                      <div class="text-danger"><?php echo $error_title; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <?php } ?>
                <hr>
              </div>

             <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-category_name"><span data-toggle="tooltip" title="Meta Descripions">Meta Descripions</span></label>
                <div class="col-sm-10">
                  <textarea  name="Meta_descripions" value="" placeholder="<?php echo $entry_english_Meta_descripions; ?>" id="input-Meta_descripions" class="form-control" ><?php echo isset($category_content[$language['language_id']]) ? $category_content[$language['language_id']]['Meta_descripions'] : ''; ?></textarea>
                  <?php if (isset($error_Meta_descripions) && $error_Meta_descripions) { ?>
                  <div class="text-danger"><?php echo $error_Meta_descripions; ?></div>
                  <?php } ?>
                </div>
                <hr>
              </div>
             <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-category_name"><span data-toggle="tooltip" title="Meta title">Meta Title</span></label>
                <div class="col-sm-10">
                  <input type="input"  name="Meta_title" value="<?php echo isset($category_content[$language['language_id']]) ? $category_content[$language['language_id']]['Meta_title'] : ''; ?>" placeholder="<?php echo $entry_english_Meta_title; ?>" id="input-Meta_title" class="form-control" />
                  <?php if (isset($error_Meta_title) && $error_Meta_title) { ?>
                  <div class="text-danger"><?php echo $error_Meta_title; ?></div>
                  <?php } ?>
                </div>
                <hr>
              </div>

              <div class="form-group ">
                <label class="col-sm-2 control-label" ><?php echo $entry_options; ?></label>
                <?php if ($category_type == 2): ?>
                <div class="col-sm-5">
                  <label><input type="checkbox" name="city_related" value="1" <?php echo $city_related == 1 ? 'checked' : '' ?> /> Related To Cities</label>
                </div>
                <?php endif ?>
                <div class="col-sm-5">
                  <label><input type="checkbox" name="show_in_index" value="1" <?php echo $show_in_index == 1 ? 'checked' : '' ?> /> Show in Home Page</label>
                </div>
              </div>
              <?php if ($category_type == 2): ?>
              <div class="form-group required has-link">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" id="slug" name="keyword" value="<?php echo $slug; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if (isset($error_keyword) && $error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
             <?php endif ?>
             <div class="form-group">
                <input type="hidden" name="category_id" value="<?php echo $category_id; ?>" />
                <input type="hidden" name="category_type" value="<?php echo $category_type; ?>" />
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
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status">country</label>
                <div class="col-sm-10">
                  <select name="country_id" id="input-status" class="form-control">
                    <?php if($country_id){?>
                      <option value="<?php echo $country_id?>" selected="selected"><?php echo $country_name ?></option>
                    <?php } ?>
                     <?php foreach ($countries as  $country) {?>


                       <option value="<?php echo $country['country_id']?>"><?php echo $country["name_ar"] ?></option>

                    <?php }?>
                  </select>
                </div>
              </div>

              <div class="center-block"> <input type="submit" value="Save" class="center-block btn btn-primary"> </div>
          </div>
        </form>
      </div>
    </div>
  </div>

<script type="text/javascript"><!--

$('#language a:first').tab('show');


$('#slug').focus(function  () {
  if (this.value == '') {
    $(this).val(getSlug($('[name="category_name"]').val()));
  };
})

$('#slug').change(function  () {
    $(this).val(getSlug(this.value));
})

</script>
<?php echo $footer; ?>
