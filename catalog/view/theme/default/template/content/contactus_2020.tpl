<?php echo $header ?>

         <div class="page-title-container">
            <div class="container">
                <div class="page-title pull-left">
                    <h2 class="entry-title">إتصل بنا</h2>
                </div>
            </div>
        </div>

        <section id="content">
            <div class="container">
                <div id="main">
                    <div class="travelo-google-maps block"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15935.027380899106!2d101.7079811!3d3.1586771!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcd544fb42a764536!2z2LTYsdmD2Kkg2KfZhNiz2YLYp9mBINmE2YTYs9mK2KfYrdipINmI2KfZhNiz2YHYsSDZhdin2YTZitiy2YrYpw!5e0!3m2!1sen!2smy!4v1543131265954" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
                    <div class="contact-address row block">
                        <div class="col-md-4">
                            <div class="icon-box style4">
                                <i class="soap-icon-phone"></i>
                                <div class="description">
                                    <small>تلفون المكتب</small>
                                    <h5 style="direction:ltr">006-03 21815444</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="icon-box style4">
                                <i class="soap-icon-message"></i>
                                <div class="description">
                                    <small>الايميل</small>
                                    <h5>marketing@alsakkaftravel.com</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="icon-box style4">
                                <i class="soap-icon-address"></i>
                                <div class="description">
                                    <small>العنوان</small><h5> Unit 17-02, Plaza 138, Jalan Ampang, 50450 Kuala Lumpur, Malaysia</h5>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="travelo-box box-full">
                        <div id="contact-form">
                            <h2>ارسل رسالة</h2>
                            <form id="contact_form" class="cruise-booking-form" method="post">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>الاسم</label>
                                            <input type="text" name="name" class="input-text full-width">
                                        </div>
                                        <div class="form-group">
                                            <label>الايميل</label>
                                            <input type="text" name="email" class="input-text full-width">
                                        </div>
                                        <div class="form-group">
                                            <label>العنوان</label>
                                            <input type="text" name="subject" class="input-text full-width">
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <label>الرسالة</label>
                                            <textarea name="message" rows="8" class="input-text full-width" placeholder="اكتب رسالتك هنا"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sms-offset-6 col-sm-offset-6 col-md-offset-8 col-lg-offset-9">
                                    <button class="btn-medium full-width" type="submit">ارسال</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <!-- <script type="text/javascript">
        $(".travelo-google-map").gmap3({
            map: {
                options: {
                    center: [3.159021,101.7057173],
                    zoom: 12
                }
            },
            marker:{
                values: [
                    {latLng:[3.159021,101.7057173], data:"Paris"}

                ],
                options: {
                    draggable: false
                },
            }
        });
    </script> -->
    <script type="text/javascript">
             $('#contact_form').submit(function (e) {
            e.preventDefault();
            $.ajax({
                type: 'post',
                url: '<?php echo $link_send_contact;?>' ,
                data: $('#contact_form').serialize(),
                success: function (data) {
                     // alert("تم استلام طلبك بنجاح ");
                     $('#contact_form').get(0).reset();
                }

            });


        });
            </script>
<?php  echo $footer ?>
