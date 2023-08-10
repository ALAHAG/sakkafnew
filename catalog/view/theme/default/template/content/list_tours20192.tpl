<?php echo $header ?>
<div class="page-title-container">
  <div class="container">
    <div class="page-title pull-left">
<h2 class="entry-title"> إحجز برنامج المواصلات والجولات السياحية في ماليزيا</h2>    </div>
  </div>
</div>
<section id="content">
  <div class="container" id="vapp">
    <div class="row">
      <div id="step1" class="col-md-9">
        <div class="head_orange">  تستطيع الان حجز برنامج المواصلات والجولات السياحية <b> بنفسك </b> من خلال : <ol>
<li> اختيال  المدينة من خانة البحث</li>
<li>اضافتة الى سلة البرنامج الجولة  / المواصلات المختاره </li>
<li>ومن ثم تعبئة معلومات الحجز</li></ol> <br/> </div><br/>


        <form id="search_form" class="cruise-booking-form" method="get">
          <div class="row">
            <div class="form-group col-md-12">
              <div class="selector">
                <select class="full-width" name="city_id" v-model="current_city">
                  <option value="all">اختر المدينة (كل المدن) </option>
                  <option v-for="(city, index) in cities" :key="index" :value="city.city_id">{{ city.city_name }}
                  </option>
                </select>
              </div>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-12">
            </div>
          </div>
        </form>
        <div class="hotel-list">
          <div class="row image-box hotel listing-style1">
            <div class="hotels">
              <?php if ($tours): ?>
              <div class="car-list listing-style3 car">
                <?php foreach ($tours as $tour): ?>
                <article class="heading-orange"
                  v-show="current_city == 'all' || current_city == '<?php echo $tour['city_id']; ?>'"
                  :class="isSelected(<?php echo $tour['id'] ?>) ? 'selected' : ''">
                  <div class="">
                    <div class="col-xs-12 col-sm-3">
                      <figure class="">
                        <span><img alt="" src="<?php echo $tour['thumb'] ?>" width="200"></span>
                      </figure>
                    </div>
                    <div class="details col-xs-12 col-sm-1 clearfix">
                      <div class="col-sm-8 col-xs-12">
                        <div class="clearfix">
                          <h4 class="box-title white-color"><a href="<?php echo $server.$tour['slug'] ?>" class=""><span
                                class="skin-color"> </span><?php echo $tour['title_ar'] ?><small class="white-color">
                                <?php echo $tour['title_en'] ?>- المدينة : <?php echo $tour['city_name'];?>  </small></a></h4>
                        </div>

                        <div class="clearfix">
                          <?php echo htmlentities($tour['description_ar'], ENT_QUOTES, 'utf-8') ?>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-2 character">
                        <!-- <?php echo ($tour['cat_id']== 1) ? "جولة":"مواصلات"  ;?> -->
                      </br>
                      <b>  السعر <br/><i> <?php echo $tour['price'];?> </i> رنجت</b>
                      </div>
                      <div class="action col-xs-12 col-sm-2">
                        <div class="amenities">
                          <div class="">
                            <div v-show="!isSelected(<?php echo $tour['id'] ?>)">
                              <button type="button" class="btn" @click="addToCart(<?php echo $tour['id'] ?>)">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i> <br/>أضغط هنا
                              </button>

                            </div>
                            <div v-show="isSelected(<?php echo $tour['id'] ?>)" style="display: none">
                              <button type="button" class="btn" @click="removeFromCart(<?php echo $tour['id'] ?>)">
                                <i class="fa fa-trash-o" aria-hidden="true"></i> حذف
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </article>
                <?php endforeach ?>
              </div>
              <?php endif ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-4 ">

        <div class="toggle-container filters-container">

          <h4 class="search-results-title"><i class="soap-icon-hotel"></i>مواصلاتي</h4>

          <div v-show="cart.length" style="display: none;">

            <ul class="list-group">
              <li class="list-group-item clearfix" v-for="(tour, index) in cart" :key="index">
                {{ tour.title_ar }} <small> - {{ tour.city_name }}</small>
                <br />
                <small>{{ tour.price }} رنجت</small>
                <button type="button" class="btn btn-sm pull-right" @click="removeFromCart(tour.id)">
                  <i class="fa fa-trash-o" aria-hidden="true"></i> حذف
                </button>
              </li>
            </ul>
            <h4 class="text-center">
              السعر الإجمالي : {{ total_price }} رنجت
            </h4>
            <button type="submit" class="full-width btn-large" @click="step = 2" v-if="step == 1">إستكمل الطلب</button>
            <button type="submit" class="full-width btn-large" @click="step = 1" v-else>تعديل الطلب</button>
          </div>

          <div class="text-center" v-show="!cart.length">
            قم باختيار الجولات والمواصلات المناسبة
            <br>
            <br>
          </div>


        </div>

      </div>
      <div id="step2" class="col-md-9">
        <h4>تفاصيل الحجز</h4>

        <div class="booking-section travelo-box tab-pane fade in " id="book">
            <small> البيانات الضروريه لحجز برنامجك وسهولة التواصل معك (*)</small>
            <hr />
            <form method="post" @submit="book">
            <div class="required">
              <div class="row">
                <div class="form-group col-md-6">
                  <label>الإسم الثلاثي (*)</label>
                  <input type="text" v-model="customer_info.customer_name_ar" class="input-text full-width" value="" placeholder=""
                    required />
                  <input type="hidden" v-model="customer_info.itinerary_id" value="<?php echo $itinerary_id ?>" />
                </div>
                <div class="form-group col-md-6">
                  <label>رقم الهاتف <small>(**) </small></label>
                  <input type="text" v-model="customer_info.phone" class="input-text full-width" value="" placeholder="" required />
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <label>تاريخ الوصول <small>(*)</small></label>
                  <div class="da1tepicker-wrap ">
                    <input type="text" v-model="customer_info.arrival_date" id="arrival_date" class="input-text  full-width"
                      placeholder="31/01/2017" data-min-date="0" autocomplete="off">
                  </div>
                </div>
                <div class="col-md-6">
                  <label>تاريخ المغادرة <small>(*)</small></label>
                  <div class="dat1epicker-wrap ">
                    <input type="text" v-model="customer_info.departure_date" class="input-text  full-width" id="departure_date"
                      placeholder="07/02/2017" data-min-date="0"  autocomplete="off">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-6">
                  <label>عدد البالغين<small>(*)</small></label>
                  <input type="number" v-model="customer_info.num_adults" class="input-text col-md-12" style="margin-left: 10px;"
                    value="" placeholder="البالغين" />
                </div>
                <div class="form-group col-md-6">
                  <label>عدد الاطفال <small>(*)</small></label>
                  <input type="number" v-model="customer_info.num_children" class="input-text col-md-12" value=""
                    placeholder="الأطفال" />
                </div>

              </div>
            </div> <!-- end of required -->
            <hr /><small>البيانات الاختيارية ان وجدت (اختياري)</small>
            <hr />
            <div class="row">
              <div class="form-group col-md-12">
                <label>البريد الإلكتروني <small>(اختياري )</small></label>
                <input type="email" v-model="customer_info.email" class="input-text full-width" value="" placeholder="" />
              </div>
            </div>

            <!-- <div class="row">
              <div class="form-group col-md-12">
                <label>الجنسية <small>(اختياري )</small></label>
                <input type="text" v-model="customer_info.country" class="input-text full-width" value="" placeholder="الجنسية" />
              </div>
            </div> -->

            <!-- <div class="row">
              <div class="form-group col-md-12">
                <label>عدد الحقائب تقريبا <small>(اختياري)</small></label>
                <input type="number" v-model="customer_info.num_bags" class="input-text full-width" value="" placeholder="" />
              </div>
            </div> -->

            <div class="row">
              <div class="form-group col-md-12">
                <label>ملاحظات <small class="blue">(اختياري)</small></label>
                <textarea rows="6" v-model="customer_info.notes" class="input-text full-width" placeholder="يرجى إرسال صور الجوازات عبر الإيميل لتأكيد الحجوزات مباشرة booking@alsakkaftravel.net او  عن طريق خدمة الواتس اب مع احد الأرقام الآتية :

 0060187770057
 0060187770018" /></textarea>
              </div>
            </div>
            <hr />
            <div class="form-group row">
              <div class="col-md-12">
                <button type="submit" class="full-width btn-large">إرسال الطلب</button>
              </div>
            </div>
          </form>

        </div>
      </div>

    </div>
  </div>

</section>
<div class="pager center-block">
  <?php // echo isset($pagination) ? $pagination : ''; ?>
</div><!-- /pager -->
<style>
  .hide-temp {
    display: none;
  }

  article.heading-orange.selected {
    border: 2px solid green;
  }

  .selector {
    border: 1px solid #7f0d4b;
  }
</style>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script type="text/javascript">
  var app = new Vue({
    el: '#vapp',
    data: {
      step: 1,
      cart: [],
      tours: <?php echo json_encode($tours)?>,
      customer_info :{
        'customer_name_ar' : null,
        'itinerary_id' : null,
        'phone' : null,
        'arrival_date' : null,
        'departure_date' : null,
        'num_adults' : null,
        'num_children' : 0,
      },
      current_city: 'all',
      cities: <?php echo json_encode($tours_city)?>,
  },
  methods: {
    addToCart: function(id) {
      console.log({ id });
      var tour = this.tours.find(function (tour) {
        return tour.id == id;
      });
      console.log(tour);

      this.cart.push(tour);
    },
    removeFromCart: function(id) {
      console.log({ id });
      var tours = this.cart.filter(function (tour) {
        return tour.id != id;
      });
      console.log(tours);
      this.cart = tours;
    },

    isSelected: function(id) {
      return this.cart.find(function (tour) {
        return tour.id == id;
      });
    },
    book : function (e) {
      e.preventDefault();
      $.ajax({
            type: 'post',
            url: '<?php echo $link_send_itinerary;?>' ,
            data: { ...this.customer_info, tours : this.cart , booking_type: 'tours'},
            success: function (data) {
                alert("تم استلام طلبك بنجاح ");
                window.location = ('<?php echo $link_send_success;?>');
            },
            error:function(error){
              alert("عفوا حصل خطأ أثنا إتمام الحجز. يرجى  التواصل مع خدمةالعملاء")
            }
        });

    }
  },
  computed: {
    total_price: function() {

      var price = 0;
      for (const tour of this.cart) {
        price += parseFloat(tour.price);
      }
      return price;
    }
  },
  watch: {
    step: function(value , old) {
      var self = this;
      if (value == 2) {
        $('#step1').fadeOut(500);
        setTimeout(function () {
          $('#step2').fadeIn(1000);

            tjq("#arrival_date").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                minDate:0,
                numberOfMonths: 1,
                onClose: function (selectedDate) {

                    tjq("#departure_date").datepicker("option", "minDate", selectedDate);
                    tjq("#departure_date").datepicker("show");
                    // alert(selectedDate);
                    self.customer_info.arrival_date = selectedDate;
                }
            });
            tjq("#departure_date").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                  self.customer_info.departure_date = selectedDate;
                    tjq("#arrival_date").datepicker("option", "maxDate", selectedDate);
                }
            });
        }, 600);
      }else if( value == 1  && old == 2){
        $('#step2').fadeOut(500);

        setTimeout(function () {
          $('#step1').fadeIn(1000);
        }, 600);
      }

    }
  },
  created() {
  }
})


  // alert($('#search_form').serialize());

  // $('#search_form').submit(function (e) {
  //   datax = $('#search_form').serialize();
  //   e.preventDefault();
  //   $.ajax({
  //     type: 'post',
  //     url: '<?php echo $link_send_city;?>',
  //     data: datax,
  //     success: function (data) {
  //       $('.hotel-list').empty();
  //       $('.hotel-list').append(data);

  //       // $('#booking_form').get(0).reset();
  //     }
  //   });
  // });
</script>
<?php  echo $footer ?>
