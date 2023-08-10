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
                    <div class="travelo-google-map block"></div>
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

    <script type="text/javascript">
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
    </script>
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
