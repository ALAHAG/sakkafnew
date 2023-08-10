<?php
	function pdf($data , $filename = null)
	{
		// $mpdf=new mPDF();
// 		$mpdf = new mPDF([
// 	'mode' => 'c',
// 	'margin_left' => 0,
// 	'margin_right' => 0,
// 	'margin_top' => 0,
// 	'margin_bottom' => 0,
// 	'margin_header' => 0,
// 	'margin_footer' => 0
// ]);
$mpdf=new mPDF('utf-8', 'Letter', 0, '', 5, 5, 27, 30, 0, 0);
$mpdf->SetHTMLHeader('<img src="' .  HTTP_IMAGE . '/itinerary_header.jpg"/>');

    // $mpdf->SetFooter('<img src="' . HTTP_IMAGE . '/malaysia-kl.jpg"/>');
		$mpdf->autoScriptToLang = true;
		$mpdf->baseScript = 1;
		$mpdf->autoVietnamese = true;
		$mpdf->autoArabic = true;
		$mpdf->SetDisplayMode('fullpage');

		$mpdf->autoLangToFont = true;

		$mpdf->WriteHTML($data);
		$mpdf->SetHTMLFooter('<img src="' . HTTP_IMAGE . '/itinerary_header.jpg"/>');

		if ($filename) {
			@$mpdf->Output($filename.'.pdf' , 'D');

		}else{
			@$mpdf->Output();
		}


	}
?>
