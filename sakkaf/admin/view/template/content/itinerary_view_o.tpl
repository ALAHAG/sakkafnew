<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div style="width:820px; margin:0 auto; direction:rtl;">
<center><img width="100%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg"></center>

<center>السلام عليكم و رحمة الله و بركاته</center>
إسم العميل: <?php echo $customer_name_ar ?> - <?php echo $customer_name_en ?> <br>
رقم الهاتف: <?php echo $phone ?> <br>
تحية طيبة من شركة السقاف للسياحة والسفر <br>
رقم البرنامج : <?php echo BOOKING_PREFIX.$booking_id ?> <br>

<?php if ($itinerary_class_id == 3): ?>
 تم تأكيد البرنامج  كالتالي: <br>

<?php else: ?>
 تم إقتراح البرنامج  كالتالي: <br>
<?php endif ?>

<center><h4><?php echo $itinerary_title; ?></h4></center>
<?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
  <h4>الفنادق</h4>
  <table width="800" style="border:1px solid #CED0D1; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
    <tbody>
      <tr style="height:40px" >
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">المدينة</span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">من - الى </span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">اسم الفندق</span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">نوع الغرفة</span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">الإفطار</span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">عدد الليالي </span></td>
        <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">مستوى الفندق</span></td>
      </tr>
      
      <?php foreach ($itinerary_rooms as $room): ?>
        <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['city_ar_name'] ;?></td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['checkin'] ;?><br><?php echo $room['checkout'] ;?></td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['hotel_name'] ;?><br><?php echo $room['hotel_english_name'] ;?> </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['room_name'] ;?><br><?php echo $room['room_english_name'] ;?></td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['num_of_breakfast'] ;?></td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['num_of_nights'] ;?></td>
          <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $room['star_rate'] ;?> نجوم</td>
        </tr>

      <?php endforeach ?>
    </table>

  <?php endif ?>

  <?php if (isset($itinerary_transportations) && $itinerary_transportations): ?>
    <br>
  <h4>الرحلات و التنقلات الداخلية  </h4>
    <table width="800" style="border:1px solid #CED0D1; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
      <tbody>
        <tr style="height:40px" >
          <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">من - الى </span></td>
          <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">نوع المواصلات</span></td>
          <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">العدد</span></td>
        </tr>
        <?php foreach ($itinerary_transportations as $transportation): ?>
          <tr>
            <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $transportation['transportation_description_ar'] ;?><br><?php echo $transportation['transportation_description_en'] ;?> </td>
            <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $transportation['transportation_title_ar'] ;?><br><?php echo $transportation['transportation_title_en'] ;?></td>
            <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $transportation['num_of_transportations'] ;?></td>
          </tr>

        <?php endforeach ?>
      </table>

    <?php endif ?>

    <?php if (isset($itinerary)): ?> 
      <br>
      <h4>برنامج الرحلة</h4>
      <table width="800" style="border:1px solid #CED0D1; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
        <tbody>
          <tr style="height:40px" >
            <td style="text-align: center;background: rgb(106, 26, 87);
color: white;width: 77px;"><span style="font-weight: bold;">التاريخ</span></td>
            <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">البرنامج</span></td>
            <td style="text-align: center;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">Description</span></td>
            <?php if ($itinerary_class_id == 3): ?>
            <td style="text-align: center;;background: rgb(106, 26, 87);
color: white;"><span style="font-weight: bold;">Time - الوقت</span></td>
            <?php endif ?>
          </tr>
          <?php foreach ($itinerary as $key => $element):?>
            <?php if ($element['type'] == 'transportation'): ?>
              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background: rgb(106, 26, 87);
color: white;width: 77px;"> <?php echo $element['date'] ;?></td>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['transportation_description_ar'] ;?></td>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['transportation_description_en'] ;?></td>
                <?php if ($itinerary_class_id == 3): ?>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['time'] ;?></td>
                <?php endif ?>
             </tr>

            <?php endif ?>
            <?php if ($element['type'] == 'tour'): ?>
              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background: rgb(106, 26, 87);
color: white;"> <?php echo $element['date'] ;?></td>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['tour_description_ar'] ;?></td>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['tour_description_en'] ;?></td>
                <?php if ($itinerary_class_id == 3): ?>
                <td style="border:1px solid #CED0D1;text-align:center;"> <?php echo $element['time'] ;?></td>
                <?php endif ?>
              </tr>
            <?php endif ?>
            <?php endforeach ?>
          <?php endif ?>
        </tbody>
      </table>
        <br>
        <br>
        <br>
      <?php if ($itinerary_class_id == 2): ?>
     <center>
      <h3>إجمالي سعر البرنامج شاملا الضرائب و  رسوم الخدمة <?php echo $customer_price ?> رنجت ماليزي </h3><br>
      <h3>لتاكيد حجزك يتطلب من دفع 30% من سعر الفنادق + سعر الطيران كامل و سيقوم موظف الحجوزات بتاكيد جميع الحجوزات وارسالها لك.</h3><br>
      <h3>المبلغ المطلوب دفعه للتامين بالرنجت الماليزي: <?php echo ceil($customer_price*0.3) ?> رنجت ماليزي</h3><br>
      </center>
      <?php endif?>
   <!--  <h4>سياسة إلغاء الحجز:</h4>
    <div><br></div>
    <div>- إلغاء الحجز حسب سياسة كل فندق بعضها يتم خصم ليلة واحدة و البعض يخصم كامل المبلغ.</div>
    <div><br></div>
    <div>- في حالة إلغاء الحجز بعد تاكيده تخصم رسوم الخدمة و استرجاع باقي المبلغ حسب التاريخ المحدد.</div>
    <div><br></div>
    <h4>ملاحظات هامة للعميل :</h4>
    <div><br></div>
      <?php if ($itinerary_class_id == 2): ?>
<div>- يعتبر هذا عرض سعر فقط و لم يتم حجز اي شي الى الان و الشركة غير مسؤولة عن ضمان السعر في حالة تاخر العميل في تاكيد الحجز.</div>
      <?php endif?>
    <div>-           الجولات السياحية لا تتضمن تذاكر الدخول للأماكن السياحية.</div>
    <div>-           تذاكر الطيران الداخلي و العبارة غير قابلة للتبديل او الإرجاع وذلك حسب نظام الشركات الناقلة.</div>
    <div>-           يرجى مراعاة عدد الحقائب حسب نوع السيارة وفي حالة وجود حقائب كثيرة يرجى ابلاغ الشركة قبل الوصول الى ماليزيا.</div>
    <div>-           سعر تذاكر الطيران غير ثابت ويزداد بإقتراب الموعد.</div>
    <div> </div>
    <div><br></div>
    <div>-           جميع الجولات السياحية تبدأ بعد الافطار الساعة 10 صباحا و يمكنك تغيرها بالتواصل مع الشركة 12 ساعة على الأقل قبل موعد الجولة.</div>
    <div> </div>
    <div><br></div>
    <div>-           في حالة إضافة ساعات اضافية في الجولات يرجى اخبار السائق و دفع المبلغ الاضافي للسائق مباشرة</div>
    <div>-           الشركة غير مسؤولة عن أي تغيير في البرنامج من قبل العميل من دون علم الشركة.</div>
    <div>-           في السفر الداخلي : يجب وجود العميل في المطار / الميناء قبل موعد إقلاع الرحلة بساعتين على الأقل . في السفر الدولي : يجب وجود العميل في المطار قبل موعد إقلاع الرحلة بثلاث ساعات على الأقل . لذا يلزم التأكد من مواعيد السائقين والتواصل مع الشركة مباشرة في حالة التأخر.</div>
    <div><br></div>
    <div>-           تسجيل الدخول بالفنادق الساعة الثالثة عصرا،  و موعد الخروج الساعة 12:00 ظهرا .</div>
    <div><br></div>
    <div>-           الوزن المسموح به في  الطيران الداخلي في ماليزيا  هو 15كيلو لكل فرد بالغ و 15 كيلوا للطفل.</div>
    <div><br></div>
    <div>للمزيد من الاستفسار التواصل مع :</div>
    <div><br></div> -->
<!--<table align="center" border="1" width="60%">
  <tr>
    <td>الاسم</td>
    <td>العمل</td>
    <td>الهاتف</td>
  </tr>
   <tr>
    <td>أحمد الكثيري</td>
    <td>المشرف العام</td>
    <td>0060149317909</td>
  </tr>
  <tr>
    <td>راضي حديجان</td>
    <td>المدير التنفيذي</td>
    <td>00601111633514</td>
  </tr>
  <tr>
    <td>راشد بت</td>
    <td>مسؤول المواصلات</td>
    <td>0060169569785</td>
  </tr> 
</table>-->
<center>نتمنى لكم رحلة لاتنسى</center>
</div>
