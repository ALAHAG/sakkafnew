<?php echo $header; ?><?php echo $column_left; ?>

    <div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-attribute').submit() : false;"><i class="fa fa-trash-o"></i></button>

        <button type="button" data-toggle="tooltip" title="Save" class="btn btn-success" id="save"><i class="fa fa-save"></i></button>
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
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">

          <div class="table-responsive">
          <form action="<?php echo $action ?>" method="post" >
            <table id="images" class="table table-striped table-bordered table-hover">
              <thead>
                <tr id="image-row0">
                  <td class="text-left"><?php echo $entry_image; ?></td>
                  <td class="text-left"><?php echo $entry_link; ?></td>
                  <?php if (sizeof($languages) > 1 ): ?>                 
                  <td class="text-left"><?php echo $entry_language; ?></td>
                  <?php endif ?>
                  <td class="text-right"><?php echo $entry_status; ?></td>
                  <td><button type="button" onclick="addImage(0);" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
              </thead>
              <tbody>
                <?php $slider_row = 1; ?>
                <?php foreach ($sliders as $slider) { ?>
                <tr id="image-row<?php echo $slider_row; ?>">
                  <td class="text-left">
                    <a href="" id="thumb-image<?php echo $slider_row; ?>" data-toggle="image" class="img-thumbnail">
                      <img src="<?php echo $slider['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                    </a>
                    <input type="hidden" name="slider[<?php echo $slider_row; ?>][image]" value="<?php echo $slider['image']; ?>" id="input-image<?php echo $slider_row; ?>" />
                  </td>
                  <td class="text-right">
                    <input type="text" name="slider[<?php echo $slider_row; ?>][url]" value="<?php echo $slider['url']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                  </td>
                  <?php if (sizeof($languages) > 1 ): ?>                 
                  <td class="text-right">
                    <input type="text" name="slider[<?php echo $slider_row; ?>][language_id]" value="<?php echo $slider['language_id']; ?>" placeholder="<?php echo $entry_language; ?>" class="form-control" />
                  </td>
                  <?php endif ?>
                  <td class="text-right">
                    <?php if (sizeof($languages) == 1 ): ?>                 
                      <input type="hidden" name="slider[<?php echo $slider_row; ?>][language_id]" value="<?php echo end($languages)['language_id']; ?>"  />
                    <?php endif ?>
                    <select name="slider[<?php echo $slider_row; ?>][status]" class="form-control">
                      <option value="1" <?php echo $slider['status'] = 1 ? 'selected' : ''; ?>>Published</option>
                      <option value="0" <?php echo $slider['status'] = 0 ? 'selected' : ''; ?>>unpublished</option>
                    </select>
                  </td>
                  <td class="text-left">
                    <button type="button" onclick="$('#image-row<?php echo $slider_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                    <button type="button" onclick="addImage(<?php echo $slider_row; ?>);" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
                <?php $slider_row++; ?>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="2"></td>
                  <td class="text-left">
                    <input type="submit" class="btn btn-primary" value="Save"></td>
                  <td colspan="2"></td>
                </tr>
              </tfoot>
            </table>
            </form>
          </div>

      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
 var slider_row = <?php echo $slider_row; ?>;

function addImage (row) {
  var row_content = '<tr id="image-row'+slider_row+'">'
                  +'<td class="text-left">'
                    +'<a href="" id="thumb-image'+slider_row+'" data-toggle="image" class="img-thumbnail">'
                      +'<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />'
                    +'</a>'
                    +'<input type="hidden" name="slider['+slider_row+'][image]" value="" id="input-image'+slider_row+'" />'
                  +'</td>'
                  +'<td class="text-right">'
                    +'<input type="text" name="slider['+slider_row+'][url]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" />'
                  +'</td>'
                  +'<?php if (sizeof($languages) > 1 ): ?>'
                  +'<td class="text-right">'
                    +'<input type="text" name="slider['+slider_row+'][language_id]" value="" placeholder="<?php echo $entry_language; ?>" class="form-control" />'
                  +'</td>'
                  +'<?php endif ?>'
                  +'<td class="text-right">'
                    +'<?php if (sizeof($languages) == 1 ): ?>'
                      +'<input type="hidden" name="slider['+slider_row+'][language_id]" value="<?php echo end($languages)["language_id"]; ?>"  />'
                    +'<?php endif ?>'
                    +'<select name="slider['+slider_row+'][status]" class="form-control">'
                      +'<option value="1">Published</option>'
                      +'<option value="0">unpublished</option>'
                    +'</select>'
                  +'</td>'
                  +'<td class="text-left">'
                    +'<button type="button" onclick="$(\'#image-row'+slider_row+'\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button> '
                    +'<button type="button" onclick="addImage('+slider_row+');" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>'
                +'</tr>';


  $(row_content).insertAfter('#image-row'+row)
  slider_row++;
}

</script>
<?php echo $footer; ?>