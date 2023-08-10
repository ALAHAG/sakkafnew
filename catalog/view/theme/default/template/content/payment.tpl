<?php echo $header ?>
<!-- <style type="text/css" media="screen">
    input[type="image"] {
    height: 50px;
    text-align: center;
    padding-right: 40%;
} -->
</style>
         <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title">الدفع بالبطاقة الائتمانية </h2>
                </div>
            </div>
        </div>

        <section id="content" >
            <div class="container">
              <div class="row">

              <div class="col-md-8">
                <div id="main">
                  <h1 class="heading-orange heading-padding"> الدفع المباشر عبر البطائق الائتمانية </h1>
                  <div class="col-md-12">ينصح بدفع العربون بعد اختيار البرنامج والتواصل مع الموظف المختص لارسال صور جوازاتكم </div>

                    <div class="col-md-12">                    <hr/><br/>
                  من خلال الرابط ادناه تستطيع الدفع مباشره لحساب الشركه عن طريق خدمة
                </div><ol style="padding:4%;    list-style: circle;
    margin: 11px 10px;
    color: #560788;
    font-size: 1.3em;">
                    <li>الدفع بأستخدام البايبال</li>
                    <li>البطاقة الائتمانية (مستر كارد او فيزا كارد)</li>

                  </ol>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
              <input type="hidden" name="cmd" value="_s-xclick">
              <input type="hidden" name="hosted_button_id" value="4SDBRMQR8NZKW">
              <input type="image" src="http://alsakkaftravel.net/image/paypal.jpg" width="100%" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
              <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
              </form>



                </div>
            </div>
            <div class="sidebar col-md-4">
                <article class="">
                                        <?php echo $right_sidebar; ?>

                </article>
            </div>
          </div>
        </div>

        </section>



<?php  echo $footer ?>
