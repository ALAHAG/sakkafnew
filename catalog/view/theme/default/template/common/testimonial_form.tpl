
<div id="container">

    <div class="content">
      
      <div class="panel panel-default">
        <div class="panel-body text-right">
          <div class="content">
            <form  method="post" id="form" class="form-horizontal">
              <div id="tab-general">
                      <h3> رأيك يهمنا </h3><hr>

                <div>
                  <div class="col-lg-12">
                   <div class="form-group">

                    <label class="col-md-12 control-label ">الاسم:</label>
                    <div class="col-md-12 ">
                      <input class="form-control" type="text" name="name" id="name"  value="<?php echo isset($name) ? $name : ''; ?>" />
                      <input type="hidden" name="customer_id" value="<?php echo isset($customer_id) ? $customer_id : ''; ?>" />
                      <input type="hidden" name="testimonial_id" value="<?php echo isset($testimonial_id) ? $testimonial_id : ''; ?>" />
                    </div>
                  </div>
                  <div class="form-group">

                    <label class="col-md-12 control-label">الايميل:</label>
                    <div class="col-md-12 ">

                      <input class="form-control" type="text" name="email" id="email"  value="<?php echo isset($email) ? $email : ''; ?>" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-12 control-label">التعليق:</label>
                    <div class="col-md-12 ">

                    <textarea class="form-control"  name="testimonial_body" id="testimonial_body" rows="4"><?php echo isset($testimonial_body) ? $testimonial_body : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">

                    <label class="col-md-12 control-label">مستوى الخدمة : </label>
                    <div class="col-md-12 ">
                    <select id="input-type" name='company_rate' id="company_rate" class="form-control" >
                      <?php for ($i = 10; $i > 0 ; $i--): ?>
                        <option value="<?php echo $i?>" <?php if(isset($company_rate) && $company_rate == $i) echo 'selected="selected"';?>> <?php echo $i;?> / 10 </option>
                      <?php endfor ?>
                    </select>
                    </div>
                  </div>
                  <div class="form-group">
                   <label class="col-md-12 control-label">الجنسية : </label>
                   <div class="col-md-12 ">
               <!--      <select id="country" name='country' class="form-control">
                      <?php foreach ($countries as $country): ?>
                        <option value="<?php echo $country['country_id']?>" <?php if(isset($country_id) && $country_id == $country['country_id']) echo 'selected="selected"';?>> <?php echo $country['name']?> 
                        </option>
                      <?php endforeach ?>
                    </select> -->
                   <input class="form-control" type="text" name="country" id="country"  value="" />

                  </div>
                </div>
              </div>
              <div class="form-group">
              <label class="col-md-12 control-label">الصوره : </label>
             <div class="col-md-4 " id="">


                <div class="row">
                    <div id="images">
                      <img src="<?php echo HTTP_IMAGE;?>testimonial.jpg" width="200" id="image_2">
                      <input type="hidden" class="cover" name="customer_image" value="" id="image_url"/>
                    </div>

                  </div>
                  <div id="filelist">المتصفح لايدعم الاصدار من html5</div>
                  <div id="files" class="row">
                    <a id="pickfiles" class="btn btn-primary" href="javascript:;">اضف صورة</a> 
                  </div>
                  <hr>

              </div>
            </div>
             <div id="information-images" style="disply:block;">
              <div id="file_container">
                <div id="filelist"></div>
              </div>
                   <div class="form-group row">
                                                <div class="col-md-12">
                                                    <button type="submit" class="gradian_button full-width btn-large" id="send">إرسال الطلب</button>
                                                </div>
                                            </div>
            <div style="clear:both;"></div>
            <p></p>
          </div>
        </form>
      </div>
    </div>
<script type="text/javascript" src="catalog/view/javascript/plupload/plupload.full.min.js"></script>
  <script type="text/javascript">

    var counter = <?php echo isset($key) ? $key+1 : 0; ?>;
    var directory = "catalog/testimonial";

    var uploader = new plupload.Uploader({
      runtimes : 'html5,flash,silverlight,html4',
      unique_names : true,
    browse_button : 'pickfiles', // you can pass in id...
    container: document.getElementById('files'), // ... or DOM Element itself
    url : '<?php echo $uploader;?>',
    flash_swf_url : 'catalog/view/javascript/plupload/Moxie.swf',
    silverlight_xap_url : 'catalog/view/javascript/plupload/Moxie.xap',
    multipart_params : {
      "directory" : directory
    },
    
    filters : {
      max_file_size : '10mb',
      mime_types: [
      {title : "Image files", extensions : "jpg,gif,png"},
      ]
    },

    init: {
      PostInit: function() {
        document.getElementById('filelist').innerHTML = '';
      },

    FilesAdded: function(up, files) {

     uploader.start();
   },

   UploadProgress: function(up, file) {
    $('body').append('<div id="modal"></div>');
    // $('#modal').modal('show');
      // document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
    },

    Error: function(up, err) {
      // document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
    },
    FileUploaded: function(up, file,res) {
      var response = JSON.parse(res.response);
      image = ''
      +'../image/'+directory+'/'+response.fileName;
       button='<div class="form-group">'
      +'<input type="hidden" class="cover" name="customer_image" value="'+directory+'/'+response.fileName+'" >'
      +'</div>';
      $('#image_2').attr('src',image);
      // $('#images').append(button);
      counter++;
      $('#image_url').val(directory+'/'+response.fileName);
      // $('#modal').modal('hide');

      $('.cover').click(function () {
        element = this;
        $('.cover').each(function () {
          $(this).removeAttr("checked");
        })
        $(element).prop("checked","checked");
      })


    }
  }
});

uploader.init();



</script>
<script type="text/javascript">
  

  $('#send').click(function (e) {
            e.preventDefault();
    if(validates()){
        $.ajax( {
            type: 'POST',
            url: '<?php echo $action;?>',
            data: $('#form').serialize(),
         
            success: function(data) {
              
                $('#form').html("<h3>شكرا جزيلا</h3>");
            
            }
        } );
      }

    })

       // validatesDate();
       
            var check = '';
           function validates () {
              var name = $("input#name").val();
                if (name == "") {
                $("input#name").focus()
                .css('background-color' , 'rgba(239, 255, 94, 0.59)');
                return false;
              }
                var email = $("input#email").val();
                if (email == "") {
                $("input#email").focus();
                $("input#email").css('background-color' , 'rgba(239, 255, 94, 0.59)');
                    return false;
              }
               var rating = $("select#company_rating").val();
               
               if (rating == '0') {
            $("#company_rating option[value='10']").attr('selected', 'selected');
          return false;
              }
              // var country = $("select#country").val();
              //   if (country == "") {
              //   $("select#country").focus();
              //   return false;
              // }
                var country = $("input#country").val();
                if (country == "") {
                $("input#country").focus()
                .css('background-color' , 'rgba(239, 255, 94, 0.59)');
                return false;
              }     

              var comment = $("textarea#testimonial_body").val();
        if (comment == "") {
                $("textarea#comment").css('background-color' , 'rgba(239, 255, 94, 0.59)');
                return false;
              }

              return true;
        }      
      // validates
</script>

