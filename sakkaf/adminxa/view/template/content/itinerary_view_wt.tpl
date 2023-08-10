  *السلام عليكم و رحمة الله و بركاته*<br/>
*تحية عطرة من شركة السقاف للسياحة والسفر*  _ماليزيا_ <br/><br/>

  *إسم العميل :* *<?php echo $customer_name_ar ?>*<br/>
  *رقم الهاتف :* <?php echo $phone ?> <br/>
  *رقم البرنامج :* <?php echo BOOKING_PREFIX.$booking_id ?>          <br/>
  *عدد المسافرين :* <?php echo $data[num_adults] ?>  بالغين   <?php if( !empty($data[num_children])) {  echo ' والاطفال '.$data[num_children];}  ;?>  <br/>
  <br/>---------------<br/>

<?php if ($itinerary_class_id == 3): ?>
  *تم تأكيد البرنامج  كالتالي*: <br/>
<?php else: ?>
 *تم إقتراح البرنامج  كالتالي* <br/>
<?php endif ?>
---------------<br/>
<?php echo '*'.$itinerary_title.'* 🇲🇾 🇲🇾'; ?>  <br/>

<?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
  1⃣  *الفنادق* _شامل الافطار والضرائب_ <br/>
      <?php foreach ($itinerary_rooms as $room): ?>
        <?php $star=$room['star_rate']; if ($room['star_rate']==4) $star= '⭐⭐⭐⭐';else if ($room['star_rate']==4) $star='⭐⭐⭐⭐⭐';else $star=$room['star_rate']; ?><br/>
 📍<?php echo '*المدينة: '.$room['city_ar_name'].'* ';?> <br/>
  <?php echo $star.' '.$room['hotel_name'];?></br/>
  🗓<?php echo $room['checkin'] ;?>🔚<?php echo $room['checkout'] ;?> <br/>
  <?php echo 'اسم الغرفه: '.$room['num_of_rooms'].' x '.$room['room_name'] ;?> <br/>
  <?php echo 'عدد الليالي : '.$room['num_of_nights'] ;?><br/>
  <br/><br/>------------- <br/><br/>
    <?php endforeach ?>
  <?php endif ?>
  <?php if (isset($itinerary_transportations) && $itinerary_transportations): ?>
    <?php endif ?>
    <?php if (isset($itinerary)): ?><br/>
  2⃣ *برنامج الرحلة التفصيلي* <br/><br/>

          <?php foreach ($itinerary as $key => $element):?>
            <?php if ($element['type'] == 'transportation'): ?><br/>
  🗓<?php echo $element['date'] ;?>
    <?php echo '🚘 *['.$element['transportation_title_ar'].'*' ;?>]<br/>
    <?php echo isset($element['transportation_description_ar']) && !empty($element['transportation_description_ar']) ? $element['transportation_description_ar'] : $element['transportation_description_en'] ;?> <br/><br/>
    <?php endif ?>
            <?php if ($element['type'] == 'tour'): ?><br/>
  🗓 <?php echo $element['date'] ;?> [<?php echo '🚙*'.$element['tour_title_ar'].'*' ;?>]<br/>
    <?php echo isset ($element['tour_description_ar']) && !empty($element['tour_description_ar']) ? $element['tour_description_ar'] : $element['tour_description_en'] ;?>--
  <br/>      <?php endif ?>
            <?php endforeach ?>
          <?php endif ?>
    <?php $currancy=array(1=>'رنجت ماليزي',2=>'ريال سعودي',3=>'دولار امريكي',4=>'ريال قطري',5=>'درهم اماراتي',6=>'ريال عماني'); ?>
    <?php if ($itinerary_class_id == 2): ?><br/>
💸 *اجمالي سعر البرنامج*  _شامل للضرائب الحكومية ورسوم الخدمة_  = *<?php echo $customer_price ?>* *<?php echo $currancy[$currancy_type];?>*<br/>
✍ *لتاكيد الحجز نرجو ارسال الأتي :*

1⃣ صورة عن جواز السفر لتاكيد حجوزات الفنادق <br/>
2⃣ صورة التذكرة الدولية <br/><br/>


💳 *طريقه الدفع*  :<br/><br/>

✅ لتاكيد حجزك يتطلب منك دفع عربون من سعر البرنامج  و سيقوم موظف الحجوزات بتاكيد جميع الحجوزات وارسالها لك.<br/>
✅ العربون المطلوب دفعة :<b> *<?php echo ceil($downpayment) ?> <?php echo $currancy[$currancy_type];?>* .<br/>
<br/><br/>      <?php endif?>

📝*الملاحظات* : <br/><br/>

✅ العرض ساري على مدار السنة وقابل للزيادة في فترة الاجازة الصيفية بشكل بسيط.<br/>
✅ حالة عدم توفر الفندق المذكور سيتم توفير فندق آخر بنفس المستوى او يتم توفير البديل المناسب, وقد يكون هناك مبلغآ اضافيآ حسب مستوى الفندق البديل.<br/>
✅ مواعيد الدخول في جميع فنادق ماليزيا الساعة 2 ظهرآ وموعيد الخروج 12 ظهرآ.<br/>
✅ البرنامج قابل للتعديل حسب طلبك من حيث عدد اليالي وعدد الافراد مع فارق السعر.<br/>
✅ البرنامج لايشمل تذاكر دخول الاماكن السياحية .<br/>
✅ الوزن المجاني في الطيران الداخلي 15 كيلو للشخص الواحد وفي حاله وجود وزن زائد الرجاء ابلاغنا مسبقا .<br/>
✅  .لايشمل رسوم الاقامه علي السائح الاجنبي في ماليزيا 10 رنجت علي الغرفه في الليله الواحده ورسوم البلديه المحليه في
الجزر 3 رنجت علي الغرفه في الليله الواحده وبقية الضرائب والرسوم مدفوعه من ضمن البرنامج<br/>
✅ الجولات السياحية حسب التواريخ المذكورة والتواريخ الغير مذكورة تون أيام حرة بدون سائق<br/>
