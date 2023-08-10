<?php if (isset($itinerary_rooms) && $itinerary_rooms ): ?>
<?php foreach ($itinerary_rooms as $room): ?>
<!DOCTYPE html>
<meta charset="UTF-8">
<div style="width:820px; margin:0 auto; direction:ltr;">
<center><img width="100%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg"></center>
<p><br></p>
<center><h3 style="text-align:center">Hotel Voucher</h3></center>
<p><br></p>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
<tr>
  <td style="  vertical-align: top;width:50%">
  <h4 style="width:100%; padding:10px; background:#3e2255;color: white;">Hotel Information</h4>
  <table style="background:#ffb2f3; border:2px solid #000;" cellpadding="5" cellspacing="0" width="100%">
    <tr>
      <td style="color: black">Hotel Name</td>
      <td>: <?php echo $room['hotel_english_name'] ;?></td>
    </tr>
    <tr>
      <td>Address</td>
      <td>: <?php echo $room['address'] ;?></td>
    </tr>
    <tr>
      <td>Contact</td>
      <td>: <?php echo $room['phone'] ;?></td>
    </tr>
  </table>
  </td>
  <td style="  vertical-align: top;width:50%">
  <h4 style="width:100%; padding:10px; background:#3e2255;color: white;">Agent Information</h4>
  <table style="background:#ffb2f3; border:2px solid #000;" cellpadding="5" cellspacing="0" width="100%">
    <tr>
      <td style="color: black"
      >Company Name</td>
      <td>: Al Sakkaf Travel & Tour SDN BHD</td>
    </tr>
    <tr>
      <td>Address</td>
      <td>: Unit 17-02, Plaza 138, Jalan Ampang,50450 Kuala Lumpur, Malaysia</td>
    </tr>
    <tr>
      <td>Contact</td>
      <td>: +603-218-15444</td>
    </tr>
  </table>

  </td>
</tr>

</table>
  <br>
  <h5>Booking Reference: <?php echo $room['booking_reference'] ;?></h5>
  <h4 style="padding:10px; background:#3e2255;color: white;">Booking Details</h4>
  <table border="0" cellspacing="0" cellpadding="5" width="100%">
  <tr>
    <td><strong>Status:</strong> Confirmed</td>
    <td><strong>No. Of Room(s): </strong><?php echo $room['num_of_rooms'] ;?></td>
    <td><strong>No. of nights:</strong> <?php echo $room['num_of_nights'] ;?></td>
  </tr>
  <tr>
    <td><strong>Check In date:</strong> <?php echo $room['checkin'] ;?></td>
    <td><strong>Check out date:</strong> <?php echo $room['checkout'] ;?> </td>
    <td> </td>
  </tr>
  <tr>
    <td colspan="3"><strong>Room(s) Type:</strong> <?php echo $room['room_english_name'] ;?> </td>
  </tr>

  </table>

  <h4 style="padding:10px; background:#3e2255;color: white;">Guest Details</h4>
  <table border="0" cellspacing="0" cellpadding="5" width="100%">
  <tr>
    <td>Guset Name : <?php echo $customer_name_en ?> (Leader)</td>
  </tr>
  </table>

  <h4 style="padding:10px; background:#3e2255;color: white;">Notes</h4>
  <p>This is a prepaid booking done By Alsakkaf Travel & Tour SDN BHD, The guest SHOULD NOT be charged for the services listed on this voucher, The guest is billed for his extras only.</p>
  <br>

  <h3>Emergency Number: +60-18777-0018</h3>

    <br>
</div>
<hr>
<?php endforeach?>
<?php endif?>
