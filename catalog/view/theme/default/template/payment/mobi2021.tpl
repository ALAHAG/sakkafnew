<?php echo $header ?>
<?php     $user_ip = getUserIP();
$mUrl = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ?
  "https" : "http") . "://" . $_SERVER['HTTP_HOST'] .
  $_SERVER['REQUEST_URI'];
  function getUserIP()
  {
      $client  = @$_SERVER['HTTP_CLIENT_IP'];
      $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
      $remote  = $_SERVER['REMOTE_ADDR'];

      if(filter_var($client, FILTER_VALIDATE_IP))
      {
          $ip = $client;
      }
      elseif(filter_var($forward, FILTER_VALIDATE_IP))
      {
          $ip = $forward;
      }
      else
      {
          $ip = $remote;
      }

      return $ip;
  }
?>

  <div class="container">
<form name="Payer" id="Payer" method="post">
<input type="hidden" name="PaReq" id="PaReq" />
<input type="hidden" name="TermUrl" value="<?php echo $link_payment_callback;?>" id="TermUrl" />
<input type="hidden" name="MD" id="MD" />
</form>
<div class="raw payments" >


<form  method="post" id="payment" class="cruise-booking-form">
  <div class="row col-md-12 heading-oranges">
    <h3 class=""style="max-width:550;margin:0 auto;display:inline;color:white;">Pay by Mobiversa (Credit/Debit Card) <img style="float:right;" src="mobiversa.png" /></h3>

  </div><br>
  <div class="col-md-12">
    <br>

    <div class="form-group col-md-8 col-xs-8">
        <label for="fname"><i class="fa fa-user"></i> Full Name</label>
        <input class="input-text full-width" type="text" name="nameOnCard" required  />
      </div>

      <div class="form-group col-md-4 col-xs-4">
        <label> Booking ID</label>
        <input class="input-text full-width" type="text" id="ordrid" name="ordrid" value="">
        <input type="hidden" class="input-text full-width"  id="reference" name="reference" value="" required>
      </div>
    </div>

<div class="col-md-12">

  <div class="form-group col-md-8 col-xs-8">
      <label ><i class="fa fa-card"></i> Card Number <div id="cards" class="mt-1 text-left input-group-addon"></div></label>
     <input class="input-text full-width" type="text"style="direction:ltr" class="form-control norm-border" id="cardNumberSpaced" name="cardnum_space" placeholder="XXXX XXXX XXXX XXXX" value="" required>
    <input type="hidden" class="input-text full-width"  id="cardNumber" name="cardnum" value="" required>

  </div>
  <div class="form-group col-md-4 col-xs-4">
    <label ><i class="fa fa-ccv"></i> CCV <img src="ccv.gif" class="text-left"alt="ccv sample" width="50"></label>
      <input class="input-text " width="80%"  type="text" name="ccv" value="" placeholder="XXX">
  </div>
</div>
<div class="col-md-12 ">
  <div class="form-group col-md-12 col-xs-12">
    <label > ExpDate </label>
    <input class="input-text"  type="text" name="exp_mm" placeholder="MM" value="" style="width:35%;">
     <input class="input-text"  style="width:63%;" type="text" name="exp_yy" placeholder="YYYY" value="">
  </div>
</div>
<div class="col-md-12">
  <div class="form-group col-md-12 col-xs-12">
    <label > <i class="fa fa-envelope"></i> Email </label>
    <input class="input-text full-width"  type="text" name="emailid" value="">

  </div>
</div>
<div class="col-md-12">
  <div class="form-group col-md-12 col-xs-12">
    <label > Amount (MYR)</label>
    <input type="text" class="input-text full-width"  id="fee" name="fee" placeholder="10.00" value="0.00" required>
    <small id="amountHelper" class="form-text text-muted">
          <br/>Processing fee: <span id="processingFee">0.00</span><strong>MYR</strong>
    </small>
    <input type="hidden" class="form-control" id="amount" name="amount" placeholder="10.00" value="0.00" required></td>
  </div>
</div>
<div class="col-md-12 col-xs-12">
  <div class="form-group col-md-12 col-xs-12">
    <input type="submit" name="submit" value="Pay" id="button-confirm" class="full-width btn-large"></td>

  </div>
</div>


  <table width="500"  class="table table-striped">
		<tr>
			<!-- <td colspan="2"><h3 style="display:inline;">Pay by Mobiversa (Credit/Debit Card)</h3> <img style="float:right;" src="mobiversa.png" /></td> -->
		</tr>
		<tr style="display: none;">
			<td><strong>IP Address</strong></td>
			<td><input class="input-text full-width" type="text" name="ip" value="<?php echo $user_ip; ?>" /></td>
		</tr>
		<tr style="display: none;">
		<td><strong>URl</strong></td>
		<td><input class="input-text full-width" class="form-control" type="text" name="mUrl" value="<?php echo $mUrl; ?>" /></td>
		</tr>
		<tr style="display: none;">
			<td><strong>First Name</strong></td>
			<td><input class="input-text full-width" type="hidden"  name="firstName"  /></td>
		</tr>
		<tr style="display: none;">
			<td><strong>Last Name</strong></td>
			<td><input class="input-text full-width" type="hidden" name="lastName"  /></td>
		</tr>
		<tr style="display: none;">
			<td><strong>Postal Code</strong></td>
			<td><input class="input-text full-width" type="hidden" name="postalCode"  /></td>
		</tr>
		<tr style="display: none;">
			<td><strong>Shipping State</strong></td>
			<td><input class="input-text full-width" type="hidden" name="shippingState"  /></td>
		</tr>

    <!-- <tr>
      <td><strong>Booking ID</strong></td>
      <td><input class="input-text full-width" type="text" id="ordrid" name="ordrid" value=""></td>
      <input type="hidden" class="input-text full-width"  id="reference" name="reference" value="" required>

    </tr> -->
		<!-- <tr>

			<td><strong>Card Holder Name</strong></td>
			<td><input class="input-text full-width" type="text" name="nameOnCard" required  /></td>
		</tr> -->

		<!-- <tr>
			<td><strong>Card Number</strong></td>
      <td >  <input class="input-text full-width" type="text"style="direction:ltr" class="form-control norm-border" id="cardNumberSpaced" name="cardnum_space" placeholder="XXXX XXXX XXXX XXXX" value="" required>
        <input type="hidden" class="input-text full-width"  id="cardNumber" name="cardnum" value="" required>
        <div id="cards" class="mt-1 text-left"></td>
		</tr>
		<tr>
			<td><strong>CCV</strong></td>
			<td>
        <div class="wrap "><input class="input-text " width="80%"  type="text" name="ccv" value="">
        <div class="col-sm-3 pl-0">
          <img src="ccv.gif" alt="ccv sample" width="100%">
        </div>
      </div>
      </td>
		</tr> -->
		<!-- <tr>
			<td><strong>ExpDate</strong></td>
			<td><input class="input-text"  type="text" name="exp_mm" placeholder="MM" value="" style="width:20%;"> <input class="input-text"  style="width:60%;" type="text" name="exp_yy" placeholder="YYYY" value=""></td>
		</tr>
		<tr>
			<td><strong>Email Address</strong></td>
			<td><input class="input-text full-width"  type="text" name="emailid" value=""></td>
		</tr> -->
		<!-- <tr>
			<td><strong>Amount</strong></td>
      <td><input type="text" class="input-text full-width"  id="fee" name="fee" placeholder="10.00" value="0.00" required>
      <small id="amountHelper" class="form-text text-muted">
          <br/>Processing fee: <span id="processingFee">0.00</span><strong>MYR</strong>
      </small>
      <input type="hidden" class="form-control" id="amount" name="amount" placeholder="10.00" value="0.00" required></td>
		</tr>

		<tr>
    <td colspan="2">

      <input type="submit" class="input-text full-width"  name="submit" value="Submit" id="button-confirm" class="btn btn-primary"></td>
  </tr> -->
	</table>
</form>
</div>
</div>
<style>
	table, th, td{border:1px solid #000;}
	td{padding:5px;}
  input.input-text {
    background: #dbdbdb;
    border-radius: 12px;
    padding: 8px;
    width: 100%;
    height: 3em;
    border: 1px solid #a9a1a1;
}
.text-left {
    text-align: right;
    float: right;
}
form .form-group {
    float: left;
}
form#payment {
    border: 1px solid #d2d1d1;
    /* padding: 1em 0px; */
    color: #000000;
    font-weight: bold;
    background: #ffffff;
    max-width: 500px;
    direction: ltr;
    margin: 0px auto;
}
input#button-confirm {
    background: #71055f;
    padding: 20px;
    border-radius: 12px;
    color: white;
    font-weight: bold;
}
.row.col-md-12.heading-oranges {
    background: #861f72;
    text-align: left;
    padding: 1em;
    margin: 0px;
    max-width: 500px;
}
</style>

<script type="text/javascript"><!--
$('#payment').submit(function (e) {
 e.preventDefault();
 $.ajax({
    url: '<?php echo $link_send_payment;?>',
    type: 'post',
    data: $('#payment :input'),
    dataType: 'json',
    cache: false,
    beforeSend: function() {
      $('#button-confirm').button('loading');
    },
    complete: function() {
      $('#button-confirm').button('reset');
      // alert("تم استلام طلبك بنجاح ");
    },
    success: function(json) {//alert(JSON.stringify(json)); console.log(json);
      if (json['error']) {
        alert(json['error']);

      }

      if (json['PaReq']) {
        $("#Payer").attr('action', json['Url']);
        $('#PaReq').val(json['PaReq']);
        //$('#TermUrl').val(json['TermUrl']);
        $('#MD').val(json['MD']);
        $('#Payer').submit();
      }
    }
  });
});

//--></script>
<!-- <script src="jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
  <script src="catalog/view/javascript/jquery.creditCardValidator.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> -->

<script>
  $(document).ready(function(){

    var fee = $("#fee").val();

    fee = parseFloat(fee);
    var amount = fee/0.977;

    $("#btn-submit").val("Pay Total amount: " + amount.toFixed(2) + " MYR");

    $("#amount").val(amount.toFixed(2));

    var processingFee = amount - fee;
    $("#processingFee").text(processingFee.toFixed(2));

    $("#fee").keyup(function(){
      fee = parseFloat($(this).val())

      amount = fee/0.977;

      $("#amount").val(amount.toFixed(2));

      var processingFee =  amount - fee;
      $("#processingFee").text(processingFee.toFixed(2));
      $("#button-confirm").val("Pay Total amount: " + amount.toFixed(2) + " MYR");

    });


          $('#cardNumberSpaced').on('keyup', function(e){
              var val = $(this).val();

              var new_val = '';

              val = val.replace(/\s/g, '');
              $("#cardNumber").val(val);
              for(var i=0; i < val.length; i++) {
                  if(i%4 == 0 && i > 0) new_val = new_val.concat(' ');
                  new_val = new_val.concat(val[i]);
              }

              $(this).val(new_val);

          });
          $('#ordrid').on('keyup', function(e){
              var val = $(this).val();
              $("#reference").val(val);
          });
          $(function() {
              $('#cardNumberSpaced').validateCreditCard(function(result) {

                  var type = result.card_type == null ? '-' : result.card_type.name;

                  var valid = result.valid;

                  if(result.card_type !== null){
                      $("#cards").html("<img 'width='52' height='32' src='" + type + ".png' alt='" + type  + " card' id='cardImg'>");
                  }else{
                      $("#cards").html("");
                  }

              });
          });



  });
</script>
<?php  echo $footer ?>
