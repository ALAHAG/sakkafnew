



                     <div class="toggle-container filters-container">
                            
        <h4 class="search-results-title"><i class="soap-icon-search"></i><b>1,984</b> البحث.</h4>
                                        <form action="<?php echo $action; ?>" method="GET" role="form">
        
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#accomodation-type-filter" class="collapsed">حسب المدن</a>
                                    </h4>
                                    <div id="accomodation-type-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
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
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#amenities-filter" class="collapsed">حسب مستوى الفنادق</a>
                                    </h4>
                                    <div id="amenities-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
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
                        
              