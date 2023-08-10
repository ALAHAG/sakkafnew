  <div class="toggle-container filters-container">
<!--     <h4 class="search-results-title"><i class="soap-icon-search"></i><b>1,984</b> البحث.</h4>
 -->    <form action="<?php echo $action; ?>" method="GET" role="form">
        
    <div class="panel style1 arrow-right">
        <h4 class="panel-title">
            <a data-toggle="collapse" href="#amenities-filter" class="collapsed">بحث حسب المدن</a>
        </h4>
        <div id="amenities-filter" class="panel-collapse ">
            <div class="panel-content">
                <ul class="check-square filters-option">
            <?php foreach ($cities as $key => $city ): ?>                  
                       <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="city[<?php echo $key ?>]" value="<?php echo $city['city_id'] ?>" <?php echo isset($get_city) && in_array($city['city_id'],$get_city ) ? 'checked': '' ?>> <?php echo $city['city_ar_name'] ?> 
                            </label>
                        </div>
                    </div>
                    <?php endforeach ?>               

                
            </ul>
        </div>
    </div>
</div>

<div class="form-group text-center">
    <button type="submit"  class="btn btn-primary btn-large"> بحث</button>
</div>
</form>
</div>

