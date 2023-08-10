<!DOCTYPE html>
<html>
<head>
  <title>تفاصيل عرض برنامج سياحي من شركة السقاف للسياحة والسفر </title>
  <meta charset="UTF-8">
  <style type="text/css">
  .bg-color{
    background-color: #2d0315 ;
    color: #422156;
  }
  header {
    padding: 10px 0;
    margin-bottom: 20px;
    border-bottom: 1px solid #3989c6;
    background: #fff4f9;
  }
  table.program, .program> th, .program> td {
    text-align: center;
    border: 1px solid black;
  }
  table.program{
    margin: 10px 0px;
  }
  td.col.company-details {
    font-style: italic;
    font-family: cursive;
    direction: ltr;
    text-align: left;
  }
  .name{
    font-style: normal;
    text-align: left;
    padding: 2px;
  }
  td.col.logo {
    border-left: 1px solid #8dabff;
    border-left-style: dotted;
  }
  .company-details {
    text-align: right;
    direction: ltr;

  }
  .txt-color{
    color: linear-gradient(to bottom, #3e2255 0%,#b6167c 100%);

  }
  /* @page {
    header: html_otherpageheader;
    footer: html_otherpagesfooter;
} */

@page :first {
    header: html_firstpageheader;
    margin: 100px 3px;
}
@page
{
  header: html_otherpageheader;
  margin-top: 0mm;

}
  .tb_col{
    border:1px solid #CED0D1;text-align:center;padding:.2em 1px;
    text-align: right;
    padding: 0px 1em;
  }
  .header{
    width: 100%;
    border-bottom: 1.5px solid #8dabff;
  }
  .name a {
    text-decoration-line: none;
  }
  .logo img {
    float: left;
  }
  h4{
    /* background: #350826; */
    padding: .51em 6px;
    margin: 2px 11px;
    /* color: wheat; */
    /* width: 50%; */
    border: 1px solid #84125e;
    border-radius: 10px;
  }

  </style>
</head>
<body  class="bg-color" style="background:#7f1f5f">
  <htmlpageheader name="firstpageheader" style="display:none">
<img src="<?php echo HTTP_IMAGE. '/itinerary_header.jpg';?>"/>
</htmlpageheader>
<htmlpageheader name="html_otherpageheader" style="display:none;margin:0mm;size: auto;   ">
</htmlpageheader>

  <div style="width:820px; margin:0 auto; direction:rtl;background:#fff;">
    <div class="heading-orange">
      <?php if($agent_type ==2){ ?> <center> </center><br/><br/><br/>

      <div style="text-align: center;">السلام عليكم و رحمة الله و بركاته<br/>"تحية طيبة"</div>
        <?php } else { ?>
        <table class="header" style=" background: #e8e8e8;
          padding: 0px 2px;">
          <tr>
            <td class="col logo">
              <table  >
                <tbody>
                  <tr style="height:30px" >
                    <td style="" ><span style="font-weight: bold;">إسم العميل   :</span></td>
                    <td style=""><span ><?php echo (empty($customer_name_en))? $customer_name_ar : $customer_name_ar.'- '.$customer_name_en; ?></span></td>
                  </tr>
                  <?php if(isset($phone) & !empty($phone)){ ?>
                    <tr style="height:30px" >
                      <td style=""><span style="font-weight: bold;">رقم الهاتف :</span></td>
                      <td style=""><span><?php echo $phone ?> </span></td>
                    </tr> <?php } ?>
                    <tr style="height:30px" >
                      <td style=""><span style="font-weight: bold;"> رقم البرنامج :</span></td>
                      <td style=""><span> <?php echo 'B'.$booking_id ?> </span></td>
                    </tr>
                    <tr style="height:30px" >
                      <td style=""  ><span style="font-weight: bold;" > عدد المسافرين :</span></td>
                      <td style=""><span> <b><?php echo $data[num_adults] ?> </b> بالغين   <?php if( !empty($data[num_children])) {  echo ' والاطفال '.$data[num_children];}  ;?> </span></td>
                    </tr>
                  </tbody>
                </table>
              </td>


              <td class="col company-details"  style="text-align: left;    font-size: 12px;">
                <h3 class="name"  >
                  <a target="_blank" href="https://alsakkaftravel.net" style="    text-decoration: none !important;">
                    السقاف للسياحة والسفر لماليزيا <br/>
                    Alsakkaf Travel & Tours SDN BHD.
                  </a>
                </h3>
                <div> Unit 17-02, Plaza 138, Jalan Ampang <br/> 50450 Kuala Lumpur, Malaysia</div>
                <div>(006) 03-21815444</div>
                <div>(006) 018-7770018</div>
                <div>sales-2@alsakkaftravel.net</div>
              </td></tr>


            </table>
            <table class="program" style="margin: 0 auto; margin-top: 2em;border:1px solid #fff; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
              <thead>

                <tr style="height:60px;color: white" class="bg-color" >
                  <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white"> <?php if ($itinerary_class_id == 3): ?>
                    البرنامج المؤكد:<?php else: ?> البرنامج المقترح :<?php endif ?></td>
                      <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white"> الفنادق </th>
                        <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white"> المواصلات </th>
                          <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white"> الجولات السياحية </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="tb_col" style="padding:1px 1.2em">  <b><?php echo $itinerary_title; ?></b></td>
                            <td class="tb_col" style="padding:5px .2em">   <?php echo (isset($itinerary_rooms) && $itinerary_rooms )?'نعم': 'لا' ;?> </td>
                            <td class="tb_col" style="padding:1px .2em">   <?php echo (isset($itinerary_transportations) && $itinerary_transportations)?'نعم': 'لا' ;?> </td>
                            <td class="tb_col" style="padding:1px .2em">   <?php echo (isset($itinerary_tours) && $itinerary_tours )?'نعم': 'لا' ;?> </td>

                          </tr>
                        </tbody>
                      </table>
                    <?php } ?>


                    <!-- <hr/> -->

                    <br>
                    <?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
                      <h4>1) الفنادق ( شامل الافطار والضرائب )</h4>
                      <table width="800" style="border:1px solid #fff; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr style="height:60px;color: white" class="bg-color" >
                            <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">المدينة</span></th>
                            <th style="text-align: center;padding:6px 8px;" ><span style="font-weight: bold;color: white">من - الى </span></th>
                            <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">اسم الفندق</span></th>
                            <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">نوع الغرفة</span></th>
                            <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">الإفطار</span></th>
                            <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white;padding:0px 1em">عدد الليالي </span></th>
                            <!--         <td style="text-align: center;" ><span style="font-weight: bold;color: white">مستوى الفندق</span></td>
                          -->      </tr>
                          <?php foreach ($itinerary_rooms as $room): ?>
                            <?php
                            $dateValue_in = strtotime($room['checkin']);
                            $dateValue_out = strtotime($room['checkout']);

                            $yr_in = date("Y", $dateValue_in) ." ";
                            $mon_in = date("m", $dateValue_in)." ";
                            $date_in = date("d", $dateValue_in);
                            $yr_out = date("Y", $dateValue_out) ." ";
                            $mon_out = date("m", $dateValue_out)." ";
                            $date_out = date("d", $dateValue_out);
                            ?>
                            <tr>
                              <td class="tb_col" style="padding:.61em"> <b> <?php echo $room['city_ar_name'] ;?></b></td>
                              <td class="tb_col" style="direction:ltr;"> <?php echo $date_in.'/'.$mon_in.' - '. $date_out.'/'.$mon_out.'-'.$yr_out;?></td>
                              <td class="tb_col" style="padding:.61em"><a target="blank" style="    text-decoration: none !important;" href="<?php echo 'https://alsakkaftravel.net/'.$room['slug'] ?>"> <?php echo $room['hotel_name'] ;?> <br><?php echo $room['hotel_english_name'] ;?> </a><br/> <b> *<?php echo $room['star_rate'] ;?> نجوم </b></td>
                              <td class="tb_col"> <?php echo $room['num_of_rooms'].' x '. $room['room_name'] ;?><br ><span dir="ltr"><?php echo $room['num_of_rooms'].' x '.$room['room_english_name'] ;?></span></td>
                              <td class="tb_col"> <?php echo $room['num_of_breakfast'] ;?></td>
                              <td class="tb_col"> <?php echo $room['num_of_nights'] ;?></td>
                              <!--           <td style="border:1px solid #CED0D1;text-align:center;padding:1.5em 1px; font-weight: bold;"> *<?php echo $room['star_rate'] ;?> </td>
                            -->        </tr>

                          <?php endforeach ?>
                        </table>

                      <?php endif ?>

                      <?php if (isset($itinerary_transportations) && $itinerary_transportations): ?>
                        <br>
                        <hr/>
                        <h4>  2) الرحلات و التنقلات الداخلية  </h4>
                        <div style="clear:both;">
                          <?php foreach ($itinerary_transportations as $transportation): ?>
                            <div style="  width: 140px;height: 175px;float: right;margin: 2px;border: 1px solid rgba(0,0,0,0.3);">
                              <img src="<?php echo HTTPS_IMAGE.$transportation['transportation_image'] ;?>" width="140px">
                              <h5 style="text-align:right;padding: 0em .3em;font-size:10px;" ><?php echo $transportation['transportation_description_en'] ;?></h5>
                              <p style="text-align:right;padding: 0em .3em;font-size:10px;" ><?php echo $transportation['transportation_title_ar']; if($transportation['num_of_passangers']) echo $transportation['num_of_passangers'] == 1 ? ' - لشخص':( $transportation['num_of_passangers'] == 2 ? ' لشخصين' : ' - لـ '.$transportation['num_of_passangers']. ' أشخاص '  )?> </p>
                              </div>

                            <?php endforeach ?>
                            <div style="width:100%;clear:both;"></div>
                          </div>
                        <?php endif ?>

                        <?php if (isset($itinerary)): ?>
                          <h4> 3) برنامج الرحلة التفصيلي</h4>
                          <table width="800" style="border:1px solid #fff; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
                            <tbody>
                              <tr style="height:60px; color:white" class="bg-color">
                                <td style="text-align: center;width:100px;padding:1em 1px;"><span style="font-weight: bold;color:white;padding:2em 1px;">التاريخ</span></td>
                                <?php if ($itinerary_class_id == 3): ?>
                                  <!-- <td style="text-align: center;;background:#e4a02f;width:100px"><span style="font-weight: bold;color:white;">Time - الوقت</span></td> -->
                                <?php endif ?>
                                <td style="text-align: center;padding:1em 1px;" ><span style="font-weight: bold;color:white;padding:2em 1px;">النوع</span></td>
                                <td style="text-align: center;padding:1em 1px;" ><span style="font-weight: bold;color:white;padding:2em 1px;"> التفاصيل</span></td>
                              </tr>
                              <?php foreach ($itinerary as $key => $element):?>
                                <?php if ($element['type'] == 'transportation'): ?>
                                  <tr>
                                    <td style="border:1px solid #CED0D1;text-align:center; background:#e4a02f;color:black;padding:1em 1px;"> <?php echo $element['date'] ;?></td>
                                    <!--  <?php if ($itinerary_class_id == 3): ?>
                                    <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo substr($element['time'], 0, -3);?></td>
                                  <?php endif ?> -->
                                  <td style="border:1px solid #CED0D1;text-align:center; padding: 0em 1em;text-align: right;    font-family: cursive;"> <?php echo $element['transportation_title_ar'] ;?></td>

                                  <td style="border:1px solid #CED0D1;text-align:center;padding: 0em 1em;text-align: right;    font-family: cursive;"><?php echo isset($element['transportation_description_ar']) && !empty($element['transportation_description_ar']) ? $element['transportation_description_ar'] : $element['transportation_description_en'] ;?>

                                  </td>
                                  <!--  <td style="border:1px solid #CED0D1;text-align:center;padding:1em 1px;"> <?php echo $element['transportation_description_en'] ;?>
                                  <p style="text-align:center;" >[<?php echo $element['transportation_title_en']; if($element['num_of_passangers']) echo $element['num_of_passangers'] == 1 ? ' - For one person': ' - for '.$element['num_of_passangers']. ' People '  ?> ]</p>

                                </td> -->
                              </tr>

                            <?php endif ?>
                            <?php if ($element['type'] == 'tour'): ?>
                              <tr>
                                <td style="border:1px solid #CED0D1;text-align:center;white-space:nowrap;color: white;" class="bg-color"> <?php echo $element['date'] ;?></td>
                                <!--    <?php if ($itinerary_class_id == 3): ?>
                                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo substr($element['time'], 0, -3);?></td>
                              <?php endif ?> -->
                              <td style="border:1px solid #CED0D1;text-align:center;padding: 1em 1em;
                              font-family: cursive;text-align:right" > <?php echo $element['tour_title_ar'] ;?></td>

                              <!--    <td style="border:1px solid #CED0D1;text-align:center;padding: 0em 1em;
                              font-family: cursive;text-align:right"> <?php echo $element['tour_title_ar'] ;?></td> -->
                              <td style="border:1px solid #CED0D1;text-align:center;padding: 0em 1em;
                              font-family: cursive;text-align:right" > <?php echo isset ($element['tour_description_ar']) && !empty($element['tour_description_ar']) ? $element['tour_description_ar'] : $element['tour_description_en'] ;?></td>
                            </tr>
                          <?php endif ?>
                        <?php endforeach ?>
                      <?php endif ?>
                    </tbody>
                  </table>
                  <br>
                  <br>
                  <br>


                  <?php $currancy=array(1=>'رنجت ماليزي',2=>'ريال سعودي',3=>'دولار امريكي',4=>'ريال قطري',5=>'درهم اماراتي',6=>'ريال عماني'); ?>
                  <?php if ($itinerary_class_id == 2): ?>

                    <table class="program" style="margin: 0 auto; margin-top: 2em;border:1px solid #fff; min-width:60%;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
                      <thead>

                        <tr style="height:60px;color: white" class="bg-color" >
                          <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white ;font-size:1.5em"> إجمالي سعر البرنامج <sub><span style="font-size:.7em"> شامل الضرائب الحكومية ورسوم الخدمه </span></sub></th>
                          <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white;font-size:1.5em"> العربون المطلوب دفعة  </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="tb_col" style="text-align: center;padding:10px;font-weight:bold;    font-size: 1.7em !important;color:#7B0462;"><label>
                            <input type="radio" name="payment-option" value="<?php echo $customer_price ?>" checked >
                            </label><?php echo $customer_price ?>    <?php echo $currancy[$currancy_type];?> </td>
                            <td class="tb_col" style="text-align: center;padding:10px;font-weight:bold;    font-size: 1.7em !important;color:#7B0462;"><label>
                            <input type="radio" name="payment-option" value="<?php echo ceil($downpayment) ?>" >
                            </label>    <?php echo ceil($downpayment) ?> <?php echo $currancy[$currancy_type];?> </td>

                          </tr>
                          <!-- <tr>
                            <td>
                              رسوم التحويل عبر بطاقة الائتمان
                            </td>
                              <div id="transfer"> </div>
                            <td>
                            </td>
                          </tr> -->
                        </tbody>
                      </table>
                      <!-- <div id="paypal-button-container" style="margin:0 auto;"></div> -->
                      <!-- <div id="paypal-button-container"></div> -->
                      <input type="hidden" value="<?php echo ceil($customer_price) ?>" name="prices" id="prices">
                      <input type="hidden" value="<?php echo ceil($customer_price*0.047) ?>" name="taxes" id="taxes">
                      <input type="hidden" value="<?php echo ceil($customer_price+$customer_price*0.047) ?>" name="total_payment" id="total_payment">
                      <div id="paypal-button-container" style="margin:0 auto ;"></div>

                      <div class="footer" style="    background: #2d0315;
                      color: white;
                      margin-top: 2px;
                      padding: 2em;
                      line-height: 2em;">
                      <h4> ::) لتاكيد الحجز نرجو الأتي :</h4>
                      <ol>
                        <li>صورة عن جواز السفر لتاكيد حجوزات الفنادق </li>
                        <li>صورة التذكرة الدولية </li>
                        <li>لتاكيد حجزك يتطلب منك دفع عربون من سعر البرنامج  و سيقوم موظف الحجوزات بتاكيد جميع الحجوزات وارسالها لك.</li>
                      </ol>
                    <?php endif?>

                    <h4> ::) الملاحظات : </h4>
                    <ol>
                      <li>العرض ساري على مدار السنة وقابل للزيادة في فترة الاجازة الصيفية بشكل بسيط.</li>
                      <li>مواعيد الدخول في جميع فنادق ماليزيا الساعة 2 ظهرآ وموعيد الخروج 12 ظهرآ.</li>
                      <li>البرنامج لايشمل تذاكر دخول الاماكن السياحية .</li>
                      <li>البرنامج قابل للتعديل حسب طلبك من حيث عدد اليالي وعدد الافراد مع فارق السعر.</li>
                      <li>الجولات السياحية حسب التواريخ المذكورة والتواريخ الغير مذكورة تون أيام حرة بدون سائق</li>
                      <li>اذا تم إلغاء الحجز بعد التأكيد يضمن العميل جميع غرامات الإلغاء اذا لم يغطي العربون غرامات الإلغاء</li>
                      <li>الوزن المجاني في الطيران الداخلي 15 كيلو للشخص الواحد وفي حاله وجود وزن زائد الرجاء ابلاغنا مسبقا .</li>
                      <li>حالة عدم توفر الفندق المذكور سيتم توفير فندق آخر بنفس المستوى او يتم توفير البديل المناسب, وقد يكون هناك مبلغآ اضافيآ حسب مستوى الفندق البديل.</li>
                      <li> .لايشمل رسوم الاقامه عل السائح الاجنب ف ماليزيا 10 رنجت عل الغرفه ف الليله الواحده ورسوم البلديه المحليه ف
                        الجزر 3 رنجت عل الغرفه ف الليله الواحده وبقية الضرائب والرسوم مدفوعه من ضمن البرنامج</li>
                      </ol>


                      <footer style="background-position: 50% 90%;background-position: left 95%;
                      background-repeat: no-repeat;
                      background-image: '<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg';
                      /*height: 28px;*/
                      padding-left: 40px;">
                      <h5 style="text-align: center;">نتمنى لكم رحلة لاتنسى</h5>
                      <!-- <div><img src="<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg" width="800" height="150" ></div> -->
                      <style>
                      @media screen and (max-width: 400px) {
                       #paypal-button-container {
                       width: 100%;
                       }
                      }

                      @media screen and (min-width: 400px) {
                       #paypal-button-container {
                       width: 350px;
                       }
                      }
                      </style>


                    <!-- Render the radio fields and button containers -->




                    <!-- Include the PayPal JavaScript SDK -->
                    <!-- <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script> -->
                    <script src="https://www.paypal.com/sdk/js?client-id=AYH93JfPFfzfkeFCCRiycsr_pnWsLb6xhELygib6FEFdBKgENy7BpaNta5ij2W7TGwEmEw6IPCF95TmB&currency=MYR"> </script>

                    <script>
                  document.querySelectorAll('input[name=payment-option]')
                        .forEach(function (el) {
                          el.addEventListener('change', function (event) {
                            document.getElementById("prices").value = Math.ceil(event.target.value);
                            document.getElementById("taxes").value = Math.ceil(event.target.value*0.047);
                            document.getElementById("total_payment").value = Math.ceil(event.target.value*1 + event.target.value*0.047);
                          });
                        });
                        // Render the PayPal button into #paypal-button-container
                      paypal.Buttons({
                        locale: 'ar_SA',
                        style: {
                        layout: 'vertical',//horizontal,vertical
                        fundingicons: 'true',
                        color: 'gold',
                        label: 'pay',
                        shape: 'rect', //rect ,pill
                        size: 'responsive',
                        tagline: false
                        },
                         createOrder: function(data, actions) {
                           // This function sets up the details of the transaction, including the amount and line item details.
                           return actions.order.create({
                             purchase_units: [{
                               // reference_id: "PUHF",
                              description: "برنامج سياحي",

                              custom_id: "<?php echo 'B'.$booking_id ?>",
                              soft_descriptor: "عرض سياحي في ماليزيا",
                              "items": [{
                                         name: "المبلغ المراد تحويلة "+document.getElementById("prices").value,
                                         description: "رسوم التحويل 4.7% من اجمالي المبلغ ",
                                         quantity: "1",
                                         unit_amount: {
                                             value: document.getElementById("prices").value,
                                             currency_code: 'MYR',
                                         },
                                         tax: {
                                             value: document.getElementById("taxes").value,
                                             currency_code: 'MYR',
                                         },
                                         // sku: "AUD101", //127 characters
                                         // category: 'DIGITAL_GOODS',
                                       }],
                              amount: {
                                 value: document.getElementById("total_payment").value ,
                                 currency: 'MYR',
                                 breakdown: {
                                      item_total: {
                                          currency_code: "MYR",
                                          value: document.getElementById("prices").value
                                      },
                                      tax_total: {
                                       currency_code: "MYR",
                                       value: document.getElementById("taxes").value
                                   }
                                  }
                                },

                             }],
                             application_context: {
                               shipping_preference: 'NO_SHIPPING'
                             }
                           });
                         },
                         onApprove: function(data, actions) {
                           // This function captures the funds from the transaction.
                           return actions.order.capture().then(function(details) {
                             // This function shows a transaction success message to your buyer.
                             alert('Transaction completed by ' + details.payer.name.given_name);
                           });
                         }
                       }).render('#paypal-button-container');
                       //This function displays Smart Payment Buttons on your web page.
                    </script>
                    </footer>
                  </div>
                </div>
