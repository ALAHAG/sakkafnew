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
         direction: ltr !important;
         text-align: left !important;
         }
         .name{
         font-style: normal;
         text-align: left !important;
         padding: 2px;
         }
         td.col.logo {
         border-left: 1px solid #8dabff;
         border-left-style: dotted;
         }
         li{
         text-align: right !important;
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
         .imgs{
         color: azure;
         background: white;
         border: 1px solid #000;
         border-radius: 12px;
         }
         }
         h4{
         /* background: #350826; */
         padding: .51em 6px;
         margin: 2px 11px;
         /* color: wheat; */
         /* width: 50%; */
         border: 1px solid #84125e;
         border-radius: 10px;
         text-align: right !important;
         }
         h4.btn.btn-primary{
         cursor: pointer;
         float: right;
         width: 100%;
         text-align: right;
         background: #84125e;
         font-size: 1.5em;
         }
         input.disable{
         border: none;
         background: none;
         }
      </style>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   </head>
   <body  class="bg-color" style="background:#7f1f5f">
     <div class="container">
      <img src="<?php echo HTTP_IMAGE. '/itinerary_header.jpg';?>" width="100%"/>
      <div class="row " style="margin:0 auto; direction:rtl;background:#fff;">
      <div class="heading-orange col-md-12">
      <div class="co-md-12">
        <?php if($agent_type ==2){ ?>
        <br/><br/><br/>
        <div style="text-align: center;">السلام عليكم و رحمة الله و بركاته<br/>"تحية طيبة"</div>
        <?php } else { ?>
          <table class="program" style="margin: 0 auto; margin-top: 2em;border:1px solid #fff; min-width:50%;" align="center" dir="rtl" cellpadding="0" cellspacing="0" >
             <tbody>
                <tr style="height:30px" >
                   <td class="tb_col" style="padding:1px 1.2em" ><span style="font-weight: bold;">إسم العميل   :</span></td>
                   <td class="tb_col" style="padding:1px 1.2em"><span ><?php echo (empty($customer_name_en))? $customer_name_ar : $customer_name_ar.'- '.$customer_name_en; ?></span></td>
                </tr>
                <!-- <?php if(isset($phone) & !empty($phone)){ ?>
                <tr style="height:30px" >
                   <td class="tb_col" style="padding:1px 1.2em"><span style="font-weight: bold;">رقم الهاتف :</span></td>
                   <td class="tb_col" style="padding:1px 1.2em"><span><?php echo $phone ?> </span></td>
                </tr>
                <?php } ?> -->
                <tr style="height:30px" >
                   <td class="tb_col" style="padding:1px 1.2em"><span style="font-weight: bold;"> رقم البرنامج :</span></td>
                   <td class="tb_col" style="padding:1px 1.2em"><span> <?php echo 'B'.$booking_id ?> </span></td>
                </tr>
                <tr style="height:30px" >
                   <td class="tb_col" style="padding:1px 1.2em"  ><span style="font-weight: bold;" > عدد المسافرين :</span></td>
                   <td class="tb_col" style="padding:1px 1.2em"><span> <b><?php echo $data[num_adults] ?> </b> بالغين   <?php if( !empty($data[num_children])) {  echo ' والاطفال '.$data[num_children];}  ;?> </span></td>
                </tr>
             </tbody>
          </table>

        <table class="program" style="margin: 0 auto; margin-top: 2em;border:1px solid #fff; min-width:80%;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
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
        <br>
      </div>

      <?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
      <h4 class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
         1) تفاصيل الفنادق في المدن [
         <?php
            $last_key = end(array_keys($itinerary_rooms));
            foreach ($itinerary_rooms as $key => $room) {
                if ($key == $last_key) {
                  echo $room['city_ar_name'].'' ;
                } else {
                    echo $room['city_ar_name'].'-' ;
                }
            } ?>
         ] <img class="imgs" src="https://media2.giphy.com/media/24G0F8lQWYMb6jD47X/source.gif" height="50"> التفاصيل
      </h4>
      <div style="clear:both;">
         <div class="collapse" id="collapseExample">
            <div class="card card-body">
               <table width="98%" style="border:1px solid #fff; min-width:90%;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
                  <tbody>
                     <tr style="height:60px;color: white" class="bg-color" >
                        <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">المدينة</span></th>
                        <th style="text-align: center;padding:6px 8px;" ><span style="font-weight: bold;color: white">من - الى </span></th>
                        <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">اسم الفندق</span></th>
                        <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">نوع الغرفة</span></th>
                        <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white">الإفطار</span></th>
                        <th style="text-align: center;padding:6px;" ><span style="font-weight: bold;color: white;padding:0px 1em">عدد الليالي </span></th>
                     </tr>
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
                           -->
                     </tr>
                     <?php endforeach ?>
               </table>
            </div>
         </div>
      </div>
      <?php endif ?>
      <?php if (isset($itinerary_transportations) && $itinerary_transportations): ?>
      <h4 class="btn btn-primary" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
         2) الرحلات و التنقلات الداخلية  <img class="imgs" src="https://media2.giphy.com/media/24G0F8lQWYMb6jD47X/source.gif" height="50"> التفاصيل
      </h4>
      <div style="clear:both;">
         <div class="collapse" id="collapseExample2">
            <div class="card card-body">
               <div style="clear:both;">
                  <div class="row">
                     <?php foreach ($itinerary_transportations as $transportation): ?>
                     <div class="col-md-2 col-sm-12 col-xs-6" style="height: 175px;float: right;margin: 2px;border: 1px solid rgba(0,0,0,0.3);">
                        <img src="<?php echo HTTPS_IMAGE.$transportation['transportation_image'] ;?>" width="140px">
                        <h5 style="text-align:right;padding: 0em .3em;font-size:10px;" ><?php echo $transportation['transportation_description_en'] ;?></h5>
                        <p style="text-align:right;padding: 0em .3em;font-size:10px;" ><?php echo $transportation['transportation_title_ar']; if($transportation['num_of_passangers']) echo $transportation['num_of_passangers'] == 1 ? ' - لشخص':( $transportation['num_of_passangers'] == 2 ? ' لشخصين' : ' - لـ '.$transportation['num_of_passangers']. ' أشخاص '  )?> </p>
                     </div>
                     <?php endforeach ?>
                  </div>
                  <div style="width:100%;clear:both;"></div>
               </div>
            </div>
         </div>
      </div>
      <?php endif ?>
      <div style="clear:both;">
         <?php if (isset($itinerary)): ?>
         <h4 class="btn btn-primary" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
            3) برنامج الرحلة التفصيلي <img class="imgs" src="https://media2.giphy.com/media/24G0F8lQWYMb6jD47X/source.gif" height="50"> التفاصيل
         </h4>
         <div style="clear:both;">
            <div class="collapse" id="collapseExample3">
               <div class="card card-body">
                  <table width="98%" style="border:1px solid #fff; min-width:90%;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
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
               </div>
            </div>
         </div>
       </div>
         <br>

         <?php $currancy=array(1=>'رنجت ماليزي',2=>'ريال سعودي',3=>'دولار امريكي',4=>'ريال قطري',5=>'درهم اماراتي',6=>'ريال عماني'); ?>
         <?php if ($itinerary_class_id == 2): ?>
         <table class="program" style="margin: 0 auto; margin-top: 2em;border:1px solid #fff; min-width:80%;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
            <thead>
               <tr style="height:60px;color: white" class="bg-color" >
                  <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white ;font-size:1.5em"> إجمالي سعر البرنامج <sub><span style="font-size:.7em"> شامل الضرائب الحكومية ورسوم الخدمه </span></sub></th>
                  <th style="text-align: center;padding:10px;" ><span style="font-weight: bold;color: white;font-size:1.5em"> تفاصيل الدفع  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td class="tb_col" style="text-align: right;padding:10px;font-weight:bold;    font-size: 1.2em !important;color:#7B0462;"><label>
                     السعر الاجمالي للبرنامج  <input type="radio" name="payment-option" value="<?php echo $customer_price ?>" checked >
                     </label>  <?php echo $customer_price ?>    <?php echo $currancy[$currancy_type];?>
                  </td>
                  <td  style="text-align: center;padding:10px;font-weight:bold;    font-size: 1.2em !important;color:#7B0462;" rowspan="1">
                    <input type="button" class="disable"disabled value="<?php echo ceil($customer_price) ?>" name="nprice" id="nprice">
                    رنجت
                  </td>

               </tr>
               <tr>
                 <td class="tb_col" style="text-align: right;padding:10px;font-weight:bold;    font-size: 1.2em !important;color:#7B0462;">
                   <label> * العربون المطلوب
                      <input type="radio" name="payment-option" value="<?php echo ceil($downpayment) ?>" >
                      </label>    <?php echo ceil($downpayment) ?> <?php echo $currancy[$currancy_type];?>
                 </td>
               </tr>
               <tr>
                  <td class="tb_col" style="text-align: right;padding:10px;font-weight:bold;    font-size: 1.2em !important;color:#7B0462;"><label>
                     رسوم التحويل
                     <sub> <small>ملاحظة:رسوم التحويل عبر بطاقة الائتمان او البيبال 4.7% من المبلغ المراد تحويله</small></sub>
                  </td>
                  <td class="tb_col" style="text-align: center;padding:10px;font-weight:bold;    font-size: 1.2em !important;color:#7B0462;"><label>
                     <input type="button" disabled class="disable" value="<?php echo ceil($customer_price*0.047) ?>" name="trab" id="trab">
                     رنجت
                  </td>
               </tr>
               <tr style="background:#f4e6f9">
                  <td class="tb_col" style="text-align: right;padding:10px;font-weight:bold;font-size: 1.2em !important;color:#7B0462;"><label>
                     المبلغ الاجمالي <sub> <small> المراد تحويله</small></sub>
                  </td>
                  <td class="tb_col" style="text-align: center;padding:10px;font-weight:bold; font-size: 1.2em !important;color:#7B0462;"><label>
                     <input type="button" class="disable"disabled value="<?php echo ceil($customer_price+$customer_price*0.047) ?>" name="xtrab" id="xtrab">
                     رنجت
                  </td>
               </tr>
               <!-- <tr>
                  <td colspan="2">
                  </td>
               </tr> -->
            </tbody>
         </table>
       <?php endif?>

         <input type="hidden" value="<?php echo ceil($customer_price) ?>" name="prices" id="prices">
         <input type="hidden" value="<?php echo ceil($customer_price*0.047) ?>" name="taxes" id="taxes">
         <input type="hidden" value="<?php echo ceil($customer_price+$customer_price*0.047) ?>" name="total_payment" id="total_payment">
         <div id="paypal-button-container" style="margin:0 auto ;"></div>
         <div class="footer" style="    background: #2d0315;
            color: white;
            margin-top: 2px;
            padding: 2em;
            line-height: 2em;">

            <footer style="background-position: 50% 90%;background-position: left 95%;
               background-repeat: no-repeat;
               background-image: '<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg';
               /*height: 28px;*/
               padding-left: 40px;">
               <h5 style="text-align: center;">نتمنى لكم رحلة لاتنسى</h5>
               <!-- <div><img src="<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg" width="800" height="150" ></div> -->

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
                            document.getElementById("xtrab").value = Math.ceil(event.target.value*1 + event.target.value*0.047);
                            document.getElementById("nprice").value = Math.ceil(event.target.value*1);
                            document.getElementById("trab").value = Math.ceil(event.target.value*0.047);

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
               <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
               <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
               <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            </footer>
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
         </div>
      </div>
    </div>
  </div>
  </body>
</html>
