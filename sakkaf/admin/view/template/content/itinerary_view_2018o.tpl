<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
    box-sizing: border-box;
}

body {
    background-color: white;
    font-family: Helvetica, sans-serif;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
.bg-color{
  background-color: #3e2255 ;
  color: #422156;
}
/* td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
} */
.footer{
  background: #ddd;
}
span.timer {
  padding: 4px 14px;
      font-size: 18px;
      font-weight: bold;
      color: #a51745;
      border: 2px solid;
      border-radius: 15px 0px 0px 15px;
}
span.timel {
  font-size: 18px;
  font-weight: bold;
  padding: 4px 20px;
  color: #a5177b;
  border: 2px solid;
  border-radius: 0px 15px 15px 0px;
}
h4.title {
    background: #642367;
    text-align: right;
    padding: 20px;
    font-size: 20px;
    width: 50%;
    font-weight: bold;
    color: #f9f9f9;
}
.time {
    PADDING: -5px;
    margin-top: -7px;
    margin-right: -25px;
}
.heading-orange{
  padding: 20px;
}
.right-head{
  width: 50%;
  float: left;
}.left-head{
  width: 50%;
  float: right;
  position: relative;
}
/* The actual timeline (the vertical ruler) */
.timeline {
    position: relative;
    max-width: 1000;
    margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
    content: '';
    position: absolute;
    width: 6px;
    background-color: #dddddd;
    top: 0;
    bottom: 0;
    /* left: 50%; */
    right: 1.5%;
    margin-left: -3px;
}

/* Container around content */
.container {
    padding: 10px 40px;
    position: relative;
    background-color: inherit;
    /* width: 50%; */
}

/* The circles on the timeline */
.container::after {
    content: '';
    position: absolute;
    width: 25px;
    height: 25px;
    right: 1px;
    background-color: #dddddd  ;
    border: 4px solid #FF9F55;
    top: 15px;
    border-radius: 50%;
    z-index: 1;
}

/* Place the container to the left */
.left {
    left: 0;
}

/* Place the container to the right */
.right {
    left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
    content: " ";
    height: 0;
    position: absolute;
    top: 22px;
    width: 0;
    z-index: 1;
    right: 30px;
    border: medium solid white;
    border-width: 10px 0 10px 10px;
    border-color: transparent transparent transparent #dddddd;
}

/* Add arrows to the right container (pointing left) */
.right::before {
    content: " ";
    height: 0;
    position: absolute;
    top: 22px;
    width: 0;
    z-index: 1;
    left: 30px;
    border: medium solid white;
    border-width: 10px 10px 10px 0;
    border-color: transparent black transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
    left: -16px;
}

/* The actual content */
.content {
    padding: 20px 30px;
    background-color: #dddddd;
    position: relative;
    border-radius: 6px;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
    left: 31px;
  }

  /* Full-width containers */
  .container {
    width: 100%;
    padding-left: 70px;
    padding-right: 25px;
  }

  /* Make sure that all arrows are pointing leftwards */
  .container::before {
    left: 60px;
    border: medium solid white;
    border-width: 10px 10px 10px 0;
    border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
    left: 15px;
  }

  /* Make all right containers behave like the left ones */
  .right {
    left: 0%;
  }
}
</style>
</head>
<body>
  <div style=" margin:0 auto; direction:rtl;background:#fff;">
    <!-- <center>  <img width="100%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg"> </center> -->

  <div class="heading-orange">
    <div class="right-head">
      <table  class="txt-color "  style=" " align="center" dir="rtl" cellpadding="0" cellspacing="0">
        <tbody>
          <tr  >
            <td style="" width="120"><span style="font-weight: bold;">      العنوان</span></td>
            <td style=""><span >       <br/>Unit 17-02, Plaza 138, <br/> Jalan Ampang, 50450 Kuala Lumpur<br/> Malaysia</span></td>
          </tr>
           <tr style="height:30px" >
            <td style=""><span style="font-weight: bold;">الهاتف</span></td>
            <td style=""><span>0000000255222 </span></td>
          </tr>
          <tr  >
            <td style=""><span style="font-weight: bold;">  الموقع الالكتروني</span></td>
            <td style=""><span> www.alsakkaftravel.net </span></td>
          </tr>
          <!-- <tr style="height:30px" >
            <td style="" width="120" ><span style="font-weight: bold;" > عدد المسافرين :</span></td>
            <td style=""><span> <b><?php echo $data[num_adults].'</b> بالغين و <b>'.$data[num_children].'</b> الاطفال';?> </span></td>
          </tr> -->
          </tbody>
      </table>


  <?php if($agent_type ==2){ ?> <br/><br/><br/>

  <!-- "تحية طيبة" -->
  <?php } else { ?>

  <!-- <div>"تحية عطرة من شركة السقاف للسياحة والسفر"</div> -->
  <?php } ?>
  <!-- <hr/> -->
</div>
<div class="left-head">

    <table  class="txt-color "  style=" " align="center" dir="rtl" cellpadding="0" cellspacing="0">
      <tbody>
        <tr style="height:30px" >
          <td style="" width="120"><span style="font-weight: bold;">إسم العميل :</span></td>
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
          <td style="" width="120" ><span style="font-weight: bold;" > عدد المسافرين :</span></td>
          <td style=""><span> <b><?php echo $data[num_adults].'</b> بالغين و <b>'.$data[num_children].'</b> الاطفال';?> </span></td>
        </tr>
        </tbody>
    </table>
    </div>
  </div>
  <div style="font-weight: bold;text-align: center;clear:both;padding-top:10px">
  <?php if ($itinerary_class_id == 3): ?>
   تم تأكيد البرنامج  كالتالي: <br>

  <?php else: ?>
   تم إقتراح البرنامج  كالتالي: <br>
  <?php endif ?></div>
  <hr/>
  <div style="width:1000; margin:0 auto; direction:rtl;background:#fff;">

  <h4 class="txt-color" style="text-align: center;"> {{ <?php echo $itinerary_title; ?> }} </h4></div>
  <?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
    <h4 class="title">1) الفنادق ( شامل الافطار والضرائب )</h4>

  <div class="content-block">
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
          <td class="tb_col"><a target="blank" href="<?php echo 'http://alsakkaftravel.net/'.$room['slug'] ?>"> <?php echo $room['hotel_name'] ;?> <br><?php echo $room['hotel_english_name'] ;?> </a><br/> <b> *<?php echo $room['star_rate'] ;?> نجوم </b></td>
          <td class="tb_col"> <?php echo $room['num_of_rooms'].' x '. $room['room_name'] ;?><br ><span dir="ltr"><?php echo $room['num_of_rooms'].' x '.$room['room_english_name'] ;?></span></td>
          <td class="tb_col"> <?php echo $room['num_of_breakfast'] ;?></td>
          <td class="tb_col"> <?php echo $room['num_of_nights'] ;?></td>
<!--           <td style="border:1px solid #CED0D1;text-align:center;padding:1.5em 1px; font-weight: bold;"> *<?php echo $room['star_rate'] ;?> </td>
 -->        </tr>

      <?php endforeach ?>
    </tbody>
    </table>
  </div>
<?php endif ?>

  <br>
  <?php if (isset($itinerary)): ?>

<h4 class="title"> 2) البرنامج اليومي للرحلات و التنقلات الداخلية  </h4>
<div class="timeline">
  <?php foreach ($itinerary as $key => $element):?>
    <?php if ($element['type'] == 'transportation'): ?>
  <div class="container left">
    <div class="content">
      <div class="time"> <span class="timel" ><?php echo $element['date'] ;?> </span><span class="timer"><?php echo $element['transportation_title_ar'] ;?></span></div>
      <p><?php echo isset($element['transportation_description_ar']) && !empty($element['transportation_description_ar']) ? $element['transportation_description_ar'] : $element['transportation_description_en'] ;?></p>
    </div>
  </div>
  <?php endif ?>
  <?php if ($element['type'] == 'tour'): ?>
    <div class="container left">
      <div class="content">
        <div class="time"> <span class="timel" ><?php echo $element['date'] ;?> </span><span class="timer"><?php echo $element['tour_title_ar'] ;?></span></div>
        <p><?php echo isset ($element['tour_description_ar']) && !empty($element['tour_description_ar']) ? $element['tour_description_ar'] : $element['tour_description_en'] ;?></p>
      </div>
    </div>
  <?php endif ?>
  <?php endforeach ?>
<?php endif ?>
</div>
<br>
<br>
<br>

<div class="footer content-block pagebreak">

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
<li>البرنامج لايشمل رسوم الاقامه على السائح الاجنبي في ماليزيا 10 رنجت على الغرفه في الليله الواحده ورسوم البلديه المحليه في الجزر 3 رنجت على الشخص الواحد وبقية الضرائب والرسوم مدفوعه من ضمن البرنامج</li>

</ol>
</div>

<footer style="background-position: 50% 90%;background-position: left 95%;
background-repeat: no-repeat;
background-image: '<?php echo HTTP_IMAGE ?>/malaysia-kl.jpg';
/*height: 28px;*/
padding-left: 40px;">
<div><img src="<?php echo HTTP_IMAGE ?>/malaysia-kl.jpg" width="820" ></div>
<div>للمزيد من الاستفسار التواصل مع :</div>
<div><br></div>
<table align="center" border="1" width="60%">
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
</table>
<center>نتمنى لكم رحلة لاتنسى</center>
<h3 style="text-align: center;">نتمنى لكم رحلة لاتنسى</h3>
<!-- <h4><?php echo $firstname; ?>-- <?php echo $lastname; ?></h4> -->

</footer>
</div>
