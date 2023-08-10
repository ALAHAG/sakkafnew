<?php echo $header; ?><?php echo $column_left; ?>

    <div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
      </div>
      <h1><?php echo $category_name; ?></h1>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $category_name; ?> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">

          <div class="table-responsive">
            <table id="images" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $category_name; ?></td>
                  <td class="text-left"><?php echo $entry_action; ?></td>
              </thead>
              <tbody>
                <?php foreach ($pages as $page) { ?>
                <tr>
                  <td class="text-left">
                    <?php echo $page['title'] ?>
                  </td>
                  <td class="text-right">
                      <a href="<?php echo $page['edit'] ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                      <a href="<?php echo $page['delete'] ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick=' if (!confirm("Are You Sure! You Want To Delete <?php echo $page['title'] ?> Page?!!")) return false ;'><i class="fa fa-trash-o"></i></a>
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

<script type="text/javascript">

</script>
<?php echo $footer; ?>