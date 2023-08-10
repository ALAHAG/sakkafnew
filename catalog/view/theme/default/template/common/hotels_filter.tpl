<div  id="filters_col">
   <h4 class="search-results-title"><i class="soap-icon-search"></i><b>1,984</b> فنادق ماليزيا.</h4>
   <form action="<?php echo $action; ?>" method="GET" role="form">
      <div class=" ">
         <h4 class="">
           <a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt"><i class="icon_set_1_icon-65"></i>حسب المدن</a>
         </h4>
         <div id="collapseFilters" class="collapse show">
            <div class="filter_type">
               <ul class="check-square filters-option">
                  <?php foreach ($cities as $key => $city) {?>
                  <div class="form-group">
                     <div class="checkbox">
                        <label>
                        <input type="checkbox" name="city[<?php echo $key ?>]" value="<?php echo $city['city_id'] ?>" <?php echo isset($get_city) && in_array($city['city_id'],$get_city ) ? 'checked': '' ?>> <?php echo $city['city_ar_name'] ?>
                        </label>
                     </div>
                  </div>
                  <?php } ?>
               </ul>
            </div>
         </div>
      </div>
      <div  >
         <h4 class="panel-title">
           <a data-toggle="collapse" href="#collapseFilters2" aria-expanded="false" aria-controls="collapseFilters2" id="filters_col_bt"><i class="icon_set_1_icon-65"></i>حسب المستوى</a>
         </h4>
         <div id="collapseFilters2" class="collapse show">
            <div class="filter_type">
               <ul class="check-square filters-option">
                  <div class="form-group">
                     <div class="checkbox">
                        <label>
                        <input type="checkbox" name="rate[5]" value="5" <?php echo isset($get_rate) && in_array(5,$get_rate ) ? 'checked': '' ?>> 5 نجوم
                        </label>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="checkbox">
                        <label>
                        <input type="checkbox" name="rate[4]" value="4" <?php echo isset($get_rate) && in_array(4,$get_rate ) ? 'checked': '' ?>> 4 نجوم
                        </label>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="checkbox">
                        <label>
                        <input type="checkbox" name="rate[3]" value="3" <?php echo isset($get_rate) && in_array(3,$get_rate ) ? 'checked': '' ?>> 3 نجوم
                        </label>
                     </div>
                  </div>
               </ul>
            </div>
         </div>
      </div>
      <div class="form-group text-center">
         <button type="submit"  class="btn btn-primary"> بحث</button>
      </div>
   </form>
</div>
