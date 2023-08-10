  <div class="toggle-container filters-container">
<!--     <h4 class="search-results-title"><i class="soap-icon-search"></i><b>1,984</b> البحث.</h4>
 -->    <form action="<?php echo $action; ?>" id="form" method="GET" role="form">
    <div class="panel style1 arrow-rights box_style_cat">    
          <h4 class="heading-orange heading-padding"> <i class="soap-icon-search"></i> بحث        </h4>

        <h4 class="panel-title">
            <a data-toggle="collapse" href="#amenities-filter" class="collapsed">ابحث حسب مستوى الفنادق</a>
        </h4>

        <div id="amenities-filter" class="panel-collapse ">
            <div class="panel-content">

                <ul class="check-square filters-option ">
                  <div class="form-group">
                        <div class="radio">
                 <label>
                                <input type="radio" id="cat" name="category" value="" >كامل البرامج
                 </label>
                 </div>
             </div>
                 <?php foreach ($package_categories as $key => $category ): ?>
                    <div class="form-group">
                        <div class="radio">
                            <label>
                                <input type="radio"  name="category" value="<?php echo $category['category_id'] ?>" <?php echo isset($get_category) && ($category['category_id']==$get_category ) ? 'checked': '' ?>> <?php echo $category['title'] ?>
                            </label>
                        </div>
                    </div>
                    <?php endforeach ?>


            </ul>
        </div>
    </div>
         <hr/> <h4 class="panel-title">
            <a data-toggle="collapse" href="#amenities-filter-night" class="collapsed">ابحث حسب مدة سفرك</a>
        </h4>

        <div id="amenities-filter-night" class="panel-collapse ">
            <div class="panel-content">
                        <div class="text button">
                            <label>
                                <input type="text" name="night" id='input' class="input-text full-width" value="<?php echo empty($night)? '':$night; ?>" >
                            </label>
                        </div>
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
