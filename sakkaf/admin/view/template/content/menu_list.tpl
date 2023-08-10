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

        <div class="dd">
          <ol class="dd-list">
            <?php foreach ($menu as $key => $value): ?>
              <li class="dd-item" data-id="<?php echo $key ?>">
                <div class="pull-right">
                  <a class="btn btn-md btn-primary" href="<?php echo $value['edit'] ?>"><i class="fa fa-edit"></i></a>
                  <a class="btn btn-md btn-danger delete" href="<?php echo $value['delete'] ?>"><i class="fa fa-trash-o"></i></a>
                </div>
                <div class="dd-handle"><?php echo $value['title'] ?></div>
                  <?php if (isset($value['children'])): ?>
                  <ol class="dd-list">
                    <?php foreach ($value['children'] as $id => $child): ?>
                      <li class="dd-item" data-id="<?php echo $id ?>">
                        <div class="pull-right">
                          <a class="btn btn-md btn-primary" href="<?php echo $child['edit'] ?>"><i class="fa fa-edit"></i></a>
                          <a class="btn btn-md btn-danger delete" href="<?php echo $child['delete'] ?>"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="dd-handle"><?php echo $child['title'] ?></div>
                      </li>
                    <?php endforeach ?>
                  </ol>
                  <?php endif ?>
              </li>
            <?php endforeach ?>
          </ol>

        </div>

      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
      $(document).ready(function(){

       $('.dd').nestable();

       // $('#save').click(function () {
       //   console.log($('.dd').nestable('serialize'));
       // })

        $('.dd').on('change', function() {
          $.ajax({
            type: "POST",
            url: "<?php echo $order; ?>",
            data: {data : JSON.stringify($('.dd').nestable('serialize'))} 
          })
            .done(function( msg ) {
              if (msg) {
                $('#notifications').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Menu Order Has Been Updated Successfully<button type="button" class="close" data-dismiss="alert">&times;</button></div>')
              };
            });

        })

        $('.delete').click(function (e) {
          if (!confirm(' Confirm ') )
            {
              e.preventDefault()
            }
        })

    });
</script>
<?php echo $footer; ?>