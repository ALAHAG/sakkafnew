<div style="width:820px; margin:0 auto;">
    <img width="100%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg"/>

<table width="100%">
  <tr>
    <td width="50%">

      [Unit 17-02, Plaza 138, Jalan Ampang] <br>
      [50450 Kuala Lumpur, Malaysia] <br>
      Phone: [+603-218-15444] <br>
      Website: www.alsakkaftravel.net
    </td>
    <td width="50%">
    <h2 style="text-align:right">Summery</h2>
    <table align="right">
    <tr>
      <td>DATE</td>
      <td>: <?php echo $time_added ?> </td>
    </tr>
    <tr>
      <td>CUSTOMER ID</td>
      <td>: [<?php echo BOOKING_PREFIX.$booking_id ?>]</td>
    </tr>
      
    </table>
    </td>
  </tr>
</table>
<br>
<br>
<h4>Customer Name : <?php echo $customer_name_en ?> - <?php echo $customer_name_ar ?></h4>
<p><br></p>
<table width="800" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td style="border: 1px solid #a1a1a1;padding:5px;background:#3e2255 ;color: white;">Description</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:#3e2255 ;color: white;">Nights#</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:#3e2255 ;color: white;">Rooms#</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:#3e2255 ;color: white;">Amount</td>
</tr>

<?php if ($itinerary_rooms): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><strong>[Hotels Booking]:</strong></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      </tr>
      <?php foreach ($itinerary_rooms as $room): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $room['hotel_english_name'] ;?> [ <?php echo $room['room_english_name'] ;?>]</td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $room['num_of_nights'] ;?></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $room['num_of_rooms'] ;?> </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $room['price'] ;?> </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>
<?php if ($itinerary_transportations): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><strong>[Transportations]:</strong></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      </tr>
      <?php foreach ($itinerary_transportations as $transportation): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $transportation['transportation_title_en'] ;?></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $transportation['num_of_transportations'] ;?> </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $transportation['price'] ;?> </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>
<?php if ($itinerary_tours): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><strong>[Tours]:</strong></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      </tr>
      <?php foreach ($itinerary_tours as $tour): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $tour['tour_title_en'] ;?></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> <?php echo $tour['price'] ;?> </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>

<tr>
<td style="border: 1px solid #a1a1a1;padding:5px;"><strong><h3>Total Cost</h3></strong></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><strong><?php echo $total_price; ?></strong></td>
</tr>
<tr>
<td><br></td>
<td><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;">Selling Price</td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $customer_price; ?></td>
</tr>
<tr>
<td><br></td>
<td><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;background:#D2D2D2">Profit</td>
<td style="border: 1px solid #a1a1a1;padding:5px;background:#D2D2D2"><?php echo $customer_price - $total_price ?></td>
</tr>
</tbody>
</table>
<p><br></p>
 
 <center>
   <h5 style="text-align:center;">
     If you have any questions about this invoice, please contact <br>
[mahdi, +60-18777-0018, mahdi@alsakkaftravel.net]
   </h5>
   <h4 style="text-align:center;">Thank You !</h4>
 </center>
