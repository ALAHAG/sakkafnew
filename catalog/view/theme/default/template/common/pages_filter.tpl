<div class="toggle-container filters-container">
<!--     <h4 class="search-results-title"><i class="soap-icon-search"></i><b>1,984</b> البحث.</h4>
-->    <form action="<?php echo $action; ?>" id="form" method="GET" role="form">
  <div class="panel style1 arrow-rights box_style_cat">
        <h4 class="heading-orange heading-padding"> بحث        </h4>

      <h4 class="panel-title">
        ابحث حسب مستوى المدن
        <i class="icon-search"></i></h4>

      <div id="amenities-filter" class="panel-collapse ">
          <div class="panel-content">

              <ul class="check-square filters-option ">
                <div class="form-group">
                      <div class="radio">
               <label class="filter">
                              <input type="radio" class="icheckbox_square-grey" id="cat" name="category" value="" > كامل البرامج
               </label>
               </div>
           </div>
           <?php foreach ($cities as $key => $city ): ?>
                  <div class="form-group">
                      <div class="radio">
                          <label>
                              <input type="checkbox" class="icheckbox_square-grey" name="city[<?php echo $key ?>]" value="<?php echo $city['city_id'] ?>" <?php echo isset($get_city) && in_array($city['city_id'],$get_city ) ? 'checked': '' ?>> <?php echo $city['city_ar_name'] ?>
                          </label>
                      </div>
                  </div>
                  <?php endforeach ?>


          </ul>
      </div>
  </div>


</div>

<div class="form-group text-center">
  <button type="submit"  class="btnSubmit btn btn-primary btn-large"> بحث</button>
</div>
</form>
</div>
<script type="text/javascript" >
  $(".btnSubmit").on("click", function(){
      var content = $.trim($("#input").val());
      var category = $.trim($("#cat").val());
      if(content == '' || content == null){
          $("#input").removeAttr( "name" );
      }
      if(category == '' || category == null){
          $("#cat").removeAttr( "name" );
      }
  });
</script>
