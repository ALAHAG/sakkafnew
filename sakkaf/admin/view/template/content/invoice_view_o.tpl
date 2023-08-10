<div style="width:820px; margin:0 auto;">

<table width="100%">
  <tr>
    <td width="50%">
<img width="90%" src="<?php echo HTTP_IMAGE ?>/itinerary_header.jpg">

    <!--   [Unit 504 & 505, wisma central, jalan ampang] <br>
      [50450,Kuala Lumpur, Malaysia] <br>
      Phone: [+603-218-18411] [+603-218-18511] <br>
      Fax: [+603-218-181841] <br>
      Website: www.crestkey-travel.com -->
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
<h4>Customer Name : <?php echo $customer_name_en ?></h4>
<p><br></p>
<table width="800" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td style="border: 1px solid #a1a1a1;padding:5px;background:orange;">Description</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:orange;">Amount/Pax</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:orange;">Pax</td>
<td width="100" style="border: 1px solid #a1a1a1;padding:5px;background:orange;">Amount</td>
</tr>
<?php if (isset($itinerary_rooms) && $itinerary_rooms): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><strong>[Hotels Booking]:</strong></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
      </tr>
      <?php foreach ($itinerary_rooms as $room): ?>
      <tr>
      <td style="border: 1px solid #a1a1a1;padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $room['hotel_name'] ;?></td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"><?php echo $room['num_of_rooms'] ;?> </td>
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>
<?php if (isset($itinerary_transportations) && $itinerary_transportations): ?>
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
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>
<?php if (isset($itinerary_tours) && $itinerary_tours): ?>
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
      <td style="border: 1px solid #a1a1a1;padding:5px;"> - </td>
      </tr>
      <?php endforeach ?>
  <?php endif ?>

<tr>
<td style="border: 1px solid #a1a1a1;padding:5px;"><strong><h3>Total </h3></strong></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><br></td>
<td style="border: 1px solid #a1a1a1;padding:5px;"><strong><?php echo $customer_price; ?></strong></td>
</tr>
</tbody>
</table>
<br>
<table align="right">
  <!-- <tr>
    <td></td>
    <td>Make all checks payable to</td>
  </tr>
  <tr>
    <td>Name</td>
    <td>: CRESTKEY TRAVEL & TOURS SDN BHD</td>
  </tr>
  <tr>
    <td>Bank Name</td>
    <td>: Alrajhi Bank ,Malaysia</td>
  </tr>
  <tr>
    <td>ACC/No</td>
    <td>: 10100-1080137151</td>
  </tr>
  <tr>
    <td>Branch</td>
    <td>: Kuala lumpur - Malaysia</td>
  </tr>
  <tr>
    <td>Swift Code</td>
    <td>: RJHIMYKL</td>
  </tr> -->
</table>
 <div style="clear:both"></div>
 <center>
   <h5 style="text-align:center;">
<!--      If you have any questions about this invoice, please contact <br>
[Radhi Hudijan, +601111633514, Radhi@crestkey-travel.com] -->
   </h5>
   <h4 style="text-align:center;">Thank You For Your Business!</h4>
 </center>
