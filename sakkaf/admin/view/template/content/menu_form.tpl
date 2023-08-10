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
            <div class="tab-pane active" id="tab-general">
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-menu-class"><?php echo $entry_menu_class; ?></label>
              <div class="col-sm-10">
                <select id="menu_class" name="menu_class" class="form-control" id="input-menu-class">
                  <option value="1" <?php echo isset($menu_class) && $menu_class == "1" ? 'selected' : '' ?>>Content Page</option>
                  <option value="2" <?php echo isset($menu_class) && $menu_class == "2" ? 'selected' : '' ?>>Direct to Link</option>
                  <option value="3" <?php echo isset($menu_class) && $menu_class == "3" ? 'selected' : '' ?>>No Link</option>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-menu-parent"><?php echo $entry_menu_parent; ?></label>
              <div class="col-sm-10">
                <select name="menu_parent" class="form-control" id="input-menu-parent">
                  <option value="0" <?php echo $menu_parent == 0 ? 'selected' : '' ?>>Parent</option>
                <?php foreach ($main_menu as $menu): ?>
                  <option value="<?php echo $menu['menu_id'] ?>" <?php echo $menu_parent == $menu['menu_id'] ? 'selected' : '' ?>><?php echo $menu['title'] ?></option>
                <?php endforeach ?>
                </select>
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
                      <input type="text" name="menu_content[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($menu_content[$language['language_id']]) ? $menu_content[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required has-content">
                    <label class="col-sm-2 control-label" for="input-content"><?php echo $entry_page_content; ?></label>
                    <div class="col-sm-10">
                      <textarea name="menu_content[<?php echo $language['language_id']; ?>][content]" placeholder="<?php echo $entry_content; ?>" id="input-content<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($menu_content[$language['language_id']]) ? $menu_content[$language['language_id']]['content'] : ''; ?></textarea>
                      <?php if (isset($error_content[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_content[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group has-content">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="menu_content[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($menu_content[$language['language_id']]) ? $menu_content[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
                <hr>
              </div>
              <div class="form-group required has-link">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" id="slug" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if (isset($error_keyword[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_keyword[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
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
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-content<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script> 
  <script type="text/javascript"><!--

  menuClass();
$('#language a:first').tab('show');

$('#menu_class').change(function () {
  menuClass();
})

$('#slug').focus(function  () {
  if (this.value == '') {
    $(this).val(getSlug($('[name="menu_content[1][title]"]').val()));
  };
})

$('#slug').change(function  () {
  if($('#menu_class').val() != 2){
    $(this).val(getSlug(this.value));
  }
})

function menuClass () {
  if ($('#menu_class').val() == 2) {
    $('.has-content').hide();
    $('.has-link').show();
  }else if ($('#menu_class').val() == 3) {
    $('.has-content').hide();
    $('.has-link').hide();
  }else{
    $('.has-content').show();
    $('.has-link').show();
  };
  
}

//--></script></div>
<?php echo $footer; ?>