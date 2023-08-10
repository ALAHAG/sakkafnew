  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <style type="text/css">
    .bg-color{
      background-color: #3e2255 ;
      color: #422156;
    }
      .txt-color{
          color: linear-gradient(to bottom, #3e2255 0%,#b6167c 100%);

      }
      .tb_col{
        border:1px solid #CED0D1;text-align:center;padding:.2em 1px;
      }

 /*     footer {
    font-size: 9px;
    color: #f00;
    text-align: center;
  }

  @page {
    size: A4;
    margin: 11mm 17mm 17mm 17mm;
  }

  @media print {
    footer {
      position: fixed;
      bottom: 0;
    }

    .content-block, p {
      page-break-inside: avoid;
    }

    html, body {
      width: 210mm;
      height: 297mm;
    }
  }*/
  </style>
  </head>
  <body  class="bg-color">
  <div style="width:820px; margin:0 auto; direction:rtl;background:#fff;">
  <div class="heading-orange">
  <?php if($agent_type ==2){ ?> <center> </center><br/><br/><br/>

  <div style="text-align: center;">السلام عليكم و رحمة الله و بركاته<br/>
  "تحية طيبة"</div>
  <?php } else { ?>
  <!-- <center><img width="100%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg"></center> -->

  <div style="text-align: center;">السلام عليكم و رحمة الله و بركاته<br/>
  "تحية عطرة من شركة السقاف للسياحة والسفر"</div>
  <?php } ?>
  <!-- <hr/> -->
  <br/>
    <table  class="txt-color" width="600" style=" min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
      <tbody>
        <tr style="height:30px" >
          <td style="" width="80"><span style="font-weight: bold;">إسم العميل :</span></td>
          <td style=""><span ><?php echo $customer_name_ar ?> - <?php echo $customer_name_en ?></span></td>
        </tr>
         <tr style="height:30px" >
          <td style=""><span style="font-weight: bold;">رقم الهاتف :</span></td>
          <td style=""><span><?php echo $phone ?> </span></td>
        </tr>
        <tr style="height:30px" >
          <td style=""><span style="font-weight: bold;"> رقم البرنامج :</span></td>
          <td style=""><span> <?php echo BOOKING_PREFIX.$booking_id ?> </span></td>
        </tr>
        <tr style="height:30px" >
          <td style="" width="100" ><span style="font-weight: bold;" > عدد المسافرين :</span></td>
          <td style=""><span> <b><?php echo $data[num_adults] ?> </b> بالغين   <?php if( !empty($data[num_children])) {  echo ' والاطفال '.$data[num_children];}  ;?> </span></td>
        </tr>
        </tbody>
    </table>
    </div>
  <div style="font-weight: bold;text-align: center;">
  <?php if ($itinerary_class_id == 3): ?>
   تم تأكيد البرنامج  كالتالي: <br>

  <?php else: ?>
   تم إقتراح البرنامج  كالتالي: <br>
  <?php endif ?></div>
  <hr/>

  <div ><h4 class="txt-color" style="text-align: center;"> {{ <?php echo $itinerary_title; ?> }} </h4></div>
  <?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
    <h4>1) الفنادق ( شامل الافطار والضرائب )</h4>
    <table width="800" style="border:1px solid #fff; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
      <tbody>
        <tr style="height:60px;color: white" class="bg-color" >
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">المدينة</span></td>
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">من - الى </span></td>
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">اسم الفندق</span></td>
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">نوع الغرفة</span></td>
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">الإفطار</span></td>
          <td style="text-align: center;" ><span style="font-weight: bold;color: white">عدد الليالي </span></td>
  <!--         <td style="text-align: center;" ><span style="font-weight: bold;color: white">مستوى الفندق</span></td>
   -->      </tr>
        <?php foreach ($itinerary_rooms as $room): ?>
          <tr>
            <td class="tb_col"> <b> <?php echo $room['city_ar_name'] ;?></b></td>
            <td class="tb_col"> <?php echo $room['checkin'] ;?><br><?php echo $room['checkout'] ;?></td>
            <td class="tb_col"><a target="blank" href="<?php echo 'https://alsakkaftravel.net/'.$room['slug'] ?>"> <?php echo $room['hotel_name'] ;?> <br><?php echo $room['hotel_english_name'] ;?> </a><br/> <b> *<?php echo $room['star_rate'] ;?> نجوم </b></td>
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
    <h4> 2) الرحلات و التنقلات الداخلية  </h4>
    <div style="clear:both;">
   <?php foreach ($itinerary_transportations as $transportation): ?>
      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
        <img src="<?php echo HTTPS_IMAGE.$transportation['transportation_image'] ;?>" width="100%">
        <h5 style="text-align:center;" ><?php echo $transportation['transportation_description_en'] ;?></h5>
        <p style="text-align:center;" >[<?php echo $transportation['transportation_title_ar']; if($transportation['num_of_passangers']) echo $transportation['num_of_passangers'] == 1 ? ' - لشخص':( $transportation['num_of_passangers'] == 2 ? ' لشخصين' : ' - لـ '.$transportation['num_of_passangers']. ' أشخاص '  )?> ]</p>
      </div>

    <?php endforeach ?>
    <div style="width:100%;clear:both;"></div>
    </div>
      <?php endif ?>

      <?php if (isset($itinerary)): ?>
        <br>
        <h4> 3) برنامج الرحلة التفصيلي</h4>
        <table width="800" style="border:1px solid #fff; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
          <tbody>
            <tr style="height:60px; color:white" class="bg-color">
              <td style="text-align: center;width:100px;padding:1em 1px;"><span style="font-weight: bold;color:white;padding:2em 1px;">التاريخ</span></td>
              <?php if ($itinerary_class_id == 3): ?>
              <!-- <td style="text-align: center;;background:#e4a02f;width:100px"><span style="font-weight: bold;color:white;">Time - الوقت</span></td> -->
              <?php endif ?>
           <!--    <td style="text-align: center;padding:1em 1px;" ><span style="font-weight: bold;color:white;padding:2em 1px;">البرنامج</span></td> -->
              <td style="text-align: center;padding:1em 1px;" ><span style="font-weight: bold;color:white;padding:2em 1px;">Description- التفاصيل</span></td>
            </tr>
            <?php foreach ($itinerary as $key => $element):?>
              <?php if ($element['type'] == 'transportation'): ?>
                <tr>
                  <td style="border:1px solid #CED0D1;text-align:center; background:#e4a02f;color:black;padding:1em 1px;"> <?php echo $element['date'] ;?></td>
                 <!--  <?php if ($itinerary_class_id == 3): ?>
                  <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo substr($element['time'], 0, -3);?></td>
                  <?php endif ?> -->
                  <td style="border:1px solid #CED0D1;text-align:center;padding:1em 1px;"><?php echo isset($element['transportation_description_ar']) && !empty($element['transportation_description_ar']) ? $element['transportation_description_ar'] : $element['transportation_description_en'] ;?>
                  <p style="text-align:center;" >[<!-- <?php echo $element['transportation_title_ar']; if($element['num_of_passangers']) echo $element['num_of_passangers'] == 1 ? ' - لشخص':( $element['num_of_passangers'] == 2 ? ' لشخصين' : ' - لـ '.$element['num_of_passangers']. ' أشخاص '  )?> --> <?php echo $element['transportation_title_ar'] ;?>]</p>

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
               <!--    <td style="border:1px solid #CED0D1;text-align:center;padding:1em 1px;"> <?php echo $element['tour_title_ar'] ;?></td> -->
                  <td style="border:1px solid #CED0D1;text-align:center;padding:1em 1px;" > <?php echo isset ($element['tour_description_ar']) && !empty($element['tour_description_ar']) ? $element['tour_description_ar'] : $element['tour_description_en'] ;?><p style="text-align:center;" >[<?php echo $element['tour_title_ar'] ;?>]</p></td>
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
        <h4> ::) اجمالي سعر البرنامج شامل للضرائب الحكومية ورسوم الخدمة = <?php echo $customer_price ?>
              <?php echo $currancy[$currancy_type];?>
         </h4>

        <h4> ::) لتاكيد الحجز نرجو ارسال الأتي :</h4>
       <ol>
        <li>صورة عن جواز السفر لتاكيد حجوزات الفنادق </li>
        <li>صورة التذكرة الدولية </li>

      </ol>

        <h4> ::) طريقه الدفع  :</h4>
       <ol>

        <li>لتاكيد حجزك يتطلب منك دفع عربون من سعر البرنامج  و سيقوم موظف الحجوزات بتاكيد جميع الحجوزات وارسالها لك.</li>
        <li>العربون المطلوب دفعة :<b> <?php echo ceil($downpayment) ?> <?php echo $currancy[$currancy_type];?> </b>.</li>
        </ol>
      <?php endif?>

        <h4> ::) الملاحظات : </h4>
      <ol>
        <li>العرض ساري على مدار السنة وقابل للزيادة في فترة الاجازة الصيفية بشكل بسيط.</li>
        <li>حالة عدم توفر الفندق المذكور سيتم توفير فندق آخر بنفس المستوى او يتم توفير البديل المناسب, وقد يكون هناك مبلغآ اضافيآ حسب مستوى الفندق البديل.</li>
        <li>مواعيد الدخول في جميع فنادق ماليزيا الساعة 2 ظهرآ وموعيد الخروج 12 ظهرآ.</li>
        <li>البرنامج قابل للتعديل حسب طلبك من حيث عدد اليالي وعدد الافراد مع فارق السعر.</li>
        <li>البرنامج لايشمل تذاكر دخول الاماكن السياحية .</li>
        <li>الوزن المجاني في الطيران الداخلي 15 كيلو للشخص الواحد وفي حاله وجود وزن زائد الرجاء ابلاغنا مسبقا .</li>
        <li> .لايشمل رسوم الاقامه عل السائح الاجنب ف ماليزيا 10 رنجت عل الغرفه ف الليله الواحده ورسوم البلديه المحليه ف
الجزر 3 رنجت عل الغرفه ف الليله الواحده وبقية الضرائب والرسوم مدفوعه من ضمن البرنامج</li>
<li>الجولات السياحية حسب التواريخ المذكورة والتواريخ الغير مذكورة تون أيام حرة بدون سائق</li>
<li>اذا تم إلغاء الحجز بعد التأكيد يضمن العميل جميع غرامات الإلغاء اذا لم يغطي العربون غرامات الإلغاء</li>
      </ol>


  <footer style="background-position: 50% 90%;background-position: left 95%;
      background-repeat: no-repeat;
      background-image: '<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg';
          /*height: 28px;*/
      padding-left: 40px;">
  <div><img src="<?php echo HTTPS_IMAGE ?>/malaysia-kl.jpg" width="820" ></div>
  <h3 style="text-align: center;">نتمنى لكم رحلة لاتنسى</h3>
  </footer>
  </div>
